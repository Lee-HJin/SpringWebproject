package com.spring.webproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
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
/*		
		Cookie[] cookie = req.getCookies();
		String id = "";
		
		if(cookie!=null) {
			
			for(int i = 0; i < cookie.length; ++i){

				String key = cookie[i].getName();

				if(key != null || key.trim().equals("id")){

				id = cookie[i].getValue();

				break;
				}    
			}
		}
		System.out.println(id);*/

		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.bestSeller();
		
		req.setAttribute("lst", lst);
		
		return "main/main";
	
	
	}
	
	
	@RequestMapping(value="/recomm.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String recomm(HttpServletRequest req, HttpServletResponse resp) {
		
		String isbn = (String)req.getParameter("params");
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.similCate(isbn);	
		
	
		req.setAttribute("lst", lst);
		
		return "main/recomm";
	}
	
	@RequestMapping(value="/newbook.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String newBook(HttpServletRequest req) {
		
		int cateId = Integer.parseInt(req.getParameter("params"));
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.newBook(cateId);
		
		req.setAttribute("lst", lst);
		return "main/newBook";
	}
	
	@RequestMapping(value="/newbookall.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String newBookAll(HttpServletRequest req) {
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.newBookAll();
		
		req.setAttribute("lst", lst);
		return "main/newBook";
	}
	
	@RequestMapping(value="/issuebook.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String issueBook(HttpServletRequest req) {
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.issueBook();
		
		req.setAttribute("lst", lst);
		return "main/issueBook";
	}
	
	@RequestMapping(value="/tempbook.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String store(HttpServletRequest req, HttpServletResponse resp) {
		
		String isbn = (String)req.getParameter("isbn");
		
		MainDTO dto = dao.tempBook(isbn);
		
		req.setAttribute("dto", dto);
		req.setAttribute("isbn", isbn);
		
		return "main/tempBook";
	}
	
	
	@RequestMapping(value="/cookie.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String cookie(HttpServletRequest req, HttpServletResponse resp) {
		
		String ck = (String)req.getParameter("params");
		
		req.setAttribute("ck", ck);
		
		return "main/cookie";
	}
	
	
	
	@RequestMapping(value="/store.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String store() {
		
		return "main/store";
	}
		
}
