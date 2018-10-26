package com.spring.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookController {

	// 소설
	@RequestMapping(value="/book_novel.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String book_novel() {
		return "/books/cate/novel/book_novel";
	}

	// 현대소설
	@RequestMapping(value="/modern_novel.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String iframeCardInfo() {
		return "/books/cate/novel/modern_novel";
	}
	
	
	
	
	
	//자기계발 도서
	@RequestMapping(value="/book_self_improvement.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String book_self_improvement() {
		return "/books/book_self_improvement";
	}
	
	
	
		
	
	// 도서 상세 페이지
	@RequestMapping(value="/book_info.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String book_info() {
		return "/books/book_info";
	}
	
	
	
	
	
	// 도서 미리보기
	@RequestMapping(value="/book_preview.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String book_preview() {
		return "/books/book_preview";
	}
}
