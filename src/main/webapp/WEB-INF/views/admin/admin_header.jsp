<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<%=cp%>/resources/css/admin.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet"/>

<title>Insert title here</title>

</head>
<body>
<div id="head">
	<div id="top_wrap">
		<div class="head_top" style="width: 1100px;">
			<h1 class="logo">
				<a href="<%=cp%>/main.action">
					<img alt="" src="<%=cp%>/resources/image/main/logo_2014_top.gif">
				</a>
			</h1>
			<div class="top_menu" style="width: 1100px;">
				<ul class="t_menu_list">
					<c:if test="${empty sessionScope.userInfo.userId }">
					<li class="t_menu login">
						<a href="<%=cp %>/login.action" class="t_menu_link btn_login">로그인</a>
					</li>
 					</c:if>
					<c:if test="${!empty sessionScope.userInfo.userId }"> 
						<li class="t_menu logout">
							<a href="javascript://" class="t_menu_link btn_logout">로그아웃</a>
						</li>
 					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="wrap_header">
		<div class="header_menu" style="width: 1100px;">
			<ul class="menu_wrap">
				<li class="menu">
					<a href="<%=cp %>/admin.action" >
						<font>홈</font>
					</a>
				</li>
				<li class="menu">
					<a href="<%=cp %>/admin_users.action" >
						<font>회원관리</font>
					</a>
				</li>
				<li class="menu">
					<a href="<%=cp %>/admin_goods.action" >
						<font>도서등록</font>
					</a>
				</li>
				
				<li class="menu">
					<a href="<%=cp %>/admin_category.action" >
						<font>카테고리관리</font>
					</a>
				</li>
				<li class="menu">
					<a href="<%=cp %>/admin_author.action" >
						<font>작가/번역가 등록</font>
					</a>
				</li>
				<li class="menu">
					<a href="<%=cp %>/admin_warehouse.action" >
						<font>지점 관리</font>
					</a>
				</li>
				
				<li class="menu">
					<a href="<%=cp %>/admin.action" >
						<font>재고현황</font>
					</a>
				</li>
				
				<li class="menu">
					<a href="<%=cp %>/admin.action" >
						<font>고객상담</font>
					</a>
				</li>
			</ul>	
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</body>
</html>



































