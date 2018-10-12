<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<title>반디앤루니스 인터넷서점</title>

<style type="text/css">

	.nameBar {background-color: #878787; color: white; width: 500px; height: 25px; padding: 3px; margin-top: 50px; margin-bottom: 0;}
	.nameBar .left_div {float: left; line-height: 25px;}
	.nameBar .right_div {float: right; line-height: 30px;}
	
	.infoBar ul {list-style: none;}
	.infoBar li {float: left; border-left: 1px solid #e1e1e1; height: 60px; padding-top: 4px; text-align: center; width: 100px;}
</style>

</head>
<body>

<div>
	<a href="/bandi/">홈</a> > 나의쇼핑
</div>

<div>
	<div class="nameBar">
		<div class="left_div"><b>user_id(nickName)님의 쇼핑 정보</b></div>
		<div class="right_div"><img alt="" src="<%=cp%>/resources/img/btn_mem_modify.gif"></div>
	</div>
	<div class="infoBar">
		<ul>
			<li>
				<span>회원등급</span>
				<span></span>
			</li>
			<li>
				<span>진행중 주문건</span>
				<span></span>
			</li>
			<li>
				<span>적립금</span>
				<span></span>
			</li>
		</ul>
	</div>
</div>


</body>
</html>