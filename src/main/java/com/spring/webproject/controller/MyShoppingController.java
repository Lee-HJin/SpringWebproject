package com.spring.webproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.LoginDAO;
import com.spring.webproject.dao.MyShoppingDAO;
import com.spring.webproject.dto.OrderListDTO;
import com.spring.webproject.dto.UserDTO;
import com.spring.webproject.util.AjaxPageIndex;

@Controller
public class MyShoppingController {

	@Autowired
	MyShoppingDAO dao;

	@Autowired
	AjaxPageIndex ajaxPaging;

	@Autowired
	LoginDAO loginDao;

	//나의쇼핑 메인
	@RequestMapping(value = "/myShoppingMain.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String myShoppingMain(HttpServletRequest request) {

		UserDTO dto = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto.getUserId();

		//진행중 주문건 건수 - 세션
		int orderCount = dao.getCountOrderListNormal(userId);
		request.getSession().setAttribute("orderCount", orderCount);


		//최근 주문/배송 내역 간략리스트(최대 3개)
		int start = 1;
		int end = 3;

		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("start", start);
		hMap.put("end", end);
		hMap.put("userId", userId);

		List<OrderListDTO> orderList = dao.getOrderList(hMap);



		request.setAttribute("orderList", orderList);

		return "myShopping/myShoppingMain";
	}

	//회원정보수정(비밀번호 재확인)
	@RequestMapping(value = "myShopping/pre_updateMyInfo.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String preUpdateMyInfo(HttpServletRequest request) {

		String mode = request.getParameter("mode");
		request.setAttribute("mode", mode);

		return "myShopping/pre_updateMyInfo";
	}

	//회원정보수정(비밀번호 재확인 완료 후 회원정보수정 페이지로 넘어감)
	@RequestMapping(value = "myShopping/pre_updateMyInfo_ok.action", method = RequestMethod.POST)
	public String myInfoPwdCheck(HttpServletRequest request) {	

		UserDTO dto = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto.getUserId();
		String inputPwd = request.getParameter("userPwd");
		String mode = request.getParameter("mode");

		//userPwd 찾아오기
		String userPwd = dao.getUserPwd(userId);

		if(!(inputPwd.equals(userPwd))) {
			request.getSession().setAttribute("pwdErrMessage", "비밀번호가 일치하지 않습니다.");
			return "redirect:/myShopping/pre_updateMyInfo.action?mode=" + mode;
		}
		else {
			if(mode.equals("update")) {
				return "redirect:/myShopping/updateMyInfo.action";
			}
			else if(mode.equals("out")) {
				return "redirect:/myShopping/memberOut.action";
			}
			else {
				return "redirect:/myShopping/pre_updateMyInfo.action?mode=" + mode;
			}
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

	//주문/배송조회 리스트 가져오기
	@RequestMapping(value = "myShopping/getOrderList.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String getOrderList(HttpServletRequest request) {

		UserDTO dto = (UserDTO) request.getSession().getAttribute("userInfo");
		String userId = dto.getUserId();

		String pageNum = request.getParameter("pageNum");	
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println(fromDate+ "fromDate!!!!!");
		
		System.out.println(searchValue + "searchValue");

		//한 페이지당 출력 건수
		int numPerPage = 3;
		//전체 페이징 페이지
		int totalPage = 0;
		//전체 출력 건수
		int totalDataCount = 0;

		//현재 페이지
		int currentPage = 1;
		if(pageNum!=null && pageNum!="") {
			currentPage = Integer.parseInt(pageNum);
		}
		else {
			pageNum = "1";
		}

		int start = (currentPage-1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		//전체 출력 건수 가져오기
		//1.기본 검색(아무조건 없음)
		if(fromDate==null || fromDate.equals("undefined") || toDate==null || toDate.equals("undefined")) {
			
			totalDataCount = dao.getCountOrderListNormal(userId);
			
			//출력 건수에 맞춰 내용 가져오기
			Map<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("start", start);
			hMap.put("end", end);
			hMap.put("userId", userId);
	
			List<OrderListDTO> orderList = dao.getOrderList(hMap);
			
			request.setAttribute("lists", orderList);
		}
		//2.기간별 조회
		if(fromDate!=null && fromDate!="" && !fromDate.equals("undefined")) {
			
			System.out.println(fromDate+"????");
			
			totalDataCount = dao.getCountOrderListByDate(userId, fromDate, toDate);
			
			//출력 건수에 맞춰 내용 가져오기
			Map<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("start", start);
			hMap.put("end", end);
			hMap.put("userId", userId);
			hMap.put("fromDate", fromDate);
			hMap.put("toDate", toDate);
			
			System.out.println(fromDate + "fromDate");
			System.out.println(toDate + "toDate");
			
			List<OrderListDTO> orderList  = dao.getOrderListByDate(hMap);
			
			request.setAttribute("lists", orderList);
			
		}
		//3.상품명 또는 ISBN 검색
		if(searchValue!=null) {
			
			totalDataCount = dao.getCountOrderListByName(userId,searchValue);
			
			Map<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("start", start);
			hMap.put("end", end);
			hMap.put("userId", userId);
			hMap.put("searchValue", searchValue);
			
			List<OrderListDTO> orderList  = dao.getOrderListByName(hMap);
			
			request.setAttribute("lists", orderList);
			
		}
		
		
		//출력 건수가 0이 아니면 페이징 작업
		if(totalDataCount!=0) {
			totalPage = ajaxPaging.getPageCount(numPerPage, totalDataCount);
		}

		//페이징 인덱스
		//1.기본검색(아무조건 없음)
		if(fromDate==null || fromDate=="" || fromDate.equals("undefined")) {	//
			String pageIndexList = ajaxPaging.pageIndexList(currentPage, totalPage, "");
			request.setAttribute("pageIndexList", pageIndexList);
		}
		//2.기간별 조회
		if(fromDate!=null && fromDate!="" && !fromDate.equals("undefined")) {
			String params = "'" + fromDate + "','" + toDate + "'";
			String pageIndexList = ajaxPaging.pageIndexList(currentPage, totalPage, params);
			request.setAttribute("pageIndexList", pageIndexList);
		}
		//3.상품명 또는 ISBN 검색
		if(searchValue!=null && !searchValue.equals("")) {
			String params = "'" + fromDate + "','" + toDate + "','" + searchValue + "'";
			String pageIndexList = ajaxPaging.pageIndexList(currentPage, totalPage, params);
			request.setAttribute("pageIndexList", pageIndexList);
		}
		
		
		return "myShopping/lists";
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
	@RequestMapping(value = "myShopping/mySentenceList.action", method = RequestMethod.GET)
	public String mySentenceList(HttpServletRequest request) {

		return "myShopping/mySentenceList";
	}

	//최근덧글 페이지
	@RequestMapping(value = "myShopping/myCommentList.action", method = RequestMethod.GET)
	public String myCommentList(HttpServletRequest request) {

		return "myShopping/myCommentList";
	}

	//1:1상담내역 페이지
	@RequestMapping(value = "myShopping/myCounselHistory.action", method = RequestMethod.GET)
	public String myCounselHistory(HttpServletRequest request) {

		return "myShopping/myCounselHistory";
	}

	//1:1상담하기 페이지
	/*@RequestMapping(value = "myShopping/myCounselHistory.action", method = RequestMethod.GET)
	public String myCounselHistory(HttpServletRequest request) {

		return "myShopping/myCounselHistory";
	}*/


	//회원 탈퇴 페이지
	@RequestMapping(value = "myShopping/memberOut.action", method = RequestMethod.GET)
	public String memberOut(HttpServletRequest request) {

		return "myShopping/memberOut";
	}

	//회원 탈퇴 진행
	@RequestMapping(value = "myShopping/memberOut_ok.action", method = RequestMethod.GET)
	public String memberOut_ok(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("userInfo");
		String userId = dto.getUserId();

		//DB 회원정보 삭제
		dao.deleteUser(userId);

		//세션 종료
		session.removeAttribute("userInfo");
		session.invalidate();

		//팝업 띄운 후 메인으로 이동
		model.addAttribute("alertMsg","회원탈퇴가 완료되었습니다.");
		model.addAttribute("nextUrl","main.action");

		return "common/alert";

	}






}
