package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author allen
 */
@Data
@Builder
public class Cash implements Serializable {

    @TableId(type = IdType.UUID)
    private String id;
    private String cashNo;
    private int cashValue;
    private Date createTime;
    private Date rechargeTime;
    private boolean enable;
    private String userId;
    private String nickname;
}
