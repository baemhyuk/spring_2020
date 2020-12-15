package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ync.domain.Criteria;
import kr.ync.domain.ReplyPageDTO;
import kr.ync.domain.ReplyVO;
import kr.ync.domain.BoardReplyVO;
import kr.ync.mapper.BoardMapper;
import kr.ync.mapper.BoardReplyMapper;
import kr.ync.mapper.MovieProgrampageMapper;
import kr.ync.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private MovieProgrampageMapper programMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register......" + vo);
		programMapper.updateReplyCnt(vo.getProg_num(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int rno) {
		log.info("get......" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify......" + vo);
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(int rno) {
		log.info("remove...." + rno);
		
		ReplyVO vo = mapper.read(rno);
		programMapper.updateReplyCnt(vo.getProg_num(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int prog_num) {
		log.info("get Reply List of a prog_num " + prog_num);
		return mapper.getListWithPaging(cri, prog_num);
	}

	@Override
	   public ReplyPageDTO getListWithPaging(Criteria cri, int prog_num) {
	  
	      return new ReplyPageDTO(
	            mapper.getCountByBno(prog_num), 
	            mapper.getListWithPaging(cri, prog_num));
	   }
}