package me.allen.newBlog.config.schedule;

import lombok.extern.slf4j.Slf4j;
import me.allen.newBlog.constant.NBV5;
import me.allen.newBlog.mapper.LogMapper;
import me.allen.newBlog.model.entity.Log;
import me.allen.newBlog.utils.NbUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.util.List;

/**
 * @author allen
 */
@Slf4j
@Component
public class LogScheduler {

    private LogMapper logMapper = NbUtils.getBean(LogMapper.class);
    private ServletContext nbServletContext = NbUtils.getServletContext();

    /**
     * 每整10分钟插入访问日志，防止频繁插入消耗资源
     */
    @Scheduled(cron = "0 0,10,20,30,40,50 * * * ? ")
    public void logInsert() {
        //noinspection unchecked
        List<Log> cacheLogs = (List<Log>) nbServletContext.getAttribute(NBV5.LOG_CACHE_KEY);
        if (cacheLogs != null && !cacheLogs.isEmpty()) {
            for (Log cacheLog : cacheLogs) {
                logMapper.insert(cacheLog);
            }
            nbServletContext.removeAttribute(NBV5.LOG_CACHE_KEY);
        }
    }

    /**
     * 每天定时清理30天以外的访问日志
     */
    @Scheduled(cron = "0 0 0 1/1 * ? ")
    public void logRemove() {
        logMapper.removeLogBeyondMonth();
    }
}
