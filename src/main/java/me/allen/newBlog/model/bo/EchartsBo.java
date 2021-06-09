package me.allen.newBlog.model.bo;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @author allen
 */
@Data
@Builder
public class EchartsBo implements Serializable {

    private String name;
    private String value;
}
