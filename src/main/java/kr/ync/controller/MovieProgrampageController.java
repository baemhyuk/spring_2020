package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ync.domain.Criteria;
import kr.ync.domain.PageDTO;
import kr.ync.service.MovieProgrampageService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class MovieProgrampageController {

	@Autowired
	private MovieProgrampageService service;
	
	@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
	@GetMapping("/index")
	  public void index(Criteria cri, Model model) {
	      
	      log.info("index : " + cri);
	      
	      int total = service.getTotal_movie(cri);
	      log.info("total : " + total);
	      model.addAttribute("movie", service.getListWithPaging_index(cri));
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	 }
	
	@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
	@GetMapping("/Tvshow")
	  public void Tvshow(Criteria cri, Model model) {
	      
	      log.info("index : " + cri);
	      
	      int total = service.getTotal_tv(cri);
	      log.info("total : " + total);
	      model.addAttribute("tv", service.getListWithPaging_tvshow(cri));
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	 }
	
	@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
	@GetMapping("/media")
	public void media(@RequestParam("prog_num") int prog_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/media");
		model.addAttribute("movie", service.get(prog_num));
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
	@GetMapping("/tv_media")
	public void tv_media(@RequestParam("prog_num") int prog_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/tv_media");
		model.addAttribute("tv", service.get(prog_num));
	}

	
}
