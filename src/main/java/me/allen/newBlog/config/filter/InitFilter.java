package me.allen.newBlog.config.filter;

import me.allen.newBlog.utils.NbUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用于判断是否已经安装好了小汪的酱牛肉系统的过滤作用
 * created by allen on 2019-08-09 at 10:03
 *
 * @author allen
 */
public class InitFilter extends HandlerInterceptorAdapter {

    private static final String INIT_URL = "/init";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (NbUtils.noteBlogIsInstalled()) {
            return true;
        } else {
            response.sendRedirect(INIT_URL);
            return false;
        }
    }
}
