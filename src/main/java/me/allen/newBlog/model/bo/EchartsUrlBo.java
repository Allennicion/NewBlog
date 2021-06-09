package me.allen.newBlog.model.bo;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @author allen
 */
@Data
@Builder
public class EchartsUrlBo implements Serializable {

    private String item;
    private long cnt;

}
