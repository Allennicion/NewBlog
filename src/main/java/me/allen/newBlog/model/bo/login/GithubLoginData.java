package me.allen.newBlog.model.bo.login;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * created by allen on 2019/3/24 at 11:13
 * @author allen
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GithubLoginData implements Serializable {

    private String callbackDomain;
    private String code;
}
