package me.allen.newBlog.controllers.management;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.allen.newBlog.controllers.BaseController;
import me.allen.newBlog.model.json.LayuiTable;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.model.bo.MessageBo;
import me.allen.newBlog.model.entity.Message;
import me.allen.newBlog.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author allen
 */
@Controller
@RequestMapping("/management/message")
public class AdminMessageController extends BaseController {

    private final MessageService messageService;

    public AdminMessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @GetMapping
    public String messagePage() {
        return "management/msg/message";
    }

    @GetMapping("/list")
    @ResponseBody
    public LayuiTable<MessageBo> messageLayuiTable(Page<MessageBo> page,
                                                   String sort, String order, String nickname, String clearComment) {
        addPageOrder(page, order, sort);
        IPage<MessageBo> messagePage = messageService.findMessagePage(page, nickname, clearComment, true);
        return new LayuiTable<>(messagePage.getTotal(), messagePage.getRecords());
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultBeanObj delete(Long id) {
        boolean res = messageService.removeById(id);
        return handle(res, "删除成功！", "删除失败！");
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultBeanObj update(@RequestParam("id") Long id, boolean enable) {
        boolean res = messageService.update(Wrappers.<Message>update().set("enable", enable).eq("id", id));
        return handle(res, "留言状态修改成功！", "留言状态修改失败！");
    }
}
