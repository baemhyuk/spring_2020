package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieProgrampageVO;
import kr.ync.domain.PageDTO;
import kr.ync.service.MovieProgrampageService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class MovieProgrampageController {

	@Autowired
	private MovieProgrampageService service;
	
	@GetMapping("/index")
	  public void index(Criteria cri, Model model) {
	      
	      log.info("index : " + cri);
	      
	      int total = service.getTotal(cri);
	      log.info("total : " + total);
	      model.addAttribute("movie", service.getListWithPaging_index(cri));
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	 }
	
	@GetMapping("/Tvshow")
	  public void Tvshow(Criteria cri, Model model) {
	      
	      log.info("index : " + cri);
	      
	      int total = service.getTotal2(cri);
	      log.info("total : " + total);
	      model.addAttribute("tv", service.getListWithPaging_tvshow(cri));
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	 }
	
//	@PostMapping("/register")
//	public String register(MovieProgrampageVO movie_program, RedirectAttributes rttr) {
//		
//		log.info("register: " + movie_program);
//	      
//	      service.register(movie_program);
//	      
//	      rttr.addFlashAttribute("result" , movie_program.getProg_num());
//	      
//	      return "redirect:/front/index";
//	}

	
}
