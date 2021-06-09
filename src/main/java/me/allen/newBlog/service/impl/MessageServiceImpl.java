package me.allen.newBlog.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.mapper.MessageMapper;
import me.allen.newBlog.model.bo.MessageBo;
import me.allen.newBlog.model.bo.MessageRankBo;
import me.allen.newBlog.model.entity.Message;
import me.allen.newBlog.service.MessageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {

    private final MessageMapper messageMapper;

    public MessageServiceImpl(MessageMapper messageMapper) {
        this.messageMapper = messageMapper;
    }

    @Override
    public IPage<MessageBo> findMessagePage(IPage<MessageBo> page, String nickname, String clearComment, boolean enable) {
        return messageMapper.findMessagePage(page, nickname, clearComment, enable);
    }

    @Override
    public MessageBo findLatestMessage() {
        return messageMapper.findLatestMessage();
    }

    @Override
    public long findTodayMessage() {
        return messageMapper.findTodayMessage();
    }

    @Override
    public List<MessageRankBo> findMessageRankBoList() {
        return messageMapper.findMessageRankBoList();
    }
}
