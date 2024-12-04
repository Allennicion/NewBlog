package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Builder;
import lombok.Data;
import me.allen.newBlog.enums.ObjectKeyEnum;

import java.io.Serializable;
import java.util.Date;

/**
 * created by allen on 2018/7/15 at 12:11
 *
 * @author allen
 */
@Data
@Builder
public class Upload implements Serializable {

    @TableId(type = IdType.UUID)
    private String id;
    private String diskPath;
    private String virtualPath;
    private Date upload;
    private String type;
    private String userId;
    /**
     * 上传标识，标识是从哪个功能和模块部分上传的
     * 如：添加文章编辑器、文章封面上传等。
     * 详情见{@link ObjectKeyEnum}
     */
    private ObjectKeyEnum objectKey;
    /**
     * 通常为文章id
     */
    private String objectKeyId;
}
