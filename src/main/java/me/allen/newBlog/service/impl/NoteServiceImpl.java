package me.allen.newBlog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.mapper.NoteMapper;
import me.allen.newBlog.model.entity.Note;
import me.allen.newBlog.service.NoteService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class NoteServiceImpl extends ServiceImpl<NoteMapper, Note> implements NoteService {
}
