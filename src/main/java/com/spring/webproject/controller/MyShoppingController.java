package com.spring.webproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.LoginDAO;
import com.spring.webproject.dao.MyShoppingDAO;
import com.spring.webproject.dto.UserDTO;

@Controller
public class MyShoppingController {

	@Autowired
	MyShoppingDAO dao;

	@Autowired
	LoginDAO loginDao;

	//나의쇼핑 메인
	@RequestMapping(value = "/myShoppingMain.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String myShoppingMain() {

		return "myShopping/myShoppingMain";
	}

	//회원정보수정(비밀번호 재확인)
	@RequestMapping(value = "myShopping/pre_updateMyInfo.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String myInfoPwdCheck() {

		return "myShopping/pre_updateMyInfo";
	}

	//회원정보수정(비밀번호 재확인 완료 후 회원정보수정 페이지로 넘어감)
	@RequestMapping(value = "myShopping/pre_updateMyInfo_ok.action", method = RequestMethod.POST)
	public String myInfoPwdCheck(HttpServletRequest request) {	

		UserDTO dto = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto.getUserId();
		String inputPwd = request.getParameter("userPwd");

		//userPwd 찾아오기
		String userPwd = dao.getUserPwd(userId);

		if(!(inputPwd.equals(userPwd))) {
			request.getSession().setAttribute("pwdErrMessage", "비밀번호가 일치하지 않습니다.");
			return "redirect:/myShopping/pre_updateMyInfo.action";
		}
		else {
			return "redirect:/myShopping/updateMyInfo.action";
		}
	}

	//회원정보수정 페이지
	@RequestMapping(value = "myShopping/updateMyInfo.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String updateMyInfo(HttpServletRequest request) {

		request.getSession().removeAttribute("pwdErrMessage");

		return "myShopping/updateMyInfo";
	}

	//회원정보수정 저장
	@RequestMapping(value = "myShopping/updateMyInfo_ok.action", method = RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request, UserDTO dto, Model model) {

		//회원정보 수정
		dao.updateUserInfo(dto);

		model.addAttribute("alertMsg","성공적으로 회원정보가 수정되었습니다!");
		model.addAttribute("nextUrl","/myShoppingMain.action");

		//수정된 회원정보를 다시 불러 세션에 올림
		UserDTO updatedDTO = dao.getUserInfo(dto.getUserId());
		request.getSession().setAttribute("userInfo", updatedDTO);

		return "common/alert";
	}

	//비밀번호 변경 페이지
	@RequestMapping(value = "myShopping/updatePwd.action", method = RequestMethod.GET)
	public String updatePwd() {

		return "myShopping/updatePwd";
	}

	//비밀번호 변경 진행
	@RequestMapping(value = "myShopping/updatePwd_ok.action", method = RequestMethod.POST)
	public String updatePwd(HttpServletRequest request, Model model) {

		//form에서 넘어오는 패스워드
		String userPwd = request.getParameter("userPwd");
		String updatePwd = request.getParameter("newPwd1");

		UserDTO dto = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto.getUserId();

		//userPwd 찾아오기
		String findedUserPwd = dao.getUserPwd(userId);

		//기존 비밀번호 불일치
		if(!(userPwd.equals(findedUserPwd))) {

			model.addAttribute("alertMsg","기존 비밀번호가 일치하지 않습니다.");
			model.addAttribute("nextUrl","myShopping/updatePwd.action");

			return "common/alert";
		}
		else {	//기존 비밀번호 일치, 비밀번호 변경 진행

			dao.updatePwd(userId, updatePwd);

			model.addAttribute("alertMsg","비밀번호가 변경되었습니다.");
			model.addAttribute("nextUrl","myShopping/updatePwd.action");
			model.addAttribute("windowClose","window.close();");

			return "common/alert";
		}

	}

	//주문/배송조회 페이지
	@RequestMapping(value = "myShopping/myOrderList.action", method = RequestMethod.GET)
	public String myOrderList(HttpServletRequest request) {

		return "myShopping/myOrderList";
	}

	//취소/반품/교환 내역 페이지
	@RequestMapping(value = "myShopping/myOrderRetList.action", method = RequestMethod.GET)
	public String myOrderRetList(HttpServletRequest request) {

		return "myShopping/myOrderRetList";
	}

	//적립금 페이지
	@RequestMapping(value = "myShopping/myPointHistory.action", method = RequestMethod.GET)
	public String myPointHistory(HttpServletRequest request) {

		return "myShopping/myPointHistory";
	}

	//최근 본 상품 페이지
	@RequestMapping(value = "myShopping/myLatesBooksList.action", method = RequestMethod.GET)
	public String myLatesBooksList(HttpServletRequest request) {

		return "myShopping/myLatesBooksList";
	}

	//위시리스트 페이지
	@RequestMapping(value = "myShopping/myWishList.action", method = RequestMethod.GET)
	public String myWishList(HttpServletRequest request) {

		return "myShopping/myWishList";
	}

	//리뷰가 있는 책 페이지
	@RequestMapping(value = "myShopping/myReviewList.action", method = RequestMethod.GET)
	public String myReviewList(HttpServletRequest request) {

		return "myShopping/myReviewList";
	}

	//리뷰를 기다리는 책 페이지
	@RequestMapping(value = "myShopping/readyReviewList.action", method = RequestMethod.GET)
	public String readyReviewList(HttpServletRequest request) {

		return "myShopping/readyReviewList";
	}

	//간단평 페이지
	/*@RequestMapping(value = "myShopping/my.action", method = RequestMethod.GET)
	public String myWishList(HttpServletRequest request) {

		return "myShopping/myWishList";
	}*/

	//최근덧글 페이지
	/*@RequestMapping(value = "myShopping/myWishList.action", method = RequestMethod.GET)
	public String myWishList(HttpServletRequest request) {

		return "myShopping/myWishList";
	}*/

	//1:1상담내역 페이지
	@RequestMapping(value = "myShopping/myCounselHistory.action", method = RequestMethod.GET)
	public String myCounselHistory(HttpServletRequest request) {

		return "myShopping/myCounselHistory";
	}




}
