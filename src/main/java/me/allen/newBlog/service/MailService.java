package me.allen.newBlog.service;

import me.allen.newBlog.model.entity.Article;

/**
 * created by allen on 2019-01-08 at 22:27
 *
 * @author allen
 */
public interface MailService {


    /**
     * 发送邮件
     *
     * @param subject    邮件主题
     * @param targetMail 发送给谁，目标邮件
     * @param content    邮件内容
     * @param isHtml     是否发送富文本
     * @return
     */
    void sendMail(String subject, String targetMail, String content, boolean isHtml);

    /**
     * 发送评论通知邮件
     *
     * @param site
     * @param article
     * @param comment
     */
    void sendNoticeMail(String site, Article article, String comment);

    /**
     * 发送留言通知
     *
     * @param site
     * @param message
     */
    void sendMessageMail(String site, String message);

    /**
     * 发送注册验证邮件
     *
     * @param email
     */
    void sendMailCode(String email);
}
