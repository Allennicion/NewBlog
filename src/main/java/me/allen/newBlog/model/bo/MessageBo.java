package me.allen.newBlog.model.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;
import me.allen.newBlog.model.entity.Message;

/**
 * @author allen
 */
@Data
@AllArgsConstructor
@RequiredArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class MessageBo extends Message {

    private String nickname;
    private String avatar;
    private String role;
}
