package com.spring.webproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.SearchDTO;


public class SearchDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
		this.sessionTemplate = sessionTemplate;
	}		
	
	//책 검색 리스트
	public List<SearchDTO> getSearchBook(int start, int end, String searchValue){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		
		List<SearchDTO> lists = sessionTemplate.selectList("searchMapper.getSearchBook",params);
		return lists;
	}
	
	//책 검색 데이터 갯수
	public int getBookCount(String searchValue) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchValue", searchValue);
		
		int result =sessionTemplate.selectOne("searchMapper.getBookCount",params);
		return result;
		
	}
	
	
	public List<SearchDTO> getBookTitle(String searchValue){
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("searchValue", searchValue);
		List<SearchDTO> lists = sessionTemplate.selectList("searchMapper.getBookTitle",params);
		return lists;
	}
	
	

	
}
