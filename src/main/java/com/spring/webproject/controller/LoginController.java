package com.spring.webproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webproject.dao.LoginDAO;
import com.spring.webproject.dto.UserDTO;

@Controller
public class LoginController {
	
	@Autowired
	LoginDAO dao;

	//로그인페이지
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String login() {

		return "login/login";
	}
	
	//로그인 진행
	@RequestMapping(value = "/login_ok.action", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request) {
		
		String returnUrl = "";
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		UserDTO dto = dao.login(userId, userPwd);
		
		if(dto!=null) {	//로그인 성공
			request.getSession().setAttribute("userInfo", dto);
			request.getSession().removeAttribute("message");
			returnUrl = "redirect:/login.action";
			
		}
		else {	//로그인 실패
			returnUrl = "redirect:/login.action";
			request.getSession().setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		return returnUrl;
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
	@RequestMapping(value = "login/mem_join_success.action", method = RequestMethod.POST)
	public String joinSucess(UserDTO dto) {
		
		dao.joinMember(dto);

		return "login/mem_join_success";
	}
	
	//아이디 찾기
	@RequestMapping(value = "/mem_findId.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String memfindId() {

		return "mem_findId";
	}

	//비밀번호 찾기
	@RequestMapping(value = "/mem_findPwd.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String memfindPwd() {

		return "mem_findPwd";
	}
	
	//나의쇼핑 메인
	@RequestMapping(value = "/myShoppingMain.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String myShoppingMain() {

		return "myShopping/myShoppingMain";
	}

}
