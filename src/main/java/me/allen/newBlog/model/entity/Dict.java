package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
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

    private Long id;
    private String name;
    @TableField("`group`")
    private String group;
}
