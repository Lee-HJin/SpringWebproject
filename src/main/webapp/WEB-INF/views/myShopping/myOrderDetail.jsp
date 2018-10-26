<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
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
	<a href="<%=cp %>/main.action">홈</a> > <a href="<%=cp %>/myShoppingMain.action">나의쇼핑</a> > <a href="<%=cp %>/myShopping/myOrderList.action">주문/배송조회</a> > <b>주문내역상세</b>
</div>
<!-- navigation -->
<jsp:include page="./topNavi.jsp" flush="false"/>
<jsp:include page="./sideNavi.jsp" flush="false"/>

<div class="contents">
	<div style="font-size: 13pt; font-weight: bold; padding-bottom: 10px;">주문내역상세 </div>
	
	<div class="order_detail_info_box">
		<span><b>주문번호:</b> ${orderId }</span>
		<span><b>주문일자:</b> ${handlingDate }</span>
	</div>
	
	<div class="order_detail_book">
		<span style="font-size: 10pt;"><b>주문 상품 정보</b></span>
		<table>
			<tr>
				<th style="width: 335px;">상품명</th>
				<th style="width: 40px;">수량</th>
				<th>판매가</th>
				<th>적립금</th>
				<th>현황</th>
				<th>배송상황</th>
				<th>상품평</th>
			</tr>
			<c:forEach var="dto" items="${lists }">
				<tr>
					<td style="text-align: left; padding-left: 15px;">${dto.bookTitle }</td>
					<td>${dto.quantity }</td>
					<td><fmt:formatNumber value="${dto.bookPrice }" pattern="#,###"/>원</td>
					<td><fmt:formatNumber value="${dto.point }" pattern="#,###"/>원</td>
					<td></td>
					<td></td>
					<td><input type="button" class="order_detail_book_btn" value="상품평쓰기"></td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="7"><span>합계 :<span> 원</span></span><span>적립금 :<span> 원</span></span></td>
				</tr>
		</table>
	</div>
	
	<div class="order_detail_notice">
		<ul>
			<li>출고완료상태에서 '구매완료' 버튼을 누르시면 '구매완료'로 전환됩니다.</li>
			<li>버튼을 누르지 않을 경우 배송완료 상태로부터 7일 이후에는 자동으로 '구매완료'로 전환됩니다.</li>
			<li>적립금은 '구매완료' 상태가 될 때 지급되므로 '구매완료' 버튼을 클릭하시면 즉시 적립금을 받으실 수 있습니다.</li>
			<li>주문상태가 '구매완료'가 되면 반품/교환/주문취소는 불가능하오니 반품 등을 고려하실 경우에는 '구매완료' 버튼을 클릭하지 마시기 바랍니다.</li>
		</ul>
	</div>
	
	

</div>




</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="false"/>

</body>
</html>