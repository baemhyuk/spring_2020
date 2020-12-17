package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.Criteria;
import kr.ync.domain.MovieProgrampageVO;
import kr.ync.domain.PageDTO;
import kr.ync.service.MovieProgrampageService;
import kr.ync.util.UploadUtils;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminProgramPageController {

	@Autowired
	private MovieProgrampageService service;
	
	@GetMapping("/admin_movie_register")
	public void admin_movie_register() {

	}
	
	@GetMapping("/admin_tv_register")
	public void admin_tv_register() {

	}
	
	@PostMapping("/admin_movie_register")
	public String admin_movie_register(MovieProgrampageVO program, RedirectAttributes rttr) {
		
		log.info("register: " + program);

		service.register(program);

		rttr.addFlashAttribute("result", program.getProg_num());

		return "redirect:/admin/admin_movie";
	}
	
	@PostMapping("/admin_tv_register")
	public String admin_tv_register(MovieProgrampageVO program, RedirectAttributes rttr) {
		
		log.info("register: " + program);

		service.register(program);

		rttr.addFlashAttribute("result", program.getProg_num());

		return "redirect:/admin/admin_tv";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_movie")
	public void admin_movie(Criteria cri, Model model) {

		log.info("admin_movie: " + cri);
		
		
		int total = service.getTotal_movie(cri);
		log.info("total: " + total);
		model.addAttribute("admin_movie", service.getListWithPaging_index(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_tv")
	public void admin_tv(Criteria cri, Model model) {

		log.info("admin_tv: " + cri);
		
		
		int total = service.getTotal_tv(cri);
		log.info("total: " + total);
		model.addAttribute("admin_tv", service.getListWithPaging_tvshow(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@GetMapping({ "/admin_movie_get", "/admin_movie_modify" })
	public void admin_movie_get(@RequestParam("prog_num") int prog_num, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/admin_movie_get or admin_movie_modify");
		model.addAttribute("movie_get", service.get(prog_num));
	}
	
	@GetMapping({ "/admin_tv_get", "/admin_tv_modify" })
	public void admin_tv_get(@RequestParam("prog_num") int prog_num, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/admin_tv_get or admin_tv_modify");
		model.addAttribute("tv_get", service.get(prog_num));
	}
	
	@PostMapping("/admin_movie_modify")
	public String admin_movie_modify(MovieProgrampageVO program, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + program);
		
		if (service.modify(program)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/admin_movie" + cri.getListLink();
	}
	
	@PostMapping("/admin_tv_modify")
	public String admin_tv_modify(MovieProgrampageVO program, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + program);
		
		if (service.modify(program)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/admin_tv" + cri.getListLink();
	}
	
	@PostMapping("/admin_movie_remove")
	public String admin_movie_remove(@RequestParam("prog_num") int prog_num, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + prog_num);
		if (service.remove(prog_num)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/admin_movie" + cri.getListLink();
	}

	@PostMapping("/admin_tv_remove")
	public String admin_tv_remove(@RequestParam("prog_num") int prog_num, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + prog_num);
		if (service.remove(prog_num)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/admin_tv" + cri.getListLink();
	}
}
