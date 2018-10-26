package com.spring.webproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.BookSectionsDTO;

public class BookSectionsDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//전체 데이터
	public List<BookSectionsDTO> getList(int sort1st, int sort2nd, int start, int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("sort1st", sort1st);
		params.put("sort2nd", sort2nd);
		params.put("start", start);
		params.put("end", end);
		
		List<BookSectionsDTO> lists = sessionTemplate.selectList("bookSectionsMapper.getLists", params);
		
		return lists;
	}
	
	//전체 데이터 갯수
	public int getDataCount() {
		
		int allDataCount = 0;
		
		allDataCount = sessionTemplate.selectOne("bookSectionsMapper.getDataCount");
		
		return allDataCount;
	}
	
}
