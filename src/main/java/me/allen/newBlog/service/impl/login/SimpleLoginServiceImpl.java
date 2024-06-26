package me.allen.newBlog.service.impl.login;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import me.allen.newBlog.constant.NBV5;
import me.allen.newBlog.enums.RoleEnum;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.model.bo.login.SimpleLoginData;
import me.allen.newBlog.model.entity.User;
import me.allen.newBlog.service.LoginService;
import me.allen.newBlog.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 普通登录方法
 * created by allen on 2018/7/21 at 18:05
 *
 * @author allen
 */
@Service("simpleLogin")
@Transactional(rollbackFor = Exception.class)
public class SimpleLoginServiceImpl implements LoginService<ResultBeanObj, SimpleLoginData> {

    private final UserService userService;

    public SimpleLoginServiceImpl(UserService userService) {
        this.userService = userService;
    }

    @Override
    public ResultBeanObj doLogin(SimpleLoginData data) {
        User user = userService.getOne(Wrappers.<User>query()
                .eq("username", data.getNbv5name())
                .eq("password", data.getNbv5pass())
                .eq("enable", true)
        );
        if (user != null) {
            String redirectUrl =
                    user.getRole() == RoleEnum.ADMIN
                            ? NBV5.MANAGEMENT_INDEX
                            : NBV5.FRONTEND_INDEX;
            return ResultBeanObj.ok("登陆成功！", redirectUrl).put("nbv5su", user);
        } else {
            return ResultBeanObj.error("用户名或密码错误！");
        }

    }


}
