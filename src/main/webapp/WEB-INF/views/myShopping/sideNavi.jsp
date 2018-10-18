<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>

<div class="side_navi">
	<span class="side_navi_title">나의쇼핑</span>
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
					<li><a href="<%=cp %>/myShopping/pre_updateMyInfo.action">회원정보 수정</a></li>
					<li style="padding-bottom: 10px;">회원 탈퇴</li>
				</ul>
			</div>
		</li>
	</ul>
</div>