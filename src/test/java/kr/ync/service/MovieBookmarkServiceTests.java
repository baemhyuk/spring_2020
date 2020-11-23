package kr.ync.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MovieBookmarkVO;
import kr.ync.domain.MovieMemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class MovieBookmarkServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private MovieBookmarkService service;
	
	@Test
	public void testRegister() {

		MovieBookmarkVO movie_bookmark = new MovieBookmarkVO();
		movie_bookmark.setUser_id("js03250");
		movie_bookmark.setProg_num(2);
		
		service.register(movie_bookmark);

		log.info("생성된 게시물의 번호: " + movie_bookmark.getUser_id());
	}
}
