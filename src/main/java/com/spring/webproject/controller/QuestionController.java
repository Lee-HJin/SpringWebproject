package com.spring.webproject.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.webproject.dao.QuestionDAO;
import com.spring.webproject.dto.CounselDTO;
import com.spring.webproject.dto.QuestionDTO;
import com.spring.webproject.util.MyUtil;

@Controller
public class QuestionController {

	@Autowired
	@Qualifier("questionDAO")
	QuestionDAO dao;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value = "/help/helpMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String helpMain(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// String cp = req.getContextPath();
		String key = "1";

		List<QuestionDTO> lists = dao.getList();
		List<QuestionDTO> topLists = dao.topView();
		List<QuestionDTO> topDate = dao.topDate();

		req.setAttribute("key", key);
		req.setAttribute("lists", lists);
		req.setAttribute("topLists", topLists);
		req.setAttribute("topDate", topDate);

		return "help/help";
	}

	@RequestMapping(value = "/help/helpIndex.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String helpIndex(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String cp = req.getContextPath();
		String key = "2";
		String typeId = req.getParameter("typeId");
		String subTypeId = req.getParameter("subTypeId");

		int questionNum;
		if (req.getParameter("questionNum") == null || req.getParameter("questionNum").equals("")) {
			questionNum = 0;
		} else {
			questionNum = Integer.parseInt(req.getParameter("questionNum"));
		}

		if (req.getParameter("subTypeId") == null || req.getParameter("subTypeId").equals("")) {

		} else {
			subTypeId = req.getParameter("subTypeId");
			List<QuestionDTO> subTypeLists = dao.getSubTypeList(subTypeId);
			req.setAttribute("subTypeLists", subTypeLists);
		}

		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String searchKey = "subject";
		String searchValue = req.getParameter("searchValue");

		if (searchValue == null) {
			searchValue = "";
		}

		searchValue = URLDecoder.decode(searchValue, "UTF-8");

		System.out.println(searchValue);

		int dataCount = 0;
		if (typeId.equals("0")) {
			dataCount = dao.getDataCount(searchKey, searchValue);
			System.out.println("if" + searchKey + "/" + searchValue);
		} else {
			dataCount = dao.getDataCount2(searchKey, searchValue, typeId);

		}

		System.out.println("dataCount:");

		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		System.out.println("sub타입아디" + subTypeId);
		List<QuestionDTO> lists = dao.getList();
		List<QuestionDTO> typeLists = dao.getTypeList(start, end, searchKey, searchValue, typeId);
		List<QuestionDTO> type0Lists = dao.getType0List(start, end, searchKey, searchValue);
		List<QuestionDTO> lists3 = dao.getSubTypeId(typeId);
		// List<QuestionDTO> subTypeLists = dao.getSubTypeList(subTypeId);
		List<QuestionDTO> topLists = dao.topView();
		
		String param = "typeId=" + typeId;
		if (!searchValue.equals("")) {

			param += "&searchKey=" + searchKey;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/help/helpIndex.do";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		System.out.println("total:");
		System.out.println(totalPage);
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		if (questionNum != 0) {
			dao.updateHitCount(questionNum);
		}

		req.setAttribute("key", key);
		req.setAttribute("lists", lists);
		req.setAttribute("typeLists", typeLists);
		req.setAttribute("type0Lists", type0Lists);
		// req.setAttribute("subTypeLists", subTypeLists);
		req.setAttribute("lists3", lists3);
		req.setAttribute("typeId", typeId);
		req.setAttribute("subTypeId", subTypeId);
		req.setAttribute("questionNum", questionNum);
		req.setAttribute("topLists", topLists);
		req.setAttribute("pageIndexList", pageIndexList);
		req.setAttribute("dataCount", dataCount);

		return "help/help";
	}

	@RequestMapping(value = "/help/helpCounsel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String helpCounsel(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String typeId = req.getParameter("typeId");
		String key = "3";

		if (req.getParameter("typeId") == null || req.getParameter("typeId").equals("")) {

		} else {
			typeId = req.getParameter("typeId");
			List<QuestionDTO> lists3 = dao.getSubTypeId(typeId);
			req.setAttribute("lists3", lists3);
		}

		List<QuestionDTO> lists = dao.getList();
		// List<QuestionDTO> lists3 = dao.getSubTypeId(typeId);
		List<QuestionDTO> topLists = dao.topView();
		List<QuestionDTO> topDate = dao.topDate();

		req.setAttribute("typeId", typeId);
		req.setAttribute("key", key);
		req.setAttribute("lists", lists);
		// req.setAttribute("lists3", lists3);
		req.setAttribute("topLists", topLists);
		req.setAttribute("topDate", topDate);

		return "help/help";
	}

	@RequestMapping(value = "/help/helpMyCounsel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String helpMyCounsel(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// String cp = req.getContextPath();
		String key = "4";

		List<QuestionDTO> lists = dao.getList();
		List<QuestionDTO> topLists = dao.topView();
		List<QuestionDTO> topDate = dao.topDate();

		req.setAttribute("key", key);
		req.setAttribute("lists", lists);
		req.setAttribute("topLists", topLists);
		req.setAttribute("topDate", topDate);

		return "help/help";
	}

	@RequestMapping(value = "/help/helpCounsel_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String helpCounsel_ok(CounselDTO dto, HttpServletRequest req, HttpServletResponse resp) throws Exception {

		int maxNum = dao.maxNum();
		dto.setConsultId(maxNum + 1);
		System.out.println(maxNum);

		dao.insertCounsel(dto);

		return "redirect:/help/helpMain.do";
	}
}
