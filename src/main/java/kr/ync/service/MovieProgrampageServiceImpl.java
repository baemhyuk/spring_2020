package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieProgrampageVO;
import kr.ync.mapper.MovieMemberMapper;
import kr.ync.mapper.MovieProgrampageMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MovieProgrampageServiceImpl implements MovieProgrampageService {
	
	@Autowired
	private MovieProgrampageMapper mapper;
	
	@Override
	public void register(MovieProgrampageVO movie_program) {
		// TODO Auto-generated method stub
		log.info("register......" + movie_program);

		mapper.insert(movie_program);
	}

	@Override
	public List<MovieProgrampageVO> getList_index() {
		
		log.info("getList..........");
		
		 return mapper.getList_index();
	}

	@Override
	public int getTotal_movie(Criteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public int getTotal_tv(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get total count");
		
		return mapper.getTotalCount2(cri);
	}

	@Override
	public List<MovieProgrampageVO> getListWithPaging_index(Criteria cri) {
		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging_index(cri);
	}
	
	@Override
	public List<MovieProgrampageVO> getListWithPaging_tvshow(Criteria cri) {
		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging_tvshow(cri);
	}

	@Override
	public MovieProgrampageVO get(Long bno) {
		log.info("get......" + bno);

		return mapper.read(bno);
	}

	@Override
	public boolean modify(MovieProgrampageVO movie_program) {
		log.info("modify......" + movie_program);
		
		// SQL 성공 시 <update tag에서 update 된 갯수를 리턴. 따라서 mapper.update(board)의 값은 1이됨. 
		// return true 가 됨.
		return mapper.update(movie_program) == 1;
	}

	@Override
	public boolean remove(long bno) {
		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}

	@Override
	public List<MovieProgrampageVO> getList_tvshow() {
		log.info("getList..........");
		
		 return mapper.getList_tvshow();
	}

	
	
	

}
