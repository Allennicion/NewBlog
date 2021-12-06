package me.allen.newBlog.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.enums.OperateType;
import me.allen.newBlog.mapper.CashMapper;
import me.allen.newBlog.mapper.ParamMapper;
import me.allen.newBlog.mapper.UserCoinRecordMapper;
import me.allen.newBlog.mapper.UserMapper;
import me.allen.newBlog.model.entity.Cash;
import me.allen.newBlog.model.entity.Param;
import me.allen.newBlog.model.entity.User;
import me.allen.newBlog.model.entity.UserCoinRecord;
import me.allen.newBlog.service.UserCoinRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserCoinRecordServiceImpl extends ServiceImpl<UserCoinRecordMapper, UserCoinRecord> implements UserCoinRecordService {

    private final UserCoinRecordMapper userCoinRecordMapper;
    private final UserMapper userMapper;
    private final ParamMapper paramMapper;
    private final CashMapper cashMapper;

    public UserCoinRecordServiceImpl(UserCoinRecordMapper userCoinRecordMapper,
                                     UserMapper userMapper, ParamMapper paramMapper, CashMapper cashMapper) {
        this.userCoinRecordMapper = userCoinRecordMapper;
        this.userMapper = userMapper;
        this.paramMapper = paramMapper;
        this.cashMapper = cashMapper;
    }

    @Override
    public void calcAdminInsertRecord(int targetCoinValue, String userId) {
        UserCoinRecord latestRecord = userCoinRecordMapper.findLatestRecordByUserId(userId);
        int latestRemainCoin = latestRecord.getRemainCoin();
        UserCoinRecord newLine = UserCoinRecord.builder()
                .operateDate(new Date())
                .userId(userId)
                .remainCoin(targetCoinValue)
                .build();
        if (targetCoinValue >= latestRemainCoin) {
            newLine.setOperateType(OperateType.ADMIN_RECHARGE_ADD);
            newLine.setOperateValue(targetCoinValue - latestRemainCoin);
            newLine.setRemark(OperateType.ADMIN_RECHARGE_ADD.getDesc());
        } else {
            newLine.setOperateType(OperateType.ADMIN_DEDUCT_MINUS);
            newLine.setOperateValue(latestRemainCoin - targetCoinValue);
            newLine.setRemark(OperateType.ADMIN_DEDUCT_MINUS.getDesc());
        }
        userCoinRecordMapper.insert(newLine);
        userMapper.updateRemainCoin(userId, targetCoinValue);
    }

    @Override
    public int todayIsSigned(String userId) {
        return userCoinRecordMapper.todayIsSigned(userId, OperateType.SIGN_ADD);
    }

    @Override
    public boolean userSign(String userId) {
        UserCoinRecord userCoinRecord = userCoinRecordMapper.findLatestRecordByUserId(userId);
        int remainCoin = userCoinRecord.getRemainCoin();
        Param param = paramMapper.selectOne(Wrappers.<Param>query().eq("name", "sign_check_coin"));
        int val = Integer.parseInt(param.getValue());
        int remainCoinAfterSign = remainCoin + val;
        UserCoinRecord ucr = UserCoinRecord.builder()
                .operateDate(new Date()).remainCoin(remainCoinAfterSign).userId(userId).operateType(OperateType.SIGN_ADD)
                .operateValue(val).remark(OperateType.SIGN_ADD.getDesc()).build();
        int cnt = userCoinRecordMapper.insert(ucr);
        if (cnt == 1) {
            userMapper.updateRemainCoin(userId, remainCoinAfterSign);
        }
        return cnt == 1;
    }

    @Override
    public boolean userCashRecharge(User user, String cashNoWithLine) {
        Cash cash = cashMapper.selectOne(Wrappers.<Cash>query().eq("cash_no", cashNoWithLine));
        if (cash != null && cash.isEnable() && cash.getUserId() == null) {
            int value = cash.getCashValue();
            UserCoinRecord userCoinRecord = userCoinRecordMapper.findLatestRecordByUserId(user.getId());
            int remainCoin = userCoinRecord.getRemainCoin();
            int remainCoinAfterSign = remainCoin + value;
            UserCoinRecord ucr = UserCoinRecord.builder()
                    .operateDate(new Date()).remainCoin(remainCoinAfterSign).userId(user.getId()).operateType(OperateType.CASH_RECHARGE_ADD)
                    .operateValue(value).remark(OperateType.CASH_RECHARGE_ADD.getDesc()).build();
            int cnt = userCoinRecordMapper.insert(ucr);
            if (cnt == 1) {
                userMapper.updateRemainCoin(user.getId(), remainCoinAfterSign);
                cash.setRechargeTime(new Date());
                cash.setEnable(false);
                cash.setUserId(user.getId());
                cash.setNickname(user.getNickname());
                cashMapper.updateById(cash);
            }
            return true;
        }
        return false;
    }
}
