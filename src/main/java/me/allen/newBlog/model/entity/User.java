package me.allen.newBlog.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import me.allen.newBlog.enums.RoleEnum;

import java.io.Serializable;
import java.util.Date;

/**
 * created by allen on 2019-08-05 at 13:32
 *
 * @author allen
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {

    private Long id;
    private RoleEnum role;
    private String avatar;
    private Date createDate;
    private String email;
    @Builder.Default
    private Boolean enable = true;
    private String nickname;
    private String password;
    private String openId;
    private String username;
    private Integer remainCoin;
}
