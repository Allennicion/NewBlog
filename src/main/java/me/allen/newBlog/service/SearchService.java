package me.allen.newBlog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.allen.newBlog.model.bo.SearchArticleBo;
import me.allen.newBlog.model.bo.SearchBo;

/**
 * @author allen
 */
public interface SearchService {

    /**
     * 查找搜索内容，包括文章和笔记
     *
     * @param words
     * @param pageNo
     * @return
     */
    Page<SearchBo> searchWithWords(String words, int pageNo);

    /**
     * 查找搜索内容
     *
     * @param tagName
     * @param pageNo
     * @param dictGroup
     * @return
     */
    Page<SearchArticleBo> searchWithDict(String dictGroup, String tagName, int pageNo);
}
