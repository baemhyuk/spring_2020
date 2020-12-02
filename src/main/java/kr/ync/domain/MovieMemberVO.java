package kr.ync.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MovieMemberVO {
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String phone_num;
	private int user_level;
	
	private List<AuthVO> auth;
	
}
