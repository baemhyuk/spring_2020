package kr.ync.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MovieMemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieMemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieMemberMapper member;
	
//	@Test
//	public void testInsert() {
//
//		MovieMemberVO mv_member = new MovieMemberVO();
//		mv_member.setUser_id("js03250");
//		mv_member.setUser_pwd("1234");
//		mv_member.setPhone_num("01033665938");
//		mv_member.setUser_level(200);
//		mv_member.setUser_name("배민혁");
//
//		member.insert(mv_member);
//
//		log.info(mv_member);
//	}
	
	@Test
	public void testRead() {
		MovieMemberVO a = member.read("js03250");
		log.info(a);
		
	}
	
		
	
}
