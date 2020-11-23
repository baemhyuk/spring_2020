package kr.ync.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieProgrampageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieProgrampageMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MovieProgrampageMapper program;
	
//	@Test
//	public void testInsert() {
//		MovieProgrampageVO mv_program = new MovieProgrampageVO();
//		mv_program.setProg_num(1);
//		mv_program.setTitle("아이언맨");
//		mv_program.setPoster("https://lh3.googleusercontent.com/proxy/AODYAIVDhHaqL4JqJ23-YzMAoOOtHeH_VBEweC3pLMamkPOWn-xR4WjlqOehwo10VkhMRBlEug6Bui4YU7UGctdGOfwrZep3DAxaN6R9j7pT9coLzZFtIH28VxL8jra4ru-x0qfjMDk1rx6KjGzw0bXti5B6JpIRfURrNiUCIGG84ccbX2rJolHKIAIabvTRKJ-CBEK0dvH6szORaS7lHBtRZmjjX94ziRP-iDGEOSjx9EaglMye8hEBeV1p0_eUu8KqCF1VCI1Pr29oMKmqFQ6q3-6CY-7KR9V3-gftqiwp64G32-eiWGWwjLU9ijy8-eBWgCJAktXoOA5Pxch9D37PI-LxNjPB-BvgyQblgrPt9Sl82opQjv_mI47nbrdsh1cP69t-iz8y2Kanj28GGxfW_0IF");
//		mv_program.setYear(2011);
//		mv_program.setRate(5);
//		mv_program.setContent("슈우우웅 날아서 콰과광");
//		mv_program.setCountry("미국");
//		mv_program.setGenre("액션");
//		mv_program.setDiv_num(1);
//		mv_program.setVideo("https://youtu.be/GXLm-sj5XiM");
//		
//		program.insert(mv_program);
//
//		log.info(mv_program);
	
//	@Test
//	public void testGetList() {
//		program.getList().forEach(mv_program -> log.info(mv_program));
//	}

//	@Test
//	public void testGetTotalCount() {
//		
//		Criteria cri = new Criteria();
//		
//		int totalCnt = program.getTotalCount(cri);
//
//		log.info("totalCnt = " + totalCnt);
//
//	}
	
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    cri.setPageNum(1);
//	    cri.setAmount(18);
//
//
//		List<MovieProgrampageVO> list = program.getListWithPaging(cri);
//
//		list.forEach(mv_program -> log.info(mv_program));
//
//	}


}
