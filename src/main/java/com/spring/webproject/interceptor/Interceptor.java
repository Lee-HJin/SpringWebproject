package com.spring.webproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		try {
			
			String path = request.getServletPath();		//로그인페이지로 넘어오기 직전 url
			String query = request.getQueryString();	//파라미터 값 저장
			
			
			System.out.println(path);
			HttpSession session = request.getSession();
			
			if(path.equals("/login.action")) {
				return false;
			}
			
			//돌아갈 url을 생성해서 session에 올림
			if(query!=null) {
				session.setAttribute("pre_url", path+"?"+query);
			}
			else {
				session.setAttribute("pre_url", path);
			}
			
			//로그인한 상태면 false
			if(session.getAttribute("userInfo")==null) {	
				response.sendRedirect(request.getContextPath() + "/login.action");
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(request.getSession().getAttribute("userInfo")==null) {
			
		}
		
		
		super.postHandle(request, response, handler, modelAndView);
	}

}
