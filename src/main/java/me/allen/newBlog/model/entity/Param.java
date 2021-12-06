package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * created by allen on 2019-07-23 at 14:46
 *
 * @author allen
 */
@Data
@Builder
public class Param implements Serializable {

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    private String name;
    private String value;
    private String paramGroup;
    private String remark;
    private Integer orderIndex;
}
