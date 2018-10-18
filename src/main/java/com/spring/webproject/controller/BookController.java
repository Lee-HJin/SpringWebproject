package com.spring.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookController {

	@RequestMapping(value="/book_novel.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String book_novel() {
		return "/books/book_novel";
	}
	@RequestMapping(value="/book_self_improvement.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String book_self_improvement() {
		return "/books/book_self_improvement";
	}
	
}
