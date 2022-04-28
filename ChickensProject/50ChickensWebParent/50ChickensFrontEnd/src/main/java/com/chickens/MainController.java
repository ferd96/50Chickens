package com.chickens;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	
	@GetMapping("")
	public String viewHomePage(Model model) {
		return "index";
	}
	@GetMapping("/login")
	public String viewLoginPage() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			return "login";
		}
		return "redirect:/";
	}
	@GetMapping("/blog")
	public String viewBlog(Model model) {
		return "blog";
	}
	@GetMapping("/contact")
	public String viewContact(Model model) {
		return "contact";
	}
	@GetMapping("/stuff")
	public String viewStuff(Model model) {
		return "stuff";
	}
}
