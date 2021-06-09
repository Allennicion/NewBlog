package me.allen.newBlog.model.entity;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author allen
 */
@Data
@Builder
public class Log implements Serializable {

    private Long id;
    private String contentType;
    private String ipAddr;
    private String ipInfo;
    private String requestMethod;
    private String sessionId;
    private String url;
    private String userAgent;
    private String username;
    private Date time;
    private String browser;
    private Long userId;

}
