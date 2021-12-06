package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Builder;
import lombok.Data;
import me.allen.newBlog.enums.OperateType;

import java.io.Serializable;
import java.util.Date;

/**
 * @author allen
 */
@Data
@Builder
public class UserCoinRecord implements Serializable {

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    private String userId;
    private OperateType operateType;
    private Date operateDate;
    private int operateValue;
    private int remainCoin;
    private String remark;


}
