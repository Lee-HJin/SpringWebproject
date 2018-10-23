package com.spring.webproject.util;

public class AjaxPageIndex {
	
	//전체 페이지수 구하기
	//numPerPage : 한화면에 표시할 데이터의 갯수
	//dataCount : 전체 데이터의 갯수
	public int getPageCount(int numPerPage, int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;	
		
	}
	
	//페이징 처리 메소드
	//currentPage :현재 표시할 페이지
	//totalPage : 전체 페이지수
	//params : 검색조건
	public String pageIndexList(int currentPage, int totalPage, String params){
		
		int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
			return "";
		
		//표시할 첫 페이지의 – 1 해준 값
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		//바로가기 페이지
		page = currentPageSetup + 1;
		
		if(params==null || params.equals("")) {
			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
				if(page == currentPage){				
					sb.append("<span class='page_on'>" + page + "</span>&nbsp;");				
				}
				else{
					sb.append("<span class='page_off'><a href=\"javascript:getList(" +  page + ")\">"
						+ page + "</a></span>&nbsp;");		
				}				
				page++;		
			}		
		}
		else {
			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
				if(page == currentPage){				
					sb.append("<span class='page_on'>" + page + "</span>&nbsp;");				
				}
				else{
					sb.append("<span class='page_off'><a href=\"javascript:getList(" 
						+ page + "," + params +")\">"
						+ page + "</a></span>&nbsp;");		
				}				
				page++;		
			}
		}	
		
		return sb.toString();
		
	}
}
