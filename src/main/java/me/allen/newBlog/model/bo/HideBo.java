package me.allen.newBlog.model.bo;

import lombok.Getter;
import lombok.Setter;
import me.allen.newBlog.model.entity.Hide;

import java.io.Serializable;
import java.util.Date;

/**
 * @author allen
 */
@Getter
@Setter
public class HideBo extends Hide implements Serializable {

    private String title;
    private Date purchaseTime;


    public HideBo(String id, String articleId, String hideType, String hideHtml, Integer hidePrice) {
        super(id, articleId, hideType, hideHtml, hidePrice);
    }
}
