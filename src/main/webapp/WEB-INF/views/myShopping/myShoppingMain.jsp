<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<title>반디앤루니스 인터넷서점</title>

	<link rel="stylesheet" href="<%=cp%>/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="<%=cp%>/resources/css/myShopping.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<%=cp%>/resources/js/myShopping.js"></script>
	
</head>
<body style="padding: 0; margin: 0;">

<!-- header -->
<jsp:include page="../common/header.jsp" flush="false"/>

<!-- 전체 div -->
<div style="margin: 0 auto; width: 960px;">

<div style="margin-top: 12px;">
	<a href="<%=cp %>/main.action">홈</a> > <a href="<%=cp %>/myShoppingMain.action">나의쇼핑</a> > 회원정보 > <b>회원정보수정</b>
</div>
<!-- navigation -->
<jsp:include page="./topNavi.jsp" flush="false"/>
<jsp:include page="./sideNavi.jsp" flush="false"/>

<div class="contents">
	<div class="main_RecentOrderList">
		<span class="contents_title">최근 주문/배송 내역</span> | 고객님의 최근 1개월 주문 내역입니다. <span class="sapn_right"><a href="">더보기></a></span>
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>수령예상일</th>
				<th style="width: 365px;">상품명</th>
				<th>주문금액</th>
			</tr>
			<tr>
				<td colspan="5" height="100px;">최근 주문내역이 없습니다.</td>
			</tr>
		</table>
	</div>
	<div class="main_wishList">
		<div style="border-bottom: 1px solid #c9c9c9; line-height: 30px;">
			<span class="contents_title">위시리스트</span><span class="count">[1]</span>
		</div>
		<div>
			책책책
		</div>
	</div>
	<div class="main_latesbooksList">
		<div style="border-bottom: 1px solid #c9c9c9; line-height: 30px;">
			<span class="contents_title">최근 본 상품</span><span class="count">[5]</span>
		</div>
		<div>
			책책책
		</div>
	</div>
	<div class="main_CounselList">
		<span class="contents_title">나의 상담 내역</span>  <span class="sapn_right"><a href="">더보기></a></span>
		<table>
			<tr>
				<th>상담날짜</th>
				<th>구분</th>
				<th style="width: 500px;">제목</th>
				<th>답변여부</th>
			</tr>
			<tr>
				<td colspan="4" height="100px;">최근 주문내역이 없습니다.</td>
			</tr>
		</table>
	</div>
</div>

<!-- 전체 div 끝 -->
</div>

</body>
</html>