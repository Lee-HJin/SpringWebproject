<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<html>
<head>
	<title>반디앤루니스 인터넷서점</title>
	
	<!-- bootstrap -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<%=cp%>/resources/js/join.js"></script>
	
</head>
<body>


<!-- 전체 div -->
<div style="margin: 0 auto; width: 960px;">

<!-- 로그인 -->
<div style="padding-left: 60px; padding-bottom: 20px;">

<form action="" name="loginForm" method="post">
<div class="login_div">
	<div style="padding: 10px">
		<span class="login_title_span">로그인</span><br/><br/>
		<div class="login_message"><b>${message}</b></div>
		<div class="bts"  style="float: left;">			
			<input type="text" name="userId" placeholder="아이디" style="border-color: bcbcbc; border: 1px solid; margin-bottom: 0px; height: 40px; width: 300px;" class="form-control"> <br/>
			<input type="password" name="userPwd" placeholder="비밀번호" style="border-color: bcbcbc; border: 1px solid; margin-bottom: 10px; height: 40px; width: 300px;" class="form-control">		
		</div>
		<div style="float: left; padding-left: 20px">
			<input type="button" value="로그인" onclick="login();" style="height: 100px; width: 100px; color: white; background-color: #886e45; border: none; font-size: 18px; font-weight: bold;">
		</div>
		<div style="clear: both; margin-bottom: 10px" class="checkbox">
			<label><input type="checkbox" id="idSave" name="idSave">아이디저장</label>
		</div>
		<div style="clear: both; text-align: right;" class="href">
			<a href="mem_findId.action">아이디찾기</a>&nbsp;|&nbsp;
			<a href="mem_findPwd.action">비밀번호 찾기</a>&nbsp;|&nbsp;
			<a href="<%=cp%>/login/mem_agree.action"><b>회원가입</b></a>
		</div>
	</div>
</div>
</form>

</div>

<div>
	<div style="padding-left: 70px; padding-bottom: 5px;">
		<img src="<%=cp%>/resources/img/login/login_service_tit.gif">
	</div>
	<div style="margin: 10px;">
		<img src="<%=cp%>/resources/img/login/login_service_02.gif">
		<img src="<%=cp%>/resources/img/login/login_service_03.gif">
		<img src="<%=cp%>/resources/img/login/login_service_04.gif">
	</div>
</div>

<a href="<%=cp%>/myShoppingMain.action">나의쇼핑</a>

<c:if test="${!empty userInfo}">
	${userInfo.userId }, ${userInfo.userPwd }, ${userInfo.nickName }
</c:if>

</div>

</body>
</html>
