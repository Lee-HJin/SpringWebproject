package com.spring.webproject.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.MainDAO;
import com.spring.webproject.dto.MainDTO;
import com.spring.webproject.util.MyUtil;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("mainDAO")
	MainDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/main.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String main(HttpServletRequest req, HttpServletResponse resp) {
		
		String cp = req.getContextPath();
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.similCate("8");	
		
	
		req.setAttribute("lst", lst);
		
		return "main/main";
	}
	
	@RequestMapping(value="/store.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String store() {
		
		return "main/store";
	}
		
}
