package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyPageDTO;
import kr.ync.domain.BoardReplyVO;
import kr.ync.mapper.BoardMapper;
import kr.ync.mapper.BoardReplyMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardReplyServiceImpl implements BoardReplyService {

	@Autowired
	private BoardReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(BoardReplyVO vo) {
		log.info("register......" + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public BoardReplyVO get(Long rno) {
		log.info("get......" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(BoardReplyVO vo) {
		log.info("modify......" + vo);
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		
		BoardReplyVO vo = mapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<BoardReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board " + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return null;
	}
}

