package me.allen.newBlog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.allen.newBlog.annotation.MybatisMapper;
import me.allen.newBlog.model.entity.Param;

/**
 * created by allen on 2019-07-23 at 14:55
 *
 * @author allen
 */
@MybatisMapper
public interface ParamMapper extends BaseMapper<Param> {

    /**
     * 更新参数
     *
     * @param name
     * @param value
     */
    void updateValueByName(@org.apache.ibatis.annotations.Param("name") String name, @org.apache.ibatis.annotations.Param("value") Object value);

}
