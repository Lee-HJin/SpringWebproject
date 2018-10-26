<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<a href="<%=cp %>/main.action">홈</a> > <b>나의쇼핑</b>
</div>
<!-- navigation -->
<jsp:include page="./topNavi.jsp" flush="false"/>
<jsp:include page="./sideNavi.jsp" flush="false"/>

<div class="contents">
	<div class="main_RecentOrderList">
		<span class="contents_title">최근 주문/배송 내역</span> | 고객님의 최근 1개월 주문 내역입니다. 
		<span class="sapn_right"><a href="<%=cp%>/myShopping/myOrderList.action">더보기></a></span>
		
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>수령예상일</th>
				<th style="width: 365px;">상품명</th>
				<th>주문금액</th>
			</tr>
			<!-- 주문내역 없을 시 -->
			<c:if test="${empty orderList }">
			<tr height="100px;">
				<td colspan="5">주문내역이 없습니다.</td>
			</tr>
			</c:if>
			<!-- 주문내역 있을 시 -->
			<c:forEach var="dto" items="${orderList }">
			<tr>
				<td>${dto.orderId }</td>
				<td>${dto.handlingDate }</td>
				<td>${dto.expectedDate }</td>
				<c:if test="${dto.quantity>1 }">
				<td style="text-align: left;">${dto.mainTitle } 외 ${dto.quantity-1 }개</td>
				</c:if>
				<c:if test="${dto.quantity==1 }">
				<td style="text-align: left;">${dto.mainTitle }</td>
				</c:if>	
				<td><fmt:formatNumber value="${dto.orderPrice }" pattern="#,###"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="main_wishList">
		<div style="border-bottom: 1px solid #c9c9c9; line-height: 30px;">
			<span class="contents_title">위시리스트</span><span class="count">[${wishCount }]</span>
			<span class="sapn_right"><a href="<%=cp%>/myShopping/myWishList.action">더보기></a></span>
		</div>
		<div class="wish_list_content" style="border-bottom: none;">
		<ul>
			<li>
				<!-- 상단 -->
				<div>
					<!-- 체크박스 -->
					<div style="float: left;">
						<input type="checkbox" class="checkbox" name="seq" value="">
					</div>
					<!-- 이미지 -->
					<div class="wish_book_up">
						<div class="wish_book_img">
							<a href=""><img alt="" src="<%=cp%>/resources/image/book/3054578.jpg"></a>
							<a href="" target="_blank" class="wish_book_popup">
								<span>새창열기</span>
							</a>
						</div>
						<div style="margin-top: 5px; text-align: center;">
							<a href=""><img alt="미리보기" src="<%=cp%>/resources/img/myShopping/btn_comm_2.png"> </a>
						</div>
					</div>
				</div>
				<!-- 하단 -->
				<div style="margin-left: 15px;">
					<dl>
						<dt><a href="">서명</a></dt>
						<dd>저자 | 출판사</dd>
						<dd>
							<p>
								<span class="point_red"><b>정가</b> (10%↓+5%P)</span>
							</p>
						</dd>
					</dl>
				</div>
			</li>
		</ul>	
		</div>
	</div>
	<div class="main_latesbooksList">
		<div style="border-bottom: 1px solid #c9c9c9; line-height: 30px;">
			<span class="contents_title">최근 본 상품</span><span class="count">[${recentCount }]</span>
			<span class="sapn_right"><a href="<%=cp%>/myShopping/myLatesBooksList.action">더보기></a></span>
		</div>
		<div class="wish_list_content" style="border-bottom: none;">
		<ul>
			<li>
				<!-- 상단 -->
				<div>
					<!-- 체크박스 -->
					<div style="float: left;">
						<input type="checkbox" class="checkbox" name="seq" value="">
					</div>
					<!-- 이미지 -->
					<div class="wish_book_up">
						<div class="wish_book_img">
							<a href=""><img alt="" src="<%=cp%>/resources/image/book/3054578.jpg"></a>
							<a href="" target="_blank" class="wish_book_popup">
								<span>새창열기</span>
							</a>
						</div>
						<div style="margin-top: 5px; text-align: center;">
							<a href=""><img alt="미리보기" src="<%=cp%>/resources/img/myShopping/btn_comm_2.png"> </a>
						</div>
					</div>
				</div>
				<!-- 하단 -->
				<div style="margin-left: 15px;">
					<dl>
						<dt><a href="">서명</a></dt>
						<dd>저자 | 출판사</dd>
						<dd>
							<p>
								<span class="point_red"><b>정가</b> (10%↓+5%P)</span>
							</p>
						</dd>
					</dl>
				</div>
			</li>
		</ul>	
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

<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="false"/>

</body>
</html>