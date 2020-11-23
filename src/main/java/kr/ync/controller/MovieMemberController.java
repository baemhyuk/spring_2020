package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.BoardVO;
import kr.ync.domain.MovieMemberVO;
import kr.ync.service.BoardService;
import kr.ync.service.MovieMemberService;
import kr.ync.util.UploadUtils;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/front/*")
public class MovieMemberController {
	@Autowired
	private MovieMemberService movie_member;
	
	@GetMapping("/signup")
	public void signup() {

	}
	
	@GetMapping("/login")
	public void login() {

	}
	
	@PostMapping("/signup")
	public String register(MovieMemberVO moviemember, Model model) {
	
		log.info("register: " + moviemember);

		movie_member.register(moviemember);


		return "redirect:/front/login";
	}
}
