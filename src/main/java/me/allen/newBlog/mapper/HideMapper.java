package me.allen.newBlog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import me.allen.newBlog.annotation.MybatisMapper;
import me.allen.newBlog.model.bo.HideBo;
import me.allen.newBlog.model.entity.Hide;
import org.apache.ibatis.annotations.Param;

/**
 * @author allen
 */
@MybatisMapper
public interface HideMapper extends BaseMapper<Hide> {

    /**
     * 查找用户购买的主题
     *
     * @param page
     * @param userId
     * @return
     */
    IPage<HideBo> findMyPurchases(IPage<HideBo> page, @Param("userId") String userId);
}
