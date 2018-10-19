package com.spring.webproject.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.UserDTO;

public class MyShoppingDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public String getUserPwd(String userId) {
		
		return sessionTemplate.selectOne("myShopping.getUserPwd",userId);
		
	}
	
	public void updateUserInfo(UserDTO dto) {
		
		sessionTemplate.update("myShopping.updateUserInfo",dto);
		
	}
	
	public UserDTO getUserInfo(String userId) {
		
		UserDTO dto = sessionTemplate.selectOne("myShoppin.getUserInfo",userId);
		
		return dto;
	}
	
	public void updatePwd(String userId, String userPwd) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("userId", userId);
		hMap.put("userPwd",userPwd);
		
		sessionTemplate.update("myShopping.updatePwd",hMap);
	}

}
