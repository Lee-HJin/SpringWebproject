package com.spring.webproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.BooksDAO;
import com.spring.webproject.dao.LoginDAO;
import com.spring.webproject.dto.AuthorDTO;
import com.spring.webproject.dto.BooksDTO;
import com.spring.webproject.dto.BooksImageDTO;
import com.spring.webproject.dto.ReviewDTO;
import com.spring.webproject.dto.SimpleReviewDTO;
import com.spring.webproject.dto.UserDTO;
import com.spring.webproject.dto.WareHouseDTO;
import com.spring.webproject.util.CookieUtil;
import com.spring.webproject.util.MyUtil;

@Controller
public class BookController {

	@Autowired
	BooksDAO dao;

	@Autowired
	LoginDAO dao2;

	@Autowired
	MyUtil myUtil;

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
		return "/books/cate/self_improvement/book_self_improvement";
	}

	// 도서 상세 페이지
	@RequestMapping(value = "/book_info.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_info(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		BooksDTO dto = dao.getReadBookData(isbn);
		AuthorDTO dto2 = dao.getReadAuthorData(isbn);

		String book_image = dao.getReadBookImage(isbn); // 북 커버 이미지

		request.setAttribute("book_image", book_image); // 북 커버 이미지

		UserDTO dto3 = (UserDTO) request.getSession().getAttribute("userInfo");
		if (dto3 != null) {
			String userId = dto3.getUserId();
			request.setAttribute("userId", userId);
		}
		int reviewNum = dao.getReviewDataCount(isbn);
		int simplereviewNum = dao.getSimpleReivewDataCount(isbn);
		request.setAttribute("simplereviewNum", simplereviewNum);

		WareHouseDTO dto4 = dao.getWareHouseData(isbn); // 창고 재고 받아오기

		request.setAttribute("dto4", dto4); // 웨어하우스 재고 넘겨주기

		request.setAttribute("dto", dto); // 책 정보 넘겨주기
		request.setAttribute("dto2", dto2); // 작가 정보 넘겨주기

		request.setAttribute("isbn", isbn); // 책 번호 넘겨주기

		request.setAttribute("reviewNum", reviewNum);

		// 쿠키쿠키

		CookieUtil cookieutil = new CookieUtil();

		try {

			cookieutil.setCookie("bookCookie", book_image, 1, request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/books/book_info";
	}

	// 도서 리뷰 페이지
	@RequestMapping(value = "/book_review.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review(HttpServletRequest request, HttpServletResponse response) {
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기
		request.setAttribute("isbn", isbn); // 도서 번호 넘겨주기

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		String userId = "";
		UserDTO dto3 = (UserDTO) request.getSession().getAttribute("userInfo");
		if (dto3 != null) {
			userId = dto3.getUserId();
			request.setAttribute("userId", userId);
		}

		int reviewNum = dao.getReviewDataCount(isbn); // 게시물 개수

		int currentPage = 1; // 현재페이지

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, reviewNum);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<ReviewDTO> lists = dao.getReadReviewList(start, end, isbn);
		String listUrl = "/webproject/book_review.action?isbn=" + isbn;
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		int check_review = dao.getReviewCheck(isbn, userId);

		request.setAttribute("check_review", check_review);
		request.setAttribute("lists", lists);
		request.setAttribute("reviewNum", reviewNum);
		request.setAttribute("pageIndexList", pageIndexList);
		return "/books/review/book_review";

	}

	// 도서 리뷰 상세 페이지

	@RequestMapping(value = "/book_review_main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_main(HttpServletRequest request, HttpServletResponse response) {

		int reviewId = Integer.parseInt(request.getParameter("reviewId")); // 리뷰 게시물 번호

		ReviewDTO dto = dao.getReadReviewData(reviewId);

		dao.updateHitCount(reviewId);

		request.setAttribute("dto", dto);

		return "/books/review/book_review_main";

	}

	// 도서 리뷰 작성 페이지
	@RequestMapping(value = "/book_review_created.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_created(HttpServletRequest request, HttpServletResponse response) {
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		BooksDTO dto = dao.getReadBookData(isbn);

		UserDTO dto3 = (UserDTO) request.getSession().getAttribute("userInfo");
		if (dto3 != null) {
			String userName = dto3.getUserName();
			request.setAttribute("userName", userName);

		}

		String book_image = dao.getReadBookImage(isbn); // 북 커버 이미지

		request.setAttribute("book_image", book_image); // 북 커버 이미지
		request.setAttribute("dto", dto);
		request.setAttribute("isbn", isbn);

		return "/books/review/book_review_created";
	}

	// 도서 리뷰 작성_프로세스
	@RequestMapping(value = "/book_review_created_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_created_ok(ReviewDTO dto, HttpServletRequest request, HttpServletResponse response) {
		String isbn = request.getParameter("isbn"); // 책 고유번호 가져오기

		UserDTO dto3 = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto3.getUserId();
		int rate = Integer.parseInt(request.getParameter("rate"));

		int maxReviewId = dao.getMaxNum(); // 리뷰게시물 최대번호
		System.out.println("게시물 맥스넘버 : " + maxReviewId);
		System.out.println("유저 아이디 : " + userId);
		dto.setIsbn(isbn);
		dto.setReviewId(maxReviewId + 1);
		dto.setUserId(userId);
		dto.setContents(dto.getContents());

		System.out.println("isbn = " + dto.getIsbn());
		System.out.println("maxReviewId = " + dto.getReviewId());
		System.out.println("userId = " + userId);
		System.out.println("contents = " + dto.getContents());
		System.out.println("reviewTitle = " + dto.getReviewTitle());

		dao.insertReviewData(dto); // 리뷰게시물 등록
		System.out.println("게시물등록완료");

		System.out.println("rate : " + rate);
		dao.insertReviewRateData(isbn, userId, rate); // 평점 등록
		System.out.println("평점 등록완료");

		dao.insertReviewThumbUpData(userId, dto.getReviewId());

		return "redirect:/book_info.action?isbn=" + isbn;

	}

	// 도서 간단평
	@RequestMapping(value = "/book_simpleReview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_simpleReview(HttpServletRequest request, HttpServletResponse response) {

		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		UserDTO dto3 = (UserDTO) request.getSession().getAttribute("userInfo");

		if (dto3 != null) {
			String userId = dto3.getUserId();
			request.setAttribute("userId", userId);
		}
		int simplereviewNum = dao.getSimpleReivewDataCount(isbn);
		request.setAttribute("simplereviewNum", simplereviewNum);
		request.setAttribute("isbn", isbn);

		return "/books/review/book_simpleReview";

	}

	// 간단평 데이터 가져오기
	@RequestMapping(value = "/book_simpleReview_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_simpleReview_ok(HttpServletRequest request, HttpServletResponse response) {

		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		List<SimpleReviewDTO> lists = dao.getReadSimpleReviewList(isbn);

		request.setAttribute("lists", lists);

		return "/books/review/book_simpleReview_ok";
	}

	// 도서 미리보기
	@RequestMapping(value = "/book_preview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_preview(HttpServletRequest request, HttpServletResponse response) {

		String cp = request.getContextPath();
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		List<BooksImageDTO> lists = dao.getReadBookImageData(isbn); // 책 미리보기 이미지
		BooksDTO dto2 = dao.getReadBookData(isbn); // 책정보

		// 도서 객체 전송
		request.setAttribute("lists", lists);
		request.setAttribute("dto2", dto2);

		return "/books/book_preview";
	}

	// 로그인 안되어 있을경우 로그인
	@RequestMapping(value = "/login2.action", method = RequestMethod.GET)
	public String login2(HttpServletRequest request, HttpServletResponse response) {
		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		request.setAttribute("isbn", isbn);
		return "books/book_login2";
	}

	@RequestMapping(value = "/login_ok2.action", method = RequestMethod.POST)
	public String loginProcess2(HttpServletRequest request) {

		int isbn = Integer.parseInt(request.getParameter("isbn")); // 책 고유번호 가져오기

		String returnUrl = "";
		String userId = request.getParameter("user_id");
		String userPwd = request.getParameter("userPwd");

		UserDTO dto = dao2.login(userId, userPwd);

		if (dto != null) { // 로그인 성공

			// 회원 적립금 정보 불러오기
			int pointValue = dao2.getPointValue(userId);

			// 회원 등급 정보 불러오기

			// 세션 - dto, pointValue 올리기
			request.getSession().setAttribute("userInfo", dto);
			request.getSession().setAttribute("pointValue", pointValue);
			request.getSession().removeAttribute("message");
			returnUrl = "redirect:/book_info.action?isbn=" + isbn;

		} else { // 로그인 실패

			returnUrl = "redirect:/login2.action?isbn=" + isbn;
			request.getSession().setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		return returnUrl;
	}

	// 공감하기 1
	@RequestMapping(value = "/book_review_vote.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_vote(HttpServletRequest request) {

		String isbn = request.getParameter("isbn"); // 책 고유번호 가져오기

		int reviewId = Integer.parseInt(request.getParameter("reviewId"));

		dao.updateThumbUp(reviewId);

		System.out.println("공감수 업데이트 완료");

		return "redirect:/book_review_main.action?isbn=" + isbn + "&reviewId=" + reviewId;

	}

	// 공감하기 2
	@RequestMapping(value = "/book_review_vote2.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String book_review_vote2(HttpServletRequest request) {

		String isbn = request.getParameter("isbn"); // 책 고유번호 가져오기
		System.out.println("isbn: " + isbn + "입니다.");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));

		dao.updateThumbUp(reviewId);

		System.out.println("공감수 업데이트 완료2");

		return "redirect:/book_simpleReview.action?isbn=" + isbn;
	}

	// 도서 간단평 등록
	@RequestMapping(value = "/enroll_simpleReview.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String enroll_simpleReview(SimpleReviewDTO dto, HttpServletRequest request, HttpServletResponse response) {

		String isbn = request.getParameter("isbn"); // 책 고유번호 가져오기
		String sentence = request.getParameter("sentence");

		UserDTO dto3 = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto3.getUserId();
		int maxReviewId = dao.getMaxNum(); // 리뷰게시물 최대번호
		dto.setIsbn(isbn);
		dto.setReviewId(maxReviewId + 1);
		dto.setUserId(userId);
		dto.setSentence(sentence);
		System.out.println(isbn + " / " + (maxReviewId + 1) + " / " + userId + " / " + dto.getSentence());
		System.out.println("유저 아이디 : " + userId);
		System.out.println("리뷰 번호 : " + maxReviewId + 1);

		dao.insertSimpleReviewData(dto); // 간단평 등록
		System.out.println("간단평 등록1 완료");
		dao.insertSimpleReviewData2(userId, (maxReviewId + 1));
		System.out.println("간단평 등록2 완료");

		System.out.println(userId + " / " + (maxReviewId + 1));

		return "redirect:/book_simpleReview.action?isbn=" + isbn;
	}
}
