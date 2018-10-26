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
	<a href="<%=cp %>/main.action">홈</a> > <a href="<%=cp %>/myShoppingMain.action">나의쇼핑</a> > 관심 리스트 ><b>위시리스트</b>
</div>
<!-- navigation -->
<jsp:include page="./topNavi.jsp" flush="false"/>
<jsp:include page="./sideNavi.jsp" flush="false"/>

<div class="contents">
	<div style="font-size: 13pt; font-weight: bold; padding-bottom: 10px;">위시리스트 </div>
	<div style="margin-top: 10px;">총 1권의 상품이 등록되어 있습니다.</div>
	<div class="wish_sort_box">
		<div class="wish_sort_left">
			<select>
				<option>최근순</option>
				<option>오래된순</option>
				<option>상품명순</option>
				<option>가격순</option>
				<option>구매한 상품만</option>
				<option>구매하지 않은 상품만</option>
			</select>
			<select>
				<option>20개씩</option>
				<option>40개씩</option>
				<option>60개씩</option>
			</select>
		</div>
		<div class="wish_sort_right">
			<span style="line-height: 20px;"><input type="checkbox" value="all" class="wish_sort_chk" height="150px;">전체선택</span>
			<input type="button" value="쇼핑카트" class="wish_sort_btn">
			<input type="button" value="삭제" class="wish_sort_btn">
		</div>
	</div>
	
	<div class="wish_list_content">
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
	<div class="wish_list_page">
		페이징
	</div>
	
	<div style="text-align: center; padding-top: 100px;">위시리스트에 담은 상품이 없습니다.</div>
</div>




</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="false"/>

</body>
</html>