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
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">


<!-- <link rel="stylesheet" href="/webproject/resources/css/main.css" type="text/css"> -->
<link rel="stylesheet" href="/webproject/resources/common/css/bnlBSList2.css" type="text/css">
<link rel="shortcut icon" href="http://image.bandinlunis.com/favicon.ico" type="image/x-icon">
<title>2조 반디앤루니스</title>

<!-- <script type="text/javascript" src="/webproject/resources/common/js/jquery-3.3.1.js"></script> -->
<script type="text/javascript" src="/webproject/resources/common/js/common.js"></script>

<script type="text/javascript" src="/webproject/resources/common/js/swfobject.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/flashcommon.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/AC_RunActiveContent.js"></script>

<script type="text/javascript" src="/webproject/resources/js/common.js" charset="euc-kr"></script>
<script type="text/javascript" src="/webproject/resources/js/JUTIL/JUTIL.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/navi.js" charset="euc-kr"></script>
<script type="text/javascript" src="/webproject/resources/js/partnerHeaderInfo.js"></script>

<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/idangerous.swiper.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>

<!-- ADSSOM 신규 버전 17-11-20 -->
<!-- ADSSOM 공통 SCRIPT -->
<script type="text/javascript" src="https://sc.11h11m.net/s/E799.js"></script>
<script type="text/javascript" charset="UTF-8" async="" src="http://s.n2s.co.kr/_n2s_ck_log.php"></script>

<!-- 스크립트2 시작 -->
<link rel="stylesheet" href="http://image.bandinlunis.com/common/css/pStyle.css" type="text/css">

<script type="text/javascript" src="/webproject/resources/js/dwr.js" charset="euc-kr"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.min.js"></script><!-- IE8 에서 오류로 인해 일부러 넣음(jQuery 보다 dwr.util.js 가 밑에 있음 오류 발생) -->
<script type="text/javascript" src="/webproject/resources/js/multiCart.js"></script>
<script type="text/javascript">

	navi.type = "path";
	
		navi.path = 401;

	jutil.eventAdd(window, "onload", navi.make);

	$(document).ready(function(){

		$(".changeListSize").change(function(){
			document.location.href = location.pathname+"?cateId=&listMode=&listType=&sort=sort8&prodStat=&prodRelSeq=&listSize="+this.value;
		});
		
		$(".changeListType").change(function(){
			document.location.href = location.pathname+"?cateId=&&listType=&listSize=20&sort=sort8&prodStat=&prodRelSeq=&listMode="+this.value;
		});
		
		$(".sorting>ul>li>a").click(function(){
			document.location.href = location.pathname+"?cateId=&listMode=&listType=&listSize=20&prodStat=&prodRelSeq=&sort="+this.id;
		});
		
		$("#prodStat").click(function(){
			var checkYn="Y";
			if(!this.checked) checkYn="";
			document.location.href = location.pathname+"?cateId=&listMode=&listType=&listSize=20&sort=sort8&prodRelSeq=&prodStat="+checkYn;
		});
		
	});

	// 쇼핑카트
	function addCarts() {
	
		var obj 	= document.getElementsByName("prodId");
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
		var prodIds = jutil.form.getCheckboxValue("prodId");
		
		if(prodIds.length > 0){
			add_wish_array_common(prodIds.join(","), true);
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
		
		frmObj.pageNum.value = "1";
		/* frmObj.sort.value = ""; */

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

		if (frmObj.sort.value == "") {
			frmObj.sort.value = "sort8";
		}
		
		var cageId = document.getElementsByName("cageId");
		
		var prodId = document.getElementsByName("isbn");
		var orderCnt = document.getElementsByName("orderCnt");
		
		for (var i = 0; i < prodId.length; i++) {
		
			prodId[i].disabled = true;
			orderCnt[i].disabled = true;
		}

		frmObj.submit();
	}
	
</script>

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
	
	$(function() {
		
		var ck = getCookie('cartlist');
		var ckOne = cookieInfo(ck);
	});
	
	
	//쿠키 가져오기
	function getCookie(cookiename){
		var cookiestring  = document.cookie;
		var cookiearray = cookiestring.split(';');
		for(var i=0; i<cookiearray.length; ++i){ 
		    if(cookiearray[i].indexOf(cookiename)!=-1){
		        var nameVal = cookiearray[i].split("=");
		        nameVal = nameVal[1].trim();
		        return unescape(nameVal);
		    }else{
		    	var cookie = null;
		    } 
		}
		return cookie;
	}
 	
	//쿠키 뿌리기
	function cookieInfo(cValue) {		
 		var cookie = cValue;
 		
 		if(cookie!=null){
 			cookie = cookie.split("/");
 	 		var ck = new Array();
 	 		
 	 		for(i=0;i<cookie.length;i++){
 	 			ck[i] = JSON.parse(cookie[i]);
 	 		} 		
 	 		return ck;
 		}else{
 			return null;
 		}
	}

</script>
<!-- 스트립트2 끝  -->

</head>

<body>
<jsp:include page="../common/header.jsp" flush="false"/>

<div id="wrap">
	
	<!-- body -->
	<div id="contentBody">
		<div id="contentWrap">
			<div class="conWrap">
				 				
				<div class="side_t2 ml5">
					<div class="cate_comm">
						<h2 class="cate_tit"> 
						베스트셀러		
						</h2>
						
						<ul class="cate_d1">
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1" class="cate_d1_link">종합</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1&sort2nd=90" class="cate_d1_link">소설</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=91&sort2nd=114" class="cate_d1_link" class="cate_d1_link">장르소설</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=115&sort2nd=174" class="cate_d1_link">시/에세이/기행</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=292&sort2nd=380" class="cate_d1_link" class="cate_d1_link">인문/교양/철학</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=381&sort2nd=430" class="cate_d1_link" class="cate_d1_link">역사/신화/문화</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=431&sort2nd=473" class="cate_d1_link" class="cate_d1_link">종교</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=474&sort2nd=527" class="cate_d1_link" class="cate_d1_link">사회/정치/법률</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=197&sort2nd=254" class="cate_d1_link" class="cate_d1_link">경제/경영</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=255&sort2nd=291" class="cate_d1_link">자기계발</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=943&sort2nd=1012" class="cate_d1_link" class="cate_d1_link">외국어/사전</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1275&sort2nd=1316" class="cate_d1_link" class="cate_d1_link">가정/생활/요리</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1317&sort2nd=1362" class="cate_d1_link" class="cate_d1_link">건강/의학/미용</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=667&sort2nd=703" class="cate_d1_link" class="cate_d1_link">유아</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=704&sort2nd=773" class="cate_d1_link" class="cate_d1_link">어린이</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=175&sort2nd=196" class="cate_d1_link" class="cate_d1_link">청소년교양</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=528&sort2nd=666" class="cate_d1_link" class="cate_d1_link">예술/대중문화</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1363&sort2nd=1419" class="cate_d1_link" class="cate_d1_link">여행/취미/레저</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1420&sort2nd=1439" class="cate_d1_link" class="cate_d1_link">잡지</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1440&sort2nd=1468" class="cate_d1_link" class="cate_d1_link">만화</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1153&sort2nd=1274" class="cate_d1_link" class="cate_d1_link">컴퓨터/IT</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=607&sort2nd=609" class="cate_d1_link" class="cate_d1_link">자연과학/공학</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1013&sort2nd=1152" class="cate_d1_link" class="cate_d1_link">대학교재</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=774&sort2nd=796" class="cate_d1_link" class="cate_d1_link">아동전집</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=1469&sort2nd=1518" class="cate_d1_link" class="cate_d1_link">서양서</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=798&sort2nd=839" class="cate_d1_link" class="cate_d1_link">초등참고서</a></li>
							<li class="cate_d1_li "><a href="<%=cp%>/bnlBSList.action?pageNum=1&sort1st=840&sort2nd=942" class="cate_d1_link" class="cate_d1_link">중/고등참고서</a></li>
						</ul>
					</div>
				</div>
				
				<!-- left contents -->
				<div class="con_t2">
				<form name="bestForm" action="/webspring/bnlBSList.action" method="get" onsubmit="javascript:return false;">
					<input type="hidden" name="searchType" value="top">
					<input type="hidden" name="prodStat">
					<input type="hidden" name="sort">
					<input type="hidden" name="pageNum" value="1">
				
				<h3 class="cateTit p10"><span>종합 
				<span class="t_11gr t_normal ml5">총 판매량과 주문수를 기준으로 매일 1회 업데이트 됩니다.</span></span></h3>

					<!-- 정렬 -->
					<div class="prod_sort sort_ver02">								
						<div class="sorting">
							<ul class="con01">
								<li><a style="cursor:pointer;" href="<%=cp%>/bnlBSList.action?pageNum=1&sort=&sort1st=${sort1st}&sort2nd=${sort2nd}" >순위 높은 순</a></li>
								<li><a style="cursor:pointer;" href="<%=cp%>/bnlBSList.action?pageNum=1&sort=sort1&sort1st=${sort1st}&sort2nd=${sort2nd}">발행일순</a></li>
								<li><a style="cursor:pointer;" href="<%=cp%>/bnlBSList.action?pageNum=1&sort=sort2&sort1st=${sort1st}&sort2nd=${sort2nd}">상품명순</a></li>
								<li><a style="cursor:pointer;" href="<%=cp%>/bnlBSList.action?pageNum=1&sort=sort3&sort1st=${sort1st}&sort2nd=${sort2nd}">평점순</a></li>
								<li class="alt"><a style="cursor:pointer;" href="<%=cp%>/bnlBSList.action?pageNum=1&sort=sort4&sort1st=${sort1st}&sort2nd=${sort2nd}">리뷰순</a></li> 
							</ul> 
						 	<div class="con02">
								<p class="t_11gr"><input type="checkbox" name="prodStat" id="prodStat" value="Y" class="chk"> 품절/절판제외</p>
							</div>
						</div>
						
						<h4>
							<span>기간</span>
							<select style="width:70px;" name="recommendYear">
								
								<option value="2000">2000년</option>							
								<option value="2001">2001년</option>								
								<option value="2002">2002년</option>								
								<option value="2003">2003년</option>								
								<option value="2004">2004년</option>								
								<option value="2005">2005년</option>								
								<option value="2006">2006년</option>								
								<option value="2007">2007년</option>								
								<option value="2008">2008년</option>								
								<option value="2009">2009년</option>								
								<option value="2010">2010년</option>								
								<option value="2011">2011년</option>								
								<option value="2012">2012년</option>								
								<option value="2013">2013년</option>								
								<option value="2014">2014년</option>								
								<option value="2015">2015년</option>								
								<option value="2016">2016년</option>								
								<option value="2017">2017년</option>								
								<option value="2018" selected="selected">2018년</option>								
								<option value="2019">2019년</option>
								
							</select> 
							<select style="width:55px;" name="recommendMonth">
								
								<option value="1">1월</option>								
								<option value="2">2월</option>								
								<option value="3">3월</option>								
								<option value="4">4월</option>								
								<option value="5">5월</option>								
								<option value="6">6월</option>								
								<option value="7">7월</option>								
								<option value="8">8월</option>								
								<option value="9">9월</option>								
								<option value="10" selected="selected">10월</option>								
								<option value="11">11월</option>								
								<option value="12">12월</option>
								
							</select> 
							<select style="width:60px;" name="recommendWeek">
								
								<option value="1">1주째</option>								
								<option value="2" selected="selected">2주째</option>								
								<option value="3">3주째</option>								
								<option value="4">4주째</option>								
								<option value="5">5주째</option>
								
							</select> 
						   <a href="javascript:goSearch();"><img src="http://image.bandinlunis.com/images/common/btnW_search_01.gif" alt="조회" class="al_top"></a>
						 </h4>
						 
						<p class="btn_cart">
							<span><input type="checkbox" name="ibsns" class="chk" onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);"> 전체</span>
							<a href="javascript:addCarts();"><span class="btn_w_comm btype_a2">쇼핑카트</span></a>
							<a href="javascript:addWishes();"><span class="btn_w_comm btype_a2">위시리스트</span></a>
						</p>
					</div>

						<!-- page -->
						<div class="pageTypeA pageTypeB">
							
							<!-- jQuery로 class on 하는 거 나중에 하기  -->
							<a href="<%=cp%>/bnlBSList.action?pageNum=1&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">1~10위</a>
							<a href="<%=cp%>/bnlBSList.action?pageNum=2&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">21~40위</a>
							<a href="<%=cp%>/bnlBSList.action?pageNum=3&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">41~60위</a>
							<a href="<%=cp%>/bnlBSList.action?pageNum=4&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">61~80위</a>
							<a href="<%=cp%>/bnlBSList.action?pageNum=5&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">81~100위</a>

						</div>
					<!-- //page --> 
					
<!-- EL / JSTL / Foreach  -->
					<c:forEach var="dto" items="${lists }">
					<div class="prod_list_type prod_best_type">
						<ul>	        	
			         	<li>
			         		<input class="checkbox" type="checkbox" value="${dto.isbn }" name="isbn" id="cart_isbn${dto.isbn }">
							<div class="prod_thumb">
								<span class="ranking">
									<span class="rank_num">${dto.rnum }</span>
									<span class="rank_change">
											<img src="http://image.bandinlunis.com/images/common/2014/ico_best_same.gif" alt="-">
										<!-- 0 -->		
									</span>
								</span>
								<div class="prod_thumb_img">
									<a href="/front/product/detailProduct.do?isbn=4181047" onfocus="this.blur();">
										<img src="<%=cp %>/resources/image/book/${dto.bookImage }"> <!-- onerror="this.src='/images/common/noimg_type01.gif';"  -->
									</a>
									<a class="btn_popup" target="_blank" href="/front/product/detailProduct.do?isbn=4181047"><span class="ico_new">새창열기</span></a>
								</div>
									<a class="btn_preview" href="javascript:popPreview('${dto.isbn }');">미리 보기</a>			
							</div>
							
							<dl class="prod_info">
								<dt>
									<a href="/front/product/detailProduct.do?isbn=4181047" onfocus="this.blur();">
										  ${dto.bookTitle }
									</a> 												
									<span class="tag_area">
										<span class="tag_best"><span>베스트</span></span>
										<span class="tag_recom"><span>반디추천</span></span>
										<span class="tag_free"><span>무료배송</span></span>
									</span>
								</dt>
								<dd class="txt_block">
									<span>${dto.authorName }</span> <span class="gap">|</span> <span>${dto.publisher }</span>
									<span class="txt_date"><span class="gap">|</span> <span>${dto.publishDate }</span></span>
								</dd>
								<dd class="mt5"><p><span class="txt_reprice">${dto.bookPrice }</span> <span class="txt_arrow">→</span> 
													<span class="txt_price"><strong><em>${dto.discountedPrice }</em>원</strong>
													 (${dto.discountRate }%↓+5%P)</span></p></dd>
								<dd class="txt_desc">
									<div class="review_point"><span style="width: ${dto.rate*10 }%;"></span></div>
									<strong>${dto.rate }</strong>
									<a href="/front/product/detailProduct.do?isbn=4181047#sub10" target="_blank">리뷰<em>(${dto.reviewCnt })</em></a>
								</dd>
								<dd class="txt_bex">
									${dto.introduction }...
								</dd>
									<dd class="txt_ebook">
									<span>지금 주문하면 <strong class="t_red">내일</strong>받을 수 있습니다.</span>
									</dd>
							</dl>
							
							<dl class="prod_btn">
								<dt>
									<span class="num_txt">수량</span>
									<input type="text" id="cntVal_${dto.isbn }" value="1" class="num" size="3" maxlength="2" onkeydown="onlyNumber();" onkeyup="">
									<span class="btn_updn_wrap">
										<a href="javascript:cntUp('${dto.isbn }');" class="btn_num_up">▲</a>
										<a href="javascript:cntDown('${dto.isbn }');" class="btn_num_dn">▼</a>
									</span>
								</dt>
								
								<dd><a href="javascript:addCart('${dto.isbn }');"><span class="btn_b_comm btype_f1">쇼핑카트</span></a></dd>
								<dd class="mt3"><a href="javascript:goOrder('${dto.isbn }');"><span class="btn_w_comm btype_f1">바로구매</span></a></dd>
								<dd class="mt3"><a href="javascript:add_wish_array_common('${dto.isbn }', true);"><span class="btn_w_comm btype_f1">위시리스트</span></a></dd>
							</dl>
						</li>						
						</ul>							
					</div>
					</c:forEach>
					<!-- page -->
					<div class="pageTypeA pageTypeB">

						<a href="<%=cp%>/bnlBSList.action?pageNum=1&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">1~20위</a>
						<a href="<%=cp%>/bnlBSList.action?pageNum=2&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">21~40위</a>
						<a href="<%=cp%>/bnlBSList.action?pageNum=3&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">41~60위</a>
						<a href="<%=cp%>/bnlBSList.action?pageNum=4&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">61~80위</a>
						<a href="<%=cp%>/bnlBSList.action?pageNum=5&sort=${sort }&sort1st=${sort1st}&sort2nd=${sort2nd}">81~100위</a>

					</div>

					<!-- //page --> 
				</form>
				</div>
				<!-- //left contents --> 
				
			</div>
		</div>
	</div>
	<!-- //body -->

</div>
<jsp:include page="../common/footer.jsp" flush="false" />
</body>
</html>