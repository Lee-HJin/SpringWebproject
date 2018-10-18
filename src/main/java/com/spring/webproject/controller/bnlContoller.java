package com.spring.webproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class bnlContoller {

	@RequestMapping(value="/bnlBSList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		return "bookSections/bnlBSList";
	}
	
	@RequestMapping(value="bnlNewBookList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String newBookList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "bookSections/bnlNewBookList";
	}
	
	@RequestMapping(value="discountBookMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String discountBookMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "bookSections/discountBookMain";
	}
	
	@RequestMapping(value="discountBookList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String discountBookList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "bookSections/discountBookList";
	}
	
	@RequestMapping(value="shopCartList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String shopCartList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "shopAndOrder/shopCartList";
	}
	
	@RequestMapping(value="order.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String order(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "shopAndOrder/order";
	}


}
