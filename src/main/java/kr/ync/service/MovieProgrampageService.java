package kr.ync.service;

import java.util.List;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieBookmarkVO;
import kr.ync.domain.MovieProgrampageVO;

public interface MovieProgrampageService {
	
	// 글 등록
	public void register(MovieProgrampageVO movie_program);
	
	public MovieProgrampageVO get(int prog_num);
	
	public boolean modify(MovieProgrampageVO movie_program);

	public boolean remove(int prog_num);
	
	// 전체 글 목록
	public List<MovieProgrampageVO> getList_index();
	
	public List<MovieProgrampageVO> getList_tvshow();
//	
//	// 글 목록 페이징 
	public List<MovieProgrampageVO> getListWithPaging_index(Criteria cri);
	
	public List<MovieProgrampageVO> getListWithPaging_tvshow(Criteria cri);
//
//	//추가
	public int getTotal_movie(Criteria cri);
	
	public int getTotal_tv(Criteria cri);
	

	

	

	

}
