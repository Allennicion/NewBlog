package me.allen.newBlog.service.impl;

import me.allen.newBlog.mapper.LogMapper;
import me.allen.newBlog.model.bo.EchartsBo;
import me.allen.newBlog.model.bo.EchartsUrlBo;
import me.allen.newBlog.service.LogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author allen
 */
@Service
@Transactional(readOnly = true)
public class LogServiceImpl implements LogService {

    private final LogMapper logMapper;

    public LogServiceImpl(LogMapper logMapper) {
        this.logMapper = logMapper;
    }

    @Override
    public List<EchartsBo> ipSummary() {
        return logMapper.ipSummary();
    }

    @Override
    public List<EchartsUrlBo> urlSummary() {
        return logMapper.urlSummary();
    }

    @Override
    public List<EchartsBo> browserSummary() {
        return logMapper.browserSummary();
    }

    @Override
    public long todayVisit() {
        return logMapper.todayVisit();
    }
}
