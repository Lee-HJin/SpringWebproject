package com.spring.webproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.BooksDAO;

@Controller
public class BookController {

	@Qualifier("BooksDAO")
	BooksDAO dao;

	// 소설
	@RequestMapping(value = "/book_novel.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_novel(HttpServletRequest request, HttpServletResponse response) {
		return "/books/cate/novel/book_novel";
	}

	// 현대소설
	@RequestMapping(value = "/modern_novel.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String modern_novel(HttpServletRequest request, HttpServletResponse response) {
		return "/books/cate/novel/modern_novel";
	}

	// 자기계발 도서
	@RequestMapping(value = "/book_self_improvement.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_self_improvement(HttpServletRequest request, HttpServletResponse response) {
		return "/books/book_self_improvement";
	}

	
	
	
	
	// 도서 상세 페이지
	@RequestMapping(value = "/book_info.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_info(HttpServletRequest request, HttpServletResponse response) {
		return "/books/book_info";
	}
	
	// 도서 리뷰 페이지
	@RequestMapping(value = "/book_review.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review(HttpServletRequest request, HttpServletResponse response) {
		return "/books/review/book_review";
	}
	
	// 도서 리뷰 작성 페이지 
	@RequestMapping(value = "/book_review_created.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_created(HttpServletRequest request, HttpServletResponse response) {
		return "/books/review/book_review_created";
	}
	
	
	
	
	

	// 도서 미리보기
	@RequestMapping(value = "/book_preview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_preview(HttpServletRequest request, HttpServletResponse response) {

		String cp = request.getContextPath();
		// 도서 정보 아이디 가져오기
		String prodId = request.getParameter("prodId");
		
		
		
		
		
//		if(dto == null){
//			return "redirect:/books/book_info.action?prodId="+prodId;
//		}
	
		
		
		
		// 도서 객체 전송
//		request.setAttribute("dto", dto);
		
		
		return "/books/book_preview?prodId="+prodId;
	}
}
