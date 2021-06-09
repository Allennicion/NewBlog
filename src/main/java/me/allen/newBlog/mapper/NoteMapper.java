package me.allen.newBlog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.allen.newBlog.annotation.MybatisMapper;
import me.allen.newBlog.model.entity.Note;

/**
 * @author allen
 */
@MybatisMapper
public interface NoteMapper extends BaseMapper<Note> {
}
