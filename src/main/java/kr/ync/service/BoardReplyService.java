package kr.ync.service;

import java.util.List;

import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyPageDTO;
import kr.ync.domain.BoardReplyVO;

public interface BoardReplyService {

	public int register(BoardReplyVO vo);

	public BoardReplyVO get(Long rno);

	public int modify(BoardReplyVO vo);

	public int remove(Long rno);

	public List<BoardReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListWithPaging(Criteria cri, Long bno);

}
