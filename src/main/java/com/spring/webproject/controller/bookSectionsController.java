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


import com.spring.webproject.dao.BookSectionsDAO;
import com.spring.webproject.dao.LoginDAO;
import com.spring.webproject.dto.BookSectionsDTO;

import com.spring.webproject.util.MyUtil;

@Controller
public class bookSectionsController {
	
	@Autowired
	@Qualifier("bookSectionsDAO")
	BookSectionsDAO raDao;
	
	@Autowired
	@Qualifier("loginDAO")
	LoginDAO leeDao; /* UserDTO*/
	
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
			sort2nd = "2000";
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
		if(sort == null || sort == "") {
			
			sort = "";
			List<BookSectionsDTO> lists = raDao.getListMain(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
		
		}else if(sort.equals("sort1")) {
			
			List<BookSectionsDTO> lists = raDao.getListSort1(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}else if(sort.equals("sort2")) {
			
			List<BookSectionsDTO> lists = raDao.getListSort2(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}else if(sort.equals("sort3")) {
			
			List<BookSectionsDTO> lists = raDao.getListSort3(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}else if(sort.equals("sort4")) {
			
			List<BookSectionsDTO> lists = raDao.getListSort4(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}

		String bnlBSListUrl = cp + "/bnlBSList.action";
		
		String pageIndexList =
				raMyUtil.pageIndexList(currentPage, totalPage, bnlBSListUrl);
		
		request.setAttribute("sort", sort);
		request.setAttribute("sort1st", sort1st);
		request.setAttribute("sort2nd", sort2nd);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageIndexList", pageIndexList);

	
		return "bookSections/bnlBSList";
	}
	
	@RequestMapping(value="bnlNewBookList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String newBookList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		sortNum like 1 and 99 or 1 and 4 필요
		*/

		//전체데이터 갯수
		int dataCount = raDao.getDataCountForNewBooks();
		
		//페이징 처리
		int numPerPage = 4;
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
		if(sort == null || sort == "") {
			
			sort = "";
			
			List<BookSectionsDTO> adLists = raDao.getSlideAd(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("adLists", adLists);
			
			List<BookSectionsDTO> lists = raDao.getBooksOfTheMonth(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			
			request.setAttribute("lists", lists);
		
		}else if(sort.equals("sort1")) {
			
			List<BookSectionsDTO> adLists = raDao.getSlideAd(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("adLists", adLists);
			
			List<BookSectionsDTO> lists = raDao.getBooksOfTheMonthSort1(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}else if(sort.equals("sort2")) {
			
			List<BookSectionsDTO> adLists = raDao.getSlideAd(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("adLists", adLists);
			
			List<BookSectionsDTO> lists = raDao.getBooksOfTheMonthSort2(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}else if(sort.equals("sort3")) {
			
			List<BookSectionsDTO> adLists = raDao.getSlideAd(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("adLists", adLists);
			
			List<BookSectionsDTO> lists = raDao.getBooksOfTheMonthSort3(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}else if(sort.equals("sort4")) {
			
			List<BookSectionsDTO> adLists = raDao.getSlideAd(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("adLists", adLists);
			
			List<BookSectionsDTO> lists = raDao.getBooksOfTheMonthSort4(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), start, end);
			request.setAttribute("lists", lists);
			
		}

		String bnlNewBookListUrl = cp + "/bnlNewBookList.action";
		
		String pageIndexList =
				raMyUtil.pageIndexList(currentPage, totalPage, bnlNewBookListUrl);
		
		
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("sort", sort);
		request.setAttribute("sort1st", sort1st);
		request.setAttribute("sort2nd", sort2nd);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageIndexList", pageIndexList);

		return "bookSections/bnlNewBookList";
	}
	
	@RequestMapping(value="discountBookMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String discountBookMain(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체데이터 갯수
		int dataCount = raDao.getDataCountForEachRnum();
		
		//페이징 처리
		int numPerPage = 10;
		int totalPage = raMyUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		List<BookSectionsDTO> dcSixSlideLists = raDao.getDcSixSlide();
		request.setAttribute("dcSixSlideLists", dcSixSlideLists);
		
		List<BookSectionsDTO> dcRnumSlideLists = raDao.getDcRnumSlide(start, end);
		request.setAttribute("dcRnumSlideLists", dcRnumSlideLists);	
		
		List<BookSectionsDTO> dcOfTheMonth = raDao.getDcSixSlide();
		request.setAttribute("dcOfTheMonth", dcOfTheMonth);
		
		List<BookSectionsDTO> bestSellerTop10 = raDao.getBestSellerTop10();
		request.setAttribute("bestSellerTop10", bestSellerTop10);
		
				
		return "bookSections/discountBookMain";
	}
	
	@RequestMapping(value="discountBookList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String discountBookList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		String theMonth = request.getParameter("theMonth");
		
		String sort = request.getParameter("sort");
		if(sort == null) {
			sort = "";
		}
		
		/*장르*//*장르*/
		String sort1st = request.getParameter("sort1st");
		String sort2nd = request.getParameter("sort2nd");
		
		if(sort1st == null && sort2nd == null){
			sort1st = "1";
			sort2nd = "99";
		}
		/*장르*//*장르*/
		
		/*discountRate*/
		String fromDiscount = request.getParameter("fromDiscount");
		String toDiscount = request.getParameter("toDiscount");
		if(fromDiscount == null && toDiscount == null){
			fromDiscount = "30";
			toDiscount = "100";
		}
		
		/* 페이지 */
		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		/* 페이지 */
		
		

		/* 이달의 신규 할인 도서만 검색하기 위한 조건 생성(the month = 1) */

		if(theMonth.equals("1")) {
			
			//전체데이터 갯수
			int dataCount = raDao.getDcDataCountOfTheMonth(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount));
			//페이징 처리
			int numPerPage = 1;
			int totalPage = raMyUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			String discountBookListUrl = cp + "/discountBookList.action?theMonth="+theMonth+"&sort="+sort+"&sort1st="+sort1st+"&sort2nd="+sort2nd+"&fromDiscount="+fromDiscount+"&toDiscount="+toDiscount;
			
			String pageIndexListforJ =
					raMyUtil.pageIndexListforJ(currentPage, totalPage, discountBookListUrl);
			
			
			request.setAttribute("dataCount", dataCount);
			request.setAttribute("pageIndexListforJ", pageIndexListforJ);	
			

			if(sort == "") {
				
				List<BookSectionsDTO> lists = raDao.getDcListsOfTheMonth(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
			
			}else if(sort.equals("sort1")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsOfTheMonthSort1(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}else if(sort.equals("sort2")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsOfTheMonthSort2(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}else if(sort.equals("sort3")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsOfTheMonthSort3(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}else if(sort.equals("sort4")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsOfTheMonthSort4(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
			}
			
		}else{
			
			//전체데이터 갯수
			int dataCount = raDao.getDcDataCount(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount));
			//페이징 처리
			int numPerPage = 1;
			int totalPage = raMyUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			String discountBookListUrl = cp + "/discountBookList.action?theMonth="+theMonth+"&sort="+sort+"&sort1st="+sort1st+"&sort2nd="+sort2nd+"&fromDiscount="+fromDiscount+"&toDiscount="+toDiscount;
			
			String pageIndexListforJ =
					raMyUtil.pageIndexListforJ(currentPage, totalPage, discountBookListUrl);

			request.setAttribute("dataCount", dataCount);
			request.setAttribute("pageIndexListforJ", pageIndexListforJ);
			
			if(sort == "") {

				List<BookSectionsDTO> lists = raDao.getDcLists(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
			
			}else if(sort.equals("sort1")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsSort1(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}else if(sort.equals("sort2")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsSort2(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}else if(sort.equals("sort3")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsSort3(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}else if(sort.equals("sort4")) {
				
				List<BookSectionsDTO> lists = raDao.getDcListsSort4(Integer.parseInt(sort1st), Integer.parseInt(sort2nd), Integer.parseInt(fromDiscount), Integer.parseInt(toDiscount), start, end);
				request.setAttribute("lists", lists);
				
			}
		
		}
		
		/* 이달의 신규 할인 도서만 검색하기 위한 조건 생성(the month = 1) */
		
		request.setAttribute("theMonth", theMonth);
		request.setAttribute("sort", sort);
		request.setAttribute("sort1st", sort1st);
		request.setAttribute("sort2nd", sort2nd);
		request.setAttribute("fromDiscount", fromDiscount);
		request.setAttribute("toDiscount", toDiscount);
		request.setAttribute("pageNum", currentPage);
		
		
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
	
	@RequestMapping(value="cartList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cartList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		String ck = request.getParameter("isbn");
		String ckC = request.getParameter("orderCount");

		List<BookSectionsDTO> lst = new ArrayList<BookSectionsDTO>();
		
		lst = raDao.cartList(ck,ckC);
		
		request.setAttribute("lst", lst);
		
		return "shopAndOrder/cartList";
	}


}
