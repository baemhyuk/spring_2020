package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieBookmarkVO;
import kr.ync.mapper.MovieBookmarkMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MovieBookmarkServiceImpl implements MovieBookmarkService {
	
	@Autowired
	private MovieBookmarkMapper mapper;
	
	@Override
	public void register(MovieBookmarkVO movie_bookmark) {
		// TODO Auto-generated method stub
		log.info("register......" + movie_bookmark);

		mapper.insert(movie_bookmark);
	}
}
