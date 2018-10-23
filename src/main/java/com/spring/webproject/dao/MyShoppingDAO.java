package com.spring.webproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.OrderListDTO;
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

		UserDTO dto = sessionTemplate.selectOne("myShopping.getUserInfo",userId);

		return dto;
	}

	public void updatePwd(String userId, String userPwd) {

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("userId", userId);
		hMap.put("userPwd",userPwd);

		sessionTemplate.update("myShopping.updatePwd",hMap);
	}

	public void deleteUser(String userId) {

		sessionTemplate.delete("myShopping.memberOut", userId);

	}

	public int getCountOrderListNormal(String userId) {

		return sessionTemplate.selectOne("myShopping.getCountOrderListNormal", userId);
	}

	public List<OrderListDTO> getOrderList (Map<String, Object> map){

		List<OrderListDTO> lists = sessionTemplate.selectList("myShopping.getOrderList",map);

		return lists;
	}

	public int getCountOrderListByDate(String userId, String fromDate, String toDate) {
			
		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("userId", userId);
		hMap.put("fromDate",fromDate);
		hMap.put("toDate",toDate);

		return sessionTemplate.selectOne("myShopping.getCountOrderListByDate", hMap);
	}
	
	public List<OrderListDTO> getOrderListByDate (Map<String, Object> map){

		List<OrderListDTO> lists = sessionTemplate.selectList("myShopping.getOrderListByDate",map);

		return lists;
	}
	
	public int getCountOrderListByName(String userId, String searchValue) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("userId", userId);
		hMap.put("searchValue",searchValue);

		return sessionTemplate.selectOne("myShopping.getCountOrderListByName", hMap);
	}
	
	public List<OrderListDTO> getOrderListByName (Map<String, Object> map){

		List<OrderListDTO> lists = sessionTemplate.selectList("myShopping.getOrderListByName",map);

		return lists;
	}


}
