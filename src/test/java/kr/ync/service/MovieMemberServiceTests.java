package kr.ync.service;

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
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class MovieMemberServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private MovieMemberService service;
	
	@Test
	public void testRegister() {

		MovieMemberVO movie_member = new MovieMemberVO();
		movie_member.setUser_id("js032501");
		movie_member.setUser_pwd("12341");
		movie_member.setUser_name("뱀혁1");
		movie_member.setPhone_num("010-3366-5938");
		
		service.register(movie_member);

		log.info("생성된 게시물의 번호: " + movie_member.getUser_id());
	}
	
//	@Test
//	public void testGetList() {
//
//		service.getList().forEach(movie_member -> log.info(movie_member));
//	}
}
