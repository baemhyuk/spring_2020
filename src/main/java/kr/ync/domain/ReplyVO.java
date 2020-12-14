package kr.ync.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;
	private int prog_num;

	private String reply;
	private String user_id;
	private Date replydate;
	private Date updatedate;
	private int rating;
	
}
