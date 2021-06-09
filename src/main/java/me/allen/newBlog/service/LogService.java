package me.allen.newBlog.service;


import me.allen.newBlog.model.bo.EchartsBo;
import me.allen.newBlog.model.bo.EchartsUrlBo;

import java.util.List;

/**
 * @author allen
 */
public interface LogService {

    /**
     * 统计ip
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
     * 今日访问量
     *
     * @return
     */
    long todayVisit();
}
