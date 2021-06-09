package me.allen.newBlog.exception;

/**
 * created by allen on 2019-08-01 at 19:23
 *
 * @author allen
 */
public class AppSetException extends RuntimeException {
    public AppSetException(String message) {
        super(message);
    }

    public AppSetException(String message, Throwable cause) {
        super(message, cause);
    }
}
