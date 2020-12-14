package kr.ync.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);

	public ReplyVO read(int prog_num);

	public int delete(int prog_num);

	public int update(ReplyVO reply);
	
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("prog_num") int prog_num);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("prog_num") int prog_num);

	public int getCountByBno(int prog_num);
}
