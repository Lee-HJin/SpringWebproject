<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/webproject/resources/common/css/bnlBSList2.css" type="text/css">
<link rel="shortcut icon" href="http://image.bandinlunis.com/favicon.ico" type="image/x-icon">
<title>2조 반디앤루니스</title>

<script type="text/javascript" src="/webproject/resources/common/js/common.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/swfobject.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/flashcommon.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/AC_RunActiveContent.js"></script>

<script type="text/javascript" src="/webproject/resources/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/JUTIL/JUTIL.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/navi.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/partnerHeaderInfo.js"></script>

<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/idangerous.swiper.js"></script>

<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>

<!-- ADSSOM 신규 버전 17-11-20 -->
<!-- ADSSOM 공통 SCRIPT -->
<script type="text/javascript" src="https://sc.11h11m.net/s/E799.js"></script>


<!-- 스크립트2  -->
<script type="text/javascript" src="/webproject/resources/js/multiCart.js"></script>
<script type="text/javascript">

	// 쇼핑카트
	function addCarts() {
	
		var obj 	= document.getElementsByName("isbn");
		var p_arr = "";
		var cnt = 0;
		
		for(var i=0;i<obj.length;i++){
			if(obj[i].checked){
				if(cnt>0){
					p_arr += ",";
				}
				p_arr += obj[i].value;
				cnt++;
			}
		}
		
		if(p_arr==""){
			alert('선택된 항목이 없습니다.');
			return;
		}
		
		
		var tmpArr	= p_arr.split(",");
		var resultArr	= Array();
		var cntArr		= Array();
		
		for(var i=0 ; i < tmpArr.length ; i++){
			resultArr.push(" ");
			cntArr.push(1);
		}
		
		add_basket_array_common(p_arr,resultArr.join(","), cntArr.join(","),resultArr.join(","), true, callBack_);
	}
	
	function callBack_()
	{
		jutil.bandi.reloadWiseCart("cart");
	}
	
	// 위시리스트
	function addWishes() 
	{
		var isbns = jutil.form.getCheckboxValue("isbn");
		
		if(isbns.length > 0){
			add_wish_array_common(isbns.join(","), true);
		}else{
			alert("상품을 선택해 주십시오");
		}
	}
	
	// 정렬
	function changeSort(index) {
	
		var sort = document.getElementsByName("sorts");
		
		sort[0].selectedIndex = index;
		sort[1].selectedIndex = index;
		
		document.bestForm.page.value = "1";
		
		goSearch();
	}

	function goTopHistory(recommendYear, recommendMonth, recommendWeek, rank) {
		
		frmObj = document.bestForm;
		
		frmObj.recommendYear.value = recommendYear;
		frmObj.recommendMonth.value = recommendMonth;
		frmObj.recommendWeek.value = recommendWeek;
		
		frmObj.page.value = Math.ceil(rank / 20);
		frmObj.sort.value = "sort8";
		frmObj.searchType.value = "top";
		//frmObj.cateId.value = "";
		//frmObj.sex.value = "";
		//frmObj.age.value = "";
		
		frmObj.submit();
	}	

function goSearch(sort) {
		
		// 폼 검증
		if (!jutil.form.validate("bestForm")) {
			return;
		}
		
		var totalPage = Number("5");
		if (totalPage == 0) {
			totalPage = 1;
		}
		
		var frmObj = document.bestForm;
	/*
		if (typeof(sort) != "undefined") {
			
			frmObj.sorts[0].value = sort;
			frmObj.sorts[1].value = sort;
		}
		
		frmObj.sort.value = frmObj.sorts[0].value;
		*/
		if (frmObj.sort.value == "") {
			frmObj.sort.value = "sort8";
		}
		
		var cageId = document.getElementsByName("cageId");
		
		
		//frmObj.cateId.value = frmObj.sorts[0].value;
		//frmObj.cateId.value = cateId;
		/*
		if (frmObj.prodStats[0].checked == true) {
			frmObj.prodStat.value = "Y";
		}
		
		if (Number(frmObj.pages[0].value) > totalPage) {
			alert("이동할 수 없는 페이지 번호 입니다.");
			return;
		} 
		else {
			frmObj.page.value = frmObj.pages[0].value;
		}*/
		
		var isbn = document.getElementsByName("isbn");
		var orderCnt = document.getElementsByName("orderCnt");
		
		for (var i = 0; i < isbn.length; i++) {
		
			isbn[i].disabled = true;
			orderCnt[i].disabled = true;
		}
		/*
		frmObj.sorts[0].disabled = true;
		frmObj.sorts[1].disabled = true;
		
		frmObj.prodStats[0].disabled = true;
		frmObj.prodStats[1].disabled = true;
		
		frmObj.pages[0].disabled = true;
		frmObj.pages[1].disabled = true;
		*/
		frmObj.submit();
	}
	
</script>
<!-- 스트립트2 끝  -->


</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>


<div id="contentBody">
		<div id="contentWrap">
			<h2 class="ml10 mt30  mb10 lh0"><img src="http://image.bandinlunis.com/images/specialBook/tit_h3_discount.gif" alt="정가인하도서" class="lh0"></h2>

			<div class="conWrap" id="selCSS2">
			
				<form name="frm" action="/front/display/discountBookList.do#tabMenu" method="get" onsubmit="javascript:return false;">
			
                <ul class="tap_menu_d1 tap_div_3 mb20 ml5" id="tabMenu">
                	<li><a href="<%=cp %>/discountBookMain.action" class="alt">추천</a></li>
                	<li><a href="<%=cp %>/discountBookList.action?theMonth=1">이달의 신규등록</a></li>
                	<li><a href="<%=cp %>/discountBookList.action?theMonth=">분야별 전체</a></li>
                </ul>
                
                <div class="side_t2 ml5">
					<div class="cate_comm">
						<h2 class="cate_tit"> 
								
						 		분야별 전체
						</h2> 
						<ul class="cate_d1">
							<li class="cate_d1_li"><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }" class="cate_d1_link">종합</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort1st=4&sort2nd=13" class="cate_d1_link">소설</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">장르소설</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort1st=1&sort2nd=3" class="cate_d1_link">시/에세이/기행</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">인문/교양/철학</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">역사/신화/문화</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">종교</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">사회/정치/법률</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">경제/경영</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort1st=14&sort2nd=17" class="cate_d1_link">자기계발</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">외국어/사전</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">가정/생활/요리</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">건강/의학/미용</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">유아</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">어린이</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">청소년교양</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">예술/대중문화</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">여행/취미/레저</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">잡지</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">만화</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">컴퓨터/IT</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">자연과학/공학</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">대학교재</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">아동전집</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">서양서</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">초등참고서</a></li>
							<li class="cate_d1_li "><a href="" class="cate_d1_link" class="cate_d1_link">중/고등참고서</a></li>
						</ul>
					</div>
				</div>
				
				<div class="con_t2">
					<h3 class="cateTit p10">
						
						<span>정가인하 도서 전체</span>

					</h3>		
					
					<div class="tap_menu_d2 mb15">
		                <ul>
							<li class="alt"><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=30&toDiscount=100" class="cart_link">전체</a></li>
		                	<li class=""><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=50&toDiscount=100" class="cart_link">50% 이상</a></li>
		                	<li class=""><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=40&toDiscount=50" class="cart_link">40% 이상</a></li>
		                	<li class=""><a href="<%=cp%>/discountBookList.action?pageNum=1&theMonth=${theMonth }&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=30&toDiscount=40" class="cart_link">30% 이상</a></li>
		                </ul>
		                <div class="tab_menu_line"></div>
		            </div>	
		            
		            <div class="prod_sort">								
						<div class="sorting">
							<input type="hidden" name="sorts" value="">
							<ul class="con01">
								<li><a style="cursor:pointer;" href="<%=cp%>/discountBookList.action?pageNum=1&sort=&theMonth=${theMonth }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=${fromDiscount}&toDiscount=${toDiscount}">판매량순</a></li>
								<li><a style="cursor:pointer;"href="<%=cp%>/discountBookList.action?pageNum=1&sort=sort1&theMonth=${theMonth }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=${fromDiscount}&toDiscount=${toDiscount}">발행일순</a></li>
								<li><a style="cursor:pointer;"href="<%=cp%>/discountBookList.action?pageNum=1&sort=sort2&theMonth=${theMonth }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=${fromDiscount}&toDiscount=${toDiscount}">상품명순</a></li>
								<li><a style="cursor:pointer;"href="<%=cp%>/discountBookList.action?pageNum=1&sort=sort3&theMonth=${theMonth }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=${fromDiscount}&toDiscount=${toDiscount}">정가인하순</a></li>
								<li class="alt"><a id="sort10" style="cursor:pointer;" href="<%=cp%>/discountBookList.action?pageNum=1&sort=sort4&theMonth=${theMonth }&sort1st=${sort1st}&sort2nd=${sort2nd}&fromDiscount=${fromDiscount}&toDiscount=${toDiscount}">가격순</a></li>
							</ul>
						 	<div class="con02">
								<p>
									<select class="changeListType">
										<option value="detail" selected="">자세히보기</option>
										<option value="simple">간단히보기</option>
									</select>
								</p>
								<p class="t_11gr"><input type="checkbox" name="prodStat" value="Y" class="chk" id="prodStat"> 품절/절판제외</p>
							</div>
						</div>
						
						<h4>
							
							<span><strong>전체</strong>에 총 <strong>${dataCount }</strong> 권의 정가인하 도서가 등록되어 있습니다. </span>

						</h4>
						<p class="btn_cart">
							<span><input type="checkbox" name="prodIds" class="chk" onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);"> 전체</span>
							<a href="javascript:addCarts();"><span class="btn_w_comm btype_a2">쇼핑카트</span></a>
							<a href="javascript:addWishes();"><span class="btn_w_comm btype_a2">위시리스트</span></a>
						</p>
					</div>		
					<div class="fl_clear ml5">	
					<c:forEach var="dto" items="${lists }">
						<div class="prod_list_type  ">

							<ul>
							
							<!-- 리스트 1개 시작  -->
				         	<li>
				         		<input class="checkbox" type="checkbox" value="${dto.isbn }" name="isbn">
								<div class="prod_thumb">
									<div class="prod_thumb_img">
										<a href="/front/product/detailProduct.do?isbn=3795041" onfocus="this.blur();">
											<img src="<%=cp %>/resources/image/book/${dto.bookImage }">
										</a>
										<a class="btn_popup" target="_blank" href="/front/product/detailProduct.do?isbn=3795041"><span class="ico_new">새창열기</span></a>
									</div>
															
								</div>
								<dl class="prod_info">
									<dt>
										<a href="/front/product/detailProduct.do?isbn=3795041" onfocus="this.blur();">
											  [정가인하] ${dto.bookTitle }
										</a>
										<!-- <span class="tit_sub">- 덧셈구구</span> -->												
										<span class="tag_area">
											<span class="tag_best"><span>베스트</span></span>
											
											
										</span>
									</dt>
									<dd class="txt_block">
										<span>${dto.authorName }</span> <span class="gap">|</span> <span>${dto.publisher }</span>
										<span class="txt_date"><span class="gap">|</span> <span>${dto.publishDate }</span></span>
									</dd>
									
										
									<dd class="mt5"><p><span class="txt_junga">정가 <span class="txt_junga">${dto.bookPrice }원</span></span><span class="txt_arrow">→</span>
														<span class="txt_reprice2">${dto.discountedPrice }원 [<strong>${dto.discountRate }%</strong> 정가인하] </span> </p>
														<p class="mt5"><span class="txt_price"><strong><em><fmt:formatNumber value="${dto.discountedPrice*0.9 }" type="number"/></em>원</strong>
														 (10%↓+5%P)</span></p>
									</dd>
									<dd class="txt_desc">
										<div class="review_point">
											<span style="width: ${dto.rate*10}%"></span>
										</div>
										<span class="ratings_num">
										<strong>${dto.rate }</strong>
										<a href="/front/product/detailProduct.do?isbn=3795041#sub10" target="_blank">리뷰<em>(${dto.reviewCnt })</em></a>
										</span>
									</dd>
									<dd class="txt_bex">
										${dto.introduction }
									</dd>
									<dd class="txt_ebook">
										<span>지금 주문하면 <strong class="t_red">내일</strong> 받을 수 있습니다.</span>
									</dd>
													
								</dl>
								<dl class="prod_btn">
								<dt>
									<span class="num_txt">수량</span>
									<input type="text" id="cntVal_${dto.isbn }" value="1" class="num" size="3" maxlength="2" onkeydown="onlyNumber();" onkeyup="">
									<span class="btn_updn_wrap"><a href="javascript:cntUp('${dto.isbn }');" class="btn_num_up">▲</a><a href="javascript:cntDown('${dto.isbn }');" class="btn_num_dn">▼</a></span>
								</dt>
								
								<dd><a href="javascript:addCart('${dto.isbn }');"><span class="btn_b_comm btype_f1">쇼핑카트</span></a></dd>
								<dd class="mt3"><a href="javascript:goOrder('${dto.isbn }');"><span class="btn_w_comm btype_f1">바로구매</span></a></dd>
								<dd class="mt3"><a href="javascript:add_wish_array_common('${dto.isbn }', true);"><span class="btn_w_comm btype_f1">위시리스트</span></a></dd>
							</dl>
							</li>
							<!-- 리스트 1개 끝  -->
							
							</ul>
														
						</div>
						</c:forEach>


						 <c:if test="${dataCount!=0 }">
							${pageIndexListforJ }
						</c:if>
						<c:if test="${dataCount==0 }">
							<div class="pageTypeA">
								<span class="pageNum">
									등록된 책이 없습니다.
								</span>
							</div>
						</c:if>

						
						<div class="prod_sort_b">
							<span><input type="checkbox" name="prodIds" class="chk" onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);"> 전체</span>
							<a href="javascript:addCarts();"><span class="btn_w_comm btype_a2">쇼핑카트</span></a>
							<a href="javascript:addWishes();"><span class="btn_w_comm btype_a2">위시리스트</span></a>
						</div>
						
						
					
					</div>		
				
				</div>
				
			</form>
			
			</div>
		</div>
	</div>



<jsp:include page="../common/footer.jsp" flush="false" />
</body>
</html>