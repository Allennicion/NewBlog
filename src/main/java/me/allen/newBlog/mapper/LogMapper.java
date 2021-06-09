package me.allen.newBlog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.allen.newBlog.annotation.MybatisMapper;
import me.allen.newBlog.model.bo.EchartsBo;
import me.allen.newBlog.model.bo.EchartsUrlBo;
import me.allen.newBlog.model.entity.Log;

import java.util.List;

/**
 * @author allen
 */
@MybatisMapper
public interface LogMapper extends BaseMapper<Log> {

    /**
     * 统计访客ip信息
     *
     * @return
     */
    List<EchartsBo> ipSummary();

    /**
     * url统计
     *
     * @return
     */
    List<EchartsUrlBo> urlSummary();

    /**
     * 浏览器统计
     *
     * @return
     */
    List<EchartsBo> browserSummary();

    /**
     * 今日访问
     *
     * @return
     */
    long todayVisit();

    /**
     * 删除30天之前的日志
     */
    void removeLogBeyondMonth();
}
