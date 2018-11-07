<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인_소설 도서부분</title>

<!-- 베스트셀러 css -->

<link rel="stylesheet"
	href="/webproject/resources/common/css/bnlBSList2.css" type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/class.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/common.css"
	type="text/css">

<link rel="stylesheet"
	href="/webproject/resources/book_css/detail_default.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/pStyle.css"
	type="text/css">


<script type="text/javascript"
	src="/springwebview/resources/js/Main_01.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/JUTIL/JUTIL.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/swfobject.js"></script>
<script type="text/javascript">
	function toggleDisplay(num) {
		var con = document.getElementById("layer" + num);
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function toggleDisplay2(num) {
		var con = document.getElementById("left_layer" + num);
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function toggleDisplay3(num) {
		var con = document.getElementById("left2_layer" + num);
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}
</script>
<!-- Carousel BS -->
<!-- Tabs with Dropdown Menu-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
	function popPreview(isbn) {

		if (typeof (isbn) == "undefined" || isbn == "") {
			return;
		}

		window.open("/webproject/book_preview.action?isbn=" + isbn, "preview",
				"width=" + screen.availWidth + ",height=" + screen.availHeight
						+ ",resizable=yes,scrollbars=yes");
	}
</script>

<!-- 메뉴 드롭 다운 -->
<script>
	/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
</script>

<!-- 수량 jQuery -->
<script type="text/javascript">
	function modifyProductQuantity(id, quantity) {

		if (isNaN($("#" + id).val())) {
			alert('숫자만 입력가능 합니다.');
			$("#" + id).focus();
			$("#" + id).val(0);
			return;
		}

		//var v = parseFloat($("#"+id).val())+parseFloat(quantity);    
		//$("#"+id).val(Math.round(v*10)/10);

		var q = parseInt($("#" + id).val()) + parseInt(quantity);
		if (q < 0) {
			$("#" + id).val() = 0;
		}
		$("#" + id).val(q);

	};
</script>

<style>
* {
	box-sizing: border-box
}

/* Style the tab */
.tab {
	float: left;
	border: none;
	width: 100%;
	height: 100px;
	justify-content: space-around;
}

.tablinks {
	float: left;
	width: 25%;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 10px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	
}

/* Create an active/current "tab button" class */
.tab button.active {
	
}

/* Style the tab content */
.tabcontent {
	float: none;
	padding: 10px 10px;
	border: none;
	width: 100%;
	height: 350px;
	display: none;
}

/* Clear floats after the tab */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}
</style>



</head>
<body>


	<jsp:include page="../../common/header.jsp" flush="false" />

	<br />
	<br />
	<br />

	<div id="contentBody" style="width: 1100px;">

		<!-- 좌측 템플릿 시작 -->
		<div class="side_t2 ml5">
			<div class="cate_comm">
				
				<h2 class="cate_tit">${dto_Main.categoryName }</h2>
				<ul class="cate_d1">
					<!-- 중분류 -->
					<c:set var = "i" value ="0"/>
					<c:forEach var = "list" items="${lists_Sub1 }">
					
					<li id="kidsCate_821" class="cate_d1_li "><a
						href="/webproject/book_cate.action?categoryId=${list.categoryId_2 }"
						class="cate_d1_link" onmouseover="javascript:toggleDisplay3(${i })"
						onmouseout="javascript:toggleDisplay3(${i })">${list.categoryName_2 }</a> <!-- 소분류 -->
						<div class="cate_d2" id="left2_layer01"
							onmouseover="javascript:toggleDisplay3(${i })"
							onmouseout="javascript:toggleDisplay3(${i })"
							style="display: none;">

							<div class="pos_rel">
								<div class="ico_arrow"></div>
								<ul>
									<c:forEach var = "list2" items ="${lists_Sub1 }">
									
									<li class="cate_d2_link "><a
										href="/webproject/book_cate.action?categoryId=${list2.categoryId_3 }">${list2.categoryName_3} </a></li>		
									</c:forEach>
								</ul>
							</div>
						</div></li>
						<c:set var ="i" value =${i+1 }/>
					</c:forEach>

				</ul>
			</div>

			<!-- left banner -->

			<!-- 브랜드 -->

			<!-- 추천인사이드:회원님이 주로 구입하시는 가격대의 인기 상품입니다 -->
			<div id="CATE_2"></div>

			<!-- 좌측 템플릿 -->

			<div class="cate_left_box temClassE">

				<h4 class="cate_tem_tit ">자기계발 스테디 셀러</h4>
				<ul>
					<c:forEach var=dto items="${lists_left }">

						<li>
							<dl>
								<dt class="pImg60">
									<a href="/front/product/detailProduct.do?prodId=4026928"><img
										src="/webproject/resources/image/book/${dto.bookImage }"
										onerror="this.src='/images/common/noimg_type04.gif';"></a>
								</dt>
								<dd class="booktit">
									<a href="/webproject/book_info.action?isbn=${isbn }"></a>
								</dd>
								<dd class="writer">${dto.authorName }</dd>
								<dd class="price">${dto.bookPrice*0.9 }</dd>
								<dd class="sPoint t_11">(10%↓+5%P)</dd>
							</dl>
						</li>

					</c:forEach>

				</ul>
			</div>

		</div>

		<!-- 좌측 템플릿 끝 -->




		<!-- 가운데 레이아웃 -->

		<div class="con_t2" style="width: 850px;">

			<div class="container" style="width: 850px;">
				<!-- 		<div class="tap_menu_d2 mb15"> -->
				<ul class="nav nav-tabs">


					<li class="active"><a href="#menu_best">베스트셀러</a></li>

					<li><a href="#menu_new">새로나온 책</a></li>

					<li><a href="#menu_discount">정가인하</a></li>
				</ul>


				<!-- 줄 생성 -->

				<!-- 탭 메뉴 -->

				<div class="tab-content" style="width: 800px;">

					<!-- 베스트셀러 시작 -->

					<div id="menu_best" class="tab-pane fade">

						<div class="con_t2">


							<div class="fl_clear ml5">
								<div class="prod_list_type prod_best_type">

									<ul>
										<c:forEach var="dto" items=${lists_best }>

											<li><input class="checkbox" type="checkbox" value=""
												name="isbn">
												<div class="prod_thumb">
													<span class="ranking"> <span class="rank_num">
															1 </span>
													</span>
													<div class="prod_thumb_img">
														<a href="/webproject/book_info.action?isbn=${dto.isbn }"
															onfocus="this.blur();"> <img
															src="/webproject/resources/image/book/${dto.book_image}"
															onerror="this.src='/images/common/noimg_type01.gif';">


														</a> <a class="btn_popup" target="_blank"
															href="/webproject/book_info.action?isbn=${dto.isbn }"><span
															class="ico_new">새창열기</span></a>
													</div>

													<a class="btn_preview"
														href="javascript:popPreview(${dto.isbn });">미리 보기</a>
												</div>
												<dl class="prod_info">
													<dt>
														<a href="/front/product/detailProduct.do?prodId=4034224"
															onfocus="this.blur();"> ${dto.bookTitle } </a> <span
															class="tag_area"> <span class="tag_best"><span>베스트</span></span>

															<span class="tag_free"><span>무료배송</span></span>

														</span>
													</dt>
													<dd class="txt_block">
														<span>${dto.authorName }</span> <span class="gap">|</span>
														<span>${dto.publisher }</span> <span class="txt_date"><span
															class="gap">|</span> <span>${dto.publishDate }</span></span>
													</dd>
													<dd class="mt5">
														<p>
															<span class="txt_reprice">${dto.bookPrice }</span> <span
																class="txt_arrow">→</span> <span class="txt_price"><strong><em>${dto.bookPrice * 0.85}</em>원</strong>
																(10%↓+5%P)</span>
														</p>
													</dd>
													<dd class="txt_desc">
														<div class="review_point">
															<span style="width: 89%;"></span>
														</div>
														<strong>${dto.rate }</strong> 리뷰<em>([${dto.reviewCnt }])</em>
													</dd>
													<dd class="txt_bex">[${dto.introduction }]</dd>

													<dd class="txt_ebook">
														<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을
															수 있습니다.
														</span>
													</dd>

												</dl>
												<dl class="prod_btn">
													<dt>
														<span class="num_txt">수량</span> <input type="text"
															id="cntVal_4034224" value="1" class="num" size="3"
															maxlength="2" onkeydown="onlyNumber();" onkeyup="">
														<span class="btn_updn_wrap"><a
															href="javascript:cntUp('','01');" class="btn_num_up">▲</a><a
															href="javascript:cntDown('','01');" class="btn_num_dn">▼</a></span>
													</dt>



													<dd>
														<a href="javascript:addCart();"><span
															class="btn_b_comm btype_f1">쇼핑카트</span></a>
													</dd>
													<dd class="mt3">
														<a href="javascript:goOrder();"><span
															class="btn_w_comm btype_f1">바로구매</span></a>
													</dd>




													<dd class="mt3">
														<a href="javascript:add_wish_array_common();"><span
															class="btn_w_comm btype_f1">위시리스트</span></a>
													</dd>
												</dl></li>

										</c:forEach>
									</ul>

								</div>

								<!-- 페이징 -->

							</div>

						</div>
						<!-- con_t2 -->
					</div>
					<!-- 베스트셀러 끝 -->

					<!-- 새로나온 책 시작  -->
					<div id="menu_new" class="tab-pane fade">
						<div class="con_t2">

							<div class="prod_sort">
								<div class="sorting">
									<input type="hidden" name="sorts" value="">
									<ul class="con01">
										<li><a id="sort1" style="cursor: pointer;" class="on">판매량순</a></li>
										<li><a id="sort2" style="cursor: pointer;">발행일순</a></li>
										<li><a id="sort12" style="cursor: pointer;">등록일순</a></li>
										<li><a id="sort6" style="cursor: pointer;">상품명순</a></li>
										<li><a id="sort11" style="cursor: pointer;">정가인하순</a></li>
										<li class="alt"><a id="sort10" style="cursor: pointer;">가격순</a></li>
									</ul>

								</div>

								<h4>

									<span><strong>새로나온 책</strong>에 총 <strong></strong> 권의
										정가인하 도서가 등록되어 있습니다. </span>



								</h4>
								<p class="btn_cart">
									<span><input type="checkbox" name="prodIds" class="chk"
										onclick="javascript:check_all(document.getElementsByName('prodId'), this.checked);">
										전체</span> <a href="javascript:addCarts();"><span
										class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
										href="javascript:addWishes();"><span
										class="btn_w_comm btype_a2">위시리스트</span></a>
								</p>
							</div>
							<div class="fl_clear ml5">
								<div class="prod_list_type  ">

									<ul>

										<!-- 리스트 1개 시작  -->
										<li><input class="checkbox" type="checkbox"
											value="3795041" name="prodId">
											<div class="prod_thumb">
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">

													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3795041"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> [정가인하] 한국사를 바꿀 14가지 거짓과 진실 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
													<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
												</dd>


												<dd class="mt5">
													<p>
														<span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span
															class="txt_arrow">→</span> <span class="txt_reprice2">4,000원
															[<strong>69%</strong> 정가인하]
														</span>
													</p>
													<p class="mt5">
														<span class="txt_price"><strong><em>3,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 80.50%"></span>
													</div>
													<span class="ratings_num"> <strong>8.05</strong> <a
														href="/front/product/detailProduct.do?prodId=3795041#sub10"
														target="_blank">리뷰<em>(19)</em></a>
													</span>
												</dd>
												<dd class="txt_bex">추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은
													위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것
													같던 흉노와 신...</dd>
												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red">2018년
															10월 20일(토) 이내</strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3795041" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3795041','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3795041','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3795041');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3795041');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3795041', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>
										<!-- 리스트 1개 끝  -->


										<!-- 리스트 2번째 시작  -->
										<li><input class="checkbox" type="checkbox"
											value="3795041" name="prodId">
											<div class="prod_thumb">
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">

													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3795041"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> [정가인하] 한국사를 바꿀 14가지 거짓과 진실 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
													<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
												</dd>


												<dd class="mt5">
													<p>
														<span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span
															class="txt_arrow">→</span> <span class="txt_reprice2">4,000원
															[<strong>69%</strong> 정가인하]
														</span>
													</p>
													<p class="mt5">
														<span class="txt_price"><strong><em>3,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 80.50%"></span>
													</div>
													<span class="ratings_num"> <strong>8.05</strong> <a
														href="/front/product/detailProduct.do?prodId=3795041#sub10"
														target="_blank">리뷰<em>(19)</em></a>
													</span>
												</dd>
												<dd class="txt_bex">추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은
													위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것
													같던 흉노와 신...</dd>
												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red">2018년
															10월 20일(토) 이내</strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3795041" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3795041','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3795041','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3795041');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3795041');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3795041', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>
										<!-- 리스트 2번째 끝  -->


										<!-- 리스트 3번째 시작  -->
										<li><input class="checkbox" type="checkbox"
											value="3795041" name="prodId">
											<div class="prod_thumb">
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">

													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3795041"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> [정가인하] 한국사를 바꿀 14가지 거짓과 진실 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
													<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
												</dd>


												<dd class="mt5">
													<p>
														<span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span
															class="txt_arrow">→</span> <span class="txt_reprice2">4,000원
															[<strong>69%</strong> 정가인하]
														</span>
													</p>
													<p class="mt5">
														<span class="txt_price"><strong><em>3,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 80.50%"></span>
													</div>
													<span class="ratings_num"> <strong>8.05</strong> <a
														href="/front/product/detailProduct.do?prodId=3795041#sub10"
														target="_blank">리뷰<em>(19)</em></a>
													</span>
												</dd>
												<dd class="txt_bex">추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은
													위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것
													같던 흉노와 신...</dd>
												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red">2018년
															10월 20일(토) 이내</strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3795041" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3795041','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3795041','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3795041');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3795041');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3795041', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>
										<!-- 리스트 3번째 끝  -->


									</ul>

								</div>

							</div>
							<!-- 베스트셀러 끝 -->

							<!-- 페이징 -->
							<div class="pageTypeA">
								<span class="prev-btn"> <!-- <img src="/images/common/btn_pagePrevG.gif" align="absmiddle" border="0"> -->

									<!-- <img src="/images/common/btn_pagePrev.gif" align="absmiddle" hspace="2" border="0"> -->
								</span> <span class="pageNum"> <a class="on">1</a> <a
									href="/front/display/discountBookList.do?page=2#tabMenu">2</a>
									<a href="/front/display/discountBookList.do?page=3#tabMenu">3</a>
									<a href="/front/display/discountBookList.do?page=4#tabMenu">4</a>
									<a href="/front/display/discountBookList.do?page=5#tabMenu">5</a>
									<a href="/front/display/discountBookList.do?page=6#tabMenu">6</a>
									<a href="/front/display/discountBookList.do?page=7#tabMenu">7</a>
									<a href="/front/display/discountBookList.do?page=8#tabMenu">8</a>
									<a href="/front/display/discountBookList.do?page=9#tabMenu">9</a>
									<a href="/front/display/discountBookList.do?page=10#tabMenu">10</a>
								</span> <span class="next-btn"> <a
									href="/front/display/discountBookList.do?page=11#tabMenu"><img
										src="/images/common/btn_pageNext.gif" align="absmiddle"
										hspace="2" border="0"></a>

								</span>

							</div>

							<div class="prod_sort_b">
								<span><input type="checkbox" name="prodIds" class="chk"
									onclick="javascript:check_all(document.getElementsByName('prodId'), this.checked);">
									전체</span> <a href="javascript:addCarts();"><span
									class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
									href="javascript:addWishes();"><span
									class="btn_w_comm btype_a2">위시리스트</span></a>
							</div>



						</div>

					</div>
					<!-- 새로나온 책 끝  -->



					<!-- 정가인하 시작 -->
					<div id="menu_discount" class="tab-pane fade">
						<div class="con_t2">
							<div class="prod_sort">


								<h4>

									<span><strong>전체</strong>에 총 <strong>${dataCount }</strong>
										권의 정가인하 도서가 등록되어 있습니다. </span>

								</h4>
								<p class="btn_cart">
									<span><input type="checkbox" name="prodIds" class="chk"
										onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);">
										전체</span> <a href="javascript:addCarts();"><span
										class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
										href="javascript:addWishes();"><span
										class="btn_w_comm btype_a2">위시리스트</span></a>
								</p>
							</div>

							<div class="fl_clear ml5">
								<c:forEach var="dto" items="${lists }">
									<div class="prod_list_type  ">

										<ul>

											<!-- 리스트 1개 시작  -->
											<li><input class="checkbox" type="checkbox"
												value="${dto.isbn }" name="isbn">
												<div class="prod_thumb">
													<div class="prod_thumb_img">
														<a href="/front/product/detailProduct.do?isbn=3795041"
															onfocus="this.blur();"> <img
															src="<%=cp %>/resources/image/book/${dto.bookImage }">
														</a> <a class="btn_popup" target="_blank"
															href="/front/product/detailProduct.do?isbn=3795041"><span
															class="ico_new">새창열기</span></a>
													</div>

												</div>
												<dl class="prod_info">
													<dt>
														<a href="/front/product/detailProduct.do?isbn=3795041"
															onfocus="this.blur();"> [정가인하] ${dto.bookTitle } </a>
														<!-- <span class="tit_sub">- 덧셈구구</span> -->
														<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


														</span>
													</dt>
													<dd class="txt_block">
														<span>${dto.authorName }</span> <span class="gap">|</span>
														<span>${dto.publisher }</span> <span class="txt_date"><span
															class="gap">|</span> <span>${dto.publishDate }</span></span>
													</dd>


													<dd class="mt5">
														<p>
															<span class="txt_junga">정가 <span class="txt_junga">${dto.bookPrice }원</span></span><span
																class="txt_arrow">→</span> <span class="txt_reprice2">${dto.discountedPrice }원
																[<strong>${dto.discountRate }%</strong> 정가인하]
															</span>
														</p>
														<p class="mt5">
															<span class="txt_price"><strong><em><fmt:formatNumber
																			value="${dto.discountedPrice*0.9 }" type="number" /></em>원</strong>
																(10%↓+5%P)</span>
														</p>
													</dd>
													<dd class="txt_desc">
														<div class="review_point">
															<span style="width: ${dto.rate*10}%"></span>
														</div>
														<span class="ratings_num"> <strong>${dto.rate }</strong>
															<a
															href="/front/product/detailProduct.do?isbn=3795041#sub10"
															target="_blank">리뷰<em>(${dto.reviewCnt })</em></a>
														</span>
													</dd>
													<dd class="txt_bex">${dto.introduction }</dd>
													<dd class="txt_ebook">
														<span>지금 주문하면 <strong class="t_red">내일</strong> 받을
															수 있습니다.
														</span>
													</dd>

												</dl>
												<dl class="prod_btn">
													<dt>
														<span class="num_txt">수량</span> <input type="text"
															id="cntVal_${dto.isbn }" value="1" class="num" size="3"
															maxlength="2" onkeydown="onlyNumber();" onkeyup="">
														<span class="btn_updn_wrap"><a
															href="javascript:cntUp('${dto.isbn }');"
															class="btn_num_up">▲</a><a
															href="javascript:cntDown('${dto.isbn }');"
															class="btn_num_dn">▼</a></span>
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
											<!-- 리스트 1개 끝  -->

										</ul>

									</div>
								</c:forEach>


								<c:if test="${dataCount!=0 }">
							${pageIndexListforJ }
						</c:if>
								<c:if test="${dataCount==0 }">
									<div class="pageTypeA">
										<span class="pageNum"> 등록된 책이 없습니다. </span>
									</div>
								</c:if>


								<div class="prod_sort_b">
									<span><input type="checkbox" name="prodIds" class="chk"
										onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);">
										전체</span> <a href="javascript:addCarts();"><span
										class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
										href="javascript:addWishes();"><span
										class="btn_w_comm btype_a2">위시리스트</span></a>
								</div>



							</div>





						</div>

					</div>
					<!-- 정가인하 끝 -->



				</div>
				<!-- tabContent -->

			</div>
			<!-- Dynamic Tabs Div -->

		</div>

		<!-- 가운데 레이아웃 -->
	</div>

	<!-- footer -->
	<jsp:include page="../../common/footer.jsp" flush="false" />
</body>
</html>