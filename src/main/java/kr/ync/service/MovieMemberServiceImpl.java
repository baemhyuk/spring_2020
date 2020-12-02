package kr.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieMemberVO;
import kr.ync.mapper.BoardMapper;
import kr.ync.mapper.MovieMemberMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MovieMemberServiceImpl implements MovieMemberService {
	
	@Autowired
	private MovieMemberMapper mapper;

	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Override
	public void register(MovieMemberVO movie_member) {
		// TODO Auto-generated method stub
		log.info("register......" + movie_member);

		String inputPass = movie_member.getUser_pwd();
	    String pass = passEncoder.encode(inputPass);
	    movie_member.setUser_pwd(pass);
		
		mapper.insert(movie_member);
	}

	@Override
	public List<MovieMemberVO> getList() {
		log.info("getList..........");
		
		 return mapper.getList();
	}

}
