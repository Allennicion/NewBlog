package me.allen.newBlog.model.bo.login;

import lombok.Data;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

/**
 * created by allen on 2018/7/21 at 18:37
 * @author allen
 */
@Data
public class SimpleLoginData implements Serializable {

    private String nbv5name;
    private String nbv5pass;
    private String nbv5code;

}
