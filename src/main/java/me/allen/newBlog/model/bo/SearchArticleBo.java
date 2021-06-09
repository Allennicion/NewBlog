package me.allen.newBlog.model.bo;

import lombok.*;
import me.allen.newBlog.model.entity.Article;

/**
 * @author allen
 */
@Data
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@RequiredArgsConstructor
public class SearchArticleBo extends Article {

    private String type;
    private String resContent;
}
