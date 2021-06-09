package me.allen.newBlog.model.bo.login;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * created by allen on 2019/1/2 at 16:57
 *
 * @author allen
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QqLoginData implements Serializable {

    private String callbackDomain;
    private String code;


}
