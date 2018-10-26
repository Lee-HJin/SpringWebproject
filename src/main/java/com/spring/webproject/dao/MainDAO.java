package com.spring.webproject.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.webproject.dto.MainDTO;

public class MainDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//유사 카테고리 책 가져오기
	public List<MainDTO> similCate(String isbn){
		
		List<MainDTO> lst = sessionTemplate.selectList("mainMapper.similCate",isbn);
		
		Random rd = new Random();
		int[] num = new int[3];
		
		int i,n;
		n=0;
		while(n<3){
			num[n] = rd.nextInt(lst.size());
			
			for(i=0;i<n;i++) {
				if(num[i]==num[n]) {
					n--;
					break;
				}
			}
			n++;
		}
		List<MainDTO> list = new ArrayList<MainDTO>();
		
		for(i=0;i<num.length;i++) {
			
			list.add(lst.get(num[i]));
		}
		return list;
	}
	
	
	//기대신간
	public List<MainDTO> newBook(int categoryId){
		
		List<MainDTO> lst = sessionTemplate.selectList("mainMapper.newBook",categoryId);
		
		return lst;	
	}
	
	//기대신간 -전체
	public List<MainDTO> newBookAll(){
		
		List<MainDTO> lst = sessionTemplate.selectList("mainMapper.newBookAll");
		
		return lst;
	}
	
	//이슈북
	public List<MainDTO> issueBook(){
		
		List<MainDTO> lst = sessionTemplate.selectList("mainMapper.issueBook");
		
		return lst;
	}
	
	//베스트셀러
	public List<MainDTO> bestSeller(){
		
		List<MainDTO> lst = sessionTemplate.selectList("mainMapper.bestSeller");
		
		return lst;
	}
	
	
	//임시 책 정보
	public MainDTO tempBook(String isbn){
		
		MainDTO dto = sessionTemplate.selectOne("mainMapper.tempBook",isbn);
		
		return dto;
	}
		
}


