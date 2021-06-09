package me.allen.newBlog.service;

/**
 * created by allen on 2019-08-14 at 15:23
 * @author allen
 */
public interface LoginService<R, P> {

    /**
     * 登录
     *
     * @param param
     * @return
     */
    R doLogin(P param);
}
