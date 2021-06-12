package me.allen.newBlog.service.impl;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.constant.NBV5;
import me.allen.newBlog.enums.OperateType;
import me.allen.newBlog.enums.RoleEnum;
import me.allen.newBlog.constant.UploadConstant;
import me.allen.newBlog.mapper.ParamMapper;
import me.allen.newBlog.mapper.UserCoinRecordMapper;
import me.allen.newBlog.mapper.UserMapper;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.model.entity.Param;
import me.allen.newBlog.model.entity.User;
import me.allen.newBlog.model.entity.UserCoinRecord;
import me.allen.newBlog.service.ParamService;
import me.allen.newBlog.utils.CacheUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;

/**
 * created by allen on 2019-08-05 at 11:46
 *
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ParamServiceImpl extends ServiceImpl<ParamMapper, Param> implements ParamService {

    private final ParamMapper paramMapper;
    private final UserMapper userMapper;
    private final UserCoinRecordMapper userCoinRecordMapper;

    public ParamServiceImpl(ParamMapper paramMapper, UserMapper userMapper, UserCoinRecordMapper userCoinRecordMapper) {
        this.paramMapper = paramMapper;
        this.userMapper = userMapper;
        this.userCoinRecordMapper = userCoinRecordMapper;
    }

    @Override
    public void saveInitParam(Map<String, Object> map) {
        CacheUtils.clearAllParamCache();
        for (Map.Entry<String, Object> next : map.entrySet()) {
            String key = next.getKey();
            if (!"username".equals(key) && !"password".equals(key)) {
                if (!StringUtils.isEmpty(next.getValue())) {
                    String value = (String) next.getValue();
                    paramMapper.updateValueByName(key, value);
                }
            }
        }
    }


    @Override
    public void initMasterAccount(String username, String password, String email) {
        String nickname = "迷茫的旅人";
        User user = User.builder()
                .role(RoleEnum.ADMIN)
                .nickname(nickname)
                .password(SecureUtil.md5(password))
                .username(username)
                .avatar("https://emiria.oss-cn-shenzhen.aliyuncs.com/base/leimu.jpg")
                .email(email)
                .build();
        int i = userMapper.insert(user);
        if (i > 0) {
            paramMapper.updateValueByName("1", NBV5.ADMIN_INIT_STATUS);
            paramMapper.updateValueByName(NBV5.MAIL_SENDER_NAME, nickname);
            paramMapper.updateValueByName(NBV5.INFO_LABEL_NICKNAME, nickname);
            paramMapper.updateValueByName(NBV5.INFO_LABEL_LOGO, user.getAvatar());
            userCoinRecordMapper.insert(
                    UserCoinRecord.builder().operateTime(new Date()).operateType(OperateType.INIT_REG)
                            .operateValue(0).remainCoin(0).remark(OperateType.INIT_REG.getDesc())
                            .userId(user.getId()).build()
            );
        }
    }

    @Override
    public Param getInitStatus() {
        Param initStatus = CacheUtils.getParamCache().get(NBV5.INIT_STATUS, Param.class);
        if (initStatus == null) {
            Param p = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.INIT_STATUS));
            CacheUtils.getParamCache().put(NBV5.INIT_STATUS, p);
            return p;
        } else {
            return initStatus;
        }
    }

    @Override
    @Cacheable(value = "paramCache", key = "#name")
    public Param findByName(String name) {
        return paramMapper.selectOne(Wrappers.<Param>query().eq("name", name));
    }

    @Override
    public ResultBeanObj updateSettings(String name, String value) {
        if (name.equalsIgnoreCase(NBV5.IS_OPEN_OSS_UPLOAD)) {
            CacheUtils.removeParamCache(NBV5.UPLOAD_TYPE);
            final String type = "0".equalsIgnoreCase(value) ? UploadConstant.Method.LOCAL.name() : UploadConstant.Method.QINIU.name();
            paramMapper.updateValueByName(NBV5.UPLOAD_TYPE, type);
        }
        if (name.equalsIgnoreCase(NBV5.IS_OPEN_ALIYUNOSS_UPLOAD)) {
            CacheUtils.removeParamCache(NBV5.UPLOAD_TYPE);
            final String type = "0".equalsIgnoreCase(value) ? UploadConstant.Method.LOCAL.name() : UploadConstant.Method.ALIYUN.name();
            paramMapper.updateValueByName(NBV5.UPLOAD_TYPE, type);
        }
        if (name.equalsIgnoreCase(NBV5.COMMENT_MAIL_NOTICE_ONOFF)
                || name.equalsIgnoreCase(NBV5.MESSAGE_MAIL_NOTICE_ONOFF)
                || name.equalsIgnoreCase(NBV5.USER_SIMPLE_REG_ONOFF)) {
            String adminEmail = userMapper.selectOne(Wrappers.<User>query().eq("role", RoleEnum.ADMIN.getValue())).getEmail();
            if (StrUtil.isEmpty(adminEmail)) {
                return ResultBeanObj.error("请先设置管理员邮箱！");
            } else {
                String host = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.MAIL_SMPT_SERVER_ADDR)).getValue();
                String port = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.MAIL_SMPT_SERVER_PORT)).getValue();
                String from = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.MAIL_SERVER_ACCOUNT)).getValue();
                String user = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.MAIL_SENDER_NAME)).getValue();
                String pass = paramMapper.selectOne(Wrappers.<Param>query().eq("name", NBV5.MAIL_SERVER_PASSWORD)).getValue();
                if (StrUtil.isEmpty(host) || StrUtil.isEmpty(port)
                        || StrUtil.isEmpty(from) || StrUtil.isEmpty(user)
                        || StrUtil.isEmpty(pass)) {
                    return ResultBeanObj.error("请先设置完整发送邮件服务器信息！");
                }
            }
        }
        return update(name, value);
    }

    @Override
    public ResultBeanObj updateMailConfig(Map<String, Object> paramMap) {
        paramMapper.updateValueByName(NBV5.MAIL_SMPT_SERVER_ADDR, paramMap.get(NBV5.MAIL_SMPT_SERVER_ADDR).toString());
        paramMapper.updateValueByName(NBV5.MAIL_SMPT_SERVER_PORT, paramMap.get(NBV5.MAIL_SMPT_SERVER_PORT).toString());
        paramMapper.updateValueByName(NBV5.MAIL_SERVER_ACCOUNT, paramMap.get(NBV5.MAIL_SERVER_ACCOUNT).toString());
        paramMapper.updateValueByName(NBV5.MAIL_SERVER_PASSWORD, paramMap.get(NBV5.MAIL_SERVER_PASSWORD).toString());
        paramMapper.updateValueByName(NBV5.MAIL_SENDER_NAME, paramMap.get(NBV5.MAIL_SENDER_NAME).toString());
        CacheUtils.clearAllParamCache();
        return ResultBeanObj.ok("更新邮件服务器配置成功！");
    }

    @Override
    public String getSystemInitDatetime() {
        Param systemInitDateTime = CacheUtils.getParamCache().get("system_init_datetime", Param.class);
        if (systemInitDateTime == null) {
            Param p = paramMapper.selectOne(Wrappers.<Param>query().eq("name", "system_init_datetime"));
            CacheUtils.getParamCache().put("system_init_datetime", p);
            return p.getValue();
        } else {
            return systemInitDateTime.getValue();
        }
    }


    @Override
    public long calcRunningDays() {
        Date initDate = DateUtil.parse(getSystemInitDatetime());
        Date now = DateUtil.parse(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        return DateUtil.between(initDate, now, DateUnit.DAY);
    }
}
