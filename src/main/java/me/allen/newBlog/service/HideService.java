package me.allen.newBlog.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import me.allen.newBlog.model.bo.HideBo;
import me.allen.newBlog.model.entity.Hide;
import org.apache.ibatis.annotations.Param;


/**
 * @author allen
 */
public interface HideService extends IService<Hide> {

    /**
     * 删除文章相关的关联
     *
     * @param articleId
     */
    void deleteArticlePurchaseRefer(String articleId);

    /**
     * 查询用户是否已经购买了
     *
     * @param articleId
     * @param userId
     * @param hideId
     * @return
     */
    boolean userIsBought(String articleId, String userId, String hideId);

    /**
     * 购买文章隐藏内容
     *
     * @param articleId
     * @param hideId
     * @param userId
     * @return
     */
    int purchaseArticleHideContent(String articleId, String hideId, String userId);

    /**
     * 查找用户购买的主题
     *
     * @param page
     * @param userId
     * @return
     */
    IPage<HideBo> findMyPurchases(IPage<HideBo> page, @Param("userId") String userId);
}
