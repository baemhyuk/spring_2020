package kr.ync.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieMemberVO;
import kr.ync.domain.MovieProgrampageVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class MovieProgrampageServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private MovieProgrampageService service;
	
	@Test
	public void testRegister() {

		MovieProgrampageVO movie_program = new MovieProgrampageVO();
		movie_program.setTitle("The Mandalorian");
		movie_program.setPoster("https://image.tmdb.org/t/p/w500/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg");
		movie_program.setYear(2019);
		movie_program.setRate(1);
		movie_program.setContent("After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.");
		movie_program.setCountry("미국");
		movie_program.setGenre("SF");
		movie_program.setDiv_num(2);
		movie_program.setVideo("https://youtu.be/eW7Twd85m2g");
		
		service.register(movie_program);

		log.info("생성된 게시물의 번호: " + movie_program.getTitle());
	}
	

//	@Test
//	public void testGetList() {
//
//		service.getList_tvshow().forEach(movie_program -> log.info(movie_program));
//	}
	
//	@Test
//	public void testUpdate() {
//
//		MovieProgrampageVO movie_program = service.get(1L);
//
//		if (movie_program == null) {
//			return;
//		}
//
//		movie_program.setTitle("제니와 동완이의 합방");
//		log.info("MODIFY RESULT: " + service.modify(movie_program));
//	}
//	
	
//	@Test
//	public void testDelete() {
//
//		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove(22L));
//
//	}
	
//	@Test
//	public void testGetListWithPaging() {
//
//		service.getListWithPaging(new Criteria(1, 10)).forEach(movie_program -> log.info(movie_program));
//	}

	@Test
	public void totalTest() {
		
		Criteria cri = new Criteria();
		log.info("total cnt " + service.getTotal(cri));
		
	}

}
