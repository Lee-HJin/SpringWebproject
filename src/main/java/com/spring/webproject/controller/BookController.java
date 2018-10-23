package com.spring.webproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.BooksDAO;
import com.spring.webproject.dto.AuthorDTO;
import com.spring.webproject.dto.BooksDTO;
import com.spring.webproject.dto.BooksImageDTO;

@Controller
public class BookController {

	@Autowired
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
		
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기 
		
		BooksDTO dto =dao.getReadBookData(isbn);
		AuthorDTO dto2 = dao.getReadAuthorData(isbn);
		
		request.setAttribute("dto", dto); // 책 정보 넘겨주기
		request.setAttribute("dto2", dto2); // 작가 정보 넘겨주기
		
		request.setAttribute("isbn", isbn); // 책 번호 넘겨주기
		
		return "/books/book_info";
	}
	
	
	
	
	

	// 도서 리뷰 페이지
	@RequestMapping(value = "/book_review.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review(HttpServletRequest request, HttpServletResponse response) {
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기 

		request.setAttribute("isbn", isbn); // 도서 번호 넘겨주기

		return "/books/review/book_review";

	}

	// 도서 리뷰 작성 페이지
	@RequestMapping(value = "/book_review_created.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_created(HttpServletRequest request, HttpServletResponse response) {
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기 

		return "/books/review/book_review_created";
	}

	// 도서 리뷰 작성
	@RequestMapping(value = "/book_review_created_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_created_ok(BooksDTO dto,HttpServletRequest request, HttpServletResponse response) {
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기 

		return "redirect:/book_review.action";
	}

	// 도서 간단평
	@RequestMapping(value = "/book_simpleReview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_simpleReview(HttpServletRequest request, HttpServletResponse response) {
		
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기 
		return "/books/review/book_simpleReview";
	}

	
	
	
	
	
	// 도서 미리보기
	@RequestMapping(value = "/book_preview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_preview(HttpServletRequest request, HttpServletResponse response) {

		String cp = request.getContextPath();
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기 

		List<BooksImageDTO> lists = dao.getReadBookImageData(isbn); // 책 미리보기 이미지
		BooksDTO dto2 =dao.getReadBookData(isbn); // 책정보
		
		

		// 도서 객체 전송
		request.setAttribute("lists", lists);
		request.setAttribute("dto2", dto2);

		return "/books/book_preview";
	}
}
