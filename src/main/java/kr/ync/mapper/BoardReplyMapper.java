package kr.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ync.domain.Criteria;
import kr.ync.domain.BoardReplyVO;

public interface BoardReplyMapper {

	public int insert(BoardReplyVO vo);

	public BoardReplyVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardReplyVO reply);
	
	public List<BoardReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	public List<BoardReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);

	public int getCountByBno(Long bno);
}
