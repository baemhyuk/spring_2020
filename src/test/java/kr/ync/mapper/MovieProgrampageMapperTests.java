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
	
	@Test
	public void testInsert() {
		MovieProgrampageVO mv_program = new MovieProgrampageVO();
		mv_program.setProg_num(1);
		mv_program.setTitle("프리키 데스데이");
		mv_program.setPoster("https://movie-phinf.pstatic.net/20201105_64/1604563236779zb4rn_JPEG/movie_image.jpg");
		mv_program.setYear(2020);
		mv_program.setRate(5);
		mv_program.setContent("“폐 끼치고 싶진 않았어요”\r\n" + 
				"전원백수로 살 길 막막하지만 사이는 좋은 기택(송강호) 가족.\r\n" + 
				" 장남 기우(최우식)에게 명문대생 친구가 연결시켜 준 고액 과외 자리는\r\n" + 
				" 모처럼 싹튼 고정수입의 희망이다.\r\n" + 
				" 온 가족의 도움과 기대 속에 박사장(이선균) 집으로 향하는 기우.\r\n" + 
				" 글로벌 IT기업 CEO인 박사장의 저택에 도착하자\r\n" + 
				" 젊고 아름다운 사모님 연교(조여정)가 기우를 맞이한다.\r\n" + 
				" \r\n" + 
				" 그러나 이렇게 시작된 두 가족의 만남 뒤로, 걷잡을 수 없는 사건이 기다리고 있었으니…");
		mv_program.setCountry("미국");
		mv_program.setGenre("공포");
		mv_program.setDiv_num(1);
		mv_program.setVideo("https://www.youtube.com/embed/4vf-Q3gIl9w");
		
		program.insert(mv_program);

		log.info(mv_program);
	
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
}
