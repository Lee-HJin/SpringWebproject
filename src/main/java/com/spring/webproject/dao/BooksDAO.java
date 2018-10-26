package com.spring.webproject.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.webproject.dto.AuthorDTO;
import com.spring.webproject.dto.BooksDTO;
import com.spring.webproject.dto.BooksImageDTO;

@Repository
public class BooksDAO {
	
	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
		
	}
	
	// 책 정보 가져오기
	public BooksDTO getReadBookData(int isbn) {

		
		BooksDTO dto = sessionTemplate.selectOne("bookMapper.getReadBookData", isbn);
		return dto;
	}
	
	// 저자 정보 가져오기
	public AuthorDTO getReadAuthorData(int isbn) {
		
		AuthorDTO dto2 = sessionTemplate.selectOne("bookMapper.getReadAuthorData", isbn);
		return dto2;
		
	}
	
	// 북 미리보기 이미지 가져오기 
	public List<BooksImageDTO> getReadBookImageData(int isbn) {
		
		
		List<BooksImageDTO> lists = sessionTemplate.selectList("bookMapper.getReadBookList", isbn);
		
		return lists;
		
	}
	
}
