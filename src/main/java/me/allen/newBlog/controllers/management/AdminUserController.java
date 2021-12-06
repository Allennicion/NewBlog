package me.allen.newBlog.controllers.management;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.allen.newBlog.enums.RoleEnum;
import me.allen.newBlog.controllers.BaseController;
import me.allen.newBlog.model.json.LayuiTable;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.model.entity.User;
import me.allen.newBlog.service.UserCoinRecordService;
import me.allen.newBlog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author allen
 */
@Controller
@RequestMapping("/management/user")
public class AdminUserController extends BaseController {

    private final UserService userService;
    private final UserCoinRecordService userCoinRecordService;

    public AdminUserController(UserService userService, UserCoinRecordService userCoinRecordService) {
        this.userService = userService;
        this.userCoinRecordService = userCoinRecordService;
    }

    @GetMapping
    public String index() {
        return "management/users/list";
    }

    @PostMapping("/list")
    @ResponseBody
    public LayuiTable<User> userLayuiTable(Page<User> page, String username,
                                           String nickname, String sort, String order) {
        addPageOrder(page, order, sort);
        IPage<User> userPage = userService.page(page,
                Wrappers.<User>query()
                        .like(StrUtil.isNotEmpty(username), "username", username)
                        .or().like(StrUtil.isNotEmpty(nickname), "nickname", nickname)
                        .ne("role", RoleEnum.ADMIN.getValue())
        );
        return new LayuiTable<>(userPage.getTotal(), userPage.getRecords());
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultBeanObj update(@RequestParam("id") String id, boolean enable) {
        boolean res = userService.update(Wrappers.<User>update().set("enable", enable).eq("id", id));
        return handle(res, "状态修改成功！", "状态修改失败！");
    }

    @RequestMapping("/update/nickname")
    @ResponseBody
    public ResultBeanObj update(@RequestParam("id") String id, String nickname) {
        User u = userService.getOne(Wrappers.<User>query().eq("nickname", nickname));
        if (u == null) {
            boolean res = userService.update(Wrappers.<User>update().set("nickname", nickname).eq("id", id));
            return handle(res, "昵称状态修改成功！", "昵称修改失败！");
        } else {
            return ResultBeanObj.error("已存在昵称！");
        }
    }

    @RequestMapping("/update/remainCoin")
    @ResponseBody
    public ResultBeanObj update(@RequestParam("id") String id, Integer remainCoin) {
        boolean res = userService.update(Wrappers.<User>update().set("remain_coin", remainCoin).eq("id", id));
        if (res) {
            userCoinRecordService.calcAdminInsertRecord(remainCoin, id);
        }
        return handle(res, "修改硬币余额成功！", "修改硬币余额失败！");
    }
}
