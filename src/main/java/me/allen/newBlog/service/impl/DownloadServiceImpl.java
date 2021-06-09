package me.allen.newBlog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.mapper.DownloadMapper;
import me.allen.newBlog.model.entity.Download;
import me.allen.newBlog.service.DownloadService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class DownloadServiceImpl extends ServiceImpl<DownloadMapper, Download> implements DownloadService {
}
