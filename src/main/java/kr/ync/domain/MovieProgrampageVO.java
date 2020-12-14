package kr.ync.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MovieProgrampageVO {
	private int prog_num;
	private String title;
	private String poster;
	private int year;
	private int rate;
	private String content;
	private String country;
	private String genre;
	private int div_num;
	private String video;
	private String prog_like;
	private int replycnt;
}
