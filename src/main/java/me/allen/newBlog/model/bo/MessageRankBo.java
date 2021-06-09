package me.allen.newBlog.model.bo;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * created by allen on 2019/10/21 at 5:32 下午
 *
 * @author allen
 */
@Data
@Builder
public class MessageRankBo implements Serializable {

    private String avatar;
    private String nickname;
    private String msgCnt;
    private String latestMsgDate;

}
