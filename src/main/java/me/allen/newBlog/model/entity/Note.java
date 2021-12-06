package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.Date;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

/**
 * created by allen on 2018/7/15 at 12:00
 *
 * @author allen
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Note implements Serializable {

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    @NotEmpty
    private String title;
    private String clearContent;
    private String mdContent;
    @NotEmpty
    private String content;
    @Builder.Default
    private Boolean top = FALSE;
    @Builder.Default
    private Boolean show = TRUE;
    @Builder.Default
    private Date post = new Date();
    private Date modifyTime;
}
