package kr.ync.service;

import java.util.List;

import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyPageDTO;
import kr.ync.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);

	public ReplyVO get(int rno);

	public int modify(ReplyVO vo);

	public int remove(int rno);

	public List<ReplyVO> getList(Criteria cri, int prog_num);
	
	public ReplyPageDTO getListWithPaging(Criteria cri, int prog_num);
}
