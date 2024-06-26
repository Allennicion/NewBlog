package me.allen.newBlog.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.mapper.CommentMapper;
import me.allen.newBlog.model.bo.CommentBo;
import me.allen.newBlog.model.bo.ReplyBo;
import me.allen.newBlog.model.entity.Comment;
import me.allen.newBlog.service.CommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    private final CommentMapper commentMapper;

    public CommentServiceImpl(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public IPage<CommentBo> findCommentPage(IPage<CommentBo> page,
                                            String nickname, String clearComment,
                                            List<String> articleIds, Long userId, boolean enable) {
        return commentMapper.findCommentPage(page, nickname, clearComment, articleIds, userId, enable);
    }

    @Override
    public CommentBo findLatestComment() {
        return commentMapper.findLatestComment();
    }

    @Override
    public long findTodayComment() {
        return commentMapper.findTodayComment();
    }

    @Override
    public IPage<ReplyBo> findReplyPage(IPage<ReplyBo> page, Long userId) {
        return commentMapper.findReplyPage(page, userId);
    }

    @Override
    public int findMaxFloorByArticleId(String articleId) {
        int maxFloor = commentMapper.findMaxFloorByArticleId(articleId);
        return maxFloor + 1;
    }
}
