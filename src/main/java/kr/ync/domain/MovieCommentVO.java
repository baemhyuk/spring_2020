package kr.ync.domain;

import lombok.Data;

@Data
public class MovieCommentVO {

	private int comment_num;
	private String user_id;
	private int prog_num;
	private String content;
}
