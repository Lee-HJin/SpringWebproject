package com.spring.webproject.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.UserDTO;

public class LoginDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public UserDTO idOverlapCheck(String userId) {
		
		UserDTO dto = sessionTemplate.selectOne("loginMapper.idOverlapCheck",userId);
		
		return dto;
		
	}
	
	public void joinMember(UserDTO dto) {
		
		dto.setMemberGrade("일반");
		
		sessionTemplate.insert("loginMapper.joinMember", dto);
		
	}
	
	public UserDTO login(String userId, String userPwd) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("userId", userId);
		params.put("userPwd", userPwd);
		
		UserDTO dto = sessionTemplate.selectOne("loginMapper.login",params);
		
		return dto;
	}

}
