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
	
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: underline; color: #886e45;}
	
	div{display: block;}

	.nameBar {background-color: #878787; color: white; width: 950px; height: 25px; padding: 3px; margin: 0;}
	.nameBar .left_div {float: left; line-height: 25px;}
	.nameBar .right_div {float: right; line-height: 30px; padding-right: 5px;}
	
	.navi_div {width: 950px; padding: 0; margin-top: 50px;}
	.infoBar {width: 948px; height: 100px; background-color: #fcfcfa; padding: 3px; margin: 0; border-bottom: 1px solid #878787; border-left: 1px solid #878787; border-right: 1px solid #878787; font-weight: bold;}
	.infoBar ul {list-style: none; margin: 0; display: block; margin-top: 16px; padding-left: 0px;}
	.infoBar li {float: left; border-left: 1px solid #e1e1e1; height: 60px; padding-top: 4px; text-align: center; width: 150px; margin: 0}
	.infoBar span {display: block;}
	.infoBar .under{margin-top: 15px; color: #3aaeca;}

	.side_navi {float: left; border: 1px solid #c9c9c9; margin-top: 15px; width: 180px; font-size: 11pt;}
	.side_navi_title {display: block; background-color: #fcfcfa; border-bottom: 1px solid #c9c9c9; padding-left: 5px; padding-top: 5px; padding-bottom: 5px;}
	.side_navi_span {font-weight: bold; display: block; padding-left: 10px; padding-bottom: 5px;}
	.side_navi ul {list-style: none; padding-left: 0px; margin: 0;}
	.side_navi li {margin: 0;}
	.side_navi_line {border-bottom: 1px solid #e1e1e1;}
	.side_navi_line li {padding-left: 20px;}

	.contents {float: left; margin-top: 15px; margin-left: 20px; width: 760px;}

	.main_RecentOrderList {height: 200px;}
	.main_wishList {height: 300px;}
	.main_latesbooksList {height: 300px;}
	.main_CounselList {height: 200px;}

	table {border-top: 2px solid #d5d5d5; border-collapse: collapse; border-spacing: 0px; font-size: 11pt; text-align: center;}
	th {background-color: #f8f8f8; border-bottom: 1px solid #d5d5d5; height: 30px; width: 100px; line-height: 30px; }
	
	.sapn_right {float: right; margin: 0; padding-top: 8px;}
	.count {color: #ea5759; font-weight: bold};
	
</style>

<link rel="stylesheet" href="<%=cp%>/resources/css/main.css" type="text/css">

</head>
<body style="margin: 0">

<!-- header -->
<jsp:include page="./header.jsp" flush="false"/>


<div>
	<a href="<%=cp %>/main.action">홈</a> > <b>나의쇼핑</b>
</div>

<div class="navi_div">
	<div class="nameBar">
		<div class="left_div">
			<b>
			${userInfo.userId }<c:if test="${!empty userInfo.nickName }">(${userInfo.nickName })님의 쇼핑 정보</c:if>
			<c:if test="${empty userInfo.nickName }">(${userInfo.userId })님의 쇼핑 정보</c:if>
			</b>
		</div>
		<div class="right_div">
			<img alt="" src="<%=cp%>/resources/img/myShopping/btn_mem_modify.gif">
			<img alt="" src="<%=cp%>/resources/img/myShopping/btn_mem_wishlist.gif">
		</div>
	</div>
	<div class="infoBar">
		<ul>
			<li style="border-left: none;">
				<span>회원등급</span>
				<span class="under">일반</span>
			</li>
			<li>
				<span>진행중 주문건</span>
				<span class="under">0건</span>
			</li>
			<li>
				<span>적립금</span>
				<span class="under">1,000원</span>
			</li>
			<li>
				<span>최근 본 상품</span>
				<span class="under">0건</span>
			</li>
			<li>
				<span>나의 상담</span>
				<span class="under">0건</span>
			</li>
		</ul>
	</div>
</div>

<div class="side_navi">
	<span class="side_navi_title"><font size="5">나의쇼핑</font></span>
	<ul>
		<li style="padding-top: 10px;">
			<span class="side_navi_span">주문관리</span>
			<div class="side_navi_line">
				<ul>
					<li><a href="">주문/배송 조회</a></li>
					<li style="padding-bottom: 10px;"><a href="">취소/반품/교환 내역</a></li>
				</ul>
			</div>
		</li>
		<li style="padding-top: 10px;">
			<span class="side_navi_span">포인트와 혜택</span>
			<div class="side_navi_line">
				<ul>
					<li style="padding-bottom: 10px;">적립금</li>
				</ul>
			</div>
		</li>
		<li style="padding-top: 10px;">
			<span class="side_navi_span">관심 리스트</span>
			<div class="side_navi_line">
				<ul>
					<li>최근 본 상품</li>
					<li style="padding-bottom: 10px;">위시리스트</li>
				</ul>
			</div>
		</li>
		<li style="padding-top: 10px;">
			<span class="side_navi_span">나의 리뷰</span>
			<div class="side_navi_line">
				<ul>
					<li>리뷰가 있는 책</li>
					<li>리뷰를 기다리는 책</li>
					<li>간단평</li>
					<li style="padding-bottom: 10px;">최근 덧글</li>
				</ul>
			</div>
		</li>
		<li style="padding-top: 10px;">
			<span class="side_navi_span">나의 상담</span>
			<div class="side_navi_line">
				<ul>
					<li>1:1 상담 내역</li>
					<li style="padding-bottom: 10px;">1:1 상담하기</li>
				</ul>
			</div>
		</li>
		<li style="padding-top: 10px;">
			<span class="side_navi_span">회원정보</span>
			<div class="side_navi_line">
				<ul>
					<li>회원정보 수정</li>
					<li style="padding-bottom: 10px;">회원 탈퇴</li>
				</ul>
			</div>
		</li>
	</ul>
</div>

<div class="contents">
	<div class="main_RecentOrderList">
		<font size="5">최근 주문/배송 내역</font> | 고객님의 최근 1개월 주문 내역입니다. <span class="sapn_right"><a href="">더보기></a></span>
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>수령예상일</th>
				<th style="width: 350px;">상품명</th>
				<th>주문금액</th>
			</tr>
			<tr>
				<td colspan="5" height="50px;">최근 주문내역이 없습니다.</td>
			</tr>
		</table>
	</div>
	<div class="main_wishList">
		<div style="border-bottom: 1px solid #c9c9c9;">
			<font size="5" style="text-align: center;">위시리스트 </font><span class="count">[1]</span>
		</div>
		<div>
			책책책
		</div>
	</div>
	<div class="main_latesbooksList">
		<div style="border-bottom: 1px solid #c9c9c9;">
			<font size="5">최근 본 상품 </font><span class="count">[5]</span>
		</div>
		<div>
			책책책
		</div>
	</div>
	<div class="main_CounselList">
		<font size="5">나의 상담 내역</font>  <span class="sapn_right"><a href="">더보기></a></span>
		<table>
			<tr>
				<th>상담날짜</th>
				<th>구분</th>
				<th style="width: 500px;">제목</th>
				<th>답변여부</th>
			</tr>
			<tr>
				<td colspan="4" height="50px;">최근 주문내역이 없습니다.</td>
			</tr>
		</table>
	</div>
</div>


</body>
</html>