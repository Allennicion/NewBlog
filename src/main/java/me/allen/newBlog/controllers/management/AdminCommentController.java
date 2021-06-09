package me.allen.newBlog.controllers.management;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.allen.newBlog.controllers.BaseController;
import me.allen.newBlog.model.json.LayuiTable;
import me.allen.newBlog.model.json.ResultBeanObj;
import me.allen.newBlog.model.bo.CommentBo;
import me.allen.newBlog.model.entity.Comment;
import me.allen.newBlog.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author allen
 */
@Controller
@RequestMapping("/management/comment")
public class AdminCommentController extends BaseController {

    private final CommentService commentService;

    public AdminCommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @GetMapping
    public String commentPage() {
        return "management/msg/comment";
    }

    @GetMapping("/list")
    @ResponseBody
    public LayuiTable<CommentBo> commentLayuiTable(Page<CommentBo> page,
                                                   String sort, String order, String nickname, String clearComment,
                                                   @RequestParam(required = false, value = "articleIds[]") List<String> articleIds) {
        addPageOrder(page, order, sort);
        IPage<CommentBo> commentPage = commentService
                .findCommentPage(page, nickname, clearComment, articleIds, null, true);
        return new LayuiTable<>(commentPage.getTotal(), commentPage.getRecords());
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultBeanObj delete(Long id) {
        boolean res = commentService.removeById(id);
        return handle(res, "删除成功！", "删除失败！");
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultBeanObj update(@RequestParam("id") Long id, boolean enable) {
        boolean res = commentService.update(Wrappers.<Comment>update().set("enable", enable).eq("id", id));
        return handle(res, "评论状态修改成功！", "评论状态修改失败！");
    }
}
