<%@page import="com.spring.webproject.dto.MainDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function() {
		
		if(document.cookie.indexOf('book')==-1){
			setCookie('book',${isbn},1);
		}else if(document.cookie.indexOf('book')!=-1){
			addCookie(${isbn});
		}
	});
	
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
        expire.setDate(expire.getDate() + cDay);
        cookies = cName + '=' + escape(cValue) + '; path=/ ';
        if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
        document.cookie = cookies;
	}
	
	function addCookie(cValue){
		
		var items = getCookie('book');
		var maxItemNum = 10;
		if(items){
			var itemArray=items.split(',');

			if(itemArray.indexOf('${isbn}')!=-1){//중복시 기존 제거 후 맨앞으로 가져옴
				alert("중복");
				var idx = itemArray.findIndex(function(item) {
					return item === '${isbn}';
				});		
			
				itemArray.splice(idx,1);
		
				itemArray.unshift(cValue);
				if(itemArray.length>maxItemNum){
					itemArray.length=10;}	
				items = itemArray.join(',');
				setCookie('book',items,1);
				
			}else{
				alert("들어감");
				itemArray.unshift(cValue);
				if(itemArray.length>maxItemNum){
					itemArray.length=10;}	
				items = itemArray.join(',');
				setCookie('book',items,1);
			}
		}
	}
	
	function getCookie(cookie_name) {
		  var x, y;
		  var val = document.cookie.split(';');

		  for (var i = 0; i < val.length; i++) {
		    x = val[i].substr(0, val[i].indexOf('='));
		    y = val[i].substr(val[i].indexOf('=') + 1);
		    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		    if (x == cookie_name) {
		      return unescape(y);
		    }
		  }
		}

	
/* 	 $(function() {
	
		var cookieValue = JSON.stringify({"isbn":"${isbn}","bookImage":"${dto.bookImage}",
			"bookTitle":"${dto.bookTitle}","authorName":"${dto.authorName}"});
		
		if(document.cookie.indexOf('book')==-1){
			setCookie('book',cookieValue,1);
		}else if(document.cookie.indexOf('book')!=-1){
			addCookie(cookieValue);
		}
	});
	
	//쿠키 생성
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
        expire.setDate(expire.getDate() + cDay);
        cookies = cName + '=' + escape(cValue) + '; path=/ ';
        if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
        document.cookie = cookies;
	}
	
	//기존 쿠키에 추가
	function addCookie(cValue){
		var items = getCookie('book');
		var maxItemNum = 5;
		
		if(items){
			var itemArray=items.split('/');
			
			if(itemArray.indexOf(cValue)!=-1){//중복시 기존 제거 후 맨앞으로 가져옴
				alert("중복");
				var idx = itemArray.findIndex(function(item) {
					return item === cValue;
				});		
				itemArray.splice(idx,1);
		
				itemArray.unshift(cValue);
				if(itemArray.length>maxItemNum){
					itemArray.length=5;}	
				items = itemArray.join('/');
				setCookie('book',items,1);
				
			}else{
				alert("들어감");
				itemArray.unshift(cValue);
				if(itemArray.length>maxItemNum){
					itemArray.length=5;}	
				items = itemArray.join('/');
				setCookie('book',items,1);
			}
		}
	}
			
	function getCookie(cookiename){
		var cookiestring  = document.cookie;
		var cookiearray = cookiestring.split(';');
		for(var i =0 ; i < cookiearray.length ; ++i){ 
		    if(cookiearray[i].indexOf(cookiename)!=-1){ 
		        var ck = [];
		        var nameVal = cookiearray[i].split( "=" );
	            var value = nameVal[1].trim();
		        ck+= value;
		    }
		} 
		return unescape(ck);
	}  */
	        
	
</script>

</head>
<body>

<img src="<%=cp %>/resources/image/book/${dto.bookImage }"><br>

책이름: ${dto.bookTitle }<br>
작가: ${dto.authorName }<br>
ISBN : ${dto.isbn }<br><br>

<a href="<%=cp%>/main.action">메인으로</a>

</body>
</html>