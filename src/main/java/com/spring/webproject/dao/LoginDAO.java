package com.spring.webproject.dao;

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

}
