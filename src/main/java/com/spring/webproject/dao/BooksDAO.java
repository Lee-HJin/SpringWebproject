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
import com.spring.webproject.dto.ReviewDTO;
import com.spring.webproject.dto.SimpleReviewDTO;

@Repository
public class BooksDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
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

	// 리뷰 테이블 가져오기

	public List<ReviewDTO> getReadReviewList(int isbn) {

		List<ReviewDTO> lists = sessionTemplate.selectList("bookMapper.getReadReviewList", isbn);
		return lists;

	}
	
	// 심플리뷰 가져오기
	public List<SimpleReviewDTO> getReadSimpleReviewList(int isbn){
		List<SimpleReviewDTO> lists = sessionTemplate.selectList("bookMapper.getReadSimpleReviewList", isbn);
		return lists;
	}
	
	// 심플리뷰 입력하기
	public void insertSimpleReviewData(SimpleReviewDTO dto) {
		
		sessionTemplate.insert("bookMapper.insertSimpleReviewData", dto);
	}

	// 리뷰 상세 정보 가져오기
	public ReviewDTO getReadReviewData(int reviewId) {
		ReviewDTO dto = sessionTemplate.selectOne("bookMapper.getReadReviewData", reviewId);
		return dto;
	}

	// 리뷰 테이블 개수 가져오기
	public int getReviewDataCount(int isbn) {
		int result = sessionTemplate.selectOne("bookMapper.getReviewDataCount", isbn);
		return result;
	}

	// 리뷰 맥스값 가져오기
	public int getMaxNum() {
		int maxNum = 0;

		maxNum = sessionTemplate.selectOne("bookMapper.getReadMaxNum");

		return maxNum;
	}

	// 리뷰 등록하기
	public void insertReviewData(ReviewDTO dto) {
		sessionTemplate.insert("bookMapper.insertReviewData", dto);
	}

	// 리뷰 평점작성
	public void insertReviewRateData(String isbn, String userId, int rate) {
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("isbn", isbn);
		params.put("userId", userId);
		params.put("rate", rate);

		sessionTemplate.insert("bookMapper.insertReviewRateData", params);

	}

	// 조회수 증가
	public void updateHitCount(int reviewId) {

		sessionTemplate.update("bookMapper.updateHitCount", reviewId);

	}

}
