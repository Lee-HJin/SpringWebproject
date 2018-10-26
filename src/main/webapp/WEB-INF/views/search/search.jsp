<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>반디앤루니스 인터넷서점</title>

<link rel="stylesheet" href="/webproject/resources/css/searchN.css"	type="text/css">
<!--[if IE]>
<script src="/js/jquery/html5shiv.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/common.js" charset="euc-kr"></script>
<script type="text/javascript" src="/webproject/resources/js/JUTIL/JUTIL.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/partnerHeaderInfo.js"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	/* onLoad */
	
	/* onLoad */

	//자동완성
	$("#sch_keyword").keyup(function(){
		if(akcOn) {
			if(event.keyCode == 38 || event.keyCode == 40) {	//상,하 방향키 event
				timeB = new Date();	//한타입력 후 방향키 입력시 두번찍힘...
				if((timeB-timeA) > 100) {
					var len = $("#AREA_AKC_WORDS li").size();
					if(len > 0) {
						if(event.keyCode == 40) {	//down
							akcIdx++;
							if((len-1) < akcIdx) akcIdx = 0;
						}else if(event.keyCode == 38) {	//up
							akcIdx--;
							if(akcIdx < 0) akcIdx = len-1;
						}
						$("#AREA_AKC_WORDS li").attr("style","background-color:#fff").delay(1000);
						$("#AREA_AKC_WORDS li").eq(akcIdx).attr("style","background-color:#f5f5f5");
						$("#sch_keyword").val($(".akc_hidden_words").eq(akcIdx).val());
						viewAkcExact($("#AREA_AKC_WORDS li").eq(akcIdx).val());
					}
				}
				timeA=timeB;
			}else {
				SCH_API_akc($("#sch_keyword").val());
			}
		}
	});

	//자동완성끄기
	$(".inner_func").click(function(){
		akcOn = false;
		$("#AREA_AKC").addClass("blind");
	});

	//자동완성켜기
	$(".auto_word").click(function(){
		if($("#AREA_AKC").attr("class").indexOf("blind") > -1) {
			akcOn = true;
			SCH_API_akc($("#sch_keyword").val());
			$("#AREA_AKC").removeClass("blind");
		}else {
			akcOn = false;
			$("#AREA_AKC").addClass("blind");
		}
	});

	//본문영역 클릭시 자동완성 닫기
	$("#sch_keyword").focusout(function() {
		setTimeout("closeAkcArea()",200);
	});
	
	/* 통합검색 셀렉트 */
	$(".search_select").hover(function() {
		$("#sch_prodType").removeClass("blind");
		},function() {
		$("#sch_prodType").addClass("blind");
	});
	
	$("#sch_prodType").hover(function() {
		$("#sch_prodType").removeClass("blind");
		},function() {
		$("#sch_prodType").addClass("blind");
	});

	$("#sch_prodType ul li").click(function() {
		$("#frm_pt").val(this.id);
		$(".search_select").html($("#sch_prodType ul li").eq(this.value).html());
		$("#sch_prodType").addClass("blind");
	});
	/* 통합검색 셀렉트 */
	
	/* 나의쇼핑 */
	$(".myShopping").hover(function() {
		$("#myShopping").show();
		},function() {
		$("#myShopping").hide();
	});
	$("#myShopping").hover(function() {
		$("#myShopping").show();
		},function() {
		$("#myShopping").hide();
	});	
	/* 나의쇼핑 */

	/* 영업점안내 */
	$(".store").hover(function() {
		$("#storeInfo").show();
		},function() {
		$("#storeInfo").hide();
	});
	$("#storeInfo").hover(function() {
		$("#storeInfo").show();
		},function() {
		$("#storeInfo").hide();
	});	
	/* 영업점안내 */

	/* 쉽게찾기 */
	$(".btn_easy").hover(function() {
		$(".layer_link").show();
		},function() {
		$(".layer_link").hide();
	});
	
	$(".layer_link").hover(function() {
		$(".layer_link").show();
		},function() {
		$(".layer_link").hide();
	});
	/* 쉽게찾기 */

	//submit
	$("#searchForm").submit(function() {
		$("#sch_keyword").val($("#sch_keyword").val().trim());
		if($("#sch_keyword").val() == "") {
			alert("검색어를 입력하세요.");
			$("#sch_keyword").focus();
			return false;
		}
	});

});

	wcs.inflow("bandinlunis.com");
	var sMemSeq = "";
	
	var akcIdx = -1;
	var timeA = new Date();
	var timeB;
	var console = window.console || {error:function(){}};

	//전역변수
	var akcOn = true;				//자동완성 끄기여부
	var gKwd = "설거지";		//검색어
	var gKwd_F = "";				//필터검색어
	var gKwd_S = "";				//구간검색어
	var gProdType = "";	//상품타입
	var gCateId = "";	//카테고리
	var currentPage = 0;			//현재페이지
	var productTotal = 0;			//상품 검색 결과 수
	var todayBookTotal = 0;			//오늘의책 검색 결과 수
	var themeBookTotal = 0;			//테마북 검색 결과 수

	//loading..
	function processing(){
		$.blockUI({
			message:null,
			overlayCSS:{ backgroundColor:'#FFFFFF' }
		});
	}

	//자동완성 영역 닫기
	function closeAkcArea() {
		$("#AREA_AKC").addClass("blind");
	}
	
	//자동완성
	function SCH_API_akc(kwd) {
		
		var apiUrl = "http://222.122.120.242:7571/ksf/api/suggest";
		
		//parameters
		var target = "complete";
		var domain_no = "0";	//0-전체
		var term = kwd;	//검색어
		var mode = "sc";
		var max_count = "10";	//요청건수
		
		var parameters = { target:target, domain_no:domain_no, term:term, mode:mode, max_count:max_count };
		var HTML = "";

		akcIdx = -1;	//초기화

		if(kwd.trim().length > 0) {
			
			$.ajax({
				
				url: apiUrl,
				type: "get",
				data: parameters,
				dataType: "jsonp",
				jsonp: "callback",
				success: function(data)	{

					try {

						$.each(data.suggestions[0], function(i,item) {
							HTML += '<li value="'+item[1]+'" onmouseover="onMouseAkcWord(\''+item[1]+'\');" onmouseout="outMouseAkcWord(\''+item[1]+'\');"><a href="javascript:akcChangeKwd('+i+')"><span class="txt_keywords">['+DispProdType(item[2])+'] '+item[0].replace(term.trim(),"<strong>"+term+"</strong>")+'</span></a><input type="hidden" class="akc_hidden_words" value="'+item[0]+'"/></li>';
						});
		
						if(data.suggestions[0].length > 0) {
							$("#AREA_AKC").removeClass("blind");
							viewAkcExact(data.suggestions[0][0][1]);
						}else {
							$("#AREA_AKC").addClass("blind");
						}
						
					}catch(e) {
						HTML = "";
					}
				},
				complete: function(){
					$("#AREA_AKC_WORDS").html(HTML);
				},
				error: function(){
					$("#AREA_AKC").addClass("blind");
				}
			});
		}else{
			if($("#AREA_AKC").attr("class").indexOf("blind") == -1) {
				$("#AREA_AKC").addClass("blind");
			}
		}
	}

	var timer;
	//자동완성 마우스 over
	function onMouseAkcWord(prodId) {
		timer = setTimeout("viewAkcExact('"+prodId+"')",300);
	}
	
	//자동완성 마우스 out
	function outMouseAkcWord(prodId) {
		clearTimeout(timer);
	}

	//자동완성 오른쪽 영역 그리기
	function viewAkcExact(prodId) {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";

		//parameters
		var sn = "product";	//검색 볼륨
		var q = "pid^"+prodId;	//검색어

		var parameters = { sn:sn, q:q };
		var HTML = "";

		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {
					if(data.result[0].prod_type != "10"){ 
					HTML +='<span class="txt_category">['+data.result[0].catename1+']</span>\n';
					HTML +='<a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId='+data.result[0].prod_id+'" target="_blank"><span class="txt_title">'+data.result[0].prod_name+'</span></a>\n';
					HTML +='<div class="thumb_left_big">\n';
					HTML +='	<a href="/front/product/detailProduct.do?prodId='+data.result[0].prod_id+'" target="_blank">\n';
					HTML +='	<img src="http://image.bandinlunis.com/upload'+data.result[0].prod_img+'" onerror="this.src=\'/images/common/noimg_type01.gif\'" >\n';
					HTML +='	</a>\n';
					HTML +='</div>\n';
					HTML +='<dl class="select_product">\n';
					HTML +='<dd><span class="info"><span class="first_child">'+data.result[0].author+'</span><span>'+data.result[0].maker+'</span></span></dd>\n';
					HTML +='<dd>'+data.result[0].pdate.substring(0,4)+'년 '+data.result[0].pdate.substring(4,6)+'월</dd>\n';
					HTML +='<dd><div class="review_point"><span style="width:'+(data.result[0].review_avg*10)+'%"></span></div></dd>\n';
					HTML +='<dd><span class="txt_price"><span class="txt_sale">'+FormatNumber(data.result[0].price1)+'원</span> → <strong>'+FormatNumber(data.result[0].price2)+'</strong>원</span></dd>\n';
					HTML +='<dd><span class="txt_price">(<em>'+data.result[0].discount_rate+'%</em>↓ + <em>'+data.result[0].save_rate+'%</em>P)</span></dd>\n';
					HTML +='</dl>\n';
					HTML +='<div class="btn_select_area">\n';
					if(data.result[0].prod_type == "01") {
						HTML +='	<span class="btn_type brown"><a href="javascript:addCart('+data.result[0].prod_id+');">쇼핑카트</a></span>\n';
					}else if(data.result[0].prod_type == "06") {
						HTML +='	<span class="btn_type brown"><a href="javascript:add_basket_ebook('+data.result[0].prod_id+',1);">쇼핑카트</a></span>\n';
					}
					if(data.result[0].p_book_price != "") {
						if(data.result[0].prod_type == "01") {
							HTML +='	<span class="btn_type white"><a href="/front/product/detailProduct.do?prodId='+data.result[0].p_book_price.split("\|")[0]+'" target="_blank">이 책의 eBook</a></span>\n';
						}else if(data.result[0].prod_type == "06") {
							HTML +='	<span class="btn_type white"><a href="/front/product/detailProduct.do?prodId='+data.result[0].p_book_price.split("\|")[0]+'" target="_blank">이 책의 종이책</a></span>\n';
						}
					}
					HTML +='</div>\n';
					}
	
				}catch(e) {
					HTML = "";
				}
			},
			complete: function(){
				$("#AREA_AKC_EXACT").html(HTML);
			},
			error: function(){
			}
		});
	}

	//타입별 텍스트 return
	function DispProdType(val){

		var str = "";
		
		if(val === "01")		str = "도서";
		else if(val === "02")	str = "도서";
		else if(val === "03")	str = "음반";
		else if(val === "04")	str = "GIFT";
		else if(val === "05")	str = "중고샵";
		else if(val === "06")	str = "eBook";
		else if(val === "07")	str = "DVD";
		else if(val === "08")	str = "해외주문도서";
		else if(val === "09")	str = "중고샵";
		else if(val === "11")	str = "뷰티";
		else if(val === "12")	str = "오피스문구";
		else 					str = "통합검색";

		return str;
	}

	//자동완성 키워드 선택시
	function akcChangeKwd(idx) {
		$("#sch_keyword").val($(".akc_hidden_words").eq(idx).val());
		$("#searchForm").submit();		
	}

	//하이라이팅 태그 삭제
	function EraseHighlightingTag(val) {
		var str = val.replace("<em class= 'emph_on'>","").replace("</em>","").replace("<em class= 'emph_on'>","").replace("</em>","").replace("<em class= 'emph_on'>","").replace("</em>","").replace("<em class= 'emph_on'>","").replace("</em>","").replace("<em class= 'emph_on'>","").replace("</em>","");
		return str;
	}

	//이미지 마우스오버시 새창열기 노출
	function onImage(val) {
		$("#blank_link_"+val).show();
	}

	//이미지 마우스아웃시 새창열기 제거
	function outImage(val) {
		$("#blank_link_"+val).hide();
	}

	//예약 태그
	function DispPreSaleYn(val){
		var str = "";
		if(val === "Y") {
			str = '<span class="tag_reser"><span>예약</span></span>';
		}
		return str;
	}

	//베스트 태그
	function DispBestYn(val){
		var str = "";
		if(val === "Y") {
			str = '<span class="tag_best"><span>베스트</span></span>';
		}
		return str;
	}

	//반디추천 태그
	function DispBandiYn(val){
		var str = "";
		if(val === "Y") {
			str = '<span class="tag_recom"><span>반디 추천</span></span>';
		}
		return str;
	}

	//해외구매 태그
	function DispOverseaYn(val, prodType){
		var str = "";
		if(val === "Y" && prodType === "03") {
			str = '<span class="tag_global"><span>해외 구매</span></span>';
		}
		return str;
	}

	//추가적립 태그
	function DispAddPointYn(val, prodType){
		var str = "";
		if(val === "Y" && (prodType === "04" || prodType === "11")) {
			str = '<span class="tag_bonus"><span>추가 적립</span></span>';
		}
		return str;
	}

	//무료배송 태그
	function DispFreeDeliYn(val, prodType){
		var str = "";
		if(val === "Y" && (prodType === "01" || prodType === "03" || prodType === "04" || prodType === "11")) {
			str = '<span class="tag_free"><span>무료 배송</span></span>';
		}
		return str;
	}

	//쿠폰 태그
	function DispCouponiYn(val, prodType){
		var str = "";
		if(val === "Y" && (prodType === "04" || prodType === "11")) {
			str = '<span class="tag_coupon"><span>쿠폰</span></span>';
		}
		return str;
	}
	
	//정가제 Free 태그
	function DispPriceFree(val, prodType){
		var pVal = "";
		var str = "";
		if(val.length > 0)
			pVal = val.trim().substr(0,5);
		
		if(pVal.length > 0 && pVal != "97889" && pVal != "97911" && prodType == "01") {
			str = '<span class="tag_price_free"><span>정가제 Free</span></span>';
		}
		return str;
	}

	//카운트 증가
	function cntUp(prodId, prodSaleStd) {
		if(prodSaleStd == "03") {
			alert("이 상품은 재고가 한정되어 있는 상품입니다. 쇼핑카트에 담으신 후 수량을 조절 해주시기 바랍니다.");
			return;
		}else {
			var ordCnt = parseInt($("#cntVal_"+prodId).val(),10);
			if(isNaN(ordCnt)) {
				ordCnt = 1;
			}else {
				ordCnt++;
			}
			if(ordCnt > 99) {
				alert("최대 수량입니다.");
				ordCnt = 99;
			}
			$("#cntVal_"+prodId).val(ordCnt);
		}
	}

	//카운트 감소
	function cntDown(prodId, prodSaleStd) {
		if(prodSaleStd == "03") {
			alert("이 상품은 재고가 한정되어 있는 상품입니다. 쇼핑카트에 담으신 후 수량을 조절 해주시기 바랍니다.");
			return;
		}else {
			var ordCnt = parseInt($("#cntVal_"+prodId).val(),10);
			if(isNaN(ordCnt)) {
				ordCnt = 1;
			}else {
				ordCnt--;
			}
			if(ordCnt < 1) {
				alert("최소 수량입니다.");
				ordCnt = 1;
			}
			$("#cntVal_"+prodId).val(ordCnt);
		}
	}

	//쇼핑카트
	function addCart(prodId) {
		var ordCnt = $("#cntVal_"+prodId).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		add_basket(prodId, ordCnt);
	}
	
	//바로구매
	function goOrder(prodId) {
		var ordCnt = $("#cntVal_"+prodId).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		goBuyOpt(prodId, ordCnt, 0);
	}

</script>
</head>
<body class="vsc-initialized" style="">
	<article id="bandiWrap"> 
	<jsp:include page="../search/header.jsp" flush="false"/>
	<script type="text/javascript">
	if(window.location.protocol == 'https:'){
		window.location.href = window.location.href.replace('https:','http:');

	}
</script>
	<div class="min_height">
		<!-- 컨텐츠 영역 -->
		<article id="bandiContainer" style=""> <!-- 상단 검색 키워드 영역 -->
		<!-- 검색 결과 값 영역 -->
		<div id="topResult">
			<div class="search_data">
				<p id="AREA_TOTAL">
					<em class="emph_on">'설거지'</em>(으)로 통합검색 <em class="emph_on">30</em>건
					검색
				</p>
			</div>
			<div class="search_wrap" style="display: none;">
				<div class="search_keyword" style="display: none;">
					<h3 class="search_tit">추천 검색어</h3>
					<ul class="search_lst" id="AREA_E_1"></ul>
				</div>
				<div class="search_keyword" style="display: none;">
					<h3 class="search_tit">연관 키워드</h3>
					<ul class="search_lst" id="AREA_E_2"></ul>
				</div>
			</div>
		</div>
		<!-- 검색 결과 값 영역 -->
		<div id="resultWrap">
			<!-- 좌측 사이드 영역 -->
			<aside id="asideWrap">
			<div class="side_box">
				<ul class="depth1">
					<li class="opened">
						<ul class="total_category" id="AREA_C_1">
							<li class="first_child">
								<div class="stit on" id="left_cate_grp_">
									<a href="javascript:goSearchCate('');" class="stit_more"><em>전체</em>
										<span>(22)</span></a>
								</div>
							</li>
							<li>
								<ul class="book_category" id="book_category_01"
									style="display: none;">
									<li class=""><a href="javascript:goSearchCate('01_3');">시/에세이/기행<span>
												(4)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('01_22');">컴퓨터/it<span>
												(1)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('01_3137');">육아/자녀교육<span>
												(1)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('01_8');">경제/경영<span>
												(1)</span></a></li>
								</ul>
								<div class="stit " id="left_cate_grp_01">
									<a href="javascript:showCateGrp('01');" class="btn_more"></a> <a
										href="javascript:goSearchCate('01');" class="stit_more"><em>국내도서</em>
										<span>(7)</span></a>
								</div>
							</li>
							<li>
								<div class="btn_sub_area">
									<a href="javascript:showMoreCate('06');" class="btn_sub_more"
										id="book_category_sub_06" style="display: block;">더보기</a>
								</div>
								<ul class="book_category" id="book_category_06" style="">
									<li class=""><a href="javascript:goSearchCate('06_5716');">시/에세이/기행<span>
												(2)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('06_5719');">종교/역학<span>
												(1)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('06_5722');">자기계발<span>
												(1)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('06_5727');">어린이<span>
												(1)</span></a></li>
									<li class=""><a href="javascript:goSearchCate('06_3740');">로맨스소설<span>
												(1)</span></a></li>
									<li class="book_category_sub_06 " style="display: none;"><a
										href="javascript:goSearchCate('06_5715');">소설<span>
												(1)</span></a></li>
									<li class="book_category_sub_06 " style="display: none;"><a
										href="javascript:goSearchCate('06_5732');">만화<span>
												(1)</span></a></li>
									<li class="book_category_sub_06 " style="display: none;"><a
										href="javascript:goSearchCate('06_5870');">ebook<span>
												(1)</span></a></li>
								</ul>
								<div class="stit " id="left_cate_grp_06">
									<a href="javascript:showCateGrp('06');" class="btn_more"
										style="display: none;"></a> <a
										href="javascript:goSearchCate('06');" class="stit_more"><em>eBook</em>
										<span>(9)</span></a>
								</div>
							</li>
							<li>
								<ul class="book_category" id="book_category_04"
									style="display: none;">
									<li class=""><a href="javascript:goSearchCate('04_4151');">키친/식품<span>
												(3)</span></a></li>
								</ul>
								<div class="stit " id="left_cate_grp_04">
									<a href="javascript:showCateGrp('04');" class="btn_more"></a> <a
										href="javascript:goSearchCate('04');" class="stit_more"><em>GIFT</em>
										<span>(3)</span></a>
								</div>
							</li>
							<li>
								<ul class="book_category" id="book_category_12"
									style="display: none;">
									<li class=""><a href="javascript:goSearchCate('12_7566');">생활용품<span>
												(3)</span></a></li>
								</ul>
								<div class="stit " id="left_cate_grp_12">
									<a href="javascript:showCateGrp('12');" class="btn_more"></a> <a
										href="javascript:goSearchCate('12');" class="stit_more"><em>오피스문구</em>
										<span>(3)</span></a>
								</div>
							</li>
						</ul>
					</li>
					<li class="opened">
						<dl class="list_style" id="filterSet">
							<dt>더 자세히</dt>
							<dd>
								<fieldset>
									<legend>필터 검색</legend>
									<div class="bbox2">
										<div class="window_wrap2">
											<input type="text" title="검색" id="sch_keyword_filter"
												maxlength="255" class="box_window2" accesskey="s"
												autocomplete="off" value="설거지"
												onkeypress="if(event.keyCode==13){goSearchFilterSub();}">
											<button type="submit" id="btn_search_filter"
												class="btn_search2">
												<span class="ir_wa">검색</span>
											</button>
										</div>
									</div>
								</fieldset>
							</dd>
							<dd id="filter_pnm">
								<input id="pnm" type="checkbox" value="pnm" title="제목/ISBN"><label
									for="pnm">제목/ISBN</label>
							</dd>
							<dd id="filter_atr">
								<input id="atr" type="checkbox" value="atr" title="저자/역자"><label
									for="atr">저자/역자</label>
							</dd>
							<dd id="filter_mkr">
								<input id="mkr" type="checkbox" value="mkr" title="출판사"><label
									for="mkr">출판사</label>
							</dd>
							<dd id="filter_cdn">
								<input id="cdn" type="checkbox" value="cdn" title="서평 내용"><label
									for="cdn">서평 내용</label>
							</dd>
							<dd id="filter_tgl">
								<input id="tgl" type="checkbox" value="tgl" title="태그"><label
									for="tgl">태그</label>
							</dd>
						</dl>
					</li>
					<li class="opened" id="filterSet_music" style="display: none;">
						<dl class="list_style">
							<dt>음반 카탈로그 NO.</dt>
							<dd>
								<fieldset>
									<legend>필터 검색</legend>
									<div class="bbox2">
										<div class="window_wrap2">
											<input type="text" title="검색" id="sch_keyword_music"
												maxlength="255" class="box_window2" accesskey="s"
												autocomplete="off" value="설거지"
												onkeypress="if(event.keyCode==13){goSearchFilterSub();}">
											<button type="submit" id="btn_search_music"
												class="btn_search2">
												<span class="ir_wa">검색</span>
											</button>
										</div>
									</div>
								</fieldset>
							</dd>
						</dl>
					</li>
					<li class="opened">
						<dl class="list_style">
							<dt class="tit_slider">출간일</dt>
							<dd class="date">
								<div id="slider-range-pdate"
									class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
									<div class="ui-slider-range ui-widget-header ui-corner-all"
										style="left: 0%; width: 100%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0" style="left: 0%;"></span><span
										class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0" style="left: 100%;"></span>
								</div>
								<span class="icon_slider gage1">최근</span> <span
									class="icon_slider gage2">3개월</span> <span
									class="icon_slider gage3">6개월</span> <span
									class="icon_slider gage4">9개월</span> <span
									class="icon_slider gage5">전체</span> <input type="hidden"
									id="slider-range-pdate1" value="0"> <input
									type="hidden" id="slider-range-pdate2" value="12">
							</dd>
							<dd class="dash"></dd>
							<dt class="tit_slider">가격대</dt>
							<dd class="price">
								<div id="slider-range-price"
									class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
									<div class="ui-slider-range ui-widget-header ui-corner-all"
										style="left: 0%; width: 100%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0" style="left: 0%;"></span><span
										class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0" style="left: 100%;"></span>
								</div>
								<span class="icon_slider gage1">0</span> <span
									class="icon_slider gage2">1만</span> <span
									class="icon_slider gage3">3만</span> <span
									class="icon_slider gage4">5만</span> <span
									class="icon_slider gage5">최대</span>
								<div class="item">
















									<input type="text" id="slider-range-price1" value="0" name=""
										title="최저가격" class="i_text" readonly="readonly"> - <input
										type="text" id="slider-range-price2" value="999000" name=""
										title="최고가격" class="i_text" readonly="readonly">
								</div>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			</aside>

			<!-- 메인 섹션 영역 -->
			<section id="mainSection"> <!-- 검색 옵션 영역 -->
			<div class="search_option">
				<div class="select_left">
					<span class="info"><span class="first_child"><a
							href="#AREA_G_2" id="PRODUCT_TOTAL">상품 [22]</a></span><span><a
							href="#AREA_G_3_1" id="TODAY_TOTAL">오늘의 책 [7]</a></span><span><a
							href="#AREA_G_3_2" id="THEME_TOTAL">테마북 [1]</a></span></span>
				</div>
				<!-- 우측 셀렉트 영역 -->
				<div id="AREA_D">
					<select id="sch_sort" class="inp_opt">
						<option value="" selected="">정확도 높은 순</option>
						<option value="pt">발행일 최신 순</option>
						<option value="st">판매량 많은 순</option>
						<option value="ra">평점 높은 순</option>
						<option value="rt">리뷰 많은 순</option>
						<option value="drt">할인율 순</option>
						<option value="scta">가격 순</option>
					</select> <select id="sch_listSize" class="inp_opt">
						<option value="20" selected="">20개씩</option>
						<option value="50">50개씩</option>
						<option value="100">100개씩</option>
					</select> <select id="sch_viewType" class="inp_opt">
						<option value="view_type" selected="">자세히</option>
						<option value="view_type_simple">간단히</option>
					</select> <span class="soldout"> <input id="pb1" type="checkbox"
						value="Y" title="품절 제외"><label for="pb1">품절 제외</label>
					</span>
				</div>
				<!--// 우측 셀렉트 영역 -->
			</div>
			<!--// 검색 옵션 영역 --> 
			<!-- 작가 소개 영역 -->
			<div class="info_writer" id="AREA_G_1" style="display: none;"></div>
			<!--// 작가 소개 영역 --> <!-- 시리즈 영역 -->
			<div class="info_serise" id="AREA_C_3_A" style="display: none;">
				<dl class="list_style2" id="AREA_C_3_1"></dl>
			</div>
			<!--// 시리즈 영역 --> 
			<!-- 수상작 영역 -->
			<div class="info_serise" id="AREA_C_3_B" style="display: none;">
				<dl class="list_style2" id="AREA_C_3_2"></dl>
			</div>
			<!--// 수상작 영역 --> 
			
			<!-- 검색 리스트 시작 -->

			<div class="view_type" id="AREA_G_2">
				<c:forEach var="dto" items="${searchBook }">
				<ul>
					<li> 
						<div class="thumb_area" onmouseover="onImage(4109026);"
							onmouseout="outImage(4109026);">
							<div class="thumb_left_big">
								<a href="/front/product/detailProduct.do?prodId=4109026"> 
								<img src="<%=cp%>/resources/image/book/${dto.bookImage}"	onerror="this.src='/images/common/noimg_type01.gif'">
								
								
								</a>
							</div>
							<div class="btn_popup">
								<a href="/front/product/detailProduct.do?prodId=4109026"
									class="btn_new" id="blank_link_4109026" target="_blank"
									style="display: none;"><span class="ico_new">새창열기</span></a>
							</div>
						</div>
						
						<dl class="book_contents">
							<dt>
								<a href="/front/product/detailProduct.do?prodId=4109026"><span
									class="tit_category"></span>${dto.bookTitle }</a> <span class="tit_sub">-
									${dto.subTitle }</span>
								<div class="tag_area">
									<span class="tag_recom"><span>반디 추천</span></span><span
										class="tag_free"><span>무료 배송</span></span>
								</div>
							</dt>
							<dd class="txt_block">
								<span class="info"><span class="author first_child">
										<a href="#" onclick="javascript:changeKwd('${dto.authorName}');">${dto.authorName }</a> 저
								</span><span class="publisher"><a href="#"
										onclick="javascript:changeKwd('${publisher }');">${publisher }</a></span><span
									class="pubdate">${dto.publishDate }</span></span>
							</dd>
							<dd class="txt_price">
								<p>
									<span>${dto.bookPrice }</span> → <strong><em>${dto.bookPrice *0.9 }</em>원</strong> (<em>10%</em>할인
									+ <em>5%</em>포인트)
								</p>
							</dd>
							<dd class="txt_desc">
								<div class="review_point">
									<span style="width: 0%"></span>
								</div>
							</dd>
						</dl>
						<dl class="btn_area">
							<dt>
								<input id="" type="checkbox" class="checkbox" value="4109026"
									title="선택"><span class="num_txt">수량</span><input
									type="text" id="cntVal_4109026" value="1" class="num" size="3"
									maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
									class="btn_updn_wrap"><a
									href="javascript:cntUp('4109026','01');" class="btn_num_up">▲</a><a
									href="javascript:cntDown('4109026','01');" class="btn_num_dn">▼</a></span>
							</dt>
							<dd>
								<span class="btn_type brown"><a
									href="javascript:addCart(4109026);">쇼핑카트</a></span>
							</dd>
							<dd>
								<span class="btn_type white"><a
									href="javascript:goOrder(4109026);">바로구매</a></span>
							</dd>
							<dd>
								<span class="btn_type white"><a
									href="javascript:add_wish_array_common(4109026, true);">위시리스트</a></span>
							</dd>
						</dl>
					</li>					
				</ul>
				</c:forEach>
			</div>



			<!-- //검색 리스트 --> <!-- 하단 버튼 영역-->
			<div class="btn_under" style="">
				<a href="javascript:addWishes();" class="wishlist">위시리스트 담기</a> <a
					href="javascript:addCarts();" class="bookcart">선택 쇼핑카트 담기</a> <span
					class="check_all"> <input id="pb2" type="checkbox" value=""
					title="전체"><label for="pb2">전체</label>
				</span>
			</div>
			<!--// 하단 버튼 영역--> <!-- 페이징 영역 -->
			<div class="paging" id="AREA_G_2_PAGE">
				<a href="/search/search.do" onclick="pageMove(0); return false;"
					class="on">1</a><a href="/search/search.do"
					onclick="pageMove(1); return false;" class="">2</a><a
					href="/search/search.do" onclick="goNextPage(); return false;"
					class="next">next</a>
			</div>
			<!--// 페이징 영역 --> 
			 </section>
		</div>
		</article>
	</div>
	<!-- 에스크로확인 --> 
<script type="text/javascript">
function go_check(){
		with(document.shop_check){
			var status  = "width=500 height=450 menubar=no,scrollbars=no,resizable=no,status=no";
			var obj     = window.open('', 'kcp_pop', status);
			method = "post";
			target = "kcp_pop";
			action = "http://admin.kcp.co.kr/Modules/escrow/kcp_pop.jsp";
			submit();
		}
	}
</script> <!-- WISELOG ONLINE TRACKING SCRIPT CODE START --> <script
		type="text/javascript">
document.write(unescape("%3Cscript src='/js/wiselog/wlo.js' type='text/javascript'%3E%3C/script%3E"));
</script>
	<script src="/js/wiselog/wlo.js" type="text/javascript"></script> <script
		type="text/javascript">
_n_sid = "10081000153";
_n_uid_cookie = "MEM_ID";
_n_uid_val = "";
n_logging();
</script> <!-- WISELOG ONLINE TRACKING SCRIPT CODE END --> <!-- adinsight 공통스크립트 start -->
	<script type="text/javascript">
var TRS_AIDX = 2402;
var TRS_PROTOCOL = document.location.protocol;
document.writeln();
var TRS_URL = TRS_PROTOCOL + '//' + ((TRS_PROTOCOL=='https:')?'analysis.adinsight.co.kr':'adlog.adinsight.co.kr') +  '/emnet/trs_esc.js';
document.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
</script> <script language="javascript"
		src="http://adlog.adinsight.co.kr/emnet/trs_esc.js"></script> <!-- adinsight 공통스크립트 end -->

	<!-- 네이버 공통유입 스크립트 start --> <script type="text/javascript">
	if(!wcs_add)	var wcs_add = {};
	wcs_add["wa"] = "s_5a299784e479";
	wcs_do();
</script> <!-- 네이버 공통유입 스크립트 end --> <!-- 이지웰 아이프레임 리사이징 start --> <script
		type="text/javascript">

</script> <!-- 이지웰 아이프레임 리사이징 end --> <img id="RECOMMEND_LOGGING"
		style="display: none;"> <!--// 푸터 영역 --> </article>






	<script type="text/javascript">
$(document).ready(function(){
	
	/* onLoad */
	if(initKwd != "") {
		goSearch(0);
	}
	//상세검색용
	var detailKwd = "";
	if(detailKwd != "") {
		gKwd = detailKwd;
		SCH_API_search_group();	//상품검색 카테고리별 결과 수
		SCH_API_search(0);	//상품검색
		
		var dtSplit = detailKwd.split(',');
		$.each(dtSplit, function(index, value){
			if(value.indexOf('pnm^') > -1 || value.indexOf('atr^') > -1 || value.indexOf('mkr^') > -1 ||
			   value.indexOf('cdn^') > -1 || value.indexOf('tgl^') > -1 ){
				var dtDetail =  value.split('^');
				$("input:checkbox[id='"+dtDetail[0]+"']").prop("checked", true);
				$("#sch_keyword_filter").val(dtDetail[1]);
			}
		});
	}
	/* onLoad */

	//필터검색
	$("#btn_search_filter").click(function(){
		goSearchFilterSub();
	});
	
	//필터검색
	$("#btn_search_music").click(function(){
		var kwd = $("#sch_keyword_music").val();
		
		if(kwd == "") {
			alert("검색어를 입력하세요.");
			return;
		}
		gKwd = initKwd+",cpi^"+kwd;
		
		$("#frm_o").val("0");
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val(gKwd);
		$("#searchForm").submit();
	});

	/* 품절제외, 자세히, 20개씩, 정확도순 */
	$("#pb1").click(function(){
		$("#frm_o").val("0");
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val("");
		
		if($("#pb1:checked").val() == "Y"){
			$("#frm_ps").val("01");
		}else{
			$("#frm_ps").val('');
		}
		$("#searchForm").submit();
	});
	$("#sch_viewType").change(function(){
		if(this.value == "view_type_simple") {
			$("#frm_v").val("s");
		}else {
			$("#frm_v").val("");
		}
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val("");
		$("#searchForm").submit();
	});
	$("#sch_listSize").change(function(){
		$("#frm_o").val("0");
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val("");
		$("#frm_l").val($(this).val());
		$("#searchForm").submit();
	});
	$("#sch_sort").change(function(){
		$("#frm_o").val("0");
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val("");
		$("#frm_s").val($(this).val());
		$("#searchForm").submit();
	});
	/* 품절제외, 자세히, 20개씩, 정확도순 */

	//모두선택
	$("#pb2").click(function(){
		$(".btn_area input[type=checkbox]").prop("checked", this.checked);
	});

	//좌측 출간일 슬라이더
	$("#slider-range-pdate").slider({
		range: true,
		min: 0,
		max: 12,
		values: [ 0, 12 ],
		step: 3,
		slide: function( event, ui ) {
			$("#slider-range-pdate1").val(ui.values[0]);
			$("#slider-range-pdate2").val(ui.values[1]);
			$("#frm_sp1").val(ui.values[0]);
			$("#frm_sp2").val(ui.values[1]);
			
			goSearchFilterSub('slider');
		}
	});

	//좌측 가격 슬라이더
	$("#slider-range-price").slider({
		range: true,
		min: -1,
		max: 7,
		values: [ -1, 7 ],
		step: 2,
		slide: function( event, ui ) {
			$("#frm_sp3").val(ui.values[0]);
			$("#frm_sp4").val(ui.values[1]);
			
			if(ui.values[0] == -1) {
				$("#slider-range-price1").val(0);
			}else if(ui.values[0] == 7){
				$("#slider-range-price1").val(FormatNumber(999000));
			}else {
				$("#slider-range-price1").val(FormatNumber(ui.values[0]*10000));
			}
			
			if(ui.values[1] == -1) {
				$("#slider-range-price2").val(0);
			}else if(ui.values[1] == 7) {
				$("#slider-range-price2").val(FormatNumber(999000));
			}else {
				$("#slider-range-price2").val(FormatNumber(ui.values[1]*10000));
			}
			goSearchFilterSub('slider');
		}
	});
	
	
	$("#header_search_btn").click(function(){
		var sch_prod_type = $("#frm_pt").val();
		if (sch_prod_type == "03" || sch_prod_type == "07"){
 			$("#frm_ps").val("01");
  			$("#frm_s").val("pt");
		}else{
 			$("#frm_ps").val("");
  			$("#frm_s").val("");
		}
		
		// 파라메터 초기화
		$("#frm_v").val("");
		$("#frm_l").val("20");
		$("#frm_o").val("0");
		$("#frm_ct").val("");
		$("#frm_dt").val("");
		$("#frm_pq").val("");
		$("#frm_sp1").val("0");
		$("#frm_sp2").val("12");
		$("#frm_sp3").val("-1");
		$("#frm_sp4").val("7");
		
		$("#searchForm").submit();
	});
	
});

	var initKwd = "설거지";

	//통합검색
	function goSearch(page) {
		SCH_API_suggest_spell();	//추천검색어
		SCH_API_suggest();			//연관키워드
		SCH_API_search_group();		//상품검색 카테고리별 결과 수
		SCH_API_search(page);		//상품검색
		SCH_API_search_series();	//시리즈검색
		SCH_API_search_award();		//수상작검색
		if(gProdType == "") {
			SCH_API_search_author();	//저자
			SCH_API_search_theme();		//테마북
		}
	}

	//카테고리별 검색
	function goSearchCate(val) {
		if(val.indexOf("_") > -1) {
			$("#frm_pt").val(val.split("\_")[0]);
			$("#frm_ct").val(val.split("\_")[1]);
		}else {
			$("#frm_pt").val(val);
			$("#frm_ct").val("");
		}
		$("#sch_keyword").val("설거지");
		$("#searchForm").submit();
	}

	//필터 검색 체크
	function goSearchFilterSub(type) {

		var kwd = $("#sch_keyword_filter").val();
		
		if(kwd == "") {
			if(type == 'slider'){
				goSearchFilter();
				return;
			}
			alert("검색어를 입력하세요.");
			return;
		}

		if($("#filterSet dd input:checked").size() === 0) {
			if(type == 'slider'){
				goSearchFilter();
				return;
			}
			alert("검색 항목을 선택하세요.");
			return;
		}

		gKwd_F = "";
		for(i=0;i<$("#filterSet dd input:checked").size();i++) {
			gKwd_F += ","+$("#filterSet dd input:checked").eq(i).val()+"^"+kwd;
		}

		goSearchFilter();
	}

	//필터 검색
	function goSearchFilter() {

		//가격대
		var price1 = parseInt($("#slider-range-price1").val().replace(",",""),0);
		var price2 = parseInt($("#slider-range-price2").val().replace(",",""),0);

		gKwd_S = "";
		
		if(price1 != 0 || price2 != 999000) {
			gKwd_S += ",pce^"+price1+"-"+price2;
		}

		//출간일
		var pdate1 = parseInt($("#slider-range-pdate1").val(),0);
		var pdate2 = parseInt($("#slider-range-pdate2").val(),0);
		
		if(pdate1 != 0 || pdate2 != 12) {

			var date1 = new Date(Date.parse(new Date()) - 1000 * 3600 * 24 * pdate1*30);
			var date2 = new Date(Date.parse(new Date()) - 1000 * 3600 * 24 * pdate2*30);

			var pdateFrom = "" + date2.getFullYear() + LPAD((date2.getMonth()+1),2,"0") + LPAD(date2.getDate(),2,"0");
			var pdateTo = "" + date1.getFullYear() + LPAD((date1.getMonth()+1),2,"0") + LPAD(date1.getDate(),2,"0");

			if(pdate2 == 12) {
				pdateFrom = "19700101";
			}

			gKwd_S += ",pdt^"+pdateFrom+"-"+pdateTo;
		}

		gKwd = initKwd + gKwd_F + gKwd_S;
		
		$("#frm_o").val("0");
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val(gKwd);
		$("#searchForm").submit();
	}

	//검색어 변경
	function changeKwd(kwd) {
		processing();
		$("#sch_keyword").val(kwd.trim());
		$("#searchForm").submit();
	}

	//추천 검색어
	function SCH_API_suggest_spell() {
		
		var apiUrl = "http://222.122.120.242:7570/ksf/api/suggest";
		
		//parameters
		var target = "spell";
		var term = gKwd;	//검색어
		var max_count = "10";	//요청건수
		
		var parameters = { target:target, term:term, max_count:max_count };
		var HTML = "";

		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {
					
					$.each(data, function(i,item) {
						HTML += '<li><a href="'+ActionChangeKwd(item)+'">'+item+'</a></li>';
					});
					if(data.length > 0) {
						$(".search_keyword").eq(0).show();
						$(".search_wrap").show();
					}
					
				}catch(e) {
					HTML = "";
				}
								
			},
			complete: function(){
				$("#AREA_E_1").html(HTML);
			},
			error: function(){
			}
		});

	}

	//연관 키워드
	function SCH_API_suggest() {
		
		var apiUrl = "http://222.122.120.242:7570/ksf/api/suggest";
		
		//parameters
		var target = "related";
		var domain_no = "0";	//0-전체
		var term = gKwd;	//검색어
		var max_count = "10";	//요청건수
		
		var parameters = { target:target, domain_no:domain_no, term:term, max_count:max_count };
		var HTML = "";

		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{
			
				try {
					
					$.each(data, function(i,item) {
						HTML += '<li><a href="'+ActionChangeKwd(item)+'">'+item+'</a></li>';
					});
					if(data.length > 0) {
						$(".search_keyword").eq(1).show();
						$(".search_wrap").show();
					}
					
				}catch(e) {
					HTML = "";
				}
			},
			complete: function(){
				$("#AREA_E_2").html(HTML);
			},
			error: function(){
			}
		});

	}
	
	function eBookRentalYn(prod_id,type){
		var str = "";
		var prodIdList = new Array();	
		
		$.ajax({
			url: "/ajax/getEbookRentalYnCheck.do",
			type: "post",
			data: {"prod_id":prod_id},
				success: function(data){ 
					var checkNum = data.trim();
					if(checkNum == prod_id){
						if(type == "s"){
							document.getElementById(prod_id).innerHTML = "[대여]";
						}else{
							document.getElementById(prod_id).innerHTML = "[대여]";
						}
					}else{
					} 
				},
					error: function(){ 
						alert("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); 
				}
			}); 
	}
	

	//상품검색
	function SCH_API_search(page) {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";

		//parameters
		var sn = "product";	//검색 볼륨
		var q = gKwd;	//검색어
		var s = $("#sch_sort").val();	//정렬방식(default:적합도)
		var l = $("#sch_listSize").val();	//요청건수(default:20)
		var o = page;	//오프셋(default:0)
		var pq = "";	//이전검색어
		var ud = "|||";	//사용자데이터(user_id|gender|age)
		var pt = gProdType;	//분야(03:음반,04:GIFT,07:DVD,11:뷰티)
		var ct = gCateId;	//카테고리
		var ps = "";
		var egp = "09,10";	//not in
		var inp = "";	//in
		
		
		
		if($("#pb1:checked").val() == "Y") {
			ps = "01";
			$("#frm_ps").val("01");
		}else{
			$("#frm_ps").val('');
		}
		
		//alert("sn:"+sn+", q:"+q+", s:"+s+", l:"+l+", o:"+o+", pq:"+pq+", ud:"+ud+", pt:"+pt+", ct:"+ct+", ps:"+ps);

		var parameters = { sn:sn, q:q, s:s, l:l, o:o, pq:pq, ud:ud, pt:pt, ct:ct, ps:ps, egp:egp, inp:inp};
		var HTML = "";
		var pHTML = "";

		processing();
		productTotal = 0;
		
		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {

					if("" == "s") {	//간단히보기
	
						$.each(data.result, function(i,item) {
	
							if((i+1)%4 == 1) {
								HTML += '<ul class="view_type_simple">\n';
							}
	
							HTML += '<li>\n';
							HTML += '	<div class="this_select"><input id="" type="checkbox" class="checkbox" value="'+item.prod_id+'" title="선택"></div>\n';
							HTML += '	<div class="thumb_area" onmouseover="onImage('+item.prod_id+');" onmouseout="outImage('+item.prod_id+');">\n';
							HTML += '		<div class="thumb_left_big">\n';
							HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'">\n';
							
							if(item.prod_type != "07"){
								if(item.min_buy_age == "19" && "" != "Y") {
									HTML += '			<img src="http://image.bandinlunis.com/images/common/bookImg_19.gif" alt="">\n';
								}else {
									HTML += '			<img src="http://image.bandinlunis.com/upload'+item.prod_img+'" onerror="this.src=\'/images/common/noimg_type01.gif\'">\n';
								}
							}else{
									HTML += '			<img src="http://image.bandinlunis.com/upload'+item.prod_img+'" onerror="this.src=\'/images/common/noimg_type01.gif\'">\n';
							}
							HTML += '			</a>\n';
							HTML += '			<div class="btn_popup">\n';
							HTML += '				<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'" class="btn_new" id="blank_link_'+item.prod_id+'" target="_blank" style="display:none;"><span class="ico_new">새창열기</span></a>\n';
							HTML += '			</div>\n';
							HTML += '		</div>\n';
							HTML += '	</div>\n';
							HTML += '	<dl class="t_book_contents">\n';
							HTML += '		<dt>\n';
							if(item.prod_type === "05" || item.prod_type === "09") {
								HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category point_o">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span> <strong>'+item.prod_name+'</strong></a>\n';								
							}else{
								if(item.bandi_deli_yn == 1 && item.prod_type =="11"){
									HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category">[뷰티]</span> <strong>'+item.prod_name+'</strong></a>\n';																	
								}else if(item.prod_type =="06"){
									eBookRentalYn(item.prod_id, '');
									HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span><strong><span id="'+item.prod_id+'"></span>'+item.prod_name+'</strong></a>\n';
								}else if (item.prod_type == "07"){
									
									HTML += '	<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'">';
									
									if(item.dvd_type == "DVD"){
										HTML += '<span class="tit_category">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span>';
									}else{
										if(item.bundle_yn=='Y'){
											HTML += '<span class="tit_category">['+'묶음'+']</span>';
										}else{
											HTML += '<span class="tit_category">['+'블루레이'+']</span>';
										}
									}
									
									if(item.store_id != "1" ){
										HTML +='<span>[업체배송] </span>';
									}
 									
									if(EraseHighlightingTag(item.prod_name).substring(0,6) == "[블루레이]"){
										HTML += '<strong>'+item.prod_name.replace("[", "").replace("블루레이", "").replace("] ", "")+'</strong></a>\n';
 								
 									}else{
										HTML +='<strong>'+item.prod_name+'</strong></a>\n';	
									} 
								}
								else{
									HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span> <strong>'+item.prod_name+'</strong></a>\n';								
								}
							}
							HTML += '		</dt>\n';
							HTML += '		<dd class="txt_block">\n';
							HTML += '			'+SplitActor(item.author)+' 저 | <a href="#" onClick="'+ActionChangeKwd(item.maker)+'">'+item.maker+'</a>\n';
							HTML += '		</dd>\n';
							HTML += '		<dd class="txt_price"><span>'+FormatNumber(item.price1)+'원</span> → <strong><em>'+FormatNumber(item.price2)+'</em>원</strong></dd>\n';
							HTML += '		<dd class="txt_price">(<em>'+item.discount_rate+'%</em>할인 + <em>'+item.save_rate+'%</em>포인트)</dd>\n';
							HTML += '		<dd class="tag_area">'+DispPreSaleYn(item.pre_sale_yn)+DispBestYn(item.best_yn)+DispBandiYn(item.bandi_yn)+DispOverseaYn(item.oversea_yn,item.prod_type)+DispFreeDeliYn(item.free_deli_yn,item.prod_type)+DispCouponiYn(item.coupon_yn,item.prod_type)+DispAddPointYn(item.promo_cost,item.prod_type)+DispPriceFree(item.barcode,item.prod_type)+'</dd>\n';
							if(item.preview_cnt != "0") {
								HTML += '		<dd><a href="javascript:popPreview('+item.prod_id+');" class="btn_preview">미리 보기</a></dd>\n';
							}
							HTML += '	</dl>\n';
							HTML += '</li>\n';
							
							if((i+1)%4 == 0) {
								HTML += '</ul>\n';
							}
							
						});
	
					}else {
		
						HTML += '<ul>\n';
		
						$.each(data.result, function(i,item) {
		
							HTML += '<li>\n';
							if(item.prod_type == "01" || item.prod_type == "06") {
								HTML += '	<div class="thumb_area" onmouseover="onImage('+item.prod_id+');" onmouseout="outImage('+item.prod_id+');">\n';
							}else {
								HTML += '	<div class="thumb_area product" onmouseover="onImage('+item.prod_id+');" onmouseout="outImage('+item.prod_id+');">\n';
							}
							HTML += '		<div class="thumb_left_big">\n';
							HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'">\n';						
							
							if(item.prod_type != "07"){
								if(item.min_buy_age == "19" && "" != "Y") {
									HTML += '			<img src="http://image.bandinlunis.com/images/common/bookImg_19.gif" alt="">\n';
								}else {
									HTML += '			<img src="http://image.bandinlunis.com/upload'+item.prod_img+'" onerror="this.src=\'/images/common/noimg_type01.gif\'">\n';
								}
							}else{
									HTML += '			<img src="http://image.bandinlunis.com/upload'+item.prod_img+'" onerror="this.src=\'/images/common/noimg_type01.gif\'">\n';
							}
							
							HTML += '			</a>\n';
							HTML += '		</div>\n';
							HTML += '		<div class="btn_popup">\n';
							HTML += '		<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'" class="btn_new" id="blank_link_'+item.prod_id+'" target="_blank" style="display:none;"><span class="ico_new">새창열기</span></a>\n';
							if(item.preview_cnt != "0") {	//미리보기
								HTML += '		<a href="javascript:popPreview('+item.prod_id+');" class="btn_preview" id="preview_link_'+item.prod_id+'"><span class="ico_preview">미리 보기</span></a>\n';
							}else if(item.prod_type == "04" || item.prod_type == "11") {	//크게보기
								HTML += '		<a href="javascript:goZoomProduct('+item.prod_id+');" class="btn_large"><span class="ico_large">미리 보기</span></a>\n';
							}
							HTML += '		</div>\n';
							HTML += '	</div>\n';
							HTML += '	<dl class="book_contents">\n';
							HTML += '<dt>\n';
							if(item.prod_type === "05" || item.prod_type === "09") {
								HTML += '	<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category point_o">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span><strong>'+item.prod_name+'</strong></a>\n';																
							}else{
								if(item.bandi_deli_yn == 1){
									HTML += '	<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category">[뷰티]</span><strong>'+item.prod_name+'</strong></a>\n';																	
								}else if(item.prod_type === "06"){
									eBookRentalYn(item.prod_id, "");
									HTML += '	<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span><strong><span id="'+item.prod_id+'"></span>'+item.prod_name+'</strong></a>\n';
								}else if (item.prod_type == "07"){

									HTML += '	<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'">';
									
									if(item.dvd_type == "DVD"){
										HTML += '<span class="tit_category">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span>';
									}else{
										if(item.bundle_yn=='Y'){
											HTML += '<span class="tit_category">['+'묶음'+']</span>';
										}else{
											HTML += '<span class="tit_category">['+'블루레이'+']</span>';
										}
									}
									
									if(item.store_id != "1" ){
										HTML +='<span>[업체배송] </span>';
									}
									
 									if(EraseHighlightingTag(item.prod_name).substring(0,6) == "[블루레이]"){
										HTML += '<strong>'+item.prod_name.replace("[", "").replace("블루레이", "").replace("] ", "")+'</strong></a>\n';
 								
 									}else{
										HTML +='<strong>'+item.prod_name+'</strong></a>\n';	
									} 
 									
									
								}else{
									HTML += '	<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'"><span class="tit_category">['+(item.bundle_yn=='Y'?'묶음':DispProdType(item.prod_type))+']</span><strong>'+item.prod_name+'</strong></a>\n';								
								}
							}
							if(item.buje != "") {
								HTML += '	<span class="tit_sub">- '+item.buje+(item.oneje===''?'':' (원제 : '+item.oneje+')')+'</span>\n';
							}
							HTML += '	<div class="tag_area">'+DispPreSaleYn(item.pre_sale_yn)+DispBestYn(item.best_yn)+DispBandiYn(item.bandi_yn)+DispOverseaYn(item.oversea_yn,item.prod_type)+DispFreeDeliYn(item.free_deli_yn,item.prod_type)+DispCouponiYn(item.coupon_yn,item.prod_type)+DispAddPointYn(item.promo_cost,item.prod_type)+DispPriceFree(item.barcode,item.prod_type)+'</div>\n';
							HTML += '</dt>\n';
							HTML += '	<dd class="txt_block">\n';
							//상품타입별 저자영역
							if(item.prod_type === "03") {
								HTML += '		<span class="info"><span class="author first_child">아티스트 : '+SplitActor(item.author)+'</span><span class="publisher"><a href="#" onClick="'+ActionChangeKwd(item.maker)+'">'+item.maker+'</a></span>'+(item.pdate.length>6?('<span class="pubdate">'+item.pdate.substring(0,4)+'년 '+item.pdate.substring(4,6)+'월</span>'):'')+'</span>\n';
							}else if(item.prod_type === "04" || item.prod_type === "11") {
								HTML += '		<span class="info"><span class="publisher"><a href="#" onClick="'+ActionChangeKwd(item.maker)+'">'+item.maker+'</a></span>'+(item.pdate.length>6?('<span class="pubdate">'+item.pdate.substring(0,4)+'년 '+item.pdate.substring(4,6)+'월</span>'):'')+'</span>\n';
							}else if(item.prod_type === "07") {
								HTML += '		<span class="info"><span class="author first_child">감독 : '+SplitActor(item.author)+'</span>'+(item.actor!=""?('<span class="translator">출연 : '+SplitActor(item.actor)+'</span>'):'')+'<span class="publisher"><a href="#" onClick="'+ActionChangeKwd(item.maker)+'">'+item.maker+'</a></span>'+(item.pdate.length>6?('<span class="pubdate">'+item.pdate.substring(0,4)+'년 '+item.pdate.substring(4,6)+'월</span>'):'')+'</span>\n';
							}else {
								HTML += '		<span class="info"><span class="author first_child">'+SplitActor(item.author)+' 저</span>'+(item.translator!=""?('<span class="translator"><a href="#" onClick="'+ActionChangeKwd(item.translator)+'">'+item.translator+'</a> 역</span>'):'')+'<span class="publisher"><a href="#" onClick="'+ActionChangeKwd(item.maker)+'">'+item.maker+'</a></span>'+(item.pdate.length>6?('<span class="pubdate">'+item.pdate.substring(0,4)+'년 '+item.pdate.substring(4,6)+'월</span>'):'')+'</span>\n';
							}
							HTML += '	</dd>\n';
							HTML += '	<dd class="txt_price"><p><span>'+FormatNumber(item.price1)+'원</span> → <strong><em>'+FormatNumber(item.price2)+'</em>원</strong> (<em>'+item.discount_rate+'%</em>할인 + <em>'+item.save_rate+'%</em>포인트)</p></dd>\n';
							HTML += '	<dd class="txt_desc">\n';
							HTML += '		<div class="review_point"><span style="width:'+(Math.round(item.review_avg*10))+'%"></span></div>\n';
							if(item.review_avg != "0") {
								HTML += '		<strong>'+item.review_avg+'</strong> \n';
							}
							if(item.review_total != "0") {
								HTML += '		<a href="/front/product/detailProduct.do?prodId='+item.prod_id+'#sub10" target="_blank">리뷰<em>('+FormatNumber(item.review_total)+')</em></a>\n';
							}
							HTML += '	</dd>\n';
							//부가정보
							if(item.ord_prod_id != "" && item.ord_prod_id != item.prod_id) {
								HTML += '	<dd class="txt_contents"><span class="tag_history">이력</span><a href="/front/product/detailProduct.do?prodId='+item.ord_prod_id+'" target="_blank"><em>[이 책의 개정판 보기]</em> '+item.prod_name+' NEW | '+item.author+' 저 | '+item.maker+' | '+item.pdate.substring(0,4)+'.'+item.pdate.substring(4,6)+'</a></dd>\n';
							}
							if(item.ssr_subject != "" || item.sar_subject != "") {
								HTML += '<dd class="txt_contents"><span class="tag_relation">연관</span>';
								if(item.ssr_subject != "") {
									HTML += '<a href="/front/product/bookSeriesView.do?prodRelSeq='+item.prod_rel_seq+'&listType=series&cateId='+item.cateid1+'" target="_blank"><em>[관련 시리즈]</em> '+item.ssr_subject+'</a>';
								}
								if(item.sar_subject != "") {
									HTML += '<a href="/front/display/recommendAward.do?recommendGrpSeq='+item.recommend_grp_seq+'" target="_blank"><em>[수상 이력]</em> ['+item.recommend_year+'년 '+item.sar_subject+'] 수상 </a>';
								}
								HTML += '</dd>\n';
							}
							if(item.appendix_desc != "" || item.gift_desc != "" || item.sep_subject != "") {
								HTML += '<dd class="txt_contents"><span class="tag_event">행사</span>';
								if(item.appendix_desc != "" || item.gift_desc != "") {
									HTML += '<a style="text-decoration:none;"><em>[사은품·부록]</em> '+item.appendix_desc+item.gift_desc+'</a>';
								}
								if(item.sep_subject != "") {
									HTML += '<a style="text-decoration:none;"><em>[관련 이벤트]</em> '+item.sep_subject+'</a>';
								}
								HTML += '</dd>\n';
							}
							if((item.discount_num != "" && item.discount_num != "0") || (item.promo_cost != "" && item.promo_cost != "0")) {
								HTML += '<dd class="txt_contents"><span class="tag_benefits">혜택</span>';
								if(item.discount_num != "" && item.discount_num != "0") {
									
									if(item.cpn_pay_type  =="01"){
										HTML += '<a style="text-decoration:none;"><em>[상품쿠폰]</em> '+FormatNumber(item.discount_num)+'% 쿠폰 사용 가능</a>';										
									}else{
										HTML += '<a style="text-decoration:none;"><em>[상품쿠폰]</em> '+FormatNumber(item.discount_num)+'원 쿠폰 사용 가능</a>';
									}
									
								}
								if(item.promo_cost != "" && item.promo_cost != "0") {
									HTML += '<a style="text-decoration:none;"><em>[추가적립]</em> 구매시 '+FormatNumber(item.promo_cost)+'원 추가적립</a>';
								}
								HTML += '</dd>\n';
							}
							if(item.prod_type == "06") {
								HTML += '	<dd class="txt_file">\n';
								if(item.weight > 0) {
									HTML += '<span>파일크기 : '+(Math.round(item.weight/1024/1024*100)/100)+'Mbyte</span>\n';
								}
								HTML += '<span>지원 기기 : '+item.ebook_equip+'</span></dd>\n';
							}
							
							if(item.prod_stat != "01" && !(item.prod_type == "03" && item.prod_stat == "06")) {
								HTML += '<dd class="txt_soldout"><span><strong>품절된 상품입니다.</strong></span></dd>';
							}
							
							//eBook vs 종이책
							if(item.p_book_price != "") {
								if(item.prod_type === "01") {
									HTML += '	<dd class="txt_ebook"><span><a href="/front/product/detailProduct.do?prodId='+item.p_book_price.split("\|")[0]+'" target="_blank">이 책의 eBook : <strong>'+FormatNumber(item.p_book_price.split("\|")[1])+'</strong>원</a></span></dd>\n';
								}else if(item.prod_type === "06") {
									HTML += '	<dd class="txt_ebook"><span><a href="/front/product/detailProduct.do?prodId='+item.p_book_price.split("\|")[0]+'" target="_blank">이 책의 종이책  : <strong>'+FormatNumber(item.p_book_price.split("\|")[1])+'</strong>원</a></span></dd>\n';
								}
							}
							
							HTML += '	</dl>\n';
							HTML += '	<dl class="btn_area">\n';
							if(item.prod_stat == "01") {
								HTML += '	<dt><input id="" type="checkbox" class="checkbox" value="'+item.prod_id+'" title="선택"><span class="num_txt">수량</span><input type="text" id="cntVal_'+item.prod_id+'" value="1" class="num" size="3" maxlength="2" onkeydown="onlyNumber();" onkeyup="" '+(item.prod_sale_std=='03'?'readOnly':'')+'><span class="btn_updn_wrap"><a href="javascript:cntUp(\''+item.prod_id+'\',\''+item.prod_sale_std+'\');" class="btn_num_up">▲</a><a href="javascript:cntDown(\''+item.prod_id+'\',\''+item.prod_sale_std+'\');" class="btn_num_dn">▼</a></span></dt>\n';
							}
							if(item.prod_stat == "01") {
								if(item.min_buy_age == "19" && "" != "Y"){
								}else{	
									if(item.prod_type === "06") {
										HTML += '	<dd><span class="btn_type brown"><a href="javascript:add_basket_ebook('+item.prod_id+',1);">쇼핑카트</a></span></dd>\n'
									}else{	
										HTML += '	<dd><span class="btn_type brown"><a href="javascript:addCart('+item.prod_id+');">쇼핑카트</a></span></dd>\n';
										
									}
								}
								if(item.prod_sale_std == "01") {
									HTML += '	<dd><span class="btn_type white"><a href="javascript:goOrder('+item.prod_id+');">바로구매</a></span></dd>\n';
								}
							}else {
								if(item.prod_type === "03" && item.prod_stat == "06") {
									HTML += '	<dd><span class="btn_type white"><a style="cursor:default;">미발매</a></span></dd>\n';
								}else{
									HTML += '	<dd><span class="btn_type white"><a style="cursor:default;">품절/절판</a></span></dd>\n';								
								}
							}
							HTML += '	<dd><span class="btn_type white"><a href="javascript:add_wish_array_common('+item.prod_id+', true);">위시리스트</a></span></dd>\n';
							HTML += '	</dl>\n';
							HTML += '</li>\n';
		
						});
		
						HTML += '</ul>\n';
					}
	
					productTotal = data.count;
					/* 페이징 */
					currentPage = page;
					var totPage = Math.ceil(productTotal/l);
					if(productTotal > 0) {
						if(page>0) {
							pHTML += '<a href="/search/search.do" onClick="goPrevPage(); return false;" class="prev">prev</a>';
						}
						//현제 페이지 기준으로 앞뒤10개 페이지 노출(10개 안되면 전부)
						var stPage = page-4;
						var edPage = page+5;
						if(totPage < 10) {
							stPage = 0;
							edPage = totPage-1;
						}else {
							if(stPage < 0) {
								stPage = 0;
								edPage = 9;
							}
							if(edPage > totPage) {
								stPage = totPage-10;
								edPage = totPage-1;
							}
						}
						for(i=stPage;i<=edPage;i++) {
							pHTML += '<a href="/search/search.do" onClick="pageMove('+i+'); return false;" class="'+(page==i?'on':'')+'">'+(i+1)+'</a>';
						}
						if(page!=edPage) {
							pHTML += '<a href="/search/search.do" onClick="goNextPage(); return false;" class="next">next</a>';
						}
					}
					/* 페이징 */
					
				}catch(e) {
					
					HTML = "";
					pHTML = "";
				}
			},
			complete: function(){

				//최상단 검색 결과 수
				if(initKwd != "") {
					$("#AREA_TOTAL").html("<em class='emph_on'>'"+initKwd+"'</em>(으)로 "+DispProdType(gProdType)+" <em class='emph_on'>"+FormatNumber(productTotal+todayBookTotal+themeBookTotal)+"</em>건 검색");
				}
				if("" != "") {
					$("#AREA_TOTAL").html("총  <em class='emph_on'>"+FormatNumber(productTotal+todayBookTotal+themeBookTotal)+"</em>건 검색");
				}
				$("#PRODUCT_TOTAL").html("상품 ["+FormatNumber(productTotal)+"]");

				//결과 없을시 소스
				if(productTotal == 0) {
					HTML = '<div class="not_found"><em>&#39;'+initKwd+'&#39;</em> 에 대한 검색결과가 없습니다.</div>';
					HTML += '<div class="not_found_txt">검색어가 올바른지 재확인 하신 후 정확하게 다시 입력해주세요. </div>';
					HTML += '<ul class="not_found_notice">';
					HTML += '	<li>다른 검색어를 입력해 보세요. 검색어의 단어 수를 줄이거나 제목의 일부 단어로 검색하시면 찾기 편리해 집니다.</li>';
					HTML += '	<li>제목에 포함된 단어를 골라 함께 검색해보시면 빨리 찾으실 수 있습니다. </li>';
					HTML += '	<li>보다 상세한 검색을 원할 경우, &#39;상세검색&#39;을 이용하시면 특정 조건으로 검색이 가능합니다. </li>';
					HTML += '	<li>출판사/저자/역자/출판일/ISBN/가격 등의 항목으로 간편하게 찾으실 수 있습니다. </li>';
					HTML += '	<li>원하는 결과를 찾을 수 없었을 시에는 1:1상담게시판을 이용하시면 이메일로 답변을 받으실 수 있습니다.</li>';
					HTML += '</ul>';
					HTML += '<div class="detail_found">';
					HTML += '	<p>만족스러운 검색결과를 찾지 못하셨다면 상세검색을 이용해 보세요.</p> ';
					HTML += '	<div class="btn_area"><span class="btn_type white"><a href="/search/search.do?type=Detail">상세검색 바로가기</a></span></div>';
					HTML += '</div>';
					$(".btn_under").hide();
					$(".search_option").hide();	
					$("#resultWrap").css('min-height','600px');				
				} else {
					$(".btn_under").show();	//선택쇼핑카트 담기 버튼
					$("#AREA_D").show();	//품절제외, 자세히, 20개씩, 정확도순
				}
				
				$("#AREA_G_2").html(HTML);			//본문 소스
				$("#AREA_G_2_PAGE").html(pHTML);	//페이징 소스

				$("#pb2").prop("checked", false);	//전체선택 체크박스 해제
				$("#frm_pq").val(gKwd);				//이전검색어 저장
				$("#bandiContainer").show();		//body 노출

				$.unblockUI();	//블락 해제

				//통합검색 이거나 첫검색일때 오늘의책 조회
				if(gProdType == "" && page == 0) {
					SCH_API_search_today(0,5);
				}
			},
			error: function(){
			}
		});

	}

	//상품검색 수 group by 검색 결과
	function SCH_API_search_group() {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";

		//parameters
		var sn = "product";	//검색 볼륨
		var q = gKwd;	//검색어
		var gd = "gcl";	//그룹바이 대상(gdt:분야,gct(카테고리),gcl(분야+카테고리)
		var egp = "09,10";	//not in
		var inp = "";	//in
		
		
			
		var parameters = { sn:sn, q:q, gd:gd, egp:egp, inp:inp };
		var HTML = "";
		var idx = 1;
		
		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {

					//전체
					HTML += '<li class="first_child">\n';
					HTML += '	<div class="stit '+(gCateId==''&&gProdType==''?'on':'')+'" id="left_cate_grp_">\n';
					HTML += '		<a href="javascript:goSearchCate(\'\');" class="stit_more"><em>전체</em> <span>('+FormatNumber(data.main_01.size+data.main_03.size+data.main_04.size+data.main_05.size+data.main_06.size+data.main_07.size+data.main_08.size+data.main_09.size+data.main_11.size+data.main_12.size)+')</span></a>\n';
					HTML += '	</div>\n';
					HTML += '</li>\n';
	
					//국내도서
					if(data.main_01.size > 0) {
						HTML += '<li>\n';
						if(data.sub_01.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'01\');" class="btn_sub_more" id="book_category_sub_01">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_01" style="display:none;">\n';
						$.each(data.sub_01, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_01 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'01_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'01_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='01'?'on':'')+'" id="left_cate_grp_01">\n';
						HTML += '		<a href="javascript:showCateGrp(\'01\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'01\');" class="stit_more"><em>국내도서</em> <span>('+FormatNumber(data.main_01.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//해외주문도서
					if(data.main_08.size > 0) {
						HTML += '<li>\n';
						if(data.sub_08.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'08\');" class="btn_sub_more" id="book_category_sub_08">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_08" style="display:none;">\n';
						$.each(data.sub_08, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_08 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'08_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'08_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='08'?'on':'')+'" id="left_cate_grp_08">\n';
						HTML += '		<a href="javascript:showCateGrp(\'08\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'08\');" class="stit_more"><em>해외주문도서</em> <span>('+FormatNumber(data.main_08.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//eBook
					if(data.main_06.size > 0) {
						HTML += '<li>\n';
						if(data.sub_06.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'06\');" class="btn_sub_more" id="book_category_sub_06">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_06" style="display:none;">\n';
						$.each(data.sub_06, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_06 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'06_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'06_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='06'?'on':'')+'" id="left_cate_grp_06">\n';
						HTML += '		<a href="javascript:showCateGrp(\'06\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'06\');" class="stit_more"><em>eBook</em> <span>('+FormatNumber(data.main_06.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//음반
					if(data.main_03.size > 0) {
						HTML += '<li>\n';
						if(data.sub_03.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'03\');" class="btn_sub_more" id="book_category_sub_03">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_03" style="display:none;">\n';
						$.each(data.sub_03, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_03 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'03_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'03_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='03'?'on':'')+'" id="left_cate_grp_03">\n';
						HTML += '		<a href="javascript:showCateGrp(\'03\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'03\');" class="stit_more"><em>음반</em> <span>('+FormatNumber(data.main_03.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//DVD
					if(data.main_07.size > 0) {
						HTML += '<li>\n';
						if(data.sub_07.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'07\');" class="btn_sub_more" id="book_category_sub_07">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_07" style="display:none;">\n';
						$.each(data.sub_07, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_07 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'07_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'07_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='07'?'on':'')+'" id="left_cate_grp_07">\n';
						HTML += '		<a href="javascript:showCateGrp(\'07\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'07\');" class="stit_more"><em>DVD</em> <span>('+FormatNumber(data.main_07.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//GIFT
					if(data.main_04.size > 0) {
						HTML += '<li>\n';
						if(data.sub_04.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'04\');" class="btn_sub_more" id="book_category_sub_04">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_04" style="display:none;">\n';
						$.each(data.sub_04, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_04 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'04_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'04_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='04'?'on':'')+'" id="left_cate_grp_04">\n';
						HTML += '		<a href="javascript:showCateGrp(\'04\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'04\');" class="stit_more"><em>GIFT</em> <span>('+FormatNumber(data.main_04.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//중고도서
					/*
					if(data.main_05.size > 0) {
						HTML += '<li>\n';
						if(data.sub_05.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'05\');" class="btn_sub_more" id="book_category_sub_05">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_05" style="display:none;">\n';
						$.each(data.sub_05, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_05 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'05_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'05_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='05'?'on':'')+'" id="left_cate_grp_05">\n';
						HTML += '		<a href="javascript:showCateGrp(\'05\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'05\');" class="stit_more"><em>중고도서</em> <span>('+FormatNumber(data.main_05.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					//중고음반
					if(data.main_09.size > 0) {
						HTML += '<li>\n';
						if(data.sub_09.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'09\');" class="btn_sub_more" id="book_category_sub_09">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_09" style="display:none;">\n';
						$.each(data.sub_09, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_09 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'09_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'09_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='09'?'on':'')+'" id="left_cate_grp_09">\n';
						HTML += '		<a href="javascript:showCateGrp(\'09\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'09\');" class="stit_more"><em>중고음반</em> <span>('+FormatNumber(data.main_09.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					*/
					
					//뷰티
					if(data.main_11.size > 0) {
						HTML += '<li>\n';
						if(data.sub_11.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'11\');" class="btn_sub_more" id="book_category_sub_11">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_11" style="display:none;">\n';
						$.each(data.sub_11, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_11 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'11_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'11_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='11'?'on':'')+'" id="left_cate_grp_11">\n';
						HTML += '		<a href="javascript:showCateGrp(\'11\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'11\');" class="stit_more"><em>뷰티</em> <span>('+FormatNumber(data.main_11.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					
					//오피스문구
					if(data.main_12.size > 0) {
						HTML += '<li>\n';
						if(data.sub_12.length > 5) {
							HTML += '<div class="btn_sub_area"><a href="javascript:showMoreCate(\'12\');" class="btn_sub_more" id="book_category_sub_12">더보기</a></div>\n';	
						}
						HTML += '	<ul class="book_category" id="book_category_12" style="display:none;">\n';
						$.each(data.sub_12, function(i,item) {
							if(i >= 5) {
								HTML += '		<li class="book_category_sub_12 '+(gCateId==item.key01?'on':'')+'" style="display:none;"><a href="javascript:goSearchCate(\'12_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}else {
								HTML += '		<li class="'+(gCateId==item.key01?'on':'')+'"><a href="javascript:goSearchCate(\'12_'+item.key01+'\');">'+item.key02+'<span> ('+FormatNumber(item.size)+')</span></a></li>\n';
							}
						});
						HTML += '	</ul>\n';
						HTML += '	<div class="stit '+(gCateId==''&&gProdType=='12'?'on':'')+'" id="left_cate_grp_12">\n';
						HTML += '		<a href="javascript:showCateGrp(\'12\');" class="btn_more"></a>\n';
						HTML += '		<a href="javascript:goSearchCate(\'12\');" class="stit_more"><em>오피스문구</em> <span>('+FormatNumber(data.main_12.size)+')</span></a>\n';
						HTML += '	</div>\n';
						HTML += '</li>\n';
					}
					
					//통합검색시 검색결과 제일 많은 카테고리 계산
					if(gProdType == "") {
						var maxSize = data.main_01.size;
						if(maxSize < data.main_03.size) {
							idx = 3;
							maxSize = data.main_03.size;
						}
						if(maxSize < data.main_04.size) {
							idx = 4;
							maxSize = data.main_04.size;
						}
						if(maxSize < data.main_06.size) {
							idx = 6;
							maxSize = data.main_06.size;
						}
						if(maxSize < data.main_07.size) {
							idx = 7;
							maxSize = data.main_07.size;
						}
						if(maxSize < data.main_08.size) {
							idx = 8;
							maxSize = data.main_08.size;
						}
						if(maxSize < data.main_05.size) {
							idx = 5;
							maxSize = data.main_05.size;
						}
						if(maxSize < data.main_09.size) {
							idx = 9;
							maxSize = data.main_09.size;
						}
						if(maxSize < data.main_11.size) {
							idx = 11;
							maxSize = data.main_11.size;
						}
						if(maxSize < data.main_12.size) {
							idx = 12;
							maxSize = data.main_12.size;
						}
					}
					
				}catch(e) {
					HTML = "";
				}
			},
			complete: function(){
				$("#AREA_C_1").html(HTML);
				//통합검색시 검색결과 제일 많은 카테고리 펼치고, 상품분류 선택시 해당 상품분류 펼치기
				if(gProdType == "") {
					showCateGrp("0"+idx);
				}else {
					showCateGrp(gProdType);
				}
			},
			error: function(){
			}
		});

	}

	//검색 도서 시리즈 검색 결과
	function SCH_API_search_series() {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";

		//parameters
		var sn = "product";	//검색 볼륨
		var q = gKwd;	//검색어
		var pt = gProdType;	//분야(03:음반,04:GIFT,07:DVD)
		var gd = "gsl";	//그룹바이 대상(gdt:분야,gct(카테고리),gcl(분야+카테고리)

		var parameters = { sn:sn, q:q, pt:pt, gd:gd };
		var HTML = "";
		
		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {
					
					if(data.groups.length > 0) {
						
						HTML += '<dt>검색어가 속한 시리즈</dt>\n';
						$.each(data.groups, function(i,item) {
							if(i>3) {
								HTML += '<dd class="book_series" style="display:none;"><a href="/front/product/bookSeriesView.do?prodRelSeq='+item.key02+'&listType=series&cateId='+item.key03+'" target="_blank">'+item.key01+'</a></dd>\n';
							}else {
								HTML += '<dd><a href="/front/product/bookSeriesView.do?prodRelSeq='+item.key02+'&listType=series&cateId='+item.key03+'" target="_blank">'+item.key01+'</a></dd>\n';
							}
						});
						if(data.groups.length>4) {
							HTML += '<dd class="dash"><span class="btn_serise_more" id="seriesMore"><a href="javascript:showMoreSeries();">+ 더보기</a></span></dd>\n';
						}
					}
					
				}catch(e) {
					HTML = "";
				}
			},
			complete: function(){
				$("#AREA_C_3_1").html(HTML);
				if(HTML != "") {
					$("#AREA_C_3_A").show();
				}
			},
			error: function(){
			}
		});

	}
	
	function pageMove(i){
		$("#frm_o").val(i);
		$("#sch_keyword").val("설거지");
		$("#frm_dt").val("");
		$("#searchForm").submit();
	}

	//검색 도서 수상정보 검색 결과
	function SCH_API_search_award() {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";

		//parameters
		var sn = "product";	//검색 볼륨
		var q = gKwd;	//검색어
		var pt = gProdType;	//분야(03:음반,04:GIFT,07:DVD)
		var gd = "gaw";	//그룹바이 대상(gdt:분야,gct(카테고리),gcl(분야+카테고리)

		var parameters = { sn:sn, q:q, pt:pt, gd:gd };
		var HTML = "";
		
		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {

					if(data.groups.length > 0) {
						
						HTML += '<dt>검색 도서 수상 정보</dt>\n';
						$.each(data.groups, function(i,item) {
							if(i>3) {
								HTML += '<dd class="book_awards" style="display:none;"><a href="/front/display/recommendAward.do?recommendGrpSeq='+item.key02+'" target="_blank">'+item.key01+'</a></dd>\n';
							}else {
								HTML += '<dd><a href="/front/display/recommendAward.do?recommendGrpSeq='+item.key02+'" target="_blank">'+item.key01+'</a></dd>\n';
							}
						});
						if(data.groups.length>4) {
							HTML += '<dd class="dash"><span class="btn_serise_more" id="awardsMore"><a href="javascript:showMoreAwards();">+ 더보기</a></span></dd>\n';
						}
					}
					
				}catch(e) {
					HTML = "";
				}
			},
			complete: function(){
				$("#AREA_C_3_2").html(HTML);
				if(HTML != "") {
					$("#AREA_C_3_B").show();
				}
			},
			error: function(){
			}
		});

	}

	//오늘의 책
	function SCH_API_search_today(page, listSize) {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";
		
		//parameters
		var sn = "todaybook";	//검색 볼륨
		var q = gKwd;	//검색어
		var l = listSize;	//요청건수(default:20)
		var o = page;	//오프셋(default:0)

		var parameters = { sn:sn, q:q, l:l, o:o };
		var HTML = "";
		var pHTML = "";
		
		todayBookTotal = 0;

		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {

					if(data.count > 0) {
						
						$.each(data.result, function(i,item) {
	
							HTML += '<li '+(i==0?'class="first_child"':'')+'>\n';
							HTML += '	<div class="thumb_left_big">\n';
							HTML += '		<a href="/front/display/recommendToday.do?todayYear='+item.recommend_year+'&todayMonth='+item.recommend_month+'&todayDay='+item.recommend_day+'" target="_blank">\n';
							HTML += '		<img src="http://image.bandinlunis.com/upload'+item.prod_img_link+'" onerror="this.src=\'/images/common/noimg_type01.gif\'">\n';
							HTML += '		<span class="mask"></span>\n';
							HTML += '		</a>\n';
							HTML += '	</div>\n';
							HTML += '	<div class="book_content">\n';
							HTML += '		<hgroup>\n';
							HTML += '		<h4><a href="/front/display/recommendToday.do?todayYear='+item.recommend_year+'&todayMonth='+item.recommend_month+'&todayDay='+item.recommend_day+'" target="_blank">'+item.subject+'</a> <span><'+item.recommend_year+'년 '+item.recommend_month+'월 '+item.recommend_day+'일 오늘의 책></span></h4>\n';
							HTML += '		<h5><a href="/front/product/detailProduct.do?prodId='+item.prod_id+'" target="_blank">'+item.prod_name+'</a></h5>\n';
							HTML += '		</hgroup>\n';
							HTML += '		<div class="book_info">\n';
							HTML += '			<span class="first_chaild">'+item.prod_author+' 저</span>\n';
							if(item.prod_translator != "") {
								HTML += '			<span>'+item.prod_translator+' 역</span>\n';
							}
							HTML += '			<span>'+item.prod_maker+'</span>\n';
							HTML += '		</div>\n';
							HTML += '		<p>'+item.recommend_prod_desc+'</p>\n';
							HTML += '	</div>\n';
							HTML += '</li>\n';
		
						});
	
						todayBookTotal = data.count;

						/* 더보기 페이징 */
						if(listSize == 20) {
							currentPage = page;
							var totPage = Math.ceil(todayBookTotal/l);
							if(todayBookTotal > 0) {
								if(page>0) {
									pHTML += '<a href="#" onClick="goPrevPageTB();" class="prev">prev</a>';
								}
								//현제 페이지 기준으로 앞뒤10개 페이지 노출(10개 안되면 전부)
								var stPage = page-4;
								var edPage = page+5;
								if(totPage < 10) {
									stPage = 0;
									edPage = totPage-1;
								}else {
									if(stPage < 0) {
										stPage = 0;
										edPage = 9;
									}
									if(edPage > totPage) {
										stPage = totPage-10;
										edPage = totPage-1;
									}
								}
								for(i=stPage;i<=edPage;i++) {
									pHTML += '<a href="#" onClick="SCH_API_search_today('+i+',20)" class="'+(page==i?'on':'')+'">'+(i+1)+'</a>';
								}
								if(page!=edPage) {
									pHTML += '<a href="#" onClick="goNextPageTB();" class="next">next</a>';
								}
							}
						}
						/* 더보기 페이징 */
						
					}
					
				}catch(e) {
					
					HTML = "";
					pHTML = "";
				}
			},
			complete: function(){
				
				if(initKwd != "") {
					$("#AREA_TOTAL").html("<em class='emph_on'>'"+initKwd+"'</em>(으)로 "+DispProdType(gProdType)+" <em class='emph_on'>"+FormatNumber(productTotal+todayBookTotal+themeBookTotal)+"</em>건 검색");
				}
				$("#TODAY_TOTAL").html("오늘의 책 ["+todayBookTotal+"]");
				$("#AREA_G_3_1_TOTAL").html("("+todayBookTotal+")");
				$("#AREA_G_3_1_DETAIL").html(HTML);
				$("#AREA_G_3_1_PAGE").html(pHTML);

				if(HTML != "") {
					$("#AREA_G_3_1").show();
				}else {
					$("#AREA_G_3_1").hide();
				}

				if(pHTML != "") {
					$("#AREA_G_3_1_PAGE").show();
				}else {
					$("#AREA_G_3_1_PAGE").hide();
				}

			},
			error: function(){
				
				$("#AREA_G_3_1").hide();
				$("#AREA_G_3_1_PAGE").hide();
				
			}
		});

	}

	//테마북
	function SCH_API_search_theme() {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";
		
		//parameters
		var sn = "themabook";	//검색 볼륨
		var q = gKwd;	//검색어
		var l = 3;	//요청건수(default:20)

		var parameters = { sn:sn, q:q, l:l };
		var HTML = "";

		themeBookTotal = 0;

		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{

				try {

					if(data.count > 0) {
						
						$.each(data.result, function(i,item) {
	
							HTML += '<li '+(i==0?'class="first_child"':'')+'>\n';
							HTML += '	<div class="inner_box">\n';
							HTML += '		<h4><a href="/front/bookPeople/themaBookDetail.do?themaBookGrpSeq='+item.thema_book_grp_seq+'" target="_blank">'+item.subject+'</a></h4>\n';
							HTML += '		<span class="txt_edited"><em>edited by</em> <a href="http://blog.bandinlunis.com/bandi_blog/'+item.mem_id+'" class="link" target="_blank">'+item.mem_nickname+'</a>님</span>\n';
							HTML += '		<p>'+item.comments+'</p>\n';
							HTML += '	</div>\n';
							HTML += '	<div class="inner_box box2">\n';
							HTML += '		<div class="box_product">\n';
							HTML += '			<dl class="list_product">\n';
							var prodCnt = item.prod_id.split("\|").length;
							var loopCnt = 3;
							if(loopCnt > prodCnt)	loopCnt = prodCnt;
							HTML += '				<dt><h5><a href="/front/bookPeople/themaBookDetail.do?themaBookGrpSeq='+item.thema_book_grp_seq+'" target="_blank">연관 추천 상품 ('+prodCnt+')</a></h5></dt>\n';
							for(j=0;j<loopCnt;j++) {
								HTML += '				<dd style=""><a href="/front/product/detailProduct.do?prodId='+item.prod_id.split("\|")[j]+'" target="_blank">'+item.prod_name.split("\|")[j]+'</a></dd>\n';
							}
							HTML += '			</dl>\n';
							HTML += '			<a href="/front/product/detailProduct.do?prodId='+item.prod_id.split("\|")[0]+'" class="thumb_right_small" alt=""><img src="http://image.bandinlunis.com/upload'+item.prod_img.split("\|")[0]+'" width="60" height="85" onerror="this.src=\'/images/common/noimg_type01.gif\'"></a>\n';
							HTML += '			<span class="layer_left"></span>\n';
							HTML += '		</div>\n';
							HTML += '	</div>\n';
							HTML += '</li>\n';
		
						});
	
						themeBookTotal = data.count;
					}
					
				}catch(e) {
					HTML = "";
				}
				
			},
			complete: function(){
				
				if(initKwd != "") {
					$("#AREA_TOTAL").html("<em class='emph_on'>'"+initKwd+"'</em>(으)로 "+DispProdType(gProdType)+" <em class='emph_on'>"+FormatNumber(productTotal+todayBookTotal+themeBookTotal)+"</em>건 검색");
				}
				$("#THEME_TOTAL").html("테마북 ["+themeBookTotal+"]");
				$("#AREA_G_3_2_TOTAL").html("("+themeBookTotal+")");
				$("#AREA_G_3_2_DETAIL").html(HTML);

				if(HTML != "") {
					$("#AREA_G_3_2").show();
				}else {
					$("#AREA_G_3_2").hide();
				}
				
			},
			error: function(){
			}
		});

	}

	//저자 검색
	function SCH_API_search_author() {

		var apiUrl = "http://222.122.120.242:7570/ksf/api/search";
		
		//parameters
		var sn = "author";	//검색 볼륨
		var q = gKwd;	//검색어
		var l = 100;

		var parameters = { sn:sn, q:q, l:l };
		var HTML = "";
		var authorSeqs = "";

		$.ajax({
			
			url: apiUrl,
			type: "get",
			data: parameters,
			dataType: "jsonp",
			jsonp: "callback",
			success: function(data)	{
			
				$.each(data.result, function(i,item) {
					authorSeqs += item.author_seq+",";
				});

				if(authorSeqs != "") {
					
					$.ajax({
						url: "/ajax/getAuthorInfo.do",
						type: "post",
						data: { authorSeqs:authorSeqs },
						dataType: "json",
						success: function(data)	{

							try {
								
								var musicYn = 'N';
								HTML += '<div class="inner_author"><div class="inner_info">\n';
								HTML += '	<a href="/front/author/authorProfile.do?authorSeq='+data.authorMap.author_seq+'" class="thumb">\n';
								HTML += '	<img src="http://image.bandinlunis.com/upload'+data.authorMap.author_img+'" width="92" height="115" onerror="this.src=\'/images/common/noimg_type01.gif\'">\n';
								HTML += '	</a>\n';
								HTML += '	<ul>\n';
								HTML += '	<li><span>'+data.authorMap.author_name+'</span> ('+(data.authorMap.birthday==null?'':data.authorMap.birthday.substring(0,4)+'.'+data.authorMap.birthday.substring(4,6)+'.'+data.authorMap.birthday.substring(6,8)+', ')+data.authorMap.nation_name+')</li>\n';
								HTML += '	<li><em>직업</em> : '+(data.authorMap.job==null?' - ':data.authorMap.job)+'</li>\n';
								HTML += '	<li><em>분류</em> : ';
								$.each(data.authorGroupValue, function(j,authorGrp) {
									HTML += authorGrp.author_group+" ";
									if(authorGrp.author_group == '음반'){
										musicYn = 'Y';
									}
								});
								HTML += '</li>\n';
								HTML += '	<li><em>데뷔년도</em> : '+(data.authorMap.debut==null?' - ':data.authorMap.debut+'년')+'</li>\n';
								HTML += '	<li><em>인기지수</em>  ['+FormatNumber(data.authorMap.pop_point)+']  <em>반디추천</em> ['+FormatNumber(data.authorMap.bandi_yn_cnt)+'회선정]</li>\n';
								HTML += '	</ul>\n';
								HTML += '	<span class="btn_sub"><a href="/front/author/authorProfile.do?authorSeq='+data.authorMap.author_seq+'" target="_blank">자세히보기</a>';
								if(data.authorInterest != "") {
									HTML += '<a href="javascript:popAuthorInterest('+data.authorMap.author_seq+', \'delete\', '+data.authorInterest[0].seq+');">관심작가 해제</a></span>\n';
								}else {
									if(musicYn == 'N'){
										HTML += '<a href="javascript:popAuthorInterest('+data.authorMap.author_seq+', \'insert\');">관심추가/새상품알림</a></span>\n';
									}
								}
								HTML += '</div>\n';
								HTML += '<div class="inner_recent">\n';
								HTML += '	<ul>\n';
								HTML += '	<li><p>최근 작품</p></li>\n';
								$.each(data.authorRecBooks, function(j,authorBook) {
									if(musicYn == 'Y'){
										HTML += '	<li><a href="/front/product/detailProduct.do?prodId='+authorBook.prod_id+'" target="_blank">'+authorBook.prod_name+'</a></li>\n';
									}else{
										HTML += '	<li><a href="/front/product/detailProduct.do?prodId='+authorBook.prod_id+'" target="_blank">['+authorBook.author_type_name+']'+authorBook.prod_name+'</a></li>\n';
									}
								});
								HTML += '	</ul>\n';
								HTML += '	<span class="btn_more"><a href="/front/author/authorProfile.do?authorSeq='+data.authorMap.author_seq+'" target="_blank">더보기</a></span>\n';
								HTML += '</div></div>\n';
								
								$.each(data.authorOtherList, function(i,item) {
									if( i > 0){
										//추가영역 태그 열기
										if(i===1) {
											HTML += '<div class="inner_same">\n';
											HTML += '	<ul>\n';
										}
										
										try {
											if(i>3) {	//3개 이상이면 히든
												HTML += '	<li style="display:none;" class="showMoreAuthor"><a href="/front/author/authorProfile.do?authorSeq='+item.author_seq+'">'+item.author_name+' <em>('+item.author_group+')</em></a><em>[최근저서]</em> <a href="/front/product/detailProduct.do?prodId='+item.prod_id+'" target="_blank">'+item.prod_name+'</a></li>\n';
											}else {
												HTML += '	<li><a href="/front/author/authorProfile.do?authorSeq='+item.author_seq+'">'+item.author_name+' <em>('+item.author_group+')</em></a><em>[최근저서]</em> <a href="/front/product/detailProduct.do?prodId='+item.prod_id+'" target="_blank">'+item.prod_name+'</a></li>\n';
											}
										}catch(e) {}
										
										//추가영역 태그 닫기
										if(i===(data.authorOtherList.length-1)) {
											HTML += '	</ul>\n';
											if(data.authorOtherList.length>4) {
												HTML += '	<div class="btn_sub_area"><a href="javascript:showMoreAuthor();" id="btn_author_more" class="btn_sub_more" value="0"></a></div>\n';
											}
											HTML += '</div>\n';
										}
									}
								});
	
							}catch(e) {
								alert(e);
								HTML = "";
							}
						},
						complete: function(){
							if(HTML != "") {
								$("#AREA_G_1").html(HTML);
								$("#AREA_G_1").show();
							}else {
								$("#AREA_G_1").html(HTML);
								$("#AREA_G_1").hide();
							}
						},
						error: function(){
						}
					});
					
				}else {
					$("#AREA_G_1").hide();
				}
			},
			error: function(){
			}
		});

	}

	//액션 스크립트 생성 - 키워드변경
	function ActionChangeKwd(val) {
		return "javascript:changeKwd('"+EraseHighlightingTag(val)+"');";
	}

	//출연배우 개별 링크
	function SplitActor(actor) {
		var actors = actor.split(",");
		var str = "";
		for(i=0;i<actors.length;i++) {
			if(i>0)	str += ",";
			str += ' <a href="#" onClick="'+ActionChangeKwd(actors[i].trim())+'">'+actors[i].trim()+'</a>';
		}
		return str;
	}

	//이전 페이지
	function goPrevPage() {
		pageMove(currentPage-1);
	}

	//다음 페이지
	function goNextPage() {
		pageMove(currentPage+1);
	}

	//좌측 카테고리 클릭시 자동펼침
	function showCateGrp(val) {
		$(".book_category").hide();						//대카테고리 모두 접고
		$("#book_category_"+val).show();				//클릭한 대카테고리만 보이기
		$("#AREA_C_1 li div a").show();					//대카테고리 펼치기 꺽쇠 모두 보이기
		if(val != "00") {
			$("#left_cate_grp_"+val+" a").eq(0).hide();	//펼쳐진 대카테고리 펼치기 꺽쇠 숨김
		}
		$("#AREA_C_1 .btn_sub_area a").hide();			//대카테고리(5개이상) 더보기 버튼 숨김
		$("#book_category_sub_"+val).show();			//펼쳐진 대카테고리(5개이상) 더보기 버튼 노출
		changeFilterSet(val);	//필터 항목 변경
	}

	//좌측 카테고리 더보기 클릭
	function showMoreCate(val) {
		$(".book_category_sub_"+val).toggle();
		if($("#book_category_sub_"+val).attr("class") == "btn_sub_more") {
			$("#book_category_sub_"+val).attr("class","btn_sub_close");
		}else {
			$("#book_category_sub_"+val).attr("class","btn_sub_more");
		}
	}

	//좌측 카테고리 선택시 필터 항목 변경
	function changeFilterSet(val) {
		$("#filter_mkr").show();
		$("#filter_cdn").show();
		if(val == "03") {
			$("#filter_pnm label").html("음반명/바코드");
			$("#filter_atr label").html("아티스트명");
			$("#filter_mkr label").html("레이블");
			$("#filter_cdn label").html("트랙명");
			$("#filterSet_music").show();
		}else if(val == "04") {
			$("#filter_pnm label").html("제품명");
			$("#filter_mkr label").html("브랜드명");
			$("#filter_atr").hide();
			$("#filter_cdn").hide();
			$("#filter_atr input").prop("checked", false);
			$("#filter_cdn input").prop("checked", false);
			$("#filterSet_music").hide();
		}else if(val == "07") {
			$("#filter_pnm label").html("타이틀");
			$("#filter_atr label").html("감독명/출연자명");
			$("#filter_mkr label").html("제작사명");
			$("#filter_cdn label").html("줄거리");
			$("#filterSet_music").hide();
		}else {
			$("#filter_pnm label").html("제목/ISBN");
			$("#filter_atr label").html("저자/역자");
			$("#filter_mkr label").html("출판사");
			$("#filter_cdn label").html("서평 내용");
			$("#filterSet_music").hide();
		}
	}

	//시리즈 더보기
	function showMoreSeries() {
		$(".book_series").toggle();
		$("#seriesMore").attr("class");
		if($("#seriesMore").attr("class") == "btn_serise_more") {
			$("#seriesMore").removeClass("btn_serise_more");
			$("#seriesMore").addClass("btn_serise_close");
			$("#seriesMore a").html("- 접기");
		}else {
			$("#seriesMore").addClass("btn_serise_more");
			$("#seriesMore").removeClass("btn_serise_close");
			$("#seriesMore a").html("+ 더보기");
		}
	}

	//수상정보 더보기
	function showMoreAwards() {
		$(".book_awards").toggle();
		$("#awardsMore").attr("class");
		if($("#awardsMore").attr("class") == "btn_serise_more") {
			$("#awardsMore").removeClass("btn_serise_more");
			$("#awardsMore").addClass("btn_serise_close");
			$("#awardsMore a").html("- 접기");
		}else {
			$("#awardsMore").addClass("btn_serise_more");
			$("#awardsMore").removeClass("btn_serise_close");
			$("#awardsMore a").html("+ 더보기");
		}
	}

	//관심작가 등록/해제
	function popAuthorInterest(authorSeq, type, seq) {
		if (isLogin() == false) {
			goLoginPopUp();
			return;
		}
		var returnUrl = location.href;
		window.open("/front/author/popUpAuthorInterest.do?type="+type+"&authorSeq="+authorSeq+"&seq="+seq, "searchPopup", "width=420,height=230,status=yes,scrollbars=yes");
	}

	//저자 더보기
	function showMoreAuthor() {
		if($("#btn_author_more").val() == "1") {
			$("#btn_author_more").attr("class","btn_sub_more");
			$("#btn_author_more").val(0);
			$(".showMoreAuthor").hide();
		}else {
			$("#btn_author_more").attr("class","btn_sub_close");
			$("#btn_author_more").val(1);
			$(".showMoreAuthor").show();
		}
	}

	//오늘의 책 더보기
	function showMoreTodayBook(obj) {
		obj.style.display = "none";
		$("#AREA_D").hide();
		$("#AREA_G_1").hide();
		$("#AREA_G_2").hide();
		$(".btn_under").hide();
		$("#AREA_G_3_2").hide();
		$("#AREA_G_2_PAGE").hide();
		$("#PRODUCT_TOTAL").removeClass("on");
		$("#TODAY_TOTAL").addClass("on");
		SCH_API_search_today(0, 20);
	}

	//오늘의 책 더보기 - 이전 페이지
	function goPrevPageTB() {
		SCH_API_search_today(currentPage-1, 20);
	}

	//오늘의 책 더보기 - 다음 페이지
	function goNextPageTB() {
		SCH_API_search_today(currentPage+1, 20);
	}

	//선택 쇼핑카트
	function addCarts() {
		var obj;
		if( "view_type" == $("#sch_viewType").val() ){	//자세히 보기의 경우.
			obj 	= $(".btn_area input[type=checkbox]:checked");
		}else if( "view_type_simple" == $("#sch_viewType").val() ){	//간단히 보기의 경우.
			obj 	= $(".view_type_simple input[type=checkbox]:checked");
		}
		
		var p_arr = "";
		var cnt = 0;
		
		for(var i=0;i<obj.length;i++) {
			if(cnt>0){
				p_arr += ",";
			}
			p_arr += obj[i].value;
			cnt++;
		}
		
		if(p_arr=="") {
			alert("선택된 항목이 없습니다.");
			return;
		}
		
		var tmpArr	= p_arr.split(",");
		var resultArr	= Array();
		var cntArr		= Array();
		
		for(var i=0 ; i < tmpArr.length ; i++){
			resultArr.push(" ");
			cntArr.push(1);
		}

		add_basket_array_common(p_arr, resultArr.join(","), cntArr.join(","), resultArr.join(","), true, callBack_);
	}
	
	//선택 위시리스트
	function addWishes() {

		var obj 	= $(".btn_area input[type=checkbox]:checked");
		var p_arr = "";
		var cnt = 0;
		
		for(var i=0;i<obj.length;i++) {
			if(cnt>0){
				p_arr += ",";
			}
			p_arr += obj[i].value;
			cnt++;
		}
		
		if(p_arr=="") {
			alert("선택된 항목이 없습니다.");
			return;
		}
		
		if (p_arr.length > 0) {
			add_wish_array_common(p_arr, true);
		} 
		else {
			alert("상품을 선택해 주십시오");
		}
	}

	function callBack_(cnt) {
		
		if(cnt == -10) {
			alert("옵션이 있는 상품은 상품상세에서 옵션을 선택해 주시기 바랍니다.");
			return;
		}
		
		if(cnt == -20) {
			alert("연령제한이 적용되어 있는 상품입니다.");
			return;
		}
		
		if(cnt >= 0) {
            if(confirm("쇼핑카트에 등록되었습니다. 지금 바로 확인 하시겠습니까?")) {
            	document.location.href = '/front/order/shopCartList.do';
            }
		}
	}

</script>

	<!-- 로그 분석 변수 (footer 에서 사용) -->
	<script type="text/javascript">
_n_p1 = "통합검색 New";  //대카테고리
_n_p2 = "";  //중카테고리
_n_p3 = "";  //소카테고리
</script>
	<!-- //로그 분석 변수 -->
</body>
</html>