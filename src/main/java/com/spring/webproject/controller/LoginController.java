package com.spring.webproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webproject.dao.LoginDAO;
import com.spring.webproject.dto.UserDTO;

@Controller
public class LoginController {

	@Autowired
	LoginDAO dao;
	
	List<String> bookCookie;	//최근 본 상품 쿠키 리스트

	//로그인페이지
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String login() {

		return "login/login";
	}
	
	//최근 본 상품 쿠키+DB
	@RequestMapping(value = "/recentCookie.action", method = RequestMethod.POST)
	public @ResponseBody String recentCookie(HttpServletRequest request, @RequestParam(value="cookieArray[]") List<String> recentCookie) {
		
		bookCookie = new ArrayList<String>();
		
		for(int i=0;i<recentCookie.size();i++) {
			bookCookie.add(recentCookie.get(i));
		}
		
		///////////////////////////////
		Iterator<String> it = bookCookie.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		return "login_ok.action";
	}
	
	
	//로그인 진행
	@RequestMapping(value = "/login_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String loginProcess(HttpServletRequest request) {

		String returnUrl = "";
		String userId = request.getParameter("user_id");
		String userPwd = request.getParameter("userPwd");
		
		UserDTO dto = dao.login(userId, userPwd);

		if(dto!=null) {	//로그인 성공
			
			//회원 적립금 정보 불러오기
			int pointValue = dao.getPointValue(userId);	
			
			//회원 등급 정보 불러오기
			
			//최근 본 상품 불러오기(쿠키에 있는 상품을 DB에 합침)
			//쿠키 가져오기

			//세션 - dto, pointValue 올리기
			request.getSession().setAttribute("userId", userId);
			request.getSession().setAttribute("userInfo", dto);
			request.getSession().setAttribute("pointValue", pointValue);
			request.getSession().removeAttribute("message");
			returnUrl = "redirect:/main.action";
			

		}
		else {	//로그인 실패
			
			returnUrl = "redirect:/login.action";
			request.getSession().setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		return returnUrl;
	}

	//로그아웃
	@RequestMapping(value = "/logout.action", method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpServletRequest request) {

		request.getSession().removeAttribute("userInfo");
		request.getSession().invalidate();

		return "redirect:/main.action";
	}

	//회원가입 1단계 : 약관동의
	@RequestMapping(value = "login/mem_agree.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String memAgree() {

		return "login/mem_agree";
	}

	//약관 팝업
	@RequestMapping(value = "rules/rules_privacy.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String privacy() {

		return "rules/rules_privacy";
	}

	@RequestMapping(value = "rules/rules_privacy2.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String privacy2() {

		return "rules/rules_privacy2";
	}

	@RequestMapping(value = "rules/rulesInfo.action", method = RequestMethod.GET)
	public String rulesInfo() {

		return "rules/rulesInfo";
	}

	//회원가입 2단계 : 회원정보 입력
	@RequestMapping(value = "login/mem_join.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String memJoin() {

		return "login/mem_join";
	}

	//회원가입 2단계 : 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "login/idOverlapCheck.action", method = {RequestMethod.GET,RequestMethod.POST})
	public boolean idOverlapCheck(HttpServletRequest request) {

		String userId = request.getParameter("userId");	
		boolean flag = false;

		UserDTO dto = dao.idOverlapCheck(userId);

		if(dto==null) {
			flag = true;
		}
		else {
			flag = false;
		}

		return flag;	
	}

	//회원가입 성공
	@RequestMapping(value = "login/mem_join_success.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String joinSucess(UserDTO dto) {

		dao.joinMember(dto);

		String userId = dto.getUserId();
		int pointId = dao.getPointId() + 1;

		dao.joinPointSaving(userId, pointId);

		return "login/mem_join_success";
	}

	//아이디 찾기 페이지
	@RequestMapping(value = "/mem_findId.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String memfindId() {	

		return "login/mem_findId";
	}

	//아이디 찾기 진행
	@ResponseBody
	@RequestMapping(value = "/mem_findId_ok.action", method = RequestMethod.POST)
	public String memfindId(HttpServletRequest request) {

		//폼에서 넘어온 데이터 받아내기
		String userName = request.getParameter("userName");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		//dto에 넘어온 데이터를 넣음
		UserDTO dto = new UserDTO();

		dto.setUserName(userName);
		dto.setBirth(birth);
		dto.setPhone(phone);
		dto.setEmail(email);

		//아이디 검색함
		String userId = dao.findUserId(dto);

		if(userId==null || userId.equals("")) {
			return "";
		}
		else {
			return userId;
		}

	}


	//비밀번호 찾기
	@RequestMapping(value = "/mem_findPwd.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String memfindPwd() {

		return "login/mem_findPwd";
	}

	//비밀번호 찾기 진행
	@ResponseBody
	@RequestMapping(value = "/mem_findPwd_ok.action", method = {RequestMethod.POST})
	public String memfindPwd(HttpServletRequest request) throws UnsupportedEncodingException {

		//폼에서 넘어온 데이터 받아내기
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		//dto에 넘어온 데이터를 넣음
		UserDTO dto = new UserDTO();

		dto.setUserId(userId);
		dto.setUserName(userName);
		dto.setBirth(birth);
		dto.setPhone(phone);
		dto.setEmail(email);


		//회원 정보 검색
		UserDTO findedDto = dao.findUserPwd(dto);

		if(findedDto==null) {	//회원정보를 못 찾았을 때
			return "";
		}
		else {	//회원정보를 찾았을 때

			//임시 비밀번호 만들기(10자리-영대소문자+숫자 랜덤조합)
			char[] randomWord = new char[] {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
					'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
					'0','1','2','3','4','5','6','7','8','9'};

			int index = 0;
			StringBuffer tempPwd = new StringBuffer();

			for(int i=0;i<10;i++) {
				index = (int)(randomWord.length * Math.random());
				tempPwd.append(randomWord[index]);
			}

			//임시 비밀번호 DB에 입력
			dao.updateTempPwd(tempPwd.toString(), findedDto.getUserId());

			//ajax에 data 리턴
			return tempPwd.toString();

		}

	}

}
