package com.spring.webproject.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.SearchDAO;
import com.spring.webproject.dto.SearchDTO;
import com.spring.webproject.util.MyUtil;

import net.sf.json.JSONArray;

@Controller
public class SearchController {

	@Autowired
	@Qualifier("searchDAO")
	SearchDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/search/search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String search(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String cp = req.getContextPath();
		String searchValue = req.getParameter("searchValue");		
		searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		int dataCount = dao.getBookCount(searchValue);
		System.out.println(searchValue);
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int numPerpage =10;
		int totalPage = myUtil.getPageCount(numPerpage, dataCount);
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerpage + 1;
		int end = currentPage * numPerpage;
		
		List<SearchDTO> searchBook = dao.getSearchBook(start, end, searchValue);
		System.out.println("start"+start+" end:"+end+" /searchValue:"+searchValue+" datacnt: "+dataCount);
		
		List<SearchDTO> bookTitle = dao.getBookTitle(searchValue);
		
		
		 
		req.setAttribute("searchBook", searchBook);
		req.setAttribute("searchValue", searchValue);
		return "search/search";
	}
	
	@RequestMapping(value = "/search/search1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String search1(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		String cp = req.getContextPath();		
		
		
		
		return "search/search1";
	}
	@RequestMapping(value = "/search/autocomplete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String search12(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String result = req.getParameter("term");
	
		List<SearchDTO> list = dao.getBookTitle(result); //result값이 포함되어 있는 emp테이블의 네임을 리턴

		JSONArray ja = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			ja.add(list.get(i).getBookTitle());
		}

		PrintWriter out = resp.getWriter();

		req.setAttribute("ja", ja);
		out.print(ja.toString());
		return "search/search3";
	}
	
}
