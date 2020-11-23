package kr.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.ync.domain.BoardVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.MovieProgrampageVO;

public interface MovieProgrampageMapper {

	public void insert(MovieProgrampageVO movie_program);
	
	public List<MovieProgrampageVO> getList_index();
	
	public List<MovieProgrampageVO> getList_tvshow();

	
	
	public List<MovieProgrampageVO> getListWithPaging_index(Criteria cri);
	
	public List<MovieProgrampageVO> getListWithPaging_tvshow(Criteria cri);

	public int update(MovieProgrampageVO movie_program);

	public MovieProgrampageVO read(Long bno);

	public int delete(long bno);

	public int getTotalCount(Criteria cri);
	
	public int getTotalCount2(Criteria cri);
	

	
}
