<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String isbn = request.getParameter("isbn");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로나온 도서</title>
<style type="text/css">
::-webkit-scrollbar {
	width: 8px;
	height: 8px;
	border: 3px solid #fff;
}

::-webkit-scrollbar-track {
	background: #fff;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	height: 50px;
	width: 3px;
	background: #FFFFFF;
	-webkit-border-radius: 8px;
	border-radius: 8px;
}

::-webkit-scrollbar-thumb:hover {
	background: #937354;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	width: 8px;
	height: 8px;
	background: #937354;
	-webkit-border-radius: 8px;
	border-radius: 8px;
}
</style>
<!-- 베스트셀러 css -->
<link rel="stylesheet"
	href="/webproject/resources/common/css/bnlBSList2.css" type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/class.css"
	type="text/css">

<link rel="stylesheet"
	href="/webproject/resources/book_css/detail_default.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/pStyle.css"
	type="text/css">

<script type="text/javascript">
	function goInfo(Val) {
		
		if (top.location != self.location) {
			top.location = self.location.href;
		}

		top.location.href = "/webproject/book_info.action?isbn="+ Val;
	}
</script>

<script type="text/javascript"
	src="/webproject/resources/common/js/common.js"></script>

<script type="text/javascript"
	src="/webproject/resources/common/js/swfobject.js"></script>
<script type="text/javascript"
	src="/webproject/resources/common/js/flashcommon.js"></script>
<script type="text/javascript"
	src="/webproject/resources/common/js/AC_RunActiveContent.js"></script>

<script type="text/javascript" src="/webproject/resources/js/common.js"
	charset="euc-kr"></script>
<script type="text/javascript"
	src="/webproject/resources/js/JUTIL/JUTIL.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/navi.js"
	charset="euc-kr"></script>
<script type="text/javascript"
	src="/webproject/resources/js/partnerHeaderInfo.js"></script>

<script type="text/javascript"
	src="/webproject/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/webproject/resources/js/jquery/jquery-ui.js"></script>
<script type="text/javascript"
	src="/webproject/resources/js/jquery/jquery.blockUI.js"></script>
<script type="text/javascript"
	src="/webproject/resources/js/jquery/idangerous.swiper.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>

<!-- ADSSOM 신규 버전 17-11-20 -->
<!-- ADSSOM 공통 SCRIPT -->
<script type="text/javascript" src="https://sc.11h11m.net/s/E799.js"></script>
<script type="text/javascript" charset="UTF-8" async=""
	src="http://s.n2s.co.kr/_n2s_ck_log.php"></script>

<script type="text/javascript" src="/webproject/resources/js/dwr.js"
	charset="euc-kr"></script>
<script type="text/javascript"
	src="/webproject/resources/js/jquery/jquery.min.js"></script>
<!-- IE8 에서 오류로 인해 일부러 넣음(jQuery 보다 dwr.util.js 가 밑에 있음 오류 발생) -->
<script type="text/javascript"
	src="/webproject/resources/js/multiCart.js"></script>

<script type="text/javascript"
	src="/springwebview/resources/js/Main_01.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/JUTIL/JUTIL.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/swfobject.js"></script>
</head>
<body>

	<div class="prod_sort">

		<h4>
			<strong>${dto_Main.categoryName }</strong> 새로나온 책에 <strong>${lists_New_Num }</strong>개
			의 도서가 등록되어 있습니다.
		</h4>
	</div>



	<div class="con_t2">

		<!-- EL / JSTL / Foreach  -->
		<c:forEach var="dto" items="${lists_New }">
			<div class="prod_list_type prod_best_type">
				<ul>
					<li><input class="checkbox" type="checkbox"
						value="${dto.isbn }" name="isbn" id="cart_isbn${dto.isbn }">
						<div class="prod_thumb">
							<span class="ranking"> <span class="rank_num">${dto.rnum }</span>
								<span class="rank_change"> <img
									src="http://image.bandinlunis.com/images/common/2014/ico_best_same.gif"
									alt="-"> <!-- 0 -->
							</span>
							</span>
							<div class="prod_thumb_img">

								<img src="<%=cp %>/resources/image/book/${dto.bookImage }"
									onclick="goInfo(${dto.isbn});" onfocus="this.blur();"> <a
									class="btn_popup" target="_blank"
									href="/webproject/book_info.action?isbn=${dto.isbn }"><span
									class="ico_new">새창열기</span></a>
							</div>
							<a class="btn_preview"
								href="javascript:popPreview('${dto.isbn }');">미리 보기</a>
						</div>

						<dl class="prod_info">
							<dt>
								<a onclick="goInfo(${dto.isbn});" onfocus="this.blur();">
									${dto.bookTitle } </a> </span> <span class="tag_recom"><span>반디추천</span></span>
								<span class="tag_free"><span>무료배송</span></span> </span>
							</dt>
							<dd class="txt_block">
								<span>${dto.authorName }</span> <span class="gap">|</span> <span>${dto.publisher }</span>
								<span class="txt_date"><span class="gap">|</span> <span>${dto.publishDate }</span></span>
							</dd>
							<dd class="mt5">
								<p>
									<span class="txt_reprice">${dto.bookPrice }</span> <span
										class="txt_arrow">→</span> <span class="txt_price"><strong><em>${dto.discountedPrice }</em>원</strong>
										(${dto.discountRate }%↓+5%P)</span>
								</p>
							</dd>
							<dd class="txt_desc">
								<div class="review_point">
									<span style="width: ${dto.rate*10 }%;"></span>
								</div>
								<strong>${dto.rate }</strong> 리뷰<em>(${dto.reviewCnt })</em>
							</dd>
							<dd class="txt_bex">${dto.introduction }...</dd>
							<dd class="txt_ebook">
								<span>지금 주문하면 <strong class="t_red">내일</strong>받을 수 있습니다.
								</span>
							</dd>
						</dl>

						<dl class="prod_btn">
							<dt>
								<span class="num_txt">수량</span> <input type="text"
									id="cntVal_${dto.isbn }" value="1" class="num" size="3"
									maxlength="2" onkeydown="onlyNumber();" onkeyup=""> <span
									class="btn_updn_wrap"> <a
									href="javascript:cntUp('${dto.isbn }');" class="btn_num_up">▲</a>
									<a href="javascript:cntDown('${dto.isbn }');"
									class="btn_num_dn">▼</a>
								</span>
							</dt>

							<dd>
								<a href="javascript:addCart('${dto.isbn }');"><span
									class="btn_b_comm btype_f1">쇼핑카트</span></a>
							</dd>
							<dd class="mt3">
								<a href="javascript:goOrder('${dto.isbn }');"><span
									class="btn_w_comm btype_f1">바로구매</span></a>
							</dd>
							<dd class="mt3">
								<a
									href="javascript:add_wish_array_common('${dto.isbn }', true);"><span
									class="btn_w_comm btype_f1">위시리스트</span></a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</c:forEach>


	</div>
	<!-- con_t2 -->

</body>
</html>