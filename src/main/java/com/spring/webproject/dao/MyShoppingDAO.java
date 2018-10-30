package com.spring.webproject.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.MainDTO;
import com.spring.webproject.dto.MyReviewDTO;
import com.spring.webproject.dto.OrderDetailDTO;
import com.spring.webproject.dto.OrderListDTO;
import com.spring.webproject.dto.PointDTO;
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

	public int getCountRetListNormal(String userId) {

		return sessionTemplate.selectOne("myShopping.getCountRetListNormal", userId);
	}
	
	public List<OrderListDTO> getRetList (Map<String, Object> map){

		List<OrderListDTO> lists = sessionTemplate.selectList("myShopping.getRetList",map);

		return lists;
	}
	
	public int getCountRetListByDate(String userId, String fromDate, String toDate) {

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("userId", userId);
		hMap.put("fromDate",fromDate);
		hMap.put("toDate",toDate);
		
		return sessionTemplate.selectOne("myShopping.getCountRetListByDate", hMap);
	}
	
	public List<OrderListDTO> getRetListByDate (Map<String, Object> map){

		List<OrderListDTO> lists = sessionTemplate.selectList("myShopping.getRetListByDate",map);

		return lists;
	}
	
	public int getExPoint(String userId) {

		return sessionTemplate.selectOne("myShopping.getExPoint", userId);
	}
	
	public int getCountPointList(String userId) {

		return sessionTemplate.selectOne("myShopping.getCountPointList", userId);
	}
	
	public List<PointDTO> getTotalPointList (Map<String, Object> map){

		List<PointDTO> lists = sessionTemplate.selectList("myShopping.getTotalPointList",map);

		return lists;
	}
	
	public int getCountPointListByDate(String userId, String fromDate, String toDate) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("userId", userId);
		hMap.put("fromDate",fromDate);
		hMap.put("toDate",toDate);

		return sessionTemplate.selectOne("myShopping.getCountPointListByDate", hMap);
	}
	
	public List<PointDTO> getPointListByDate (Map<String, Object> map){

		List<PointDTO> lists = sessionTemplate.selectList("myShopping.getPointListByDate",map);

		return lists;
	}
	
	public int getCountSavePoint(String userId, String fromDate, String toDate) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("userId", userId);
		hMap.put("fromDate",fromDate);
		hMap.put("toDate",toDate);

		return sessionTemplate.selectOne("myShopping.getCountSavePoint", hMap);
	}
	
	public int getCountUsePoint(String userId, String fromDate, String toDate) {
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("userId", userId);
		hMap.put("fromDate",fromDate);
		hMap.put("toDate",toDate);

		return sessionTemplate.selectOne("myShopping.getCountUsePoint", hMap);
	}
	
	public List<PointDTO> getSavePointList (Map<String, Object> map){

		List<PointDTO> lists = sessionTemplate.selectList("myShopping.getSavePointList",map);

		return lists;
	}
	
	public List<PointDTO> getUsePointList (Map<String, Object> map){

		List<PointDTO> lists = sessionTemplate.selectList("myShopping.getUsePointList",map);

		return lists;
	}
	
	public int getWishCount(String userId) {
		
		return sessionTemplate.selectOne("myShopping.getWishCount",userId);
	}
	
	public int getRecentCount(String userId) {
		
		return sessionTemplate.selectOne("myShopping.getRecentCount",userId);
	}
	
	public List<OrderDetailDTO> getOrderDetailList(String orderId){
		
		List<OrderDetailDTO> lists = sessionTemplate.selectList("myShopping.getOrderDetailList",orderId);
		
		return lists;
	}
	
	public OrderListDTO getOrderDetailInfo(String orderId) {
		
		OrderListDTO dto = sessionTemplate.selectOne("myShopping.getOrderDetailInfo", orderId);
		
		return dto;
	}
	
	public void cancelOrder(String orderId) {
		
		sessionTemplate.update("myShopping.cancelOrder",orderId);
		
	}
	
	public void returnOrder(String orderId) {
		
		sessionTemplate.update("myShopping.returnOrder",orderId);
		
	}
	
	public void confirmOrder(String orderId) {
		
		sessionTemplate.update("myShopping.confirmOrder",orderId);
		
	}
	
	public void exchangeOrder(String orderId) {
		
		sessionTemplate.update("myShopping.exchangeOrder",orderId);
		
	}
	
	public int expPointCount(String userId) {
		
		return sessionTemplate.selectOne("myShopping.expPointCount",userId);
				
	}
	
	
	public List<PointDTO> expPointList(Map<String, Object> map){
		
		List<PointDTO> lists = sessionTemplate.selectList("myShopping.expPointList",map);
		
		return lists;
		
	}
	
	public int readyReviewCount(String userId) {
		
		return sessionTemplate.selectOne("myShopping.readyReviewCount",userId);
		
	}
	
	public List<MainDTO> readyReviewList (Map<String, Object> map) {
		
		List<MainDTO> lists = sessionTemplate.selectList("myShopping.readyReviewList",map);
		
		return lists;
		
	}
	
	public int LatesBooksCount(String userId) {
		
		return sessionTemplate.selectOne("myShopping.LatesBooksCount",userId);
		
	}
	
	public List<MainDTO> LatesBooksList (Map<String, Object> map){
		
		List<MainDTO> lists = sessionTemplate.selectList("myShopping.LatesBooksList",map);
		
		return lists;
	}
	
	public void deleteLatesBooks(List<String> delList, String userId) {
		
		String isbn = "";
		
		Iterator<String> it = delList.iterator();
		
		while(it.hasNext()) {
			isbn = it.next();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isbn", isbn);
			map.put("userId", userId);
			sessionTemplate.delete("myShopping.deleteLatesBooks",map);
		}
		
	}
	
	public int myReviewCount(String userId) {
		
		return sessionTemplate.selectOne("myShopping.myReviewCount",userId);
				
	}
	
	public List<MyReviewDTO> myReviewList(Map<String, Object> map){
		
		List<MyReviewDTO> lists = sessionTemplate.selectList("myShopping.myReviewList",map);
		
		return lists;
	}
	
	
	

}
