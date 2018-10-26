package com.spring.webproject.controller;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.BookSectionsDAO;
import com.spring.webproject.dto.BookSectionsDTO;
import com.spring.webproject.util.MyUtil;

@Controller
public class bookSectionsController {
	
	@Autowired
	@Qualifier("bookSectionsDAO")
	BookSectionsDAO raDao;
	
	@Autowired
	MyUtil raMyUtil;
	
	@RequestMapping(value="/bnlBSList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		/* 
		장르별 검색을 위해서 between 을 넣어서 
		sortNum lke 1 and 99 or 1 and 4 필요
		*/
		
		String sort1st = request.getParameter("sort1st");
		String sort2nd = request.getParameter("sort2nd");
		
		if(sort1st == null && sort2nd == null){
			sort1st = "1";
			sort2nd = "99";
		}
		/* 
		장르별 검색을 위해서 between 을 넣어서 
		sortNum lke 1 and 99 or 1 and 4 필요
		*/
		
		
		
		//전체데이터 갯수
		int dataCount = raDao.getDataCount();
		
		//페이징 처리
		int numPerPage = 10;
		int totalPage = raMyUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		/* 
		sort 분류 
		sort0 = order by soldBookCnt desc, rate desc, reviewCnt desc
		sort1 = order by publish
		sort2 = order by goods 
		sort3 = order by review
		*/
		String sort = request.getParameter("sort");
		
		/*if(sort1st == null || sort == "") {
			sort = "sort0";
		}*/
		
		List<BookSectionsDTO> lists = raDao.getList(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);

		String bnlBSListUrl = cp + "/bnlBSList.action";
		
		String pageIndexList =
				raMyUtil.pageIndexList(currentPage, totalPage, bnlBSListUrl);
		
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageIndexList", pageIndexList);

	
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
