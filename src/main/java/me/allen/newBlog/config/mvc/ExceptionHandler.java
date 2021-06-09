package me.allen.newBlog.config.mvc;

import me.allen.newBlog.exception.AppRunningException;
import me.allen.newBlog.exception.AppSetException;
import me.allen.newBlog.model.json.ResultBeanObj;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author allen
 */
@ControllerAdvice
public class ExceptionHandler {

    @org.springframework.web.bind.annotation.ExceptionHandler(value = {
            AppRunningException.class,
            AppSetException.class
    })
    @ResponseBody
    public ResultBeanObj handle(Exception e) {
        return ResultBeanObj.error(e.getMessage());
    }
}
