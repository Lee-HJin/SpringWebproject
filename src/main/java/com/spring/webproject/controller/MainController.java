package com.spring.webproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webproject.dao.MainDAO;
import com.spring.webproject.dto.MainDTO;
import com.spring.webproject.dto.StoreDTO;
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
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.bestSeller();
		
		req.setAttribute("lst", lst);
		
		return "main/main";
	}
	
	
	@RequestMapping(value="/recomm.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String recomm(HttpServletRequest req, HttpServletResponse resp) {
		
		String isbn = req.getParameter("isbn");
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.similCate(isbn);	
		
	
		req.setAttribute("lst", lst);
		
		return "main/recomm";
	}
	
	@RequestMapping(value="/newbook.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String newBook(HttpServletRequest req) {
		
		int cateId = Integer.parseInt(req.getParameter("nb"));
		
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
	
	
	@RequestMapping(value="/todayview.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String todayView(HttpServletRequest req, HttpServletResponse resp) {
		
		String ck = req.getParameter("ck");
		
		List<MainDTO> lst = new ArrayList<MainDTO>();
		
		lst = dao.todayView(ck);
		
		req.setAttribute("lst", lst);
		
		return "main/todayView";
	}
	
	@RequestMapping(value="/imbook.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String imBook() {
		
		return "main/imBook";
	}
	
	@RequestMapping(value="/readbnl.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String readBnl() {
		
		return "main/readBnl";
	}
	
	@RequestMapping(value="/storeinfo.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String storeInfo(HttpServletRequest req) {
		
		int warehouseId = Integer.parseInt(req.getParameter("params"));
		
		StoreDTO dto= new StoreDTO();
		List<StoreDTO> lst = new ArrayList<StoreDTO>();
		
		lst = dao.storeImage(warehouseId);
		dto = dao.storeInfo(warehouseId);
		
		dto.setIntro(dto.getIntro().replaceAll("\\\\", "<br>"));
		dto.setTime(dto.getTime().replaceAll("\\\\", "<br>"));
		dto.setWayBus(dto.getWayBus().replaceAll("\\\\", "<br>"));
		dto.setWaySub(dto.getWaySub().replaceAll("\\\\", "<br>"));
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("lst", lst);
		return "company/storeInfo";
	}
	
	@RequestMapping(value="/store.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String store(HttpServletRequest req) {
		
		String warehouseId = req.getParameter("params");
		
		if(warehouseId==null) 
			warehouseId = "0";
		
		req.setAttribute("warehouseId", warehouseId);
		return "company/store";
	}
	
	@RequestMapping(value="/company.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String company(HttpServletRequest req) {
		
		return "company/company";
	}
	
		
	@RequestMapping(value="/bi.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String bi(HttpServletRequest req) {
		
		return "company/bi";
	}
	
	
	@RequestMapping(value="/history.action",method= {RequestMethod.GET,RequestMethod.POST})
	public String history(HttpServletRequest req) {
		
		return "company/history";
	}
	
	
	
	
	
	
	
	
}