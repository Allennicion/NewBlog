package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author allen
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Dict implements Serializable {

    public static String PRODUCT = "商品";

    @TableId(type = IdType.UUID)
    private String id;
    private String name;
    private String dictGroup;
}
