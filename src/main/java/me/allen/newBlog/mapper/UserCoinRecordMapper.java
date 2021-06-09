package me.allen.newBlog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.allen.newBlog.annotation.MybatisMapper;
import me.allen.newBlog.enums.OperateType;
import me.allen.newBlog.model.entity.UserCoinRecord;
import org.apache.ibatis.annotations.Param;

/**
 * @author allen
 */
@MybatisMapper
public interface UserCoinRecordMapper extends BaseMapper<UserCoinRecord> {

    /**
     * 找最新的一条
     *
     * @param userId
     * @return
     */
    UserCoinRecord findLatestRecordByUserId(@Param("userId") long userId);


    /**
     * 用户今日是否已签到，返回签到的记录数
     *
     * @param userId
     * @param operateType
     * @return
     */
    int todayIsSigned(@Param("userId") long userId, @Param("operateType") OperateType operateType);

}
