package com.spring.webproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.webproject.dto.AdminAuthorDTO;
import com.spring.webproject.dto.AdminTranslatorDTO;
import com.spring.webproject.dto.AdminUsersDTO;
import com.spring.webproject.dto.AdminWarehouseDTO;
import com.spring.webproject.util.SearchCriteria;

@Repository
public class AdminDAO {
	
	@Inject
	private SqlSession sessionTemplate;
	
	//users
	public List<AdminUsersDTO> getUserList(SearchCriteria cri){
		
		List<AdminUsersDTO> list = sessionTemplate.selectList("adminMapper.selectAll",cri);
		
		return list;
	}
	
	public void delUser(String userId) {
		
		sessionTemplate.delete("adminMapper.deleteUser", userId);
		
	}
	
	public int getUserTotalCount(SearchCriteria cri) {
		
		return sessionTemplate.selectOne("adminMapper.getUserTotalCount",cri);
	}
	
	//author
	public int getAuthorTotalCount(SearchCriteria cri) {
		return sessionTemplate.selectOne("adminMapper.getAuthorTotalCount", cri);
	}
	
	public List<AdminAuthorDTO> getAuthorList(SearchCriteria cri){
		List<AdminAuthorDTO> list = sessionTemplate.selectList("adminMapper.authorList", cri);
		return list;
	}
	
	//translator
	public int getTranslatorTotalCount(SearchCriteria cri) {
		return sessionTemplate.selectOne("adminMapper.getTranslatorTotalCount", cri);
	}
	
	public List<AdminTranslatorDTO> getTranslatorList(SearchCriteria cri){
		List<AdminTranslatorDTO> list = sessionTemplate.selectList("adminMapper.translatorList", cri);
		return list;
	}
	
	//warehouse
		public int getWarehouseTotalCount(SearchCriteria cri) {
			return sessionTemplate.selectOne("adminMapper.getWarehouseTotalCount", cri);
		}
		
		public List<AdminWarehouseDTO> getWarehouseList(SearchCriteria cri){
			List<AdminWarehouseDTO> list = sessionTemplate.selectList("adminMapper.warehouseList", cri);
			return list;
		}
	
}
