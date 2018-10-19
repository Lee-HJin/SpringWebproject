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
			System.out.println(num[i]);
		}
		
		
		
		
		return list;
	}

}
