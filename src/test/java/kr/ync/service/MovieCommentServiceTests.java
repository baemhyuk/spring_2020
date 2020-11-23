package kr.ync.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MovieCommentVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class MovieCommentServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private MovieCommentService service;
	
	@Test
	public void testRegister() {

		MovieCommentVO movie_comment = new MovieCommentVO();
		movie_comment.setUser_id("js03250");
		movie_comment.setProg_num(2);
		movie_comment.setContent("웅잉웅~");
		
		service.register(movie_comment);

		log.info("생성된 게시물의 번호: " + movie_comment.getUser_id());
	}
}
