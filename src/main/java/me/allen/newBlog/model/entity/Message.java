package me.allen.newBlog.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

import static java.lang.Boolean.TRUE;
import static java.time.LocalDateTime.now;

/**
 * created by allen on 2018/7/15 at 11:52
 *
 * @author allen
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Message implements Serializable {

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    @NotNull
    private String userId;
    private Long replyId;
    private String clearComment;
    @NotNull
    @Length(min = 1, max = 1000, message = "字数必须在1000字以内")
    private String comments;
    @Builder.Default
    private Boolean enable = TRUE;
    private String ipAddr;
    private String ipInfo;
    @Builder.Default
    private LocalDateTime post = now();
    private String userAgent;

}
