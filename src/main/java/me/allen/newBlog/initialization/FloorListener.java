package me.allen.newBlog.initialization;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import me.allen.newBlog.model.entity.Comment;
import me.allen.newBlog.service.CommentService;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 此类是处理从老版本升级到5.7的时候
 * 因为优化了评论楼层显示，所以需要更新老版本评论中的楼层数值
 * created by allen on 2019/10/21 at 10:52 上午
 *
 * @author allen
 */
@Slf4j
@Component
@Order(2)
public class FloorListener implements ApplicationListener<ContextRefreshedEvent> {

    private final CommentService commentService;

    public FloorListener(CommentService commentService) {
        this.commentService = commentService;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        log.info("正在检测评论楼层显示是否需要优化...");
        int cnt = commentService.count(Wrappers.<Comment>query().eq("floor", -1));
        if (cnt > 1) {
            log.info("需要优化，开始优化操作...");
            List<Comment> comments = commentService.list();
            for (Comment c : comments) {
                List<Comment> curArticleComment = commentService.list(Wrappers.<Comment>query().eq("article_id", c.getArticleId()).orderByAsc("id"));
                for (int i = 0; i < curArticleComment.size(); i++) {
                    commentService.update(
                            Wrappers.<Comment>update()
                                    .set("floor", i + 1)
                                    .eq("id", curArticleComment.get(i).getId())
                                    .eq("article_id", curArticleComment.get(i).getArticleId()));
                }
            }
            log.info("优化完毕，进行下一步...");
        } else {
            log.info("不需要优化，进行下一步...");
        }
    }
}
