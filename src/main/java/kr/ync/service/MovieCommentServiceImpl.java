package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieCommentVO;
import kr.ync.mapper.MovieCommentMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MovieCommentServiceImpl implements MovieCommentService {
	
	@Autowired
	private MovieCommentMapper mapper;

	@Override
	public void register(MovieCommentVO movie_comment) {
		// TODO Auto-generated method stub
		
		log.info("register......" + movie_comment);

		mapper.insert(movie_comment);
	}
	
	
}
