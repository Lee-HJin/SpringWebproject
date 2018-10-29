package com.spring.webproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.webproject.dao.AdminDAO;
import com.spring.webproject.dto.AdminAuthorDTO;
import com.spring.webproject.dto.AdminBooksDTO;
import com.spring.webproject.dto.AdminCategoryDTO;
import com.spring.webproject.dto.AdminTranslatorDTO;
import com.spring.webproject.dto.AdminUsersDTO;
import com.spring.webproject.dto.AdminWarehouseDTO;
import com.spring.webproject.util.Criteria;
import com.spring.webproject.util.FileUtil;
import com.spring.webproject.util.PageMaker;
import com.spring.webproject.util.SearchCriteria;

@Controller
public class AdminController {

	@Autowired
	AdminDAO dao;
	
	@Autowired private ServletContext servletContext; 

	@RequestMapping(value = "/admin.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {

		return "admin/admin_home";
	}

	// users
	@RequestMapping(value = "/admin_users.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String users(Model model, SearchCriteria cri) {

		List<AdminUsersDTO> userList = dao.getUserList(cri);

		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalDataCount(dao.getUserTotalCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", userList);

		return "admin/admin_users";
	}

	@RequestMapping(value = "/admin_users_delete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String usersDel(HttpServletRequest request, SearchCriteria cri) {

		dao.delUser((String) request.getParameter("userId"));

		String url = "/admin_users.action?page=" + cri.getPage();

		if (cri.getSearchKey() != null || cri.getSearchKey() == "") {
			url += "&searchKey=" + cri.getSearchKey();
			if (cri.getSearchValue() != null) {
				url += "&searchValue=" + cri.getSearchValue();
			} else {
				url = "/admin_users.action";
			}
		}

		return "redirect:/" + url;
	}

	// goods
	@RequestMapping(value = "/admin_goods.action", method = { RequestMethod.GET })
	public String goods() {
		return "admin/admin_goods";
	}

	@RequestMapping(value = "/admin_goods_ok.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String goodsOK(AdminBooksDTO dto,MultipartFile file, FileUtil fileutil) throws IOException {
		
		String bookImagePath = servletContext.getRealPath("/")+"\\resources\\image\\book";
		
		System.out.println(servletContext.getRealPath("/")+"\\resources\\image\\book");
		
		dto.setBookImage(fileutil.fileNameMaker(file.getOriginalFilename()));
	
		File target = new File(bookImagePath, dto.getBookImage());
		
		FileCopyUtils.copy(file.getBytes(), target);
		
		dao.insertBook(dto);
		dao.insertBookSpecial(dto);
		dao.insertBookCategory(dto);
		dao.insertBookImage(dto);
		

		return "redirect:/admin_goods.action";
	}

	// author
	@RequestMapping(value = "/admin_search_author.action", method = { RequestMethod.GET })
	public String searchAuthor(Model model, SearchCriteria cri) {

		cri.setNumPerPage(5);

		List<AdminAuthorDTO> authorList = dao.getAuthorList(cri);

		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalDataCount(dao.getAuthorTotalCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("authorList", authorList);

		return "admin/admin_search_author";
	}

	// translator
	@RequestMapping(value = "/admin_search_translator.action", method = { RequestMethod.GET })
	public String searchTranslator(Model model, SearchCriteria cri) {

		cri.setNumPerPage(5);

		List<AdminTranslatorDTO> translatorList = dao.getTranslatorList(cri);

		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalDataCount(dao.getTranslatorTotalCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("translatorList", translatorList);

		return "admin/admin_search_translator";
	}

	// warehouse
	@RequestMapping(value = "/admin_search_warehouse.action", method = { RequestMethod.GET })
	public String searchWarehouse(Model model, SearchCriteria cri) {

		cri.setNumPerPage(5);

		List<AdminWarehouseDTO> warehouseList = dao.getWarehouseList(cri);

		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setTotalDataCount(dao.getTranslatorTotalCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("warehouseList", warehouseList);

		return "admin/admin_search_warehouse";
	}
	
	//category
	
	@RequestMapping(value = "/admin_categoryList.action", method = {RequestMethod.POST, RequestMethod.GET })
	public String categoryList(Model model, AdminCategoryDTO dto) {
		
		List<AdminCategoryDTO> categoryList = dao.getCategoryList(dto);
		
		model.addAttribute("categoryList", categoryList);
		
		return "admin/admin_categoryList";
	}
	
	@RequestMapping(value = "/admin_category.action", method = {RequestMethod.POST, RequestMethod.GET })
	public String category(Model model, AdminCategoryDTO dto) {
		
		List<AdminCategoryDTO> categoryList = dao.getCategoryList(dto);
		
		model.addAttribute("categoryList", categoryList);
		
		return "admin/admin_category";
	}
	
	
	@RequestMapping(value = "/admin_category_ok.action", method = {RequestMethod.POST, RequestMethod.GET })
	public String categoryOK(Model model, AdminCategoryDTO dto, AdminBooksDTO bookDTO) {
		
		try {
			dao.insertCategory(dto);
			
			if(bookDTO.getIsbn()!=null) {
				dao.insertBookCategory(bookDTO);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/admin_category.action";
		}
		
		
		return "redirect:/admin_category.action";
	}
	
	
	

}
