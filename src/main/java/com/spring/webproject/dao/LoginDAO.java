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
	
	public int getPointId() {
		
		return sessionTemplate.selectOne("loginMapper.getPointId");
		
	}
	
	public void joinPointSaving(String userId, int pointId) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("userId", userId);
		params.put("pointItem","신규회원 가입 적립금 지급 (30일 후 소멸)");
		params.put("pointId",pointId);
		
		sessionTemplate.insert("loginMapper.joinPointSaving",params);
		
	}
	
	public String findUserId(UserDTO dto) {
		
		return sessionTemplate.selectOne("loginMapper.findUserId",dto);
		
	}
	/*
	public String findUserPwd() {
		
	}
	 */
}
