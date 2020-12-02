package kr.ync.mapper;

import java.util.List;

import kr.ync.domain.MovieMemberVO;

public interface MovieMemberMapper {
	
	public void insert(MovieMemberVO movie_member);

	public List<MovieMemberVO> getList();

	public int update(MovieMemberVO movie_member);

	public MovieMemberVO read(String userName);
	
	
}
