package kr.ync.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.MovieBookmarkVO;
import kr.ync.domain.MovieCommentVO;
import kr.ync.domain.MovieMemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieBookmarkMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MovieBookmarkMapper bookmark;
	
	@Test
	public void testInsert() {

		MovieBookmarkVO mv_bookmark = new MovieBookmarkVO();
		mv_bookmark.setUser_id("js03250");
		mv_bookmark.setProg_num(1);
		
		bookmark.insert(mv_bookmark);
		
		log.info(mv_bookmark);
	}
}
