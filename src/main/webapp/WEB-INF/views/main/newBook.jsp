<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%> 
<div class="b_arrow_box">
	<button class="slide_aw left" id="nb_awL">
		<span class="aw_count_nb"></span>
	</button>	
	<button class="slide_aw right" id="nb_awR">
		<span class="aw_count_nb"></span>
	</button>
</div>
<div class="swiper-container swiper4">
	<div class="swiper-wrapper">
		<c:forEach var="nb" items="${lst }">
			<div class="swiper-slide">
				<div class="wrap_b_img">
					<a href="<%=cp%>/book_info.action?isbn=${nb.isbn}">
						<img src="<%=cp%>/resources/image/book/${nb.bookImage}">
					</a>
					<dl class="rb_title">
						<dt>${nb.bookTitle }</dt>
						<dd>${nb.authorName }</dd>
					</dl>
				</div>
			</div>
		</c:forEach>
	</div>	
</div>

<script>
var swiper = new Swiper('.swiper4', {
	slidesPerView: 5,
	spaceBetween: 10,
	slidesPerGroup: 5,
	loopFillGroupWithBlank: true,
	loop: true,
	pagination: {
		el: '.aw_count_nb',
		type: 'fraction',
	},
	navigation: {
		nextEl: '#nb_awR',
		prevEl: '#nb_awL',
	},
});
</script>