package com.spring.webproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalDataCount(dao.getTotalCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", userList);
		
		return "admin/admin_users";
	}
	
	@RequestMapping(value="/admin_users_delete.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String usersDel(HttpServletRequest request, SearchCriteria cri) {
		
		dao.delUser((String)request.getParameter("userId"));
		
		
		String url = "/admin_users.action?page="+cri.getPage();
		
		if(cri.getSearchKey()!=null || cri.getSearchKey()=="") {
			url += "&searchKey="+cri.getSearchKey();
			if(cri.getSearchValue()!=null) {
				url +="&searchValue="+cri.getSearchValue();
			}else {
				url = "/admin_users.action";
			}
		}
		
		
		return "redirect:/"+url;
	}
	@RequestMapping(value="/admin_goods.action",method= {RequestMethod.GET})
	public String goods() {
		return "admin/admin_goods";
	}
}
