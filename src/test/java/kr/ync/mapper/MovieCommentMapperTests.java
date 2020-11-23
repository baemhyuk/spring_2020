package kr.ync.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MovieCommentVO;
import kr.ync.domain.MovieMemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieCommentMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MovieCommentMapper comment;
	
	@Test
	public void testInsert() {

		MovieCommentVO mv_comment = new MovieCommentVO();
		mv_comment.setUser_id("js03250");
		mv_comment.setProg_num(1);
		mv_comment.setContent("정말 재밌네요");
		
		comment.insert(mv_comment);
		
		log.info(mv_comment);
	}
}
