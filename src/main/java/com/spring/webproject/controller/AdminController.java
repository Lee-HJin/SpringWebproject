package com.spring.webproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.AdminUsersDAO;
import com.spring.webproject.dto.AdminUsersDTO;
import com.spring.webproject.util.Criteria;
import com.spring.webproject.util.PageMaker;
import com.spring.webproject.util.SearchCriteria;


@Controller
public class AdminController {
	
	@Autowired
	AdminUsersDAO dao;
	
	@RequestMapping(value="/admin.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String home() {
		
		return "admin/admin_home";
	}
	
	
	@RequestMapping(value="/admin_users.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String users(Model model, SearchCriteria cri) {
		
		List<AdminUsersDTO> userList = dao.getUserList(cri);
		
		System.out.println(dao.getTotalCount(cri));
		System.out.println(userList.size());
		
		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalDataCount(dao.getTotalCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", userList);
		
		return "admin/admin_users";
	}
	
	@RequestMapping(value="/admin_users_delete.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String usersDel(HttpServletRequest request) {
		
		dao.delUser((String)request.getParameter("userId"));
		
		return "redirect:/admin_users.action";
	}
	
}
