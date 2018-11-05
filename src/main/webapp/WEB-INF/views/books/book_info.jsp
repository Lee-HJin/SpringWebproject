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
<title>도서 상세페이지</title>


<link rel="stylesheet" href="/webproject/resources/book_css/class.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/common.css"
	type="text/css">

<link rel="stylesheet"
	href="/webproject/resources/book_css/detail_default.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/pStyle.css"
	type="text/css">

<script src="/webproject/resources/book_js/bookInfo.js"></script>


<style>
i {
	border: solid black;
	border-width: 0 3px 3px 0;
	display: inline-block;
	padding: 3px;
}

.up {
	transform: rotate(-135deg);
	-webkit-transform: rotate(-135deg);
}

#more {
	display: none;
}

#more2 {
	display: none;
}
</style>

<style>
.tooltip {
	position: relative;
	display: inline-block;
	border-bottom: 1px dotted black;
	width: 149px;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: 100%;
	background-color: #F15F5F;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -60px;
	opacity: 0;
	transition: opacity 0.3s;
}

.tooltip .tooltiptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
	opacity: 1;
}
</style>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/webproject/resources/book_js/common.js"></script>
<!-- TOP 버튼 CSS -->
<style type="text/css">
#myBtn {
	display: none;
	position: fixed;
	/* 	float: right;  */
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: #EAEAEA;
	color: black;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
	bottom: 20px;
}

#myBtn:hover {
	background-color: #555;
	color: white;
}

#myBtn1 {
	background-color: #957556;
	color: white;
}

#myBtn2 {
	background-color: #957556;
	color: white;
}
</style>

<!-- Read and More Script -->
<script>
	function myFunction() {
		var dots = document.getElementById("dots");
		var moreText = document.getElementById("more");
		var btnText = document.getElementById("myBtn1");

		if (dots.style.display == "none") {
			dots.style.display = "inline";
			btnText.innerHTML = "펼쳐보기";
			moreText.style.display = "none";
		} else {
			dots.style.display = "none";
			btnText.innerHTML = "닫기";
			moreText.style.display = "inline";
		}
	}

	function myFunction2() {
		var dots2 = document.getElementById("dots2");
		var moreText2 = document.getElementById("more2");
		var btnText2 = document.getElementById("myBtn2");

		if (dots2.style.display == "none") {
			dots2.style.display = "inline";
			btnText2.innerHTML = "펼쳐보기";
			moreText2.style.display = "none";
		} else {
			dots2.style.display = "none";
			btnText2.innerHTML = "닫기";
			moreText2.style.display = "inline";
		}
	}
</script>

<!-- TOP 버튼 jQuery -->

<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
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
			$("#" + id).val() = 1;
		}
		$("#" + id).val(q);

	};
</script>

<!-- 쿠키 생성 -->
<script type="text/javascript">
	
	$(function() {
		
		var cookieValue = JSON.stringify({"isbn":"${isbn}","bookImage":"${book_image}",
			"bookTitle":"${dto.bookTitle}","authorName":"${dto2.authorname}"});
		
		if(document.cookie.indexOf('rcbook')==-1){
			setCookie('rcbook',cookieValue,1);
		}else if(document.cookie.indexOf('rcbook')!=-1){
			addCookie(cookieValue);
		}
	});
	
	//쿠키 생성
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
	    expire.setDate(expire.getDate() + cDay);
	    cookies = cName + '=' + escape(cValue) + '; path=/ ';
	    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	    document.cookie = cookies;
	}
	
	//기존 쿠키에 추가
	function addCookie(cValue){
		var items = getCookie('rcbook');
		var maxItemNum = 10;
		
		if(items){
			var itemArray=items.split('/');
			
			if(itemArray.indexOf(cValue)!=-1){//중복시 기존 제거 후 맨앞으로 가져옴
				var idx = itemArray.findIndex(function(item) {
					return item === cValue;
				});		
				itemArray.splice(idx,1);
		
				itemArray.unshift(cValue);
				if(itemArray.length>maxItemNum){
					itemArray.length=10;}	
				items = itemArray.join('/');
				setCookie('rcbook',items,1);
				
			}else{
				itemArray.unshift(cValue);
				if(itemArray.length>maxItemNum){
					itemArray.length=10;}	
				items = itemArray.join('/');
				setCookie('rcbook',items,1);
			}
		}
	}
			
	function getCookie(cookiename){
		var cookiestring  = document.cookie;
		var cookiearray = cookiestring.split(';');
		for(var i =0 ; i < cookiearray.length ; ++i){ 
		    if(cookiearray[i].indexOf(cookiename)!=-1){ 
		        var ck = [];
		        var nameVal = cookiearray[i].split( "=" );
	            var value = nameVal[1].trim();
		        ck+= value;
		    }
		} 
		return unescape(ck);
	}

</script>


</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp" flush="false" />
	<br />
	<br />
	<br />
	<br />
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<i class="up"></i><br />Top
	</button>




	<div id="wrapDetail" style="width: 1000px;">

		<div class="wrap_contents">
			<!-- 왼쪽 영역 -->
			<div class="inner_left">

				<div class="thumb_bookCover">
					<img src="/webproject/resources/image/book/${book_image}">
				</div>


				<p class="btn_txt">

					<a href="javascript:popPreview(${dto.isbn });"
						class="btn_gy_comm btype_a4">미리보기</a>

				</p>





				<div class="mt30 pos_rel">
					<div>
						<strong>매장 재고현황 <a href="javascript:popLayer('prodNum')"><span
								class="sp_btn help">?</span></a></strong>
					</div>
					<div class="mt3">
						<!-- 일서,잡시 매장 재고 표시 안함. -->
						<table cellpadding="0" cellspacing="0" class="commTable_s">
							<colgroup>
								<col width="65">
								<col width="65">
								<col width="71">
							</colgroup>
							<tbody>


								<tr>
									<th>롯데<br>스타시티점
									</th>
									<th>롯데<br>월드몰점
									</th>
									<th>신림역점</th>
								</tr>
								<tr>
									

										
											<td>${dto4.g }</td>
										
										
											<td>${dto4.c }</td>
									
										
											<td>${dto4.h }</td>
										

									
								</tr>
								<tr>
									<th>사당역점</th>
									<th>목동점</th>
									<th>롯데몰<br>수원점
									</th>
								</tr>
								<tr>
									

										
											<td>${dto4.i }</td>
										
											<td>${dto4.j }</td>

											<td>${dto4.f }</td>

									
								</tr>
								<tr>
									<th>대구<br>신세계점
									</th>
									<th>롯데<br>울산점
									</th>
									<th>신세계<br>김해점
									</th>
								</tr>
								<tr>
									

											<td>${dto4.e }</td>

											<td>${dto4.l }</td>

											<td>${dto4.m }</td>

									
								</tr>
								<tr>
									<th>롯데피트인<br>산본점
									</th>
									<th>여의도<br>신영증권점
									</th>
									<th></th>
								</tr>
								<tr>
									

											<td>${dto4.k }</td>


											<td>${dto4.d }</td>

									
									<td></td>
								</tr>
								<tr>

									<th>신세계<br>강남점
									</th>
									<th>부산 신세계<br>센텀시티점
									</th>
									<th></th>
								</tr>
								<tr>


											<td>${dto4.a }</td>

											<td>${dto4.b }</td>

									
									<td></td>
								</tr>
							</tbody>
						</table>
						<div class="t_11gr mt5">
							
						</div>


					</div>

					<!-- 재고현황 안내 LAYER -->
					<div class="bookViewPop" id="prodNum"
						style="visibility: hidden; width: 300px; top: 0; left: 0">
						<h3 class="mLine">재고현황 안내</h3>
						<div class="laypopCon">
							<ul class="t_11gr pt10 overflow">
								<li class="dot_comm_11">비교적 정확한 수치이오나 매장별 재고수는 현장 구매 등 여러
									변수에 의해 실제 재고와 다를 수 있습니다.</li>
								<li class="dot_comm_11 mt5">정확한 재고를 확인하시려면 매장으로 직접 문의하시기
									바랍니다.</li>
								<li class="dot_comm_11 mt5">각 매장의 연락처 및 위치를 확인하시려면 재고숫자를
									클릭하십시오.</li>
								<li class="dot_comm_11 mt5">센트럴시티점의 매장명이 신세계강남점으로 변경되었습니다.</li>
							</ul>
						</div>
						<p class="btnClose">
							<img
								src="http://image.bandinlunis.com/images/common/btn_close02.gif"
								alt="close" style="cursor: pointer;"
								onclick="javascript:popHidden('prodNum')">
						</p>
					</div>
				</div>

			</div>
			<!--// 왼쪽 영역 -->



			<!-- 오른쪽 영역 -->
			<div class="inner_right" style="width: 760px;">
				<!--// 상품 구매영역 -->
				<div class="row_item" style="width: 760px;">
					<div class="group_tag">



						<span class="sp_tag benefit">배송 품질 보상</span>




					</div>
					<div class="group_title">
						<h1>

							<span class="txt_main">${dto.bookTitle } </span>

						</h1>
					</div>

					<div class="group_inside" style="padding: 0px;">
						<ul style="height: 13px;">
							<li>${dto2.authorname }&nbsp;저&nbsp;&nbsp;|</li>


							<li>${dto.publisher }&nbsp;&nbsp;|</li>


							<li>${dto.publishDate }</li>


						</ul>
					</div>
				</div>
				<div class="row_item" style="width: 760px;">
					<div class="group_info">
						<ul class="txt_price">

							<li>
								<div class="tbl_left">
									<span>정가</span>
								</div>
								<div class="tbl_right">
									<span class="list_price"><fmt:formatNumber
											value="${dto.bookPrice }" type="number"></fmt:formatNumber> 원</span>
								</div>
							</li>


							<li>
								<div class="tbl_left mt12">
									<span>판매가</span>
								</div>
								<div class="tbl_right" style="">
									<span class="sale_price"> <fmt:formatNumber
											value="${dto.bookPrice * 0.9 }" type="number"></fmt:formatNumber>
										<span>원</span></span> <span class="point_red">[10% 할인]</span>

								</div>
							</li>




							<li>
								<div class="tbl_left mt3">
									<span>제휴할인</span>
								</div>
								<div class="tbl_right">
									<a href="javascript:popLayer('cardSaleInfo')"><span>카드할인/포인트결제
											안내 </span></a>
									<!-- 제휴할인 -->
									<div class="bookViewPop" id="cardSaleInfo"
										style="visibility: hidden; right: 212px; top: 0; width: 450px; height: 425px">
										<h3 class="mLine">카드할인/포인트결제 안내</h3>
										<div class="laypop_scroll mt15" style="height: 300px">
											<h4>제휴카드</h4>
											<table cellpadding="0" cellspacing="0"
												class="storeNum card_info">
												<colgroup>
													<col width="150">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th>반디앤루니스 롯데카드</th>
														<td>결제금액 최대 25% 청구할인 (1만원 이상 결제건에 한해 월 2회, 건당 최대 1만원
															할인)</td>
													</tr>
													<!-- <tr><th>썸타는 우리체크카드</th><td>결제금액 최대 20% 할인(CASH-BACK)<br>※ 이벤트기간 발급분에 한함 <a href="http://www.bandinlunis.com/front/event/viewPromotionEvent.do?evtSeq=26829" class="btn_w_comm btype_a4" style="text-decoration:none">자세히보기</a></td></tr> -->
													<tr>
														<th>반디앤루니스 우리V카드</th>
														<td>결제금액 10% 청구할인</td>
													</tr>
												</tbody>
											</table>
											<h4 class="mt20">포인트결제</h4>
											<table cellpadding="0" cellspacing="0"
												class="storeNum card_info">
												<colgroup>
													<col width="150">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th>OK캐쉬백 포인트</th>
														<td>최소 10원부터 전액 사용 or 1% 적립</td>
													</tr>
													<tr>
														<th>현대카드 M포인트</th>
														<td>결제금액의 최대 10% 사용 가능</td>
													</tr>
													<tr>
														<th>신한카드 포인트</th>
														<td>결제금액의 최대 10% 사용 가능(일부카드)</td>
													</tr>
													<tr>
														<th>하나(구.외환) 포인트</th>
														<td>보유 한도 내에서 100% 사용 가능</td>
													</tr>
													<tr>
														<th>씨티카드 포인트</th>
														<td>결제금액의 최대 50% 사용 가능</td>
													</tr>
												</tbody>
											</table>
											<h4 class="mt20">할인카드</h4>
											<table cellpadding="0" cellspacing="0"
												class="storeNum card_info">
												<colgroup>
													<col width="150">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th>NH농협 TAKE5카드</th>
														<td>20% 청구할인(Edu Pack)</td>
													</tr>
													<tr>
														<th>채움 플래티늄 멀티카드</th>
														<td>20% 청구할인</td>
													</tr>
													<tr>
														<th>모바일 Tmoney 신한카드</th>
														<td>10% 청구할인</td>
													</tr>
													<tr>
														<th>신한카드 Shopping</th>
														<td>10% 청구할인</td>
													</tr>
													<tr>
														<th>NH농협 체크카드</th>
														<td>10% 청구할인</td>
													</tr>
													<tr>
														<th>NH20 해봄 신용카드</th>
														<td>10% 청구할인</td>
													</tr>
													<tr>
														<th>씨티 클리어 카드</th>
														<td>7% 청구할인</td>
													</tr>
													<tr>
														<th>NH20 해봄 체크카드</th>
														<td>5% 청구할인</td>
													</tr>
													<tr>
														<th>NH농협 LADY다솜카드</th>
														<td>5% 청구할인</td>
													</tr>
													<tr>
														<th>신한카드 큐브</th>
														<td>5% 청구할인</td>
													</tr>
													<tr>
														<th>신한카드 큐브 PLATINUM#</th>
														<td>5% 청구할인</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="al_right mt10 mr10">
											<a href="/pages/front/service/serviceCard.jsp#st01"
												target="_blank"><button class="btn_more_2014">
													<span>더보기</span>
												</button></a>
										</div>
										<p class="btnClose">
											<img
												src="http://image.bandinlunis.com/images/common/btn_close02.gif"
												alt="close" style="cursor: pointer;"
												onclick="javascript:popHidden('cardSaleInfo')">
										</p>
									</div>


								</div>
							</li>

							<li>
								<div class="tbl_left mt3">
									<span>적립금</span>
								</div>
								<div class="tbl_right">
									<span class="save_price"><fmt:formatNumber
											value="${dto.bookPrice * 0.05 }" type="number"></fmt:formatNumber>
										<span>원 적립</span></span> <span class="sub_info">[5%P]</span> <span
										class="ml5 lspM">- 5만원이상 구매시 2천원 / 멤버십 최대3% <strong>추가적립</strong>
										<a href="javascript:popLayer('addPoint')"><span
											class="sp_btn help">?</span></a>
									</span>
									<div style="margin: 7px 0 0 122px">
										<span class="txt_ad">바로ON 접속하면 2% <strong>추가
												적립</strong></span> <a href="/favorite.do#st01" target="_blank"><span
											class="sp_btn move">?</span></a>
									</div>
									<!-- 추가 적립금 안내 -->
									<div class="bookViewPop" id="addPoint"
										style="visibility: hidden; right: 212px; top: 18px; width: 320px">
										<h3 class="mLine">추가 적립금 안내</h3>
										<div class="laypopCon">
											<p class="mt15">
												<strong>[2천원 추가 적립]</strong>
											</p>
											<p class="mt5">총 주문금액 5만원 이상 구매 시 2,000원 추가 적립</p>
											<p class="mt5"></p>
											<div class="dot_comm">도서(eBook포함)만 구매 시 적립 대상에서 제외</div>
											<div class="dot_comm mt5">해외구매 음반/DVD 적립 대상에서 제외</div>
											<div class="dot_comm mt5">
												<strong>업체배송상품</strong>은 적립 대상에서 제외 <br>(상품상세 및 카트에서
												업체배송 여부 확인 가능)
											</div>
											<p></p>
											<div class="btnR mt5 t_11br4">
												<a href="/pages/front/service/serviceAddPoint.jsp#st01"><strong>자세히
														보기 &gt; </strong></a>
											</div>
											<p class="mt20">
												<strong>[멤버십 추가 적립]</strong>
											</p>
											<div class="mt10">
												<p class="dot_comm">
													슈퍼루니 : <strong>3%</strong> 추가 적립
												</p>
												<p class="dot_comm">
													골드루니 : <strong>2%</strong> 추가 적립
												</p>
												<p class="dot_comm">
													실버루니 : <strong>1%</strong> 추가 적립
												</p>
											</div>
											<p class="t_11gr mt5">단, 국내도서, eBook만 구매 시 적립 불가</p>
											<div class="btnR mt5 t_11br4">
												<a href="/pages/front/service/serviceMembership.jsp#st01"><strong>서비스
														안내 및 유의사항 보기 &gt; </strong></a>
											</div>
										</div>
										<p class="btnClose">
											<img
												src="http://image.bandinlunis.com/images/common/btn_close02.gif"
												alt="close" style="cursor: pointer;"
												onclick="javascript:popHidden('addPoint')">
										</p>
									</div>
								</div>
							</li>

						</ul>
					</div>





				</div>


				<div class="row_item">
					<div class="group_info">
						<ul class="txt_shipping">
							<li style="display: none;">
								<div class="tbl_left">
									<span>배송구분</span>
								</div>
								<div class="tbl_right">업체배송(반디북)</div>
							</li>
							<li>
								<div class="tbl_left">
									<span>배송료</span>
								</div>
								<div class="tbl_right">
									<strong>무료배송</strong>

								</div>
							</li>













							<li style="overflow: visible;">
								<div class="tbl_left">
									<span>당일배송 </span> <a
										href="/pages/front/service/serviceTodayDeli.jsp#st01"
										target="_blank"><span class="sp_btn help ml3">?</span></a>
								</div>

								<div class="tbl_right">

									<div class="mt5">
										<strong>서울/수도권</strong> 오전 12시 주문까지 <span
											class="btn_w_comm btype_a4 al_top mt3m hand"
											onmouseover="javascript:popLayer('oneDay1')"
											onmouseout="javascript:popHidden('oneDay1')">가능지역</span> <span
											class="btn_w_comm btype_a4 al_top mt3m hand"
											onmouseover="javascript:popLayer('todayDeliveryInfo')"
											onmouseout="javascript:popHidden('todayDeliveryInfo')">당일배송
											유의사항</span>
									</div>

									<!-- 당일배송 가능지역 LAYER -->
									<div class="bookViewPop" id="oneDay1"
										style="visibility: hidden; top: 40px; left: 80px; width: 480px; text-align: left">
										<h3 class="mLine">서울/수도권 당일배송 가능지역</h3>
										<div class="laypopCon">
											<table cellapdding="0" cellspacing="0"
												class="commTable_d mt10">
												<colgroup>
													<col width="80">
													<col width="360">
												</colgroup>
												<tbody>
													<tr>
														<th>서울시</th>
														<td class="al_left">전 지역(일부 동 제외)</td>
													</tr>
													<tr>
														<th>인천시</th>
														<td class="al_left">서구, 계양구, 남동구, 남구, 연수구, 부평구</td>
													</tr>
													<tr>
														<th>경기</th>
														<td class="al_left">수원시, 안산시, 안양시, 용인시, 의왕시, 의정부시,
															고양시, 광명시, 구리시, 군포시, 성남시, 화성시, 부천시</td>
													</tr>
												</tbody>
											</table>
											<div class="mt10">※ 단, 가능지역 중 일부 외곽지역은 서비스가 제한될 수도
												있습니다.</div>
										</div>
									</div>



									<!-- 당일배송 유의사항 LAYER -->
									<div class="bookViewPop" id="todayDeliveryInfo"
										style="visibility: hidden; top: 40px; left: 80px; width: 480px; text-align: left">
										<h3 class="mLine">당일배송 유의사항</h3>
										<div class="laypopCon">
											<div class="pt10 overflow">
												<div class="dot_comm_11">'당일배송 상품'외 상품 또는 예약상품을 같이
													주문하면 타 상품 수령예상일에 맞춰 배송됩니다.</div>
												<div class="dot_comm_11 mt5">선물포장 주문건은 제외됩니다.</div>
												<div class="dot_comm_11 mt5">가능지역 중 일부 외곽지역은 서비스가 일부
													제한될 수 있으니 지역변경으로 가능지역을 검색하세요.</div>
												<div class="dot_comm_11 mt5">당일배송 지역 내 일부 도서 산간 및 특수
													지역은 서비스가 제한 될 수 있습니다.</div>
												<div class="dot_comm_11 mt5">18시 이후에 배송될 수도 있으므로 직장주소는
													피해주시기 바랍니다.</div>
											</div>
										</div>
									</div>
								</div>
							</li>





						</ul>

						<!-- 지역변경 레이어 -->
						<div class="bookViewPop zip_code" id="zipCode"
							style="visibility: hidden; top: 40px; left: 80px;">
							<h3 class="mLine">당일배송 가능지역 검색</h3>
							<p class="btnClose">
								<img
									src="http://image.bandinlunis.com/images/common/btn_close02.gif"
									alt="close" style="cursor: pointer;"
									onclick="javascript:popHidden('zipCode')">
							</p>
							<div class="zip_tap">
								<ul class="tap_menu">
									<!-- 								<li id="jibun" class="on" ><a style="cursor:pointer;">지번 주소 찾기</a></li><li id="doro" class="alt"><a style="cursor:pointer;">도로명주소 찾기</a></li> -->
								</ul>
							</div>
							<div class="zip_contents">
								<div name="search_doro" id="search_doro">
									<p class="box_notice">
										<strong>“도로명주소”를 쉽게 찾아보세요</strong><br> 1. 도로명으로 검색하기 (예,
										“직지길” or “직지길+322”)<br> 2. 건물명으로 검색하기 (예, “반디앤루니스빌딩”)<br>
										3. 동(읍/면/리) 으로 검색 (예, “인사동” or “인사동+43”)<br> 4. 도로명주소를
										모르실 경우 도로명주소 안내시스템(<a href="http://www.juso.go.kr"
											target="_blank">http://www.juso.go.kr</a>)에서 확인해주세요.
									</p>
									<div class="item">
										<input name="searchType" type="radio" value="doro" id="c1"
											class="i_radio" checked=""><label for="c1"
											class="i_label">도로명+건물번호</label> <input name="searchType"
											type="radio" value="bldName" id="c2" class="i_radio"><label
											for="c2" class="i_label">건물명</label> <input name="searchType"
											type="radio" value="dong" id="c3" class="i_radio"><label
											for="c3" class="i_label">동명+지번</label>
									</div>
									<div class="item">
										<span class="txt_basic">시/도</span> <select name="sido"
											onchange="javascript:changeDist(this.value);"
											class="slt_zipcode">
											<option value="" selected="">전체</option>
											<option value="01">서울특별시</option>
											<option value="02">부산광역시</option>
											<option value="03">대구광역시</option>
											<option value="04">인천광역시</option>
											<option value="05">광주광역시</option>
											<option value="06">대전광역시</option>
											<option value="07">울산광역시</option>
											<option value="08">세종특별자치시</option>
											<option value="09">강원도</option>
											<option value="10">경기도</option>
											<option value="11">경상남도</option>
											<option value="12">경상북도</option>
											<option value="13">전라남도</option>
											<option value="14">전라북도</option>
											<option value="15">제주특별자치도</option>
											<option value="16">충청남도</option>
											<option value="17">충청북도</option>
										</select> <span class="txt_basic">시/군/구</span> <select name="sigungu"
											class="slt_zipcode">
											<option value="">전체</option>
										</select>
									</div>
									<div class="item " id="doroArea">
										<label for="temp_input" class="i_screen_hide"
											style="position: absolute; display: block;">도로명,
											ex)직지길</label> <input type="text" name="searchDoro" id="searchDoro"
											class="i_text short"
											onkeypress="javascript:(event.keyCode == 13)? goSearch() : ''; javascript:preventSpace(event);">
										<label for="temp_input2" class="i_screen_hide"
											style="position: absolute; left: 160px; display: block;">건물번호,
											ex) 322</label> <input type="text" class="i_text short" id="bldNum"
											name="bldNum"
											onkeydown="javascript:(event.keyCode == 13)? goSearch() : ''; javascript:preventChar(event);">
										<a style="cursor: pointer;" onclick="javascript:goSearch();"
											class="btn_small"><span class="search">검색</span></a>
									</div>
									<div class="item hide" id="bldArea">
										<label for="temp_input" class="i_screen_hide"
											style="position: absolute; display: block;">건물명,
											ex)반디앤루니스빌딩</label> <input type="text" name="searchBld"
											id="searchBld" class="i_text long"
											onkeypress="javascript:(event.keyCode == 13)? goSearch() : ''; javascript:preventSpace(event);">
										<a style="cursor: pointer;" onclick="javascript:goSearch();"
											class="btn_small"><span class="search">검색</span></a>
									</div>
									<div class="item hide" id="dongArea">
										<label for="temp_input" class="i_screen_hide"
											style="position: absolute; display: block;">동명,
											ex)인사동</label> <input type="text" name="searchDong" id="searchDong"
											class="i_text short"
											onkeypress="javascript:(event.keyCode == 13)? goSearch() : ''; javascript:preventSpace(event);">
										<label for="temp_input2" class="i_screen_hide"
											style="position: absolute; left: 160px; display: block;">지번</label>
										<input type="text" name="searchKJibun" id="searchKJibun"
											class="i_text short"
											onkeydown="javascript:(event.keyCode == 13)? goSearch() : ''; javascript:preventChar(event);">
										<a style="cursor: pointer;" onclick="javascript:goSearch();"
											class="btn_small"><span class="search">검색</span></a>
									</div>
								</div>
								<div name="search_jibun" id="search_jibun"
									style="display: none;">
									<p class="box_notice">주소의 동(읍/리/면) 또는 마지막 부분을 입력하신 후 검색을
										누르세요.</p>
									<div class="item">
										<label for="temp_input" class="i_screen_hide"
											style="position: absolute; display: block;">지번 검색</label> <input
											type="text" name="jibunDong" id="jibunDong"
											class="i_text long"
											onkeypress="javascript:(event.keyCode == 13)? goSearchJibun() : ''">
										<a style="cursor: pointer;"
											onclick="javascript:goSearchJibun();" class="btn_small"><span
											class="search">검색</span></a>
									</div>
								</div>
								<div style="display: none;" name="search_result"
									id="search_result">
									<p class="txt_notice">
										총 <a style="color: red" id="txt_count">0</a>건, 검색결과 주소를 클릭하시면
										자동입력 됩니다.
									</p>
									<table cellpadding="0" cellspacing="0" class="tbl_subject">
										<caption>제목 테이블</caption>
										<colgroup>
											<col width="115">
											<col width="315">
										</colgroup>
										<tbody>
											<tr>
												<th><strong>우편번호</strong></th>
												<th><strong>주소</strong></th>
											</tr>
										</tbody>
									</table>
									<div class="tbl_frame" id="zipCodeList">
										<table cellpadding="0" cellspacing="0" class="">
											<tbody>
												<tr>
													<td class="txt_blank" id="default_txt">검색된 주소가 없습니다.</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>



































				<div class="row_item buy_group">
					<div class="group_info">
						<div class="tbl_qty">
							<span class="txt_num">수량</span> <input name="quantity"
								id="quantity" style="vertical-align: middle; text-align: right"
								size="5" maxlength="4" value="1" /> <img
								style="vertical-align: middle;" alt="수량 증가 감소"
								src="/springwebview/resources/images/book/common/2014/btn_cnt.gif"
								usemap="#map_name_quantity" />
							<map id="map_name_quantity" name="map_name_quantity">
								<area href="javascript:modifyProductQuantity('quantity',1);"
									shape="rect" alt="수량 증가" coords="0,0,9,10" />
								<area href="javascript:modifyProductQuantity('quantity',-1);"
									shape="rect" alt="수량 감소" coords="0,10,9,20" />
							</map>

						</div>
						<div class="tbl_ad">
							<span class="txt_ad">더욱 새로워진 반디앤루니스 옴니채널 <a
								href="/pages/front/service/serviceBookSelf.jsp#st01"
								target="_blank"><strong class="point_red">북셀프3.0</strong></a>을
								확인하세요.
							</span> <a href="/pages/front/service/serviceBookSelf.jsp#st01"
								target="_blank"><span class="sp_btn move">자세히</span></a>
						</div>
					</div>
					<div class="group_info fl_clear buy_btn">
						<div class="btn_zone_left pos_rel">
							<a href="javascript:add_basket_cnt('4189934');" class="btn_big"><span
								class="box_bookcart">쇼핑카트 담기</span></a> <a
								href="javascript:go_buy_cnt('4189934');" class="btn_big"><span
								class="box_quickbuy">바로 구매</span></a> <a
								href="javascript:popUpBookSelf();" class="btn_big pos_rel">
								<span class="box_bookself"><span class="tooltip"
									style="text-align: center;">북셀프 구매 <span
										class="tooltiptext">매장직접수령</span>
								</span></span>
							</a> <a href="javascript:add_wish_array_common('4189934', true);"
								class="btn_big"><span class="box_wishlist">위시리스트</span></a>
							<div class="widget_btn">
								<a href="javascript:jutil.bandi.blogAddMyLibrary('4189934');"><span
									class="bookshelf">서재담기</span></a> <a
									href="javascript:addThemaBook('4189934');"><span
									class="theme">테마담기</span></a>
							</div>
							<!-- 모든 매장 재고수 LAYER -->

							<div class="bookViewPop" id="bookselfInfo"
								style="display: none; bottom: 45px; left: 210px; width: 350px">
								<h3 class="mLine">북셀프 가능매장</h3>
								<div class="laypopCon">(부산)신세계센텀시티점, 롯데몰수원점, 신세계강남점,

									롯데월드몰점, 사당역점, 롯데스타시티점, 신림역점, 롯데울산점, 목동점, 신세계김해점, 대구신세계점,

									롯데피트인산본점</div>
							</div>

						</div>

						<div class="mt15 pos_rel fl_left" id="naverPayDirect"
							style="display: none;">
							<a href="javascript:go_buy_cnt('4189934', 'Y');"><img
								src="/images/detail/2014/btn_naverpay.gif" alt="네이버페이 구매"></a>
							<span><img src="/images/detail/2014/txt_naverpay.gif"
								alt="네이버 ID로 간편결제, 네이버페이"></span> <a
								href="javascript:popLayer('naverpayInfo')"><span
								class="sp_btn help" style="margin-top: 22px">?</span></a>
							<div class="bookViewPop" id="naverpayInfo"
								style="visibility: hidden; top: -20px; left: 60px; width: 320px">
								<h3 class="mLine">네이버페이는?</h3>
								<div class="laypopCon">
									<p class="t_11gr mt5">네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를
										등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스 입니다.</p>
								</div>
								<p class="btnClose">
									<img
										src="http://image.bandinlunis.com/images/common/btn_close02.gif"
										alt="close" style="cursor: pointer;"
										onclick="javascript:popHidden('naverpayInfo')">
								</p>
							</div>
						</div>

					</div>
				</div>



				<div class="etc_info">
					<!-- 에디터의 한마디 -->

					<div class="editor" id="comment">
						<span class="txt_title">에디터의 한마디</span>
						<p class="txt_editor">인간과 인간의 삶에 대해 되돌아보고 반성할 소중한 기회를 우리에게
							제공하지만, 이와 동시에 연토와 준호의 만남과 헤어짐의 이야기를 통해 결함투성이인 우리네 인간들과 인간들의 삶 자체에
							대한 적극적이고 따뜻한 이해로 우리를 유도하는 것도 사실이다-MD추천</p>
					</div>

					<div class="vote">
						<strong>회원리뷰</strong>
						<div class="medium_ratings">
							<span style="width: 93%"></span>
						</div>
						<span class="medium_ratings_num"> 리뷰평점 평균 <span
							class="ml10">리뷰[${reviewNum}] 간단평[${simplereviewNum }]
						</span>
						</span> <a href="#sub02" class="btn_w_comm btype_a4">참여하기</a>
					</div>


					<div class="isbn_info">

						<span class="alt"><strong>ISBN</strong>: ${book.isbn }</span> <span>${dto.page }쪽</span>




						<span>${book.bookSize } (㎜) </span>


					</div>


				</div>

			</div>
			<!--// 오른쪽 영역 -->

			<div class="inner_merge">
				<div class="row_item">

					<div class="section_center">
						<h4 class="txt_title">이 분야의 베스트셀러</h4>

						<ul>

							<li><a href="javascript:goDetailBook('4002576');"> <img
									src="http://image.bandinlunis.com/upload/product/4002/4002576.jpg"
									alt="" class="d_imgLine"
									onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type04.gif';">


							</a> <a href="javascript:goDetailBook('4002576');"
								class="txt_subject"><strong>82년생 김지영</strong></a> <span
								class="txt_writer">조남주</span> <strong class="point_red">11,700원
							</strong></li>

							<li><a href="javascript:goDetailBook('3960994');"> <img
									src="http://image.bandinlunis.com/upload/product/3960/3960994.jpg"
									alt="" class="d_imgLine"
									onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type04.gif';">


							</a> <a href="javascript:goDetailBook('3960994');"
								class="txt_subject"><strong>7년의 밤</strong></a> <span
								class="txt_writer">정유정</span> <strong class="point_red">13,050원
							</strong></li>

							<li><a href="javascript:goDetailBook('3698481');"> <img
									src="http://image.bandinlunis.com/upload/product/3698/3698481.jpg"
									alt="" class="d_imgLine"
									onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type04.gif';">


							</a> <a href="javascript:goDetailBook('3698481');"
								class="txt_subject"><strong>두근두근 내 인생[오디오북 특별판]</strong></a> <span
								class="txt_writer">김애란</span> <strong class="point_red">10,800원
							</strong></li>

						</ul>

					</div>
					<div class="section_right">
						<a
							href="javascript:parent.goBannerUrl('http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4203203', '_self', '112656');"><script>
								showImgSwf("http://image.bandinlunis.com/upload/banner/20181012/banner20181012112050.jpg");
							</script><img
							src="http://image.bandinlunis.com/upload/banner/20181012/banner20181012112050.jpg"></a>
					</div>
				</div>
			</div>

			<!--// 상품 구매영역 -->

			<div class="tap_zone" id="sub01">
				<ul>
					<li class="on"><a href="#sub01">상품 정보</a></li>
					<li><a href="#sub02">회원리뷰</a></li>
					<li><a href="#sub03">반품/교환</a></li>
					<li><a class="alt"></a></li>
					<!-- 마지막 기본틀 -->
				</ul>
			</div>


			<!-- 책정보 -->




			<!-- 상품 추가 정보 영역 -->
			<div class="inner_info">
				<!-- 공지사항 -->

				<!--// 공지사항 -->


				




				<!-- 이 책이 속한 분야 -->
				<div class="row_item">
					<div class="title_zone">
						<h3 class="txt_title">이 책이 속한 분야</h3>
					</div>
					<div class="box_contents">
						<ul>

							<li class="mb10"><a
								href="/front/product/bookCategoryMain.do?cateId=2">소설</a> &gt; <a
								href="/front/product/bookCategoryMain.do?cateId=25&amp;fullCateId=00020025">한국소설</a>

								&gt; <a
								href="/front/product/bookCategoryMain.do?cateId=26&amp;fullCateId=000200250026">현대소설</a>

								<a
								href="/front/product/bookCategoryMain.do?cateId=&amp;fullCateId=000200250026"></a>
							</li>

						</ul>
					</div>
				</div>
				<!-- //이 책이 속한 분야 -->

				<!-- 책소개 -->
				<div class="row_item" id="sub05">
					<div class="title_zone">
						<h3 class="txt_title">책 소개</h3>
						<div class="btn_zone_right">
							<a href="javascript:goInquiry('4189934');" class="btn_small"><span
								class="txt_link">상품문의 / 정보수정 요청 &gt;</span></a>
						</div>
					</div>



					<div class="box_contents">
						<div class="group_txt" id="cutBookDesc">

							<div class="sub_title_zone">
								<h4 class="box_tag">출판사 리뷰</h4>
							</div>
							<br> <strong>한국일보문학상, 남촌문학상, 만해문학상 수상작가 <br>윤영수가
								펼쳐 보이는 독자적인 한국 판타지<br>『단풍나무』는 우리 문학계에 기록될 하나의 사건이다!<br></strong><br>범상치
							않은 작가의식과 성실성으로 문학의 본령을 지켜온 작가 윤영수, 불혹의 나이에 등단한 윤영수는 도시의 사람살이를 폭넓게
							탐사하며 소통이 단절된 인간소외의 풍경과 자본주의라는 연옥에 던져진 우리네 속물적 욕망을 냉엄하고도 사실적인 문체로
							형상화하였다. 특유의 균형감각과 절제된 어조는 사람의 관계(특히 가족)가 형성하는 미묘한 갈등의 무늬들과 허위로 가릴
							수 없는 삶의 진실들을 그려내는 데 탁월했다. 인간에 대한 남다른 통찰력은 선과 악의 문제를 권력과 욕망이라는 또다른
							역학관계를 통해 중층적으로 인식했고 그 고유한 프리즘을 통과한 삶의 풍경들은 한국 소설에서 쉬이 찾아보기 어려운 귀한
							개성이 되었다. 그렇기에 윤영수를 향한 “우리 소설계에 있어 하나의 희망의 지렛대”(우찬제)라거나 “최근 우리 문학이
							거둔 최대의 수확의 하나”(최원식)라는 찬사는 결코 과분한 것이 아니었으리라. <br>독자와 평단의 사랑을
							고루 받으며 한국 문학사에 그 믿음직한 이름을 새겨넣은 작가 윤영수. 그의 작품세계를 결산하는 야심찬 환상소설 『숨은
							골짜기의 단풍나무 한 그루』가 도서출판 열림원에서 출간되었다. 모두가 기다려왔던 진정한 한국형 판타지라 할 만한
							작품인 『단풍나무』는 이백 자 원고지 삼천 매에 달하는 방대한 분량의 장편으로 익히 알고 있는 개념을 뒤틀어버린
							완전히 새로운 시공간으로 우리를 초대한다. 나무가 전하는 나무들의 삶에 관한 이야기를 담은 이 작품은 그의 창작활동을
							관통하는 화두와 문제의식의 집합체로서 우리 사회와 인간 전체를 비추는 환상적인 또 하나의 세계를 만들어내는 데
							성공했다. 이 책을 펼치는 독자들은 작가 윤영수가 겹겹이 쌓아올린 기이한 공간과 존재들의 일대기 속에서 그 상상력에
							압도당해 혀를 내두르게 될 것이다.<span id="dots">...</span> <span id="more">
								<br> <br> <strong>우리가 살아가는 세계와 삶 자체를 <br>낯설게
									만들고 다시 돌아보게 하는 단풍나무 이야기
							</strong><br> <br>빛과 대립하는 ‘영원한새벽의나라’ 동굴국을 배경으로 ‘나무 인간’ 어른이들의
								일대기가 펼쳐지는 이 작품은 깊이 있는 묘사와 치밀하게 세공한 세계관을 통해 이 환상적인 존재들에게 살아 움직이는
								입체감과 독자적인 논리를 부여하고 있다. ‘(나무) 인간’이되 인간(검은머리짐승)은 아닌 존재, 윤영수가 상상해낸
								환상의 존재 ‘어른이족’은 우리에게 질문을 던진다.<br>우리가 살기 위해서 먹거나 마시지 않아도 된다면
								어떨까? 그렇다면 우리에겐 돈을 벌어야 할 이유도 사라지지 않을까? 돈이 사라진 이후 삶의 풍경은 어떻게 바뀔까?
								혼자서는 아무것도 할 수 없는 무력한 아이로 태어나는 것이 아니라 삶의 시작부터 지력과 체력을 갖춘 몸으로 살아가게
								된다면? 나이를 먹을수록 주름살이 없어지고 체구가 작아져 마치 아이와도 같이 변해버리는 세상이라면? 힘없던 노인은
								땅밑 나라에 떨어져 힘과 젊음을 되찾는다. 단풍동으로 떨어진 검은머리짐승 준호는 ‘젊음’을 얻은 대신 ‘빛’을
								잃었다. 작가는 묻는다. 우리에게는 어쩌면 “늙음으로써 받는 축복이 있었”던 것이 아닐까?<br>인간은
								짐승 취급을 받고 노예가 되어 수용소에 가야 하는 세상. 인간이 다른 생명체들에게 저지른 만행을 되돌려 받는다면
								어떻게 될까? 임신과 출산이 사라지고 그저 자식은 ‘어미산’에 올라 아득한 옛날 누군가가 뿌린 씨를 캐어올
								뿐이라면, 부모와 자식 간의 핏줄이라는 끈이 사라진다면 어떨까? 누구도 나를 절대적으로 사랑할 까닭이 없는 세상에서
								나 역시도 누군가를 사랑할 이유를 찾아 헤매야 하는 세상. 앞날을 훤히 볼 수 있어 모든 것이 결정된 세상에서
								살아가야 할 의미를 발명해야만 하는 존재들. 벌어질 모든 일들을 알고 있다면, 그 권태가 우리의 삶을 서서히 목
								조르지 않을까? 동시에 우리에게는 “앞날을 볼 능력이 없기 때문에 옳다고 믿는 일을 밀고 나갈 힘이 있”는 것은
								아닐까. 이것이 작가 윤영수가 그리고 있는 땅밑 나라 단풍동의 세계, ‘나무 인간’ 운흘 연토가 자신이 누구인지
								알아가는 과정에서 마주치는 질문들이다.<br> <br> <strong>치밀하고
									빈틈 없는 서사체계로<br>우리 삶을 비추는 환상의 거울<br>
							</strong><br>풍향계가 아닌 풍향계를 움직이는 ‘바람의 눈’을 보는 작가 윤영수. 가장 깊은 진실은 눈을 감아야
								보인다(「사랑하라, 희망 없이」)는 작가의 믿음은 우리를 눈에 보이지 않는 땅밑 나라로 이끌었다. 윤영수가
								『단풍나무』의 구상을 시작한 것은 무려 스무 해 이전 과거로 돌아간다. 그동안 꾸준하고 우직하게 작가는 우리
								인간이라는 종을 되돌아보기 위한 하나의 손거울로서 우리가 발 딛고 선 땅속에 ‘영원한새벽의나라’의 공간을 공들여
								세공하였다. 책을 펼치자마자 만나게 되는 단풍동 집안의 가계도와 맑은이, 하얀이를 비롯한 어른이족들의 특징, 그들이
								머무는 공간에서 흐르는 시간에 대한 꼼꼼하고 의미 있는 설명을 따라 읽다보면 허구의 세계를 이토록 완성도 있게
								창조하는 데 들인 상상력과 그의 소설가로서의 사명감에 혀를 내두르게 될 것이다. <br>또한 작가 윤영수가
								그동안 발표해온 소설들을 따라 읽은 눈 밝은 독자라면 작품 곳곳에서 마치 한깍지처럼 닮아 있는 문제의식의 씨앗이
								담긴 장면들을 발견하는 재미도 쏠쏠할 것이다. 「성주」의 ‘통나무 노파’ 남편이 보여주는 환상이나 「삼가 조의를
								표함」에서의 출세주의자 함준호, 등단작 「생태관찰」 속 수현의 어머니가 지점토로 인형 만드는 장면을 기억하는
								독자라면 말이다. 완전히 재창조된 허구의 사회에서 여전한 것이 있다면 무엇이고 바뀐 것이 있다면 무엇인지 그의
								발전한 문제의식의 깊이를 엿볼 수 있을 것이다.<br> <br> <br> <strong>한국문학의
									새로운 가능성을 써내려가기 위한 디딤돌<br>단풍나무는 우리 사회와 인간 전체에게 던지는 질문이다
							</strong><br> <br>너고 나고 할 것 없이 모두 너겁인 썩은 웅덩이 속에서 오물로 뒤발을 한 채 자신이
								오물을 뒤집어쓴 줄도 모르는 이들을 향해 거울을 치켜들어야 하는 것이 작가의 운명이라고, 그 손거울이나마 깨끗이
								닦아내면 좋으련만 이 오염된 웅덩이가 그의 삶의 장이자 거울로 비출 모든 것이기 때문에 떠날 수 없다고 윤영수는
								일찍이 고백한 바 있다(「시대, 작가, 손거울」). 종교는 모두 하늘을 가리키지만 사실 우리 생물은 헛헛한 허공보다
								지구라는 이 땅과 관계가 깊다. 하늘엔 아무것도 없다. 나무들도 하늘을 향해 가지를 뻗지만 뿌리는 땅에 있다.
								해탈이 아니라, 초월하는 것이 아니라 이 땅에 발 딛고 선 채로 희망을 발견하려고 악착(齷齪)했던 그는 단풍동의
								이야기를 통해 우리에게는 회복시켜야 할 두 개의 뿌리가 있다고 호소한다. 하나는 인간의 무분별한 개발 끝에 이제
								물과 공기마저 평등하게 누릴 수 없게 되었음을 가르쳐주는 자연이고 다른 하나는 바로 생각하는 힘, 이야기의
								상상력이다.<br>단풍나무는 이것 혹은 저것으로 답하기 어려운 질문을 담은 소설로서 이 겹겹이 싸인 진실을
								파헤쳐가는 길은 결코 친절하지 않다. 작가가 책 곳곳에 배치해둔 이야기의 단서를 찾아 스스로 조합하며 읽어나가는 데
								익숙해지지 않는다면 도중에 나가떨어질지도 모른다. 잘 읽히는 것이 소설의 미덕인 것처럼 요구되는 사회에서 몇 번이고
								앞장으로 돌아가 인물 이름을 확인하고 배경지식을 다시 점검해야 하는 이 독법은 시대착오적으로 보이기까지 한다. <br>하나
								추천하고픈 방법은 노트를 하나 만들어 인물과 사건, 시간 등을 기록하며 읽는 것이다. 그렇게 연토의 여정의 시작과
								끝을 함께하면 어느새 자기만의 단풍동 지도가 손에 쥐어져 있으리라. 그렇다면 앞서 사소하게 언급되었던 인물이나 사건
								들이 작품의 후반부에 이르러 어떠한 폭풍우를 몰고 오는지 뒤늦게 깨닫게 될 것이다. 공들여 쓴 소설을 힘들여 읽는
								독자에게는 이 책의 숨겨진 가치와 또다른 독서의 재미가 제 모습을 드러낼 것이니, 이는 어쩌면 작가가 오늘날
								독자에게 주는 하나의 선물이자 도전장이기도 한 것이다. 이백 자 원고지로 삼천 매, 칠백 쪽이 넘는 책을 펴내는
								것은 작가에게도 출판사에게도 도전이 아닐 수 없다. 갈수록 긴 이야기를 읽지 않는다는 시대라지만 정말 그럴까?
								우리는 이 초대에 기꺼이 응할 독자가 있다고 믿는다.<br>소설로 누구를 가르치거나 특수한 상황을 보여주는
								시대는 지났다. 현실은 소설보다 더 적나라하고 이야기들은 영상으로 화하여 우리의 눈과 마음을 사로잡고 있다. 이러한
								오늘날 책이 할 수 있는 몫은 무엇일까? 진짜 진솔한 소설에 목마른 독자들이 있다는 믿음 하나로 작가는 이 작품을
								쓴 것은 아닐까. 한국문학의 새로운 가능성을 써내려가기 위한 디딤돌, 나아가 지금 우리 사회에 던지는 질문 그
								밑바닥에 자리한 벽돌이 되겠다는 마음이 고스란히 전해져오는 작품이다. 우리에게 이토록 환상적이면서도 적나라하게
								사회를 비추는 작품이 있었던가, 묻지 않을 수 없을 것이다. 1994년 그가 처음 발표했던 소설집 『사랑하라, 희망
								없이』의 해설에서 “기존의 정제된 단편미학을 토대로 더 크고 깊이 있는 세계를 창조하여 우리 앞에 펼쳐 보여줄 수
								있으리라. 우리는 그 열린 가능성을 크게 신뢰한다”라는 기대에 긴 시간이 지나 비로소 이 작품으로 답하게 된 것은
								아닐까. 우리가 누구인지, 나와 세상은 어떤 관계를 맺고 있는지, 인간이 어떤 존재인지 질문을 던지고 알아가는
								과정이 삶이라 한다면 그 질문에 답하기엔 그리 길지 않은 시간인 것처럼도 보인다.<br>‘어른이세상’에서의
								모험, 그 마지막 장을 덮은 독자의 마음속엔 붉은 단풍잎 한 장이 남아 바람이 일렁일 때면 이들 인물의 이름을
								가만히 불러보게 될지도 모른다. 설레는 마음으로 단풍동 운흘 연토의 모험에 함께해주시기 바란다.<br> <br>더럽고
								냄새나는 존재가 인간이고 그런 한계를 벗어나지 못하는 것이 인간의 삶이라고 해도, 우리는 더럽고 냄새나는 우리의
								삶을 포기할 수 없다는 엄연한 사실을 되풀이해서 말하지 않을 수 없다. 어찌 보면, 더럽고 냄새나는 부족한 존재가
								우리 자신이고 또 부족한 인간이 이어가는 것이 우리의 삶이기 때문에, 우리는 그만큼 ‘인간’으로서 소중한 존재이고
								우리의 삶이란 살아볼 가치가 있는 것이 아니겠는가. 『단풍나무』는 인간과 인간의 삶에 대해 되돌아보고 반성할 소중한
								기회를 우리에게 제공하지만, 이와 동시에 연토와 준호의 만남과 헤어짐의 이야기를 통해 결함투성이인 우리네 인간들과
								인간들의 삶 자체에 대한 적극적이고 따뜻한 이해로 우리를 유도하는 것도 사실이다. 작가 윤영수의 환상적인 환상소설
								『단풍나무』가 우리에게 소중함은 바로 이 때문이다. <br>_장경렬 해설 「환상문학의 진경(眞境), 그
								가능성을 찾아서」 중에서<br> <br>
								<div class="sub_title_zone">
									<h4 class="box_tag">추천글</h4>
								</div> <br>◎ 추천사<br> <br>이 소설은 적어도 『금오신화』 이래 한국형 본격
								판타지의 현대적 부활을 고지하는 획기적 작품임을 언명해야 하겠다. 멀리 『남가태수전』과 가까이 쥘 베른의 지저세계
								상상의 맥락 속에서 작가는 고유의 신화적 감성과 준일(俊逸)한 필치로 독자적 풍격(風格)을 지닌 한국 판타지를
								빚어냈다.<br>지상에는 뿌리박힌 나무들이, 그러나 지저에는 자유로운 ‘나무 인간’ 곧 수인(樹人)의
								세계가 존재한다는 발상이 흥미롭고 경이롭다. 소설에서는 수인 집안, 세대 간의 갈등, 굴곡진 개인사는 물론 영웅적
								수인의 성장, 모험, 투쟁 등 과거 가문소설과 군담소설의 재현을 방불케 하듯 수인 종족의 일대 파노라마가 펼쳐진다.
								근래 우리에게 이처럼 장려한 구상과 복잡한 정절(情節)의 판타지는 없었다.<br>기서(奇書) 『산해경』의
								신화적 세계관을 토양으로 전개된 작중세계에서 작가는 ‘나무 인간’의 눈으로 침통히 인간 존재의 당위성을 심문한다.
								나아가 ‘생명의 연대성’에 근거하여 인간중심주의를 해체하고 숱한 이타적(異他的) 존재의 생존방식에 대해 호혜의
								따뜻한 시선을 보낸다. 이 작품을 단순히 환상을 현실의 알레고리나 도피로 보는 관점과는 다른 차원에서 읽어야 할
								이유가 여기에 있다. <br>이른바 ‘부족(部族)의 시대’가 도래하는 이 시점에서 사라진 물활론적 감성을
								일깨우는 이 작품으로부터 우리는 환상이 삶의 비의(秘義)를 계시하는 유력한 방안이 될 수 있다는 좌증을 발견한다.
								이러한 의미에서 이 소설의 등장은 진정한 한국 판타지의 출현을 갈망해온 독자들에게 큰 복음이 아닐 수 없다. 이제
								판타지의 유수한 고국(古國)이었던 우리도 그 지위에 상응하는 걸출한 작품을 갖게 되었다. <br>_정재서
								| 신화학자·문학평론가·이화여대 명예교수<br>
								<p>&nbsp;</p> <br>
							</span>
						</div>
						<button onclick="myFunction()" id="myBtn1">펼쳐 보기</button>
					</div>


				</div>







				<!--// 책소개 -->



				<!-- 저자/역자 소개 -->


				<div class="row_item">
					<div class="title_zone">
						<h3 class="txt_title">저자 소개</h3>
					</div>

					<div class="box_contents pb40">
						<div class="thumb_zone">
							<div class="img_profile">
								<span class="bg_profile"> <c:choose>
										<c:when test="">
											<img src="/webproject/resources/">

										</c:when>
										<c:otherwise>
											<img
												src="http://image.bandinlunis.com/images/detail/2014/bg_mask.png">
										</c:otherwise>
									</c:choose>


								</span> <span class="btn_txt">자세히 보기</span> <span class="btn_bg"></span>
								<span class="mask"></span>

							</div>

						</div>
						<div class="group_profile">
							<div class="txt_profile_left mt10">
								<span class="author_name"> <a
									href="/front/author/authorProfile.do?authorSeq=8840">${dto2.authorname }</a>
									<span>(1952)</span>
								</span>
								<ul>
									<li>구분 : 저서</li>
									<li>국적 : ${dto2.nationality }</li>
									<li>분류 : ${dto2.category }</li>


								</ul>
							</div>
							<div class="txt_profile_right mt10">
								<span class="author_name">최근저서</span>
								<ul>

									<li>ㆍ<a
										href="/front/product/detailProduct.do?prodId=4189934">[저서]숨은
											골짜기의 단풍나무 한 그루 </a></li>

									<li>ㆍ<a
										href="/front/product/detailProduct.do?prodId=3826432">[저서]바이링궐
											에디션 한국 대표 소설 110-13 ...</a></li>

									<li>ㆍ<a
										href="/front/product/detailProduct.do?prodId=3740738">[저서]사랑하라
											희망 없이</a></li>

									<li>ㆍ<a
										href="/front/product/detailProduct.do?prodId=3613710">[저서]뱀장어
											스튜-제26회 이상문학상 작품집(200...</a></li>

								</ul>
							</div>
							<div class="txt_profile_marge">
								<p></p>
								<p>${dto2.introduction }</p>
								<p>&nbsp;</p>
								<p></p>
							</div>
						</div>
					</div>

				</div>







				<!-- //저자/역자 소개 -->



				<!-- 책 속에서 -->
				<div class="row_item">
					<div class="title_zone">
						<h3 class="txt_title">책 속에서</h3>
					</div>
					<div class="box_contents">
						<div class="group_txt">${dto.introduction }</div>
					</div>
				</div>
				<!-- //책 속에서 -->



				<!-- 목차 -->
				<div id="cutIndexDesc" class="row_item">
					<div class="title_zone">
						<h3 class="txt_title">목차</h3>
					</div>
					<div class="box_contents">
						<div class="group_txt">

							${dto.tableOfContents } <span id="dots2">...</span> <span
								id="more2"> 이하 생략 </span>

						</div>
						<div id="bookDescBtn" class="pr20">
							<button onclick="myFunction2()" id="myBtn2">펼쳐 보기</button>
						</div>
					</div>

				</div>
			</div>
			<!--// 목차 -->






			<!-- 상품고시정보 -->


			<div class="tap_zone mt40" id="sub02">
				<ul>
					<li><a href="#sub01">상품 정보</a></li>
					<li class="on"><a href="#sub02">회원리뷰</a></li>
					<li><a href="#sub03">반품/교환</a></li>
					<li><a class="alt"></a></li>
					<!-- 마지막 기본틀 -->
				</ul>
			</div>
			<div class="row_item">
				<img
					src="http://image.bandinlunis.com/upload/design/bn/2017/01/bandipoint_info.jpg"
					usemap="#bandipoint_info">
			</div>



			<!-- 리뷰 -->
			<div style="margin-top: 5px">

				<div class="bookViewPop" id="reviewInfo"
					style="visibility: hidden; right: 10px; top: 0; width: 450px">
					<h3 class="mLine">리뷰 혜택 및 이용안내</h3>
					<div class="laypopCon mt15">
						<h4>리뷰 작성 시 혜택</h4>
						<table cellpadding="0" cellspacing="0" class="storeNum card_info">
							<colgroup>
								<col width="220">
								<col width="220">
							</colgroup>
							<tbody>
								<tr>
									<th>구매상품 일반리뷰(150자 이상)</th>
									<td>반딧불 300개 적립</td>
								</tr>
								<tr>
									<th>구매상품 우수리뷰(300자 이상)</th>
									<td>반딧불 600개 적립</td>
								</tr>
								<tr>
									<th>포토 추가(GIFT, 뷰티만 해당)</th>
									<td>반딧불 100개 적립</td>
								</tr>
							</tbody>
						</table>
						<div class="al_center mt10"></div>
						<h4 class="mt20">반딧불이란?</h4>
						<div class="t_11gr mt5" style="line-height: 140%">반디앤루니스에서
							메일 구독, 간단평/서평 작성, 공감하기 등 책과 관련된 컨텐츠 활동을 하는 모든 회원님께 드리는 특별 포인트
							입니다. 반딧불은 10개부터 적립금으로 환전하여 현금처럼 사용할 수 있습니다.</div>

					</div>
					<p class="btnClose">
						<img
							src="http://image.bandinlunis.com/images/common/btn_close02.gif"
							alt="close" style="cursor: pointer;"
							onclick="javascript:popHidden('reviewInfo')">
					</p>
				</div>

				<iframe style="overflow: auto;" id="blogReview"
					src="<%=cp%>/book_review.action?isbn=${isbn }" width="100%"
					height="600px" class="iframe_review" frameborder="0" scrolling="no"></iframe>




			</div>
			<!-- //리뷰 -->

			<!-- 간단평 -->
			<!-- 			src="/front/product/iframeSimpleReview.do?prodId=4189934" -->
			<iframe id="simpleReview" width="100%" class="iframe_review"
				src="<%=cp %>/book_simpleReview.action?isbn=${isbn}"
				style="margin-left: 0" frameborder="0" scrolling="no" height="422"></iframe>
			<!-- //간단평 -->


			<div class="tap_zone mt40" id="sub03">
				<ul>
					<li><a href="#sub01">상품 정보</a></li>
					<li><a href="#sub02">회원리뷰</a></li>
					<li class="on"><a href="#sub03">반품/교환</a></li>
					<li><a class="alt"></a></li>
					<!-- 마지막 기본틀 -->
				</ul>
			</div>







			<!-- 반품/교환 -->
			<div class="inner_info">
				<div class="row_item">
					<div class="title_zone">
						<h3 class="txt_title">반품/교환</h3>
					</div>
					<div class="box_contents">
						<p>상품 설명에 반품/ 교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질
							수 있습니다)</p>
						<dl class="information">

							<dd>
								<table
									summary="본 상품은 배송 없이 구매 후 바로 다운받아 보는 eBook으로 다운 후에는 취소/환불이 불가능합니다."
									class="table_return">

									<colgroup>
										<col width="18%">
										<col width="82%">
									</colgroup>
									<tbody>
										<tr>
											<th>반품/교환 방법</th>
											<td>홈 &gt; 고객센터 &gt; 자주찾는질문 “반품/교환/환불” 안내 참고 또는 1:1상담게시판</td>
										</tr>
										<tr>
											<th>반품/교환 가능 기간</th>
											<td>반품,교환은 배송완료 후 7일 이내, 상품의 결함 및 계약내용과 다를 경우 문제발견 후 30일
												이내에 신청가능</td>
										</tr>
										<tr>
											<th>반품/교환 비용</th>
											<td>변심 혹은 구매착오의 경우에만 반송료 고객 부담(별도 지정 택배사 없음)</td>
										</tr>
										<tr>
											<th>반품/교환 불가 사유</th>
											<td>
												<ul>
													<li>소비자의 책임 사유로 상품 등이 손실 또는 훼손된 경우</li>
													<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우 : 예) 화장품,
														식품, 가전제품 등</li>
													<li>복제가 가능한 상품 등의 포장을 훼손한 경우 : 예) 음반/DVD/비디오, 소프트웨어,
														만화책, 잡지, 영상 화보집</li>
													<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 (GIFT주문제작상품)</li>
													<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
													<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
													<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는
														경우</li>
													<li>해외주문 상품(도서 및 음반)의 경우(파본/훼손/오발송 상품을 제외)</li>
													<li>중고 상품 등 재고의 추가 확보가 어려운 경우 (교환은 어려우나 반품은 가능)</li>
													<li>그밖에 월간지, 화보집, 사진집, 그림도감, 시집류, 중고학습서, 카세트테입, 만화,
														입시자료, 악보, 지도, 여성실용서적 등(파본/훼손/오발송 상품을 제외)</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th>소비자 피해보상<br>환불지연에 따른 배상
											</th>
											<td>
												<ul>
													<li>상품의 불량에 의한 반품, 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은
														소비자 분쟁해결기준 (공정거래위원회고시)에 준하여 처리됨</li>
													<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자
														보호에 관한 법률에 따라 처리함</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<!--// 반품/교환 -->
		</div>
		<br /> <br /> <br /> <br />
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="false" />

</body>
</html>