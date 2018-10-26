<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/webproject/resources/common/css/bnlBSList2.css" type="text/css">
<link rel="stylesheet" href="/webproject/resources/common/css/shopCartList.css" type="text/css"/>

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
<script language="javascript">
$(document).ready(function(){
	
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

	/* 최근담긴 상품 */
	$(".gnb_cart").hover(function() {
		$(".gnb_cart_pop").show();
		},function() {
		$(".gnb_cart_pop").hide();
	});
	$(".gnb_cart_pop").hover(function() {
		$(".gnb_cart_pop").show();
		},function() {
		$(".gnb_cart_pop").hide();
	});	
	/* 최근담긴 상품 */	
	
	$(".hb_close").click(function() {
		$(".head_banner").hide();
	});	
	
	/* setSearchKeyword(); */
	setHeaderKeyword();
	latestBookCartInfo();
	setGnbBanner();

	getMainBanner();
	
	showTimeBanner();
	
});

	wcs.inflow("bandinlunis.com");
	var sMemSeq = "21058516";

	var akcIdx = -1;
	var timeA = new Date();
	var timeB;
	var console = window.console || {error:function(){}};

	//전역변수
	var akcOn = true;				//자동완성 끄기여부
	var gKwd = "";		//검색어

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
		// https는 url 변경(SSL 적용)
		if(window.location.protocol == 'https:'){
			apiUrl = "https://search.bandinlunis.com:8454/ksf/api/suggest";
		}
		
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
		
		// https는 url 변경(SSL 적용)
		if(window.location.protocol == 'https:'){
			apiUrl = "https://search.bandinlunis.com:8444/ksf/api/search";
		}

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
					HTML +='	<a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId='+data.result[0].prod_id+'" target="_blank">\n';
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
					HTML +='	<span class="btn_type brown"><a href="javascript:addCart('+data.result[0].prod_id+');">쇼핑카트</a></span>\n';
					if(data.result[0].p_book_price != "") {
						if(data.result[0].prod_type == "01") {
							HTML +='	<span class="btn_type white"><a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId='+data.result[0].p_book_price.split("\|")[0]+'" target="_blank">이 책의 eBook</a></span>\n';
						}else if(data.result[0].prod_type == "06") {
							HTML +='	<span class="btn_type white"><a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId='+data.result[0].p_book_price.split("\|")[0]+'" target="_blank">이 책의 종이책</a></span>\n';
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

	//쇼핑카트
	function addCart(prodId) {
		var ordCnt = $("#cntVal_"+prodId).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		add_basket(prodId, ordCnt);
	}

	//메뉴 마우스 오버
	function toggleLayer(id) {
		if (document.getElementById("cLayer"+id).style.display == "block"){
			document.getElementById("cLayer"+id).style.display = "none";
		}else{
			document.getElementById("cLayer"+id).style.display = "block";
		}
	}

	//추천빅데이터
	function goRecommendInside() {
		jutil.cookie.set_cookie("lastPath", location.pathname+location.search);
		document.location.href = "http://www.bandinlunis.com/front/recommend/linkedBook.do";
	}
	
	/* 카테고리 배너(GNB , 오른쪽 맨위 , 옆) */
	function getMainBanner(){
		var bannerDpAreas = '38,89';
		
		if(!checkMemType('15')){
			var prodType = '';
			var bannerDpArea = "31";
			if(prodType == "03"){
				bannerDpArea = "69";
			}else if(prodType == "07"){
				bannerDpArea = "119";
			}
			bannerDpAreas += ','+bannerDpArea;
		}
		
		$.getScript("/ajax/getMainBannerAjax.do?bannerDpAreas="+bannerDpAreas+"&orderType=random&rownum=10",
				function(){
					if (data != null && typeof(data) == "object") {
						for(var j = 0; j < data.length; j++){
							if(data[j].bannerdparea == '38'){
							var bookBannerHtml = "";
							var bookBannerCnt = 0;
							var exmBannerHtml = "";
							var exmBannerCnt = 0;
							var kidsBannerHtml = "";
							var kidsBannerCnt = 0;
							var eBookBannerHtml = "";
							var eBookBannerCnt = 0;
							var musicBannerHtml = "";
							var musicBannerCnt = 0;
							var dvdBannerHtml = "";
							var dvdBannerCnt = 0;
							var giftBannerHtml = "";
							var giftBannerCnt = 0;
							var usedBannerHtml = "";
							var usedBannerCnt = 0;
							var tourBannerHtml = "";
							var tourBannerCnt = 0;
							var cosBannerHtml = "";
							var cosBannerCnt = 0;
							var stationeryBannerHtml = "";
							var stationeryBannerCnt = 0;
							
							for(var i=0;i<data.length;i++){
								if(data[i].bannerdparea =='38'){
									if(data[i].prodtype == '01'){
										bookBannerCnt += 1;
										bookBannerHtml += "<div class=\"mdr\" id=\"bookCateBanner_"+(bookBannerCnt)+"\" style=\"display:none;\">";							
										bookBannerHtml += "<p class=\"bn_img\"><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										bookBannerHtml += "<p class=\"bn_txt\">"+data[i].subject+"</p>";
										bookBannerHtml += "</div>";
										exmBannerCnt += 1;
										exmBannerHtml += "<div class=\"mdr\" id=\"exmCateBanner_"+(exmBannerCnt)+"\" style=\"display:none;\">";
										exmBannerHtml += "<p class=\"bn_img\"><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										exmBannerHtml += "<p class=\"bn_txt\">"+data[i].subject+"</p>";
										exmBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '06'){
										eBookBannerCnt += 1;
										eBookBannerHtml += "<div class=\"mdr\" id=\"eBookCateBanner_"+(eBookBannerCnt)+"\" style=\"display:none;\">";
										eBookBannerHtml += "<p class=\"bn_img\"><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										eBookBannerHtml += "<p class=\"bn_txt\">"+data[i].subject+"</p>";
										eBookBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '03'){
										musicBannerCnt += 1;
										musicBannerHtml += "<div class=\"mdr\" id=\"musicCateBanner_"+(musicBannerCnt)+"\" style=\"display:none;\">";
										musicBannerHtml += "<p><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										musicBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '07'){
										dvdBannerCnt += 1;
										dvdBannerHtml += "<div class=\"mdr\" id=\"dvdCateBanner_"+(dvdBannerCnt)+"\" style=\"display:none;\">";
										dvdBannerHtml += "<p><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										dvdBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '04'){
										giftBannerCnt += 1;
										giftBannerHtml += "<div class=\"mdr\" id=\"giftCateBanner_"+(giftBannerCnt)+"\" style=\"display:none;\">";
										giftBannerHtml += "<p><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										giftBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '08'){
										kidsBannerCnt += 1;
										kidsBannerHtml += "<div class=\"mdr\" id=\"kidsCateBanner_"+(kidsBannerCnt)+"\" style=\"display:none;\">";
										kidsBannerHtml += "<p class=\"bn_img\"><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										kidsBannerHtml += "<p class=\"bn_txt\">"+data[i].subject+"</p>";
										kidsBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '05'){
										usedBannerCnt += 1;
										usedBannerHtml += "<div class=\"mdr\" id=\"usedCateBanner_"+(usedBannerCnt)+"\" style=\"display:none;\">";
										usedBannerHtml += "<p><a href=\"javascript:goBannerUrl('" + data[i].url + "', '" + data[i].target + "', '" + data[i].banseq + "');\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										usedBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '09'){
										tourBannerCnt += 1;
										tourBannerHtml += "<div class=\"mdr\" id=\"tourCateBanner_"+(tourBannerCnt)+"\" style=\"display:none;\">";
										tourBannerHtml += "<p><a href=\"" + data[i].url + "\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										tourBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '11'){
										cosBannerCnt += 1;
										cosBannerHtml += "<div class=\"mdr\" id=\"cosCateBanner_"+(cosBannerCnt)+"\" style=\"display:none;\">";
										cosBannerHtml += "<p><a href=\"" + data[i].url + "\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										cosBannerHtml += "</div>";
									}
									else if(data[i].prodtype == '12'){
										stationeryBannerCnt += 1;
										stationeryBannerHtml += "<div class=\"mdr\" id=\"stationeryCateBanner_"+(stationeryBannerCnt)+"\" style=\"display:none;\">";
										stationeryBannerHtml += "<p><a href=\"" + data[i].url + "\"><img src='http://image.bandinlunis.com/upload" + data[i].filename + "'></a></p>";
										stationeryBannerHtml += "</div>";
									}
									
								}
							}
							
							$("#bookCateBannerArea").html(bookBannerHtml);
							$("#exmCateBannerArea").html(exmBannerHtml);
							$("#kidsCateBannerArea").html(kidsBannerHtml);
							$("#eBookCateBannerArea").html(eBookBannerHtml);
							$("#musicCateBannerArea").html(musicBannerHtml);
							$("#dvdCateBannerArea").html(dvdBannerHtml);
							$("#giftCateBannerArea").html(giftBannerHtml);
							$("#usedCateBannerArea").html(usedBannerHtml);
							$("#tourCateBannerArea").html(tourBannerHtml);
							$("#cosCateBannerArea").html(cosBannerHtml);
							$("#stationeryCateBannerArea").html(stationeryBannerHtml);
							
							var bookRandomIndex = 0;
							var exmRandomIndex = 0;
							var kidsRandomIndex = 0;
							var eBookRandomIndex = 0;
							var musicRandomIndex = 0;
							var dvdRandomIndex = 0;
							var giftRandomIndex = 0;
							var usedRandomIndex = 0;
							var tourRandomIndex = 0;
							var cosRandomIndex = 0;
							var stationeryRandomIndex = 0;

							bookRandomIndex = Math.round(parseInt(Math.random() * bookBannerCnt)) + 1;
							exmRandomIndex = Math.round(parseInt(Math.random() * exmBannerCnt)) + 1;
							kidsRandomIndex = Math.round(parseInt(Math.random() * kidsBannerCnt)) + 1;
							eBookRandomIndex = Math.round(parseInt(Math.random() * eBookBannerCnt)) + 1;
							musicRandomIndex = Math.round(parseInt(Math.random() * musicBannerCnt)) + 1;
							dvdRandomIndex = Math.round(parseInt(Math.random() * dvdBannerCnt)) + 1;
							giftRandomIndex = Math.round(parseInt(Math.random() * giftBannerCnt)) + 1;
							usedRandomIndex = Math.round(parseInt(Math.random() * usedBannerCnt)) + 1;
							tourRandomIndex = Math.round(parseInt(Math.random() * tourBannerCnt)) + 1;
							cosRandomIndex = Math.round(parseInt(Math.random() * cosBannerCnt)) + 1;
							stationeryRandomIndex = Math.round(parseInt(Math.random() * stationeryBannerCnt)) + 1;
							
							$("#bookCateBanner_"+bookRandomIndex).show();
							$("#exmCateBanner_"+exmRandomIndex).show();
							$("#kidsCateBanner_"+kidsRandomIndex).show();
							$("#eBookCateBanner_"+eBookRandomIndex).show();
							$("#musicCateBanner_"+musicRandomIndex).show();
							$("#dvdCateBanner_"+dvdRandomIndex).show();
							$("#giftCateBanner_"+giftRandomIndex).show();
							$("#usedCateBanner_"+usedRandomIndex).show();
							$("#tourCateBanner_"+tourRandomIndex).show();
							$("#cosCateBanner_"+cosRandomIndex).show();
							$("#stationeryCateBanner_"+stationeryRandomIndex).show();

						}
						
						if (data[j].bannerdparea == '89'){
							var bannerHtml = '';
							for(var i=0;i<data.length;i++){
								if(data[i].bannerdparea =='89'){
								bannerHtml += '<div><a href="javascript:goBannerUrl(\''+data[i].url+'\', \''+ data[i].target+ '\', \''+data[i].banseq+'\');"><img src="http://image.bandinlunis.com/upload'+data[i].filename+'"></a></div>';
								}
							}
							$("#ssWrap").html(bannerHtml);
							
						}
						if (data[j].bannerdparea == '69' || data[j].bannerdparea == '31' || data[j].bannerdparea == '119'){
							
							var bannerHtml = "";
							for(var i=0;i<data.length;i++){
								if(data[i].bannerdparea =='31' || data[i].bannerdparea =='69' || data[i].bannerdparea =='119'){
								bannerHtml += '<div class="swiper-slide"><a href="javascript:goBannerUrl(\''+data[i].url+'\', \''+data[i].target+'\', \''+data[i].banseq+'\');"><img src="http://image.bandinlunis.com/upload'+data[i].filename+'"></a></div>';
								}
							$("#gnbBannerArea").html(bannerHtml);
							setGnbBannerSlide();
						}
					} 
				}
			}
		});
	}
	
	// Gnb 플래시 배너 설정 함수-
	function setGnbBanner() {
		if(checkMemType('15')) {
			var memSeq = "21058516";
			$.getScript("/ajax/getB2EBanner.do?memSeq="+memSeq,
				function(){
					if (data != null && typeof(data) == "object") {															
						var bannerHtml = '<div class="swiper-slide"><a href="javascript:goBannerUrl(\''+data.url+'\', \''+data.target+'\', \''+data.banseq+'\');"><img src="http://image.bandinlunis.com/upload'+data.filename+'"></a></div>';
						$("#gnbBannerArea").html(bannerHtml);
						setGnbBannerSlide();
					}   
				}
			);
		} 
	}
	
	function setGnbBannerSlide(){
		var mGnbBnIndex = parseInt(Math.random() * ($(".gnb_banner  .swiper-container .swiper-wrapper div").length));
		var mGnbBn = new Swiper('.gnb_banner .swiper-container',{
			initialSlide:mGnbBnIndex,
		    pagination: '.gnb_banner .pagination',
		    loop:true,
		    simulateTouch: false
		  });
		  $('#gnbBnLt').on('click', function(e){
		    e.preventDefault();
		    mGnbBn.swipePrev();
		  });
		  $('#gnbBnRt').on('click', function(e){
		    e.preventDefault();
		    mGnbBn.swipeNext();
		  });
	}
	
	function checkMemType(value) {				
		var flag = false;
		var temp = "01";
							
		if(temp == undefined || temp == ""){ return flag; }
		
		var memType = temp.split(",");
		if(value != "" && memType != "" && 0 < memType.length){
			for(var i = 0; i < memType.length; i++) {
                if(value == memType[i]) { flag = true;  break; }
            }
		}

		return flag;
	}
	
	
	
	function searchAdClear() {
		isSchKeywordFocus = true;
		$("#sch_keyword").val("");
		$("#ad_url").val("");
	}
	
	var isSchKeywordFocus = false;	// 키워드 로딩전 포커싱 갔을때 문제점 수정
	
	function setHeaderKeyword() {
		var prodType = '';
		if(prodType == null || prodType == ""){
			prodType = "01";
		}
		var keywordHtml = "";
		$.getScript("/ajax/getHeaderKeyword.do?prodType="+prodType+"&keywordDpAreas=01,02&sort=random",
			function(){
				if (data != null && data.length > 0 && typeof(data) == "object") {
					
					var loopCnt = 0;
					
					for(var j = 0; j < data.length; j++){
						if(data[j].keyword_dp_area == '01'){
							if(loopCnt < 4){
								keywordHtml += "<dd><a href=\""+data[j].url+"\">"+data[j].keyword+"</a></dd>";
								loopCnt++;
							}
							$("#seachIssue").html(keywordHtml);
						}
						
						if(data[j].keyword_dp_area == '02'){
							if (!isSchKeywordFocus) {
								$("#sch_keyword").val(data[j].keyword);
								$("#ad_url").val(data[j].url);
							}
						}
						
					}
				}
			}
		);
	}
	
	
	function latestBookCartInfo(){
		$.ajax({
			url: "/ajax/latestBookCartInfo.do",
			type: "post",
			data: {"page":1,"listSize":5},
			dataType: "json",
			success: function(data)	{
				if(data != null){
					var HTML = '<dt>최근담긴 상품</dt>';
					if(data.latestBookCartList != null && data.latestBookCartList.length > 0){
						for(var i=0;i<data.latestBookCartList.length;i++){
							HTML += '<dd>';
							HTML += '	<span class="cart_pimg"><a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId='+data.latestBookCartList[i].prod_id+'"><img src="http://image.bandinlunis.com/upload'+data.latestBookCartList[i].prod_img+'" onerror="this.src=\'/images/common/noimg_type02.gif\'"  ></a></span>';
							HTML += '	<span class="cart_pname"><a href="http://www.bandinlunis.com/front/product/detailProduct.do?prodId='+data.latestBookCartList[i].prod_id+'">'+data.latestBookCartList[i].prod_name+'</a></span>';
							HTML += '</dd>';	
						}
					}else{
						HTML += '<dd class="nodata">';
						HTML += '	쇼핑카트에 담긴 상품이<br> 없습니다.';
						HTML += '</dd>';
					}
					$("#cartListArea").html(HTML);
					$("#cartCnt").html("<span>"+data.latestBookCartTotCnt+"</span>");
					$("#cartCnt2").html(data.latestBookCartTotCnt);
				}
			},
			error: function(){
				
			}
		});
	}
	
	function tourSearch(url,add){
		document.getElementById("tourUrl").value=url;
		document.getElementById("add").value=add;
		document.tourForm.submit();
	}
	
	function tourPage(menu){
		tourSearch("http://hanatour.bandinlunis.com/app/default.asp?menu="+menu);
	}
	
	
	
    function showTimeBanner() {
    	
    	var _date = new Date();
    	
    	var _year = _date.getFullYear();
    	var _month = _date.getMonth()+1;
    	var _day = _date.getDate();
    	var _hour = _date.getHours();

    	var std = "" + LPAD2(_month) + LPAD2(_day) + LPAD2(_hour);
    	var fullStd = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day) + LPAD2(_hour);  
 
    	if(fullStd >= "2017090109" && fullStd <= "2017093023") {
    		$("#paycoLayer").show();
    	} 
    	
    	if(fullStd >= "2017110109" && fullStd <= "2018033123") {
    		$("#paycoLayer2").show();
    	} 
     }
	
</script>
<script type="text/javascript" charset="UTF-8" async="" src="http://s.n2s.co.kr/_n2s_ck_log.php"></script>

<script type="text/javascript" src="/webproject/resources/jsforJ/order.js"></script>

</head>
<body>

<div id="contentBody">
        <div id="contentWrap">          
            <div class="conWrap">
            	<div class="orderStepN">
                    <h2><img src="/webproject/resources/images/order/h2_order.gif" alt="주문/결제"></h2>

	                    <dl class="benefitA bf_order">
	                   		<dt class="bftit">나의 사용가능 혜택:</dt>
	                   		<dd>
	                   		 예치금<strong>0</strong>원 | 적립금 <strong>1,000</strong>원 | 쿠폰 <strong>0</strong>장  | 전환금 <strong>0</strong>원
	                   		</dd>
	                    </dl>
                    
					<!-- 복합결제 아닐 시 -->
                   		<p class="step"> <img src="/webproject/resources/images/order/navi_step02.gif" alt="쇼핑카트 > 주문/결제 > 주문완료"> </p>
                </div>
                
				<form name="frmMain" id="KCP_PAYINFO" method="post">

					<!-- 북셀프 카트에서 넘어왔거나 북셀프 복합결제 일때 rCartType 세팅 -->
					
					<!-- 복합결제 일때 gu 세팅 -->

					<!-- [2018.06 문화비소득공제] 소득공제상품과 일반상품 SQL에서 강제 분리되어 jsp에서 다시 변환 -->
					<input type="hidden" name="prod_id" class="prod_id" value="4034224">
					<input type="hidden" name="prod_name" value="돌이킬 수 없는 약속">
					<input type="hidden" name="main_cate_name" value="소설">
					<input type="hidden" name="opt_seq" value="0">
					<input type="hidden" name="ord_cnt" class="ord_cnt" value="1">
					<input type="hidden" name="last_prof" value="0">
					<input type="hidden" name="sale_cost" value="13500">
					<input type="hidden" name="comp_id" value="1">
					<input type="hidden" name="store_id" value="1">
					<input type="hidden" name="book_mem_seq" value="0">
					<input type="hidden" name="save_point" class="save_point" value="750">

					<input type="hidden" name="row_cnt" value="2">
					<input type="hidden" name="row_comp_id" value="1">
					<input type="hidden" name="row_store_id" value="1">
					<input type="hidden" name="row_bundle" value="Y">
					<input type="hidden" name="deli_cost" value="0">

					<!-- [2018.06 문화비소득공제] 소득공제상품과 일반상품 SQL에서 강제 분리되어 jsp에서 다시 변환 -->
					
					<input type="hidden" name="prod_id" class="prod_id" value="4181047">
					<input type="hidden" name="prod_name" value="죽고 싶지만 떡볶이는 먹고 싶어">
					<input type="hidden" name="main_cate_name" value="시/에세이/기행">
					<input type="hidden" name="opt_seq" value="0">
					<input type="hidden" name="ord_cnt" class="ord_cnt" value="1">
					<input type="hidden" name="last_prof" value="0">
					<input type="hidden" name="sale_cost" value="12420">
					<input type="hidden" name="comp_id" value="1">
					<input type="hidden" name="store_id" value="1">
					<input type="hidden" name="book_mem_seq" value="0">
					<input type="hidden" name="save_point" class="save_point" value="690">
					
					
					<input type="hidden" name="ord_prod_name" value="[도서] 돌이킬 수 없는 약속">

					<input type="hidden" name="reprProdName" value="[도서] 돌이킬 수 없는 약속 외 1종 ">
					
					
					<input type="hidden" id="orderCheck" value="0">
					<input type="hidden" name="paramString" value="cnt_ally=1,1&amp;seq_ally=48118596,48116888&amp;cartType=01&amp;origin=1&amp;directDiscountUseYn=N&amp;src_mem_ally=&amp;src_prod_id_ally=&amp;partner=&amp;prod_id_ally=4181047,4034224&amp;gu=&amp;memSeq=21058516&amp;prod_opt_ally=0,0">
					<input type="hidden" name="memSeq" value="21058516">
					
					<input type="hidden" name="tot_price" value="25920">
					<input type="hidden" name="cash_price" value="25920">
					<input type="hidden" name="deli_price" value="0">
					<input type="hidden" name="ord_type" value="01">
					<input type="hidden" name="origin" value="1">
					<input type="hidden" name="cartSeqs" value="">
					<input type="hidden" name="seqArrComma" value="48116888,48118596,">
					<input type="hidden" name="cpn_price_chk" value="0">
					<input type="hidden" name="cpnArray" value="">
					<input type="hidden" name="cpnPriceArray" value="">
					<input type="hidden" name="bookCpnArray" value="">
					<input type="hidden" name="bookCpnPriceArray" value="">
					<input type="hidden" name="gift_price" value="0">
					<input type="hidden" name="lotte_dc_price" value="0">
					
					<input type="hidden" name="deductionProcess" value="">
					<input type="hidden" name="deductionProdCntTot" value="2">
					<input type="hidden" name="nonDeductionProdCntTot" value="0">
					<input type="hidden" name="ndpc" value="0">
					
					
					<input type="hidden" name="req_tx" value="pay">                           <!-- 요청구분 -->
					<input type="hidden" name="site_name" value="BANDINLUNIS">       <!-- 사이트 이름 --> 
					<input type="hidden" name="site_cd" value="">       					   <!-- 사이트 코드-->
					<input type="hidden" name="ordr_idxx" value="">                             <!-- 주문번호 -->
					<input type="hidden" name="pay_method" value="">							   <!-- 결제수단 -->
					<input type="hidden" name="good_name" value="">                             <!-- 상품명   -->
					<input type="hidden" name="buyr_name" value="">                             <!-- 주문자명 -->
					<input type="hidden" name="buyr_mail" value="">                             <!-- E-mail   -->
					<input type="hidden" name="buyr_tel1" value="">                             <!-- 전화번호 -->
					<input type="hidden" name="buyr_tel2" value="">                             <!-- 휴대전화 -->
					<input type="hidden" name="currency" value="WON">                          <!-- 통화 코드-->
					<input type="hidden" name="shop_user_id" value="fkfmeod">
					<input type="hidden" name="eng_flag" value="N">                            <!-- 한 / 영  -->
					<input type="hidden" name="time_stamp" value="">                             <!-- 주문시간 -->
					
					<!-- 신용카드 설정 -->
					<input type="hidden" name="used_card_YN" value="Y">						   <!-- 특정 카드사 설정 여부 -->
					<input type="hidden" name="quotaopt" value="12">						   <!-- 선택가능 최대 할부 개월수 -->
					
					<!-- //KCP의 경우 별도의 무이자 설정 필요하지 않음(PG사 행사외에 무이자 없음)
					<input type="hidden" name="kcp_noint"        value=""/>						   		무이자 옵션 설정 여부
					<input type="hidden" name="kcp_noint_quota"  value=""/>							    무이자 설정
					 -->
					
					<!-- 가상계좌 설정 -->
					<input type="hidden" name="vcnt_expire_term" value="5">						   <!-- 가상계좌 유효기간 설정(+5일) -->
					<!-- 현금영수증 설정 -->
					<input type="hidden" name="disp_tax_yn" value="Y">						   <!-- 현금영수증 등록 창 출력 여부 -->
					<!-- 업체 로고 설정 -->
					<input type="hidden" name="site_logo" value="http://www.bandinlunis.com/images/bandi/bandilogo_kcp.jpg">
					<!-- PG 스킨 설정 -->
					<input type="hidden" name="skin_indx" value="3">
					
					<input type="hidden" name="tax_flag" value="TG03">						   	<!-- 변경불가 -->
					<input type="hidden" name="good_mny" value="25920">  					   	<!-- 결제금액 -->
					<input type="hidden" name="comm_tax_mny" value="0">  						<!-- 과세금액 --> 
					<input type="hidden" name="comm_vat_mny" value="0">  						<!-- 부가세   -->
					<input type="hidden" name="comm_free_mny" value="25920"> 				  	<!-- 비과세 금액 -->
					
					<!-- 에스크로 설정 -->
					<input type="hidden" name="escw_used" value="N">							<!-- 에스크로 사용 여부 (eBook 제외) -->
				    <input type="hidden" name="pay_mod" value="N">								<!-- 모드(O:신청한 조건대로 에스크로 결제 처리, Y: 무조건 에스크로, N: 무조건 일반 결제 -->
				    <input type="hidden" name="bask_cntx" value="1">								<!-- 장바구니 상품 개수 -->
				    <input type="hidden" name="deli_term" value="03">							<!-- 배송 소요일 -->
				    <input type="hidden" name="good_info" value="">								<!-- 상품 정보 항목명 -->
				    
				    <!-- PLUGIN 설정 정보입니다(변경 불가) -->
				    <input type="hidden" name="module_type" value="01">

				    <input type="hidden" name="res_cd" value="">
				    <input type="hidden" name="res_msg" value="">
				    <input type="hidden" name="tno" value="">
				    <input type="hidden" name="trace_no" value="">
				    <input type="hidden" name="enc_info" value="">
				    <input type="hidden" name="enc_data" value="">
				    <input type="hidden" name="ret_pay_method" value="">
				    <input type="hidden" name="tran_cd" value="">
				    <input type="hidden" name="bank_name" value="">
				    <input type="hidden" name="bank_issu" value="">
				    <input type="hidden" name="use_pay_method" value="">
			    	
			    	
					
					<input type="hidden" name="tot_sale_cost" value="25920">
					<input type="hidden" name="prod_point" value="1440">
					<input type="hidden" name="bandi_deli_cost" value="0">
					<input type="hidden" name="extra_deli_cost" value="0">
					<input type="hidden" name="store_deli_cost" value="0">
					<input type="hidden" name="fore_deli_cost" value="0">
					<input type="hidden" name="ord_tot_cnt" value="2">
					
					
					<input type="hidden" name="pt_idno" value="">
					<input type="hidden" name="pt_pwd" value="">
					
					
					<input type="hidden" name="store_code" value="">
					<input type="hidden" name="ho_code" value="">
					<input type="hidden" name="dc_code" value="">
					<input type="hidden" name="codePany" value="">
					<input type="hidden" name="codeName" value="">
					<input type="hidden" name="codeTel" value="">
					<input type="hidden" name="dc_name" value="">
					<input type="hidden" name="dcr_dock" value="">
					<input type="hidden" name="code_f" value="">
					<input type="hidden" name="dd_zone" value="">
					<input type="hidden" name="dd_bag" value="">
					<input type="hidden" name="eupmyeon" value="">
					<input type="hidden" name="post_no" value="">
					<input type="hidden" name="store_address1" value="">
					<input type="hidden" name="store_address2" value="">
					
					<!-- kakaoPay에서 TXN_ID 를 가져 올 때 함께 받아오는 변수 목록 -->
				    <input id="resultCode" name="resultCode" type="hidden" value="">
				    <input id="resultMsg" name="resultMsg" type="hidden" value="">
				    <input id="txnId" name="txnId" type="hidden" value="">
				    <input name="GoodsName" type="hidden" value="[도서] 돌이킬 수 없는 약속 외 1종 ">
				    
				    <!-- kakaoPay DLP창으로부터 받은 결과값을 SETTING 할 INPUT LIST -->
				    <input type="hidden" name="SPU" value="">
				    <input type="hidden" name="SPU_SIGN_TOKEN" value="">
				    <input type="hidden" name="MPAY_PUB" value="">
				    <!-- 부인방지 토큰 / RESULT_CODE == 00일 때는 항상 들어오는 값. -->
				    <!-- 해당값은 가군인증을 위해 돌려주는 값으로서, 가맹점과 카카오페이 양측에서 저장하고 있어야 한다. -->
				    <input type="hidden" name="NON_REP_TOKEN" value="">
				    <!-- OCB check -->
				    <input type="hidden" name="ocb_save_yn" id="ocb_save_yn" value="N">
				    <!-- payco -->
				    <input type="hidden" name="paycoReserveOrderNo" id="paycoReserveOrderNo" value="">
				    <input type="hidden" name="paycoToken" id="paycoToken" value="">
				    <input type="hidden" name="sellerKey" id="sellerKey" value="">
				    <!--  NaverPay -->
				    <input type="hidden" name="naverPaymentId" id="naverPaymentId" value="">
					<!--  BandiPay -->
				    <input type="hidden" name="payGb" id="payGb" value="RP">
				    <input type="hidden" name="PMid" id="PMid" value="bandi1r">
				    <input type="hidden" name="PCustId" id="PCustId" value="21058516">
				    <input type="hidden" name="POid" id="POid" value="">
				    <input type="hidden" name="PGoods" id="PGoods" value="">
				    <input type="hidden" name="PAmt" id="PAmt" value="">
				    <input type="hidden" name="PBname" id="PBname" value="">
				    
				    <input type="hidden" name="PDeduction" id="PDeduction" value="C">
				    
				    <input type="hidden" name="PNextUrl" id="PNextUrl" value="https://www.bandinlunis.com/pages/front/order/bandiPay_return.jsp">
				    <input type="hidden" name="PCancUrl" id="PCancUrl" value="https://www.bandinlunis.com/pages/front/order/bandiPay_return.jsp">
				    <input type="hidden" name="PHash" id="PHash" value="">
				    <input type="hidden" name="bandiPaymentId" id="bandiPaymentId" value="">
	            	<fieldset>
					
		            	<h3 class="orderTit mt20 pos_rel">
		            		<img src="/webproject/resources/images/order/h3_order_step01.gif" alt="1. 주문상품 확인">
		            		
			            		<span class="dedu_txt">도서 소득공제 상품</span> <span class="sp_btn sp_help" onmouseover="javascript:popLayer('deductionInfo')" onmouseout="javascript:popHidden('deductionInfo')"><span>?</span></span>
		            			<div class="bookViewPop al_left" id="deductionInfo" style="visibility: hidden; left 20px; top: 22px; width: 320px;">
		            				<h3 class="mLine">도서 소득공제 대상 안내</h3>
		            				<div class="laypopCon t_12 t_normal">
		            					<p class="mt5">
											저자, 발행인, 발행일, 출판사, 국제표준도서번호(ISBN. 다만, 전자책의 경우
											ECN 포함)이 기록된 간행물로 종이책(학술서, 만화, 학습참고서 포함), 전자책
											(오디오북, 웹툰, 웹소설 포함)<br>
											(※ 잡지, eBook 대여, 과세도서 제외)
										</p>
									</div>
								</div>
		            	</h3>
		            	
		            	<table cellpadding="0" cellspacing="0" class="orderTable">
		            		<colgroup><col width="55"><col><col width="90"><col width="120"><col width="100"><col width="100"><col width="130"></colgroup>
		            		<tbody><tr>
		            			<th colspan="2">주문상품</th>
		            			<th>수량</th>
		            			<th>주문금액</th>
		            			<th>배송비</th>
		            			<th>예상적립금</th>
		            			<th>주문 금액 합계</th>
		            		</tr>
		            		
		            		
		            		
		            		<tr class="prodViewRepr">
		            			<td>
		            				<span class="book_img"><img src="/webproject/resources/upload/product/4034/4034224_s.jpg" onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type04.gif'"></span>
		            			</td> 
		            			<td class="prod_name">[도서] 돌이킬 수 없는 약속 외 1종 </td>
		            			<td>총2종(2개)</td>
		            			<td><strong>25,920원</strong></td>
		            			<td>0원</td>            			
		            			<td>1,440원</td>
		            			<td><strong class="t_red">25,920원</strong></td>
		            		</tr>

		            		<tr class="prodViewAll" style="display:none;">
		            			<td>
		            				<span class="book_img"><img src="/webproject/resources/upload/product/4034/4034224_s.jpg"></span>
		            			</td>
		            			<td class="prod_name"> [도서] 돌이킬 수 없는 약속</td>
		            			<td>1개</td>
		            			<td><strong>13,500원</strong></td>
		            			<td rowspan="2">
			            		10,000원 이상<br>무료배송<br>
			            		/미만시 2,000원
			            		</td>
		            			<td>750원</td>
		            			<td><strong class="t_red">13,500원</strong></td>
		            		</tr>
	            			
		            		<tr class="prodViewAll" style="display:none;">
		            			<td>
		            				<span class="book_img"><img src="/webproject/resources/upload/product/4181/4181047_s.jpg"></span>
		            			</td>
		            			<td class="prod_name"> [도서] 죽고 싶지만 떡볶이는 먹고 싶어</td>
		            			<td>1개</td>
		            			<td><strong>12,420원</strong></td>
		            			<td>690원</td>
		            			<td><strong class="t_red">12,420원</strong></td>
		            		</tr>

		            	</tbody></table>
		            	
		            	<div class="overflow">
		            		 
		            		<div class="fl_left mt10 ml10 receive_check">
			            		<div class="mb5">반디배송상품 <strong id="bandi_deli_expect">2018년 10월 17일(수)</strong></div>
				            </div>
			            	<div class="fl_right mt10">
			            		<span class="t_11gr mr5">주문상품 변경을 원하시면 </span>
		            			<a href="javascript:goCart();"><img src="/webproject/resources/images/order/btn_order_cartmodify.gif" alt="쇼핑카트 수정하기"></a>
		            			<a href="javascript://"><img src="/webproject/resources/images/order/btn_order_prodview.gif" id="btn_switchView" alt="전체상품 보기"></a>
			            	</div>
		            	</div>
		            	
	            		<h3 class="orderTit mt40 fl_clear"><img src="/webproject/resources/images/order/h3_order_step02.gif" alt="2. 배송방법 선택"></h3>
		            	
          					
		            	<div class="order_deli">
			            	<table cellpadding="0" cellspacing="0" class="orderTable2" width="728">
			            		<colgroup><col width="140"><col width="588"></colgroup>
			            		<tbody><tr id="tr_deliCode" style="display: table-row;">
			            			<th>배송방법</th>
			            			<td>
			            				<span><input type="radio" name="deli_code" id="deli_01" value="01" class="mt3m mr3 btn_deliCode" checked=""><label for="deli_01">일반택배</label></span>
			            				<span class="ml15" id="deliMethod_07" style=""><input type="radio" name="deli_code" id="deli_07" value="07" class="mt3m mr3 btn_deliCode"><label for="deli_07">편의점택배</label></span>
			            				<span class="ml15" id="deliMethod_13" style="display:none;"><input type="radio" name="deli_code" id="deli_13" value="13" class="mt3m mr3 btn_deliCode"><label for="deli_13">편의점택배</label></span>
			            				<!-- 
			            				<span class="ml15" id="deliMethod_03" style="display:none;"><input type="radio" name="deli_code" id="deli_03" value="03" class="mt3m mr3 btn_deliCode"><label for="deli_03">해외배송</label></span>
			            				 -->
			            				<span class="ml15" id="deliMethod_02" style="display:none;"><input type="radio" name="deli_code" id="deli_02" value="02" class="mt3m mr3 btn_deliCode"><label for="deli_02">직원주문(매장수령)</label></span>
			            				<span class="ml10" id="deliMethod_02_1" style="display:none;">
			            					<select name="deli_store_code" disabled=""><option value="01">본사</option><option value="02">신세계강남점</option><option value="04">롯데월드몰점</option><option value="05">사당역점</option><option value="06">롯데스타시티점</option><option value="07">신림역점</option><option value="08">목동점</option><option value="09">롯데몰수원점</option><option value="10">현대일산점</option><option value="13">서강점</option><option value="14">파주물류센터</option><option value="15">롯데피트인산본점</option></select>
			            				</span>
			            			</td>
			            		</tr>

			            		<tr id="tr_deliAddrSelect" style="display: table-row;">
			            			<th>배송지선택</th>
			            			<td>
			            				<span><input type="radio" name="deli_input_type" id="deli2_01" value="01" class="mt3m mr3" checked=""><label for="deli2_01">기본배송지</label></span> 
			            				<span class="ml15"><input type="radio" name="deli_input_type" id="deli2_02" value="02" class="mt3m mr3"><label for="deli2_02">새로입력</label></span>
			            				<span class="ml15"><input type="radio" name="deli_input_type" id="deli2_04" value="04" class="mt3m mr3"><label for="deli2_04">회원정보와 동일</label> </span>
			            				<span class="ml15"><input type="radio" name="deli_input_type" id="deli2_03" value="03" class="mt3m mr3"><label for="deli2_03" id="label_addr_name">최근배송지()</label> </span>
			            				<img src="/webproject/resources/images/order/btn_order_deli.gif" alt="배송지 더 보기" class="mt3m mr3" id="btn_deliAddrMore" style="cursor:pointer;">
			            				<p class="mt5 t_11gr">'최근 배송지 목록’에 추가하시려면 [새로입력]을 선택하여 입력해주세요.</p>
			            			</td>
			            		</tr>
			            		
			            		<tr id="tr_deliName" style="display: table-row;">
			            			<th class="line_none pb0">받으실 분</th>
			            			<td class="line_none pb0"><input type="text" name="rcvr_name" size="20" maxlength="20" value="" class="o_input"></td>
			            		</tr>
			            		<tr id="tr_deliMobile" style="display: table-row;">
			            			<th class="line_none pb0">휴대폰</th>
			            			<td class="line_none pb0">
			            				<select name="rcvr_tel2_part1"><option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="018">018</option><option value="019">019</option><option value="0502">0502</option><option value="0503">0503</option><option value="0504">0504</option><option value="0505">0505</option><option value="0506">0506</option><option value="0507">0507</option><option value="0508">0508</option><option value="0509">0509</option></select> -
			            				<input type="text" name="rcvr_tel2_part2" size="4" maxlength="4" value="" class="o_input" style="ime-mode:disabled;width:20%" onkeypress="goNumCheck();"> -
			            				<input type="text" name="rcvr_tel2_part3" size="4" maxlength="4" value="" class="o_input" style="ime-mode:disabled;width:20%" onkeypress="goNumCheck();">
			            				<input type="hidden" name="rcvr_tel2" value="">
			            			</td>
			            		</tr>
			            		<tr id="tr_deliPhone" style="display: table-row;">
			            			<th>유선전화 (선택)</th>
			            			<td>
			            				<select name="rcvr_tel1_part1"><option value="02">02</option><option value="031">031</option><option value="032">032</option><option value="033">033</option><option value="041">041</option><option value="042">042</option><option value="043">043</option><option value="044">044</option><option value="051">051</option><option value="052">052</option><option value="053">053</option><option value="054">054</option><option value="055">055</option><option value="061">061</option><option value="062">062</option><option value="063">063</option><option value="064">064</option><option value="070">070</option><option value="0502">0502</option><option value="0503">0503</option><option value="0504">0504</option><option value="0505">0505</option><option value="0506">0506</option><option value="0507">0507</option><option value="0508">0508</option><option value="0509">0509</option></select> -            				
			            				<input type="text" name="rcvr_tel1_part2" size="4" maxlength="4" value="" class="o_input" style="ime-mode:disabled;" onkeypress="goNumCheck();"> -
			            				<input type="text" name="rcvr_tel1_part3" size="4" maxlength="4" value="" class="o_input" style="ime-mode:disabled;" onkeypress="goNumCheck();">
			            				<input type="hidden" name="rcvr_tel1" value="">
			            			</td>
			            		</tr>
			            		<tr id="tr_deliAddr" style="display: table-row;">
			            			<th>주소</th>
			            			<td>
			            				<p>
			            					<input type="text" name="rcvr_zip1" size="6" value="" class="o_input" readonly="">
			            					<input type="hidden" name="rcvr_zip2" value="">
			            					
			            						<img src="/webproject/resources/images/order/btn_order_zipcode.gif" class="mt2 btn_popPost" alt="우편번호찾기" style="cursor:pointer;">
			            					
			            				</p>
			            				<p class="mt5">
			            					<input type="text" name="rcvr_addr1" value="" size="30" class="o_input" readonly="">
			            					<input type="text" id="rcvr_addr2" name="rcvr_addr2" size="40" class="o_input" value="나머지 주소 입력" style="color:grey;">
			            				</p>
			            				<p class="mt5 t_11gr">우편번호를 찾지 못하시거나 주소 입력에 어려움을 느끼실 경우 고객센터 1577-4030으로 문의 주십시오.</p>
			            				<input type="hidden" name="rcvr_post" value="">
			            			</td>
			            		</tr>
			            		<tr id="tr_deliMsg" style="display: table-row;">
			            			<th>배송 메시지</th>
			            			<td class="pos_rel">
			            				<p><input type="text" id="ref_msg" name="ref_msg" size="70" maxlength="50" class="o_input" placeholder="택배 기사님께 전달 할 메시지를 남겨주세요" onclick="onChangeText(this,'deli_req_stat')" onkeyup="onChangeText(this,'deli_req_stat')" onkeypress="onChangeText(this,'deli_req_stat')"> <span class="di_in t_gr4_v" id="deli_req_stat">(0/50)</span></p>
			            				<p class="mt5 t_11gr">택배 기사님께 전달 할 메시지를 남겨주세요. 주문 관련 사항은   1:1상담을 이용해주십시오.</p>
			            				<!-- 배송 메시지  -->
			            				<ul class="pre_deliMsg" style="display:none">
			            					<li value="0">배송 전에 미리 연락 바랍니다.</li>
			            					<li value="1">부재 시 경비실에 맡겨 주세요.</li>
			            					<li value="2">부재 시 전화 주시거나 문자 남겨주세요.</li>
			            				</ul>
			            			</td>
			            		</tr>
			            		<tr id="tr_deliGift" style="display: table-row;">
			            			<th class="line_none">선물포장</th>
			            			<td class="line_none">
			            				<div>
				            				<span>선물포장을 하시겠습니까? (1,000원 추가)</span>
				            				<span class="ml15"><input type="radio" name="gift_yn" value="Y" class="mt3m mr3 btn_giftYn"><label for="">예</label></span> 
				            				<span class="ml15"><input type="radio" name="gift_yn" value="N" class="mt3m mr3 btn_giftYn" checked=""><label for="">아니오</label></span>
				            				<span class="ml10"><img src="/webproject/resources/images/order/btn_order_pack.gif" id="btn_giftInfo" alt="선물포장 안내" class="mt3m" style="cursor:pointer;"></span>
			            				</div>
			            				
			            				<div id="div_giftMsg" style="display:none">
				            				<div class="mt10"><span><textarea name="gift_msg" cols="81" rows="4" onclick="onChangeText(this,'gift_req_stat')" onkeyup="onChangeText(this,'gift_req_stat')" onkeypress="onChangeText(this,'gift_req_stat')"></textarea></span> <span class="di_in t_gr4_v" id="gift_req_stat">(0/50)</span></div>
						            		<ul class="dotList mt5 ml5 mr10">
						            			<li>포장 가능 개수는 선물박스 사이즈에 따라 <strong style="color:#7b5844">최소3권~최대 5권</strong> 이내만 가능합니다.</li>
						            			<li class="mt3">메시지는 별도 엽서에 인쇄 후 박스 안에 담아 발송됩니다.</li>
						            			<li class="mt3">선물포장 주문 건은 <strong style="color:#7b5844">당일배송에서 제외</strong>되며, 거래명세서는 발송되지 않습니다.</li>
						            			<li class="mt3">상품이 박스크기에 맞지 않아 포장이 어려운 경우 안내 후 포장비는 <strong style="color:#7b5844">환불</strong> 해드립니다.</li>
						            		</ul>				            				
					            		</div>
			            			</td>
			            		</tr>
			            		
			            		<!-- 편의점 선택시 -->
			            		<tr id="tr_deliCvsName" style="display: none;">
			            			<th class="line_none pb0">편의점 이름</th>
			            			<td class="line_none pb0">
			            				<input type="text" name="cvs_rcvr_addr1" size="25" value="" class="o_input" readonly="">
			            				
			            					<span id="btn_cvsNetMap_CU" class="btn_w_comm btype_a2" style="cursor:pointer;">편의점 선택(CU)</span>
			            					<span id="btn_cvsNetMap_GS" class="btn_w_comm btype_a2" style="cursor:pointer;">편의점 선택(GS)</span>
			            				
			            			</td>
			            		</tr>
			            		<tr id="tr_deliCvsPhone" style="display: none;">
			            			<th class="line_none" height="80" valign="top">편의점 연락처</th>
			            			<td class="line_none" valign="top">
			            				<input type="text" name="cvs_rcvr_addr2" size="25" value="" class="o_input" readonly="">
			            			</td>
			            		</tr>
			            		
			            		<!-- 해외배송 선택시 -->
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th class="line_none pb0">Name</th>
			            			<td class="line_none pb0"><input type="text" name="eng_rcvr_name" size="30" class="o_input"></td>
			            		</tr>
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th>Phone</th>
			            			<td>
			            				<input type="text" name="eng_rcvr_tel1" size="25" class="o_input">
			            			</td>
			            		</tr>
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th class="line_none pb0">Zip code</th>
			            			<td class="line_none pb0"><input type="text" name="eng_rcvr_post" size="25" class="o_input"></td>
			            		</tr>
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th class="line_none pb0">Country</th>
			            			<td class="line_none pb0">
			            				<select name="eng_rcvr_country" style="width:172px;">
			           						<option>Select Country</option>
		           							
		           								<option value="1">ALBANIA</option>
		           							
		           								<option value="2">ALGERIA</option>
		           							
		           								<option value="3">AMERICAN SAMOA</option>
		           							
		           								<option value="4">ANDORRA</option>
		           							
		           								<option value="5">ANGOLA</option>
		           							
		           								<option value="6">ANGUILLA</option>
		           							
		           								<option value="7">ANTIGUA</option>
		           							
		           								<option value="8">ARGENTINA</option>
		           							
		           								<option value="9">ARMENIA</option>
		           							
		           								<option value="10">ARUBA</option>
		           							
		           								<option value="11">AUSTRALIA</option>
		           							
		           								<option value="12">AUSTRIA</option>
		           							
		           								<option value="13">AZERBAIJAN</option>
		           							
		           								<option value="14">BAHAMAS</option>
		           							
		           								<option value="15">BAHRAIN</option>
		           							
		           								<option value="16">BANGLADESH</option>
		           							
		           								<option value="17">BARBADOS</option>
		           							
		           								<option value="18">BELARUS</option>
		           							
		           								<option value="19">BELGIUM</option>
		           							
		           								<option value="20">BELIZE</option>
		           							
		           								<option value="21">BENIN</option>
		           							
		           								<option value="22">BERMUDA</option>
		           							
		           								<option value="23">BHUTAN</option>
		           							
		           								<option value="24">BOLIVIA</option>
		           							
		           								<option value="25">BONAIRE</option>
		           							
		           								<option value="26">BOSNIA AND HERZEGOVINA</option>
		           							
		           								<option value="27">BOTSWANA</option>
		           							
		           								<option value="28">BRAZIL</option>
		           							
		           								<option value="29">BRUNEI</option>
		           							
		           								<option value="30">BULGARIA</option>
		           							
		           								<option value="31">BURKINA FASO</option>
		           							
		           								<option value="32">BURUNDI</option>
		           							
		           								<option value="33">CAMBODIA</option>
		           							
		           								<option value="34">CAMEROON</option>
		           							
		           								<option value="35">CANADA</option>
		           							
		           								<option value="36">CANARY ISLANDS, THE</option>
		           							
		           								<option value="37">CAPE VERDE</option>
		           							
		           								<option value="38">CAYMAN ISLANDS</option>
		           							
		           								<option value="39">CENTRAL AFRICAN REPUBLIC</option>
		           							
		           								<option value="40">CHAD</option>
		           							
		           								<option value="41">CHILE</option>
		           							
		           								<option value="42">CHINA,PEOPLE'S REPUBLIC OF</option>
		           							
		           								<option value="43">COLOMBIA</option>
		           							
		           								<option value="44">COMOROS</option>
		           							
		           								<option value="45">CONGO</option>
		           							
		           								<option value="46">COOK ISLANDS</option>
		           							
		           								<option value="47">COSTA RICA</option>
		           							
		           								<option value="48">CROATIA</option>
		           							
		           								<option value="49">CUBA</option>
		           							
		           								<option value="50">CURACAO</option>
		           							
		           								<option value="51">CYPRUS</option>
		           							
		           								<option value="52">CZECH REPUBLIC, THE</option>
		           							
		           								<option value="53">DENMARK</option>
		           							
		           								<option value="54">DJIBOUTI</option>
		           							
		           								<option value="55">DOMINICA</option>
		           							
		           								<option value="56">DOMINICAN REPUBLIC</option>
		           							
		           								<option value="57">ECUADOR</option>
		           							
		           								<option value="58">EGYPT</option>
		           							
		           								<option value="59">EL SALVADOR</option>
		           							
		           								<option value="60">EQUATORIAL GUINEA</option>
		           							
		           								<option value="61">ERITREA</option>
		           							
		           								<option value="62">ESTONIA</option>
		           							
		           								<option value="63">ETHIOPIA</option>
		           							
		           								<option value="64">FAROE ISLANDS</option>
		           							
		           								<option value="65">FIJI ISLANDS</option>
		           							
		           								<option value="66">FINLAND</option>
		           							
		           								<option value="67">FRANCE</option>
		           							
		           								<option value="68">FRENCH GUIANA</option>
		           							
		           								<option value="69">GABON</option>
		           							
		           								<option value="70">GAMBIA</option>
		           							
		           								<option value="71">GEORGIA</option>
		           							
		           								<option value="72">GERMANY</option>
		           							
		           								<option value="73">GHANA</option>
		           							
		           								<option value="74">GIBRALTAR</option>
		           							
		           								<option value="75">GREECE</option>
		           							
		           								<option value="76">GREENLAND</option>
		           							
		           								<option value="77">GRENADA</option>
		           							
		           								<option value="78">GUADELOUPE</option>
		           							
		           								<option value="79">GUAM</option>
		           							
		           								<option value="80">GUATEMALA</option>
		           							
		           								<option value="81">GUERNSEY(CHANNEI ISLAND)</option>
		           							
		           								<option value="82">GUINEA BISSAU</option>
		           							
		           								<option value="83">GUINEA REPUBLIC</option>
		           							
		           								<option value="84">GUYANA</option>
		           							
		           								<option value="85">HAITI</option>
		           							
		           								<option value="86">HAWAII</option>
		           							
		           								<option value="87">HONDURAS, REPUBLIC</option>
		           							
		           								<option value="88">HONG KONG</option>
		           							
		           								<option value="89">HUNGARY</option>
		           							
		           								<option value="90">ICELAND</option>
		           							
		           								<option value="91">INDIA</option>
		           							
		           								<option value="92">INDONESIA</option>
		           							
		           								<option value="93">IRAN</option>
		           							
		           								<option value="94">IRELAND, REPUBLIC OF</option>
		           							
		           								<option value="217">ISRAEL</option>
		           							
		           								<option value="95">ITALY</option>
		           							
		           								<option value="96">IVORY COAST</option>
		           							
		           								<option value="97">JAMAICA</option>
		           							
		           								<option value="98">JAPAN</option>
		           							
		           								<option value="99">JERSEY</option>
		           							
		           								<option value="100">JORDAN</option>
		           							
		           								<option value="101">KAZAKHSTAN</option>
		           							
		           								<option value="102">KENYA</option>
		           							
		           								<option value="103">KIRIBATI, REPUBLIC OF</option>
		           							
		           								<option value="104">KUWAIT</option>
		           							
		           								<option value="105">KYRGYZSTAN</option>
		           							
		           								<option value="106">LAOS</option>
		           							
		           								<option value="107">LATVIA</option>
		           							
		           								<option value="108">LEBANON</option>
		           							
		           								<option value="109">LESOTHO</option>
		           							
		           								<option value="110">LIBERIA</option>
		           							
		           								<option value="111">LIBYA</option>
		           							
		           								<option value="112">LIECHTENSTEIN</option>
		           							
		           								<option value="113">LITHUANIA</option>
		           							
		           								<option value="114">LUXEMBOURG</option>
		           							
		           								<option value="115">MACAU</option>
		           							
		           								<option value="116">MADAGASCAR</option>
		           							
		           								<option value="117">MALAWI</option>
		           							
		           								<option value="118">MALAYSIA</option>
		           							
		           								<option value="119">MALDIVES</option>
		           							
		           								<option value="120">MALI</option>
		           							
		           								<option value="121">MALTA</option>
		           							
		           								<option value="122">MARSHALL ISLANDS</option>
		           							
		           								<option value="123">MARTINIQUE</option>
		           							
		           								<option value="124">MAURITANIA</option>
		           							
		           								<option value="125">MAURITIUS</option>
		           							
		           								<option value="126">MEXICO</option>
		           							
		           								<option value="127">MOLDOVA, REPUBLIC OF</option>
		           							
		           								<option value="128">MONACO</option>
		           							
		           								<option value="129">MONGOLIA</option>
		           							
		           								<option value="130">MONTSERAT</option>
		           							
		           								<option value="131">MOROCCO</option>
		           							
		           								<option value="132">MOZAMBIQUE</option>
		           							
		           								<option value="133">MYANMAR(BURMA)</option>
		           							
		           								<option value="134">NAMIBIA</option>
		           							
		           								<option value="135">NAURU, REPUBLIC OF</option>
		           							
		           								<option value="136">NEPAL</option>
		           							
		           								<option value="137">NETHERLANDS, THE</option>
		           							
		           								<option value="138">NEVIS</option>
		           							
		           								<option value="139">NEW CALEDONIA</option>
		           							
		           								<option value="140">NEW ZEALAND</option>
		           							
		           								<option value="141">NICARAGUA</option>
		           							
		           								<option value="142">NIGER</option>
		           							
		           								<option value="143">NIGERIA</option>
		           							
		           								<option value="144">NIUE</option>
		           							
		           								<option value="145">NORTH KOREA</option>
		           							
		           								<option value="146">NORWAY</option>
		           							
		           								<option value="147">OMAN</option>
		           							
		           								<option value="148">PAKISTAN</option>
		           							
		           								<option value="149">PANAMA</option>
		           							
		           								<option value="150">PAPUA NEW GUINEA</option>
		           							
		           								<option value="151">PARAGUAY</option>
		           							
		           								<option value="152">PERU</option>
		           							
		           								<option value="153">PHILIPPINES</option>
		           							
		           								<option value="154">POLAND</option>
		           							
		           								<option value="155">PORTUGAL</option>
		           							
		           								<option value="156">PUERTO RICO</option>
		           							
		           								<option value="157">QATAR</option>
		           							
		           								<option value="158">REUNION, ISLAND OF</option>
		           							
		           								<option value="159">ROMANIA</option>
		           							
		           								<option value="160">RUSSIAN FEDERATION</option>
		           							
		           								<option value="161">RWANDA</option>
		           							
		           								<option value="162">SAIPAN</option>
		           							
		           								<option value="163">SAO TOME AND PRINCIPE</option>
		           							
		           								<option value="164">SAUDI ARABIA</option>
		           							
		           								<option value="165">SENEGAL</option>
		           							
		           								<option value="166">SEYCHELLES</option>
		           							
		           								<option value="167">SIERRA LEONE</option>
		           							
		           								<option value="169">SINGAPORE</option>
		           							
		           								<option value="168">SLOVAKIA, REPUBLIC OF</option>
		           							
		           								<option value="170">SLOVENIA</option>
		           							
		           								<option value="171">SOLOMON ISLANDS</option>
		           							
		           								<option value="172">SOUTH AFRICA</option>
		           							
		           								<option value="173">SPAIN</option>
		           							
		           								<option value="174">SRI LANKA</option>
		           							
		           								<option value="175">ST. BARTHELEMY</option>
		           							
		           								<option value="176">ST. EUSTATIUS</option>
		           							
		           								<option value="177">ST. KITTS</option>
		           							
		           								<option value="178">ST. LUCIA</option>
		           							
		           								<option value="179">ST. MAARTEN</option>
		           							
		           								<option value="180">ST. VINCENT</option>
		           							
		           								<option value="181">SUDAN</option>
		           							
		           								<option value="182">SURINAME</option>
		           							
		           								<option value="183">SWAZILAND</option>
		           							
		           								<option value="184">SWEDEN</option>
		           							
		           								<option value="185">SWITZERLAND</option>
		           							
		           								<option value="186">SYRIA</option>
		           							
		           								<option value="187">TAHITI</option>
		           							
		           								<option value="188">TAIWAN</option>
		           							
		           								<option value="189">TAJIKISTAN</option>
		           							
		           								<option value="190">TANZANIA</option>
		           							
		           								<option value="191">THAILAND</option>
		           							
		           								<option value="192">TOGO</option>
		           							
		           								<option value="193">TONGA</option>
		           							
		           								<option value="194">TRINIDAD AND TOBAGO</option>
		           							
		           								<option value="197">TRUKS AND CAICOS ISLANDS</option>
		           							
		           								<option value="195">TURKEY</option>
		           							
		           								<option value="196">TURKMENISTAN</option>
		           							
		           								<option value="198">TUVALU</option>
		           							
		           								<option value="204">U.S.A.</option>
		           							
		           								<option value="199">UGANDA</option>
		           							
		           								<option value="200">UKRAINE</option>
		           							
		           								<option value="201">UNITED ARAB EMIRATES</option>
		           							
		           								<option value="202">UNITED KINGDOM</option>
		           							
		           								<option value="203">URUGUAY</option>
		           							
		           								<option value="205">UZBEKISTAN</option>
		           							
		           								<option value="206">VANUATU</option>
		           							
		           								<option value="207">VENEZUELA</option>
		           							
		           								<option value="208">VIETNAM</option>
		           							
		           								<option value="209">VIRGIN ISLAND(BRITISH)</option>
		           							
		           								<option value="210">VIRGIN ISLAND, U.S.</option>
		           							
		           								<option value="211">WESTERN SAMOA</option>
		           							
		           								<option value="212">YEMEN REPUBLIC</option>
		           							
		           								<option value="213">YUGOSLAVIA</option>
		           							
		           								<option value="214">ZAIRE</option>
		           							
		           								<option value="215">ZAMBIA</option>
		           							
		           								<option value="216">ZIMBABWE</option>
		           							
			           						<option>없음</option>
			           					</select>
			            			</td>
			            		</tr>
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th class="line_none pb0">City</th>
			            			<td class="line_none pb0"><input type="text" name="eng_rcvr_city" size="25" class="o_input"></td>
			            		</tr>
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th class="line_none pb0">State/Province</th>
			            			<td class="line_none pb0"><input type="text" name="eng_rcvr_state" size="25" class="o_input"></td>
			            		</tr>
			            		<tr class="tr_deliEng" style="display:none;">
			            			<th class="line_none">Address</th>
			            			<td class="line_none">
			            				<input type="text" name="eng_rcvr_addr1" size="30" class="o_input"> <input type="text" name="eng_rcvr_addr2" size="40" class="o_input">
			            			</td>
			            		</tr>
			            	</tbody></table>
			            	
			            	
			            	<div class="order_deli_box" style="display: block;">
			            		<h4 class="order_deli_tit">주문자 정보</h4>
			            		<dl class="order_buy_info">
			            			<dt>이름</dt>
			            			<dd>
			            				
			            					<input type="text" name="sndr_name" size="15" value="라영준" class="o_input">
			            				
			            				
			            			</dd>
			            			<dt>휴대폰</dt>
			            			<dd>
										<select name="sndr_tel2_part1" style="width:49px;height:20px;"><option value="">선택</option><option value="010" selected="selected">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="018">018</option><option value="019">019</option><option value="0502">0502</option><option value="0503">0503</option><option value="0504">0504</option><option value="0505">0505</option><option value="0506">0506</option><option value="0507">0507</option><option value="0508">0508</option><option value="0509">0509</option></select>-<input type="text" name="sndr_tel2_part2" value="5461" maxlength="4" size="4" class="o_input" style="ime-mode:disabled;width:25%;" onkeypress="goNumCheck();">-<input type="text" name="sndr_tel2_part3" value="0811" maxlength="4" size="4" class="o_input" style="ime-mode:disabled;width:25%;" onkeypress="goNumCheck();">
										<input type="hidden" name="sndr_tel2">
										<input type="hidden" name="sndr_tel1" value="">
			           				</dd>
			            			<dt>이메일</dt>
			            			<dd>
			            				<input type="text" name="sndr_mail" size="18.5" maxlength="40" class="o_input" value="rmvely@gmail.com">
			            				<input type="hidden" name="sndr_post" value="">
			            				<input type="hidden" name="sndr_addr1" value="">
			            				<input type="hidden" name="sndr_addr2" value="">
			            				
			            					<input type="hidden" name="sndr_num" value="8807121">
			            				
			            				
			            			</dd>
			            			
			            		</dl>
			            		
			            	</div>
			            	
			            	<div class="order_deli_box cvsnetInfo" style="display: none;">
			            		<h4 class="order_deli_tit">편의점 택배 안내</h4>
			            		<div class="mt10 ml10 mr10">주문 시 가까운 편의점을 선택하시면 24시간 영업을 하고 있는 편의점에서 주문하신 도서를 받으실 수 있습니다.</div>
			            		<div class="mt10 ml10 mr10 al_center">
			            			<img src="/webproject/resources/images/order/btn_order_cvsinfo.gif" id="btn_cvsNetInfo" alt="편의점 택배 더 보기" style="cursor:pointer;">
			            			<img src="/webproject/resources/images/order/btn_order_cvsdeli.gif" id="btn_cvsNetInfo2" alt="편의점 배송 시간 안내" style="cursor:pointer;">
			            		</div>
			            		
			            		<ul class="dotList mt10 ml10 mr10">
			            			<li><strong class="t_org">당일배송 상품</strong>은 <strong class="t_org">‘일반택배’</strong> 를 이용 해 주십시오. </li>
			            			<li class="mt10">편의점 택배는 안내된 <strong class="t_org">예상수령일보다 다소 지연</strong>되어 도착할 수 있습니다. </li>
			            			<li class="mt10">이용 가능한 편의점은 GS25 와 CU 입니다.(제주도와 도서지역 제외) </li>
			            		</ul>
			            		
			            		<div class="deli_box_close">
			            			<img src="/webproject/resources/images/order/btn_order_close.gif" alt="닫기" style="cursor:pointer;">
			            		</div>
			            	</div>
			            	
			            	<div class="order_deli_box foreignInfo" style="display:none">
			            		<h4 class="order_deli_tit">해외 배송 안내  </h4>
			            		<div class="mt10 ml10 mr10 al_center">
			            			<img src="/webproject/resources/images/order/btn_order_foreign.gif" id="btn_globalDeliCost" alt="해외배송비 안내" style="cursor:pointer;">
			            		</div>
			            		<ul class="dotList mt10 ml10 mr10">
			            			<li>해외 배송 시 주소는 <strong class="t_org">필히 영문으로 입력</strong> 해 주세요.</li>
			            			<li class="mt10">해외배송은 DHL로 배송되며, 도서상품의 경우 무게와 상관없이 <strong class="t_org">주문 권수대로 배송료를 부과</strong>합니다. 단, CD/DVD 등 도서 이외의 상품이 포함되어 있는 경우는 DHL 정상 운임이 적용됩니다.</li>
			            			<li class="mt10">무게가 많이 나가는 도서는 배송료를 추가로 부담할 수 있습니다.</li>
			            			<li class="mt10">배송 소요기간은 도서 재고확보여부에 따라 더 늘어날 수 있습니다. </li>			            			
			            			<li class="mt10">해당 상품은 각 국가별 면세 기준에 의하여 해외 배송료 외에 <strong class="t_org">통관 관세가 추가 될 수도</strong> 있습니다. 
			            			추가된 관련 관세는 <strong class="t_org">수령인 부담이니</strong> 유의하시기 바랍니다. (수령인의 서류미비로 인하여 통관 또는 배송이 지연될 수도 있습니다.)</li>
			            		</ul>
			            		<div class="deli_box_close">
			            			<img src="/webproject/resources/images/order/btn_order_close.gif" alt="닫기" style="cursor:pointer;">
			            		</div>
			            	</div>
			            	
			            	<div class="order_deli_box deli_info" style="display:none">
			            		<h4 class="order_deli_tit">최근 배송지 목록</h4>
			            		<ul class="deli_list">
			            			
			            			
			            			
			            			
			            		</ul>
			            		<div class="deli_box_close">
			            			<img src="/webproject/resources/images/order/btn_order_close.gif" alt="닫기" style="cursor:pointer;">
			            		</div>
			            	</div>
			            	
			            	
			            </div>
			            
			            
		            	<table cellpadding="0" cellspacing="0" class="orderTable2" id="todayDeliTab" width="960" style="display: none;">
		            		<tbody><tr>
		            			<th>당일배송</th>
		            			<td>
		            				<span><input type="radio" name="todayDeliYn" id="today_deli_y" value="Y" class="mt3m mr3" checked=""><label for="today_deli_y">당일배송</label></span> 
		            				<span class="ml15"><input type="radio" name="todayDeliYn" id="today_deli_n" value="N" class="mt3m mr3"><label for="today_deli_n">일반배송(내일 이후 도착 / 단, 주말/공휴일 경우 예외)</label></span>
		            			</td>
		            		</tr>
		            	</tbody></table>
		            	
		            	
		            	<table cellpadding="0" cellspacing="0" class="orderTable2" id="abroad_deli" width="960" style="display:none">
		            		<tbody><tr>
		            			<td>
		            				<p>＊중국, 일본, 태국 등 지역이 넓은 국가는 일부 지역에 한해 DHL택배 → 현지택배를 통해 배송됩니다.<br>
    									(현지택배로 배송 시 예상 수령일보다 2~3일 더 소요될 수 있습니다.)</p>
		            			</td>
		            		</tr>
		            	</tbody></table>
		            	
		            	
		            	<h3 class="orderTit mt40"><img src="/webproject/resources/images/order/h3_order_step03.gif" alt="3. 할인정보"></h3>
		            	<table cellpadding="0" cellspacing="0" class="orderTable2" width="960" style="display:;">
		            		<colgroup><col width="140"><col width="270"><col></colgroup>
		            		<tbody><tr>
		            			<th class="line_none pb0">적립금</th>
		            			<td class="line_none pb0">
		            				<span class="s_con01"><input type="text" name="reserve_point" id="reserve_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">1,000원</strong></span>
		            				<input type="hidden" id="reserve_point_max" value="1000">
		            			</td>
		            			<td class="line_none pb0"><input type="checkbox" name="reserve_point_all" id="reserve_point_all" value="reserve_point" class="mt3m mr3 use_all"><label for="reserve_point_all">모두사용</label></td>
		            		</tr>
		            		<tr>	            		
		            			<th class="line_none pb0">예치금</th>
		            			<td class="line_none pb0">
		            				<span class="s_con01"><input type="text" name="disposit_point" id="disposit_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">0원</strong></span>
		            				<input type="hidden" id="disposit_point_max" value="0">
		            			</td>
		            			<td class="line_none pb0"><input type="checkbox" name="disposit_point_all" id="disposit_point_all" value="disposit_point" class="mt3m mr3 use_all"><label for="disposit_point_all">모두사용</label></td>
		            		</tr>
		            		<tr style="display:none">	            		
		            			<th class="line_none pb0">복리후생 포인트</th>
		            			<td class="line_none pb0">
		            				<span class="s_con01"><input type="text" name="b2b_point" id="b2b_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">0원</strong></span>
		            				<input type="hidden" id="b2b_point_max" value="0">
		            			</td>
		            			<td class="line_none pb0"><input type="checkbox" name="b2b_point_all" id="b2b_point_all" value="b2b_point" class="mt3m mr3 use_all"><label for="b2b_point_all">모두사용</label></td>
		            		</tr>
		            		<tr>
		            			<th>상품권 전환금</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="conv_point" id="conv_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">0원</strong></span>
		            				<input type="hidden" id="conv_point_max" value="0">
		            			</td>
		            			<td><input type="checkbox" name="conv_point_all" id="conv_point_all" value="conv_point" class="mt3m mr3 use_all"><label for="conv_point_all">모두사용</label> <img src="/webproject/resources/images/order/btn_order_exchange.gif" id="btn_giftCardInfo" alt="상품권 환전하기" class="ml10 mt3m" style="cursor:pointer;">
		            			<!-- <span class="t_11gr ml10" style="color: Blue">※ 모바일팝 10% 캐시백 이벤트  </span> <a href="http://www.bandinlunis.com/front/event/bandi/event1030776.do?evtSeq=30776" target="_blank"><span class="btn_w_comm btype_a2" style="cursor:pointer;">자세히보기</span></a> -->
		            			</td>
		            		</tr>
		            		<tr id="tr_giftCardInfo" style="display:none;">
		            			<th>반디앤루니스<br>제휴상품권</th>
		            			<td colspan="2">
		            				<a href="http://www.bandinlunis.com/pages/front/service/serviceUseGiftCard.jsp?tab=cl#st02" target="_blank"><img src="/webproject/resources/images/service/thr_culture.gif" alt="컬쳐랜드"></a>
		            				<a href="http://www.bandinlunis.com/pages/front/service/serviceUseGiftCard.jsp?tab=hm#st02" target="_blank"><img src="/webproject/resources/images/service/thr_happy.gif" alt="해피머니"></a>
		            				<a href="http://www.bandinlunis.com/pages/front/service/serviceUseGiftCard.jsp?tab=bnl#st02" target="_blank"><img src="/webproject/resources/images/service/thr_bookN.gif" alt="북앤라이프"></a>
		            				<a href="http://www.bandinlunis.com/pages/front/service/serviceUseGiftCard.jsp?tab=hm#st02" target="_blank"><img src="/webproject/resources/images/service/thr_mobilepop.gif" alt="모바일팝"></a>
		            			</td>
		            		</tr>
						
							
								<tr>
							
							
						
		            			<th>OK캐쉬백 포인트</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="ocb_point" id="ocb_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org"><span id="ocb_AvPoint">0</span>원</strong></span>
		            				<input type="hidden" id="ocb_point_max" name="ocb_point_max" value="0">
		            				<input type="hidden" id="ocb_txNo" name="ocb_txNo" value="">
		            				<input type="hidden" id="authId" name="authId" value="">
		            			</td>
		            			<td>
		            			 <!-- <input type="checkbox" name="ocb_point_all" id="ocb_point_all" value="ocb_point" class="mt3m mr3 use_all"><label for="ocb_point_all">모두사용</label> -->
		            			 <input type="checkbox" name="btn_OcbCardInfo" id="btn_OcbCardInfo" class="mt3m mr3"><label for="ocb_point_use">포인트 사용</label>
		            			 <input type="checkbox" name="btn_OcbSaveCardInfo" id="btn_OcbSaveCardInfo" class="mt3m mr3"><label for="ocb_point_save">포인트 적립</label>
		            			 
		            			 <!-- <img src="/images/order/btn_done_point.gif" id="btn_OcbCardInfo" alt="포인트조회" class="ml10 mt3m" style="cursor:pointer;">
		            			 <img src="/images/order/btn_save_point.gif" id="btn_OcbSaveCardInfo" alt="포인트적립" class="ml10 mt3m" style="cursor:pointer;"> -->
		            			 <span class="t_11gr ml10">OK캐쉬백 포인트 적립/사용 중 택1(중복 적용 불가)</span></td>       			 
		            		</tr>
		            		<tr id="tr_OcbCardInfo" style="display:none;">
		            			<th>OK캐쉬백 사용</th>
		            			<td colspan="2">
		            			    <span>카드번호</span>&nbsp;
		            				<input type="text" name="card1" id="card1" class="o_input" size="6" maxlength="4" value=""> -
		            				<input type="password" name="card2" id="card2" class="o_input" size="6" maxlength="4" value=""> -
		            				<input type="password" name="card3" id="card3" class="o_input" size="6" maxlength="4" value=""> -
		            				<input type="text" name="card4" id="card4" class="o_input" size="6" maxlength="4" value=""> &nbsp; 
		            				<br><br>
		            				<span>비밀번호</span>&nbsp;
		            				<input type="password" name="ocbPw" id="ocbPw" class="o_input" size="14" value="">
		            				<img src="/images/order/btn_order_mypoint.gif" id="btn_OcbPoint" alt="포인트조회" class="ml10 mt3m" style="cursor:pointer;">
		            				&nbsp;<span style="padding-left:10px"><a href="https://member.okcashbag.com/ocb/modifyCardPass/popupSearchPass/42100" target="_blank">카드 비밀번호 변경/등록하기 &gt;</a></span><!-- 이미지 경로 변경 -->
									<br>					
								</td>
		            		</tr>
		            		<tr id="tr_OcbSaveCardInfo" style="display:none;">
		            			<th>OK캐쉬백 적립</th>
		            			<td colspan="2">
		            			    <span>카드번호</span>&nbsp;
		            				<input type="text" name="saveCard1" id="saveCard1" class="o_input" size="6" maxlength="4" value=""> -
		            				<input type="password" name="saveCard2" id="saveCard2" class="o_input" size="6" maxlength="4" value=""> -
		            				<input type="password" name="saveCard3" id="saveCard3" class="o_input" size="6" maxlength="4" value=""> -
		            				<input type="text" name="saveCard4" id="saveCard4" class="o_input" size="6" maxlength="4" value=""> &nbsp; 
		            				<img src="/images/order/btn_done_point.gif" id="ocb_save_check" alt="입력 완료" class="ml10 mt3m" style="cursor:pointer;">
		            				<!-- <span>적립</span>&nbsp;<input type="checkbox" name="ocb_save_check" id="ocb_save_check" value="N"> -->
									<br><br>
									<ul class="mt10 ml5" style="margin-bottom:20px;line-height:1.7;color:#666">						
										<li class="dot_comm t_11gr">부정확한 카드번호 입력 시 적립되지 않습니다.</li>
										<li class="dot_comm t_11gr mt5">주문완료 후에는 카드번호 변경 및 추후 적립이 불가합니다.</li>
									</ul>
		            			</td>
		            		</tr>		            		
		            		
		            		<tr id="ezwel_point_tr" style="display:none">
		            			<th class="line_none pb0">이지웰 포인트</th>
		            			<td class="line_none pb0">
		            				<span class="s_con01"><input type="text" name="ezwel_point" id="ezwel_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">0원</strong></span>
		            				<input type="hidden" id="ezwel_point_max" value="0">
		            			</td>
		            			<td class="line_none pb0">
		            				<input type="checkbox" name="ezwel_point_all" id="ezwel_point_all" value="ezwel_point" class="mt3m mr3 use_all"><label for="ezwel_point_all">모두사용</label>
		            				<span class="t_11gr ml10">(부분취소 발생 시 반디앤루니스 적립금으로 환원되오니 이점 양지해 주시기 바랍니다.)</span>
		            			</td>
		            		</tr>
		            		<tr style="display:none">
		            			<th class="line_none pb0">이지웰 적립금</th>
		            			<td class="line_none pb0">
		            				<span class="s_con01"><input type="text" name="ezwel_mileage" id="ezwel_mileage" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">0원</strong></span>
		            				<input type="hidden" id="ezwel_mileage_max" value="0">
		            			</td>
		            			<td class="line_none pb0"><input type="checkbox" name="ezwel_mileage_all" id="ezwel_mileage_all" value="ezwel_mileage" class="mt3m mr3 use_all"><label for="ezwel_mileage_all">모두사용</label></td>
		            		</tr>
		            		<tr style="display:none">
		            			<th>이지웰 특별포인트</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="ezwel_special_point" id="ezwel_special_point" size="16" maxlength="8" class="o_input use_point" value="0" style="ime-mode;disabled;"></span>
		            				<span class="s_con02">원 / <strong class="t_org">0원</strong></span>
		            				<input type="hidden" id="ezwel_special_point_max" value="0">
		            			</td>
		            			<td><input type="checkbox" name="ezwel_special_point_all" id="ezwel_special_point_all" value="ezwel_special_point" class="mt3m mr3 use_all"><label for="ezwel_special_point_all">모두사용</label></td>
		            		</tr>
		            		
		            		<tr id="benepia_point_tr" style="display:none">
		            			<th>베네피아 포인트</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="benepia_point" id="benepia_point" size="16" class="o_input" value="0" readonly=""></span>
		            				<span class="s_con02">원</span>
		            				<input type="hidden" id="benepia_point_max" value="">
		            			</td>
		            			<td><a href="javascript:useBenePoint();"><img src="/webproject/resources/images/order/btn_order_point.gif" alt="포인트조회"></a></td>
		            		</tr>
		            		<tr style="display:none">
		            			<th>E1 오렌지 포인트</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="e1_point" id="e1_point" size="16" class="o_input" value="0" readonly=""></span>
		            				<span class="s_con02">원</span>
		            				<input type="hidden" id="e1_point_max" value="">
		            			</td>
		            			<td><a href="javascript:useE1Point();"><img src="/webproject/resources/images/order/btn_order_point.gif" alt="포인트조회"></a></td>
		            		</tr>
		            		<tr style="display:none">
		            			<th>컬쳐캐쉬</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="culture_cash" id="culture_cash" size="16" class="o_input" value="0" readonly=""></span>
		            				<span class="s_con02">원</span>
		            				<input type="hidden" name="culture_cash_max" id="culture_cash_max" value="100000">
		            				<input type="hidden" name="CustID" value="">
		            				<input type="hidden" name="UserID" value="">
		            				<input type="hidden" name="HashNo" value="">
		            			</td>
		            			<td><a href="javascript:useCultureCash();"><img src="/webproject/resources/images/order/btn_order_point.gif" alt="포인트조회"></a></td>
		            		</tr>
		            		<tr id="exanadu_point_tr" style="display:none">
		            			<th></th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="exanadu_point" id="exanadu_point" size="16" class="o_input" value="0" readonly=""></span>
		            				<span class="s_con02">원</span>
		            				<input type="hidden" name="exanadu_point_max" id="exanadu_point_max" value="0">
		            				<input type="hidden" name="exanadu_key" value="">
		            			</td>
		            			<td><a href="javascript:useExanaduPoint();"><img src="/webproject/resources/images/order/btn_order_point.gif" alt="포인트사용"></a></td>
		            		</tr>
		            		
		            		
		            		<tr>
		            			<th>쿠폰할인</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="cpn_price" size="16" class="o_input" value="0" readonly=""></span>
		            				<span class="s_con02">원</span>
		            			</td>
		            			<td>
		            				<img src="/webproject/resources/images/order/btn_order_coupon.gif" id="btn_popCoupon" name="N" alt="쿠폰선택" class="mt3m" style="cursor:pointer;">
		            				
			            				<!-- <span class="t_11gr ml10">사용가능 쿠폰: <strong>3</strong>장</span>  -->
		            				
		            				<div class="t_11gr mt5">
		            				
		            				쇼핑카트 쿠폰은 도서외 상품 주문에서만 할인 적용됩니다. (도서 결제 적용불가)
		            				
		            							
		            				</div>
		            			</td>
		            		</tr>
		            		
		            		<tr>
		            			<th>반디상품권</th>
		            			<td>
		            				<span class="s_con01"><input type="text" name="bookcpn_price" size="16" class="o_input" value="0" readonly=""></span>
		            				<span class="s_con02">원</span>
		            			</td>
		            			<td class="line_none">
		            				<span id="btn_view_bookcoupon" class="btn_w_comm btype_a2" style="cursor:pointer;">사용가능 반디상품권보기</span>
		            			</td>
		            		</tr>
		            		<!-- 금액대별 반디상품권 팝업 레이어 -->
							<tr id="my_bookcoupon_area" style="display:none">
								<td class="coupon_order_w" colspan="3">
									<div class="coupon_order_use" id="result_bookcoupon_area"></div> 
									<div class="al_center mt20">
										<span id="btn_apply_bookcoupon" class="btn_bu_comm btype_a3" style="cursor:pointer;">반디상품권 적용하기</span>
										<!-- <a href="javascript:$('#my_bookcoupon_area').toggle();" class="btn_w_comm btype_a3">닫기</a>  -->
										<a href="#" onclick="javascript:$('#my_bookcoupon_area').toggle();" class="btn_w_comm btype_a3">닫기</a>
									</div>
								</td>
							</tr>
							<!--// 금액대별 반디상품권 팝업 레이어 -->
		            	</tbody></table>
		            	<div class="pos_rel">
			            	<table cellpadding="0" cellspacing="0" class="orderTable_tatol" width="960">
			            		<colgroup><col width="250"><col width="230"><col><col width="232"></colgroup>
			            		<tbody><tr>
			            			<th>주문금액 합계</th>
			            			<th>배송/포장비</th>
			            			<th>할인금액</th>
			            			<th>결제금액</th>
			            		</tr>
			            		<tr>
			            			<td><span>25,920</span><span class="t_14">원</span></td>
			            			<td><span id="finalDeliCost">0</span><span class="t_14">원</span><br><span class="t_11gr" id="finalDeliCostInfo"></span></td>
			            			<td><span id="finalDiscountCost">0</span><span class="t_14">원</span><br><span class="t_11gr" id="finalDiscountCostInfo"></span></td>
			            			<td class="total"><span class="finalCashCost">25,920</span><span class="t_14">원</span></td>
			            		</tr>
			            	</tbody></table>
			            	<span class="order_plus"></span><span class="order_minus"></span><span class="order_same"></span>
			            	<span id="span_partner_text" style="float:right"></span>
		            	</div>
		            	
		           		<h3 class="orderTit mt40"><img src="/webproject/resources/images/order/h3_order_step04.gif" alt="4. 결제정보"></h3>
		           		<div class="order_pay">
		            		<div class="payInfo">
			            		<div class="payInfo_wrap">
				            		<h4 class="none">결제수단선택</h4>
				            		<div class="pi_select">
				            			<div>
					            			<span id="span_settleType_10" class="mr15"><input type="radio" name="settle_type" id="sett_10" value="10" class="mt3m mr3" checked=""><label for="sett_10">신용카드</label></span>
					            			<span id="span_settleType_11" class="mr15" style=""><input type="radio" name="settle_type" id="sett_11" value="11" class="mt3m mr3"><label for="sett_11">제휴 신용카드</label></span>			            				
					            			<span id="span_settleType_20" class="mr15" style=""><input type="radio" name="settle_type" id="sett_20" value="20" class="mt3m mr3"><label for="sett_20">휴대폰 결제</label></span>
					            			<span id="span_settleType_30" class="mr15" style=""><input type="radio" name="settle_type" id="sett_30" value="30" class="mt3m mr3"><label for="sett_30">실시간 계좌이체</label></span>
					            			<span id="span_settleType_40" class="mr15" style=""><input type="radio" name="settle_type" id="sett_40" value="40" class="mt3m mr3"><label for="sett_40">무통장 입금</label></span>
				            			</div>
				            			<div class="mt15">
				            				<span id="span_settleType_70" class="mr15" style=""><input type="radio" name="settle_type" id="sett_70" value="70" class="mt3m mr3"><label for="sett_70"><strong>반디페이</strong> (간편 계좌이체<em class="bandipay_order_event"><span>,</span> 2%적립</em>)</label></span>
					            			<span id="span_settleType_15" class="mr15" style=""><input type="radio" name="settle_type" id="sett_15" value="15" class="mt3m mr3"><label for="sett_15">직접 입금</label></span>
					            			<span style="display:none;"><input type="radio" name="settle_type" id="sett_50" value="50" class="mt3m mr3" disabled=""><label for="">사이버머니</label></span>
				            			</div>
				            		<h5>간편결제</h5>
				            			<span id="span_settleType_68" class="mr15" style=""><input type="radio" name="settle_type" id="sett_68" value="68" class="mt3m mr3"><label for="sett_68"><img src="/webproject/resources/images/order/ico_naverpay.gif" class="mt3m" alt="NaverPay"></label></span>
				            			<span id="span_settleType_12" class="mr15" style=""><input type="radio" name="settle_type" id="sett_12" value="12" class="mt3m mr3"><label for="sett_12"><img src="/webproject/resources/images/order/ico_kakao.gif" class="mt3m" alt="Kakao Pay"></label></span>
				            			<span id="span_settleType_14" class="mr15" style=""><input type="radio" name="settle_type" id="sett_14" value="14" class="mt3m mr3"><label for="sett_14"><img src="/webproject/resources/images/order/ico_payco.gif" class="mt3m" alt="Payco"></label></span>
				            			<span id="span_settleType_13" class="mr15" style="display:none;"><input type="radio" name="settle_type" id="sett_13" value="13" class="mt3m mr3"><label for="sett_13"><img src="/webproject/resources/images/order/ico_paynow.gif" class="mt3m" alt="Paynow"></label></span>
				            		</div>
				            		
				            		<div class="pi_box">
				            			<table cellspacing="0" cellpadding="0" width="" class="pi_list">
				            				<colgroup><col width="120"><col></colgroup>
				            				<tbody><tr>
				            					<th>카드선택</th>
				            					<td id="selectCardCode"><select name="used_card" onchange="javascript:changeCardCode(this);"><option value="">카드사 선택</option><option value="CCDI">현대</option><option value="CCLG">신한</option><option value="CCSS">삼성</option><option value="CCHN">하나</option><option value="CCKE">하나(구 외환)</option><option value="CCLO">롯데</option><option value="CCKM">국민</option><option value="CCNH">NH채움</option><option value="CCBC">비씨</option><option value="CCPH">우리</option><option value="CCCT">씨티</option><option value="CCSU">수협</option><option value="CCSM">MG새마을</option><option value="CCCJ">제주</option><option value="BC81">하나BC</option><option value="CCJB">전북</option><option value="CCCU">신협</option><option value="CCPB">우체국</option><option value="CCKJ">광주</option><option value="CCKD">KDB산은</option><option value="CCSB">저축</option><option value="CCHS">KB증권(현대증권)</option><option value="CCKA">카카오뱅크</option></select></td>
				            				</tr>
				            				<tr>
				            					<th>할부기간</th>
				            					<td id="selectCardInstallRange"><select name="fix_inst"><option value="0">일시불</option></select></td>
				            				</tr>
				            				<tr id="tr_cardPointUse" style="display:none;">
				            					<th>포인트 사용</th>
				            					<td>
				            						<p><input type="checkbox" name="card_point" id="cardPointCheckbox" class="chk" value="only" disabled=""> <label for="cardPointCheckbox" id="cardPointCheckboxLabel"></label></p>
				            						<p class="ml20 mt5" id="cardPointCheckboxLabel2"><strong>대상</strong>: 신한하이포인트카드/nano/nano f/S-MORE 카드회원<br><span class="t_11">(최대 10% 사용가능, 포인트 부족 시 사용불가.)</span></p>
				            					</td>
				            				</tr>
				            			</tbody></table>
				            		</div>
				            		<div class="pi_box2" style="display:none;">
				            			<table cellspacing="0" cellpadding="0" width="" class="pi_list">
				            				<colgroup><col width="140"><col></colgroup>
				            				<tbody><tr>
				            					<th>입금은행/계좌번호</th><td id="selectAccountCode"></td>
				            				</tr>
				            				<tr>
				            					<th>예금주</th><td>(주)서울문고</td>
				            				</tr>
				            				<tr>
				            					<th>입금자성명</th><td><input type="text" name="setAcName" size="20" maxlength="20" class="o_input"></td>
				            				</tr>
				            			</tbody></table>
				            			
				            			<h4 class="mt15 ml10" style="border-top:1px solid #e1e1e1; padding-top:15px">직접입금 문화비 소득공제 안내</h4>
				            			<div class="mt10 ml10"><em class="t_blue">직접입금 결제 시 문화비 소득공제를 받으실 수 없습니다.</em> <br>
				            			직접입금은 PG결제의 무통장입금과 다르게 반디앤루니스 전용 계좌로 직접입금이 되어 기술적으로 도서·공연비만을 <br>구분(추출)하여 카드사,
												국세청 등에 자료를 전송할 수 없어 도서·공연비 확인 및 증빙이 불가하여 소득공제 적용을  <br>받을 수 없습니다. 고객님의 양해 부탁드립니다. 						
										</div>
				            		</div>
				            		<div class="pi_box3" style="display: none;">
				            			<table cellspacing="0" cellpadding="0" width="" class="pi_list">
				            				<colgroup><col width="120"><col></colgroup>
				            				<tbody><tr>
				            					<th>에스크로 사용 여부</th>
				            					<td><input type="radio" name="escrowYn" value="Y" id="escrowY"><label for="escrowY">사용함</label>&nbsp;&nbsp;<input type="radio" name="escrowYn" value="N" id="escrowN" checked=""><label for="escrowN">사용안함</label></td>
				            				</tr>
				            				<tr>
				            					<th>에스크로란?</th>
				            					<td>에스크로(매매보호 서비스)는 판매자와 구매자가 거래합의 후 상품배송 및 결제과정 중에 거래사고를<br>
													예방하기 위하여 NHN KCP(에스크로 사업자)가 거래대금의 입출금을 공정하게 관리함으로써 매매를<br>
													보호하고, 판매자와 구매자 간의 거래 안전을 도모하는 서비스입니다.</td>
				            				</tr>
				            			</tbody></table>
				            		</div>
				            		
				            		
				            		<div class="pi_box_w pi_box4" style="display: none">
				            			<h4>휴대폰 결제 문화비 소득공제 안내</h4>
				            			<div class="mt10"><em class="t_blue">휴대폰 결제를 이용하시면 문화비 소득공제를 받으실 수 없습니다.</em> <br>현재 이동통신사에서는 기술적으로 도서·공연비만을 구분(추출)하여 카드사,
												국세청 등에 자료를 전송할 수 없으므로 <br>도서·공연비 확인 및 증빙이 불가하여 소득공제 적용을 받을 수 없습니다.
										</div>
				            		</div> 
				            		
				            		<div class="pi_box_w pi_box5" style="display: none">
				            			<h4>카카오페이 문화비 소득공제 안내</h4>
				            			<div class="mt10"><em class="t_blue">카카오페이 결제 시 문화비 소득공제를 받으실 수 없습니다.</em> <br>현재 연동 준비 중이며 빠른 시일안에 문화비 소득공제가 될 수 있도록 하겠습니다. 고객님의 양해 부탁드립니다. 						
										</div>
				            		</div> 

									<div class="pi_box_w pi_box6" style="display: none">
				            			<h4>네이버페이 문화비 소득공제 안내</h4>
				            			<div class="mt10"><em class="t_blue">네이버페이 결제 시 문화비 소득공제를 받으실 수 없습니다.</em> <br>현재 연동 준비 중이며 빠른 시일안에 문화비 소득공제가 될 수 있도록 하겠습니다. 고객님의 양해 부탁드립니다. 						
										</div>
				            		</div>
				            		
				            					            		
				            	</div>
				            	
				            	<div class="pay_wrap">
				            		<div class="pay_total">
				            			<dl class="pan_con01">
				            				<dt><img src="/webproject/resources/images/order/h3_order_totalpay.gif" alt="최종 결제 금액"></dt>
				            				<dd><span class="finalCashCost">25,920</span><span class="t_14">원</span></dd>
				            			</dl>
				            		</div> 
				            		<div class="mt10">
				            			<img src="/webproject/resources/images/order/btn_order_pay.gif" id="btn_order" alt="결제하기" style="cursor:pointer;">
				            			<img src="/webproject/resources/images/ajax-loader.gif" id="btn_order_loading" alt="로딩" style="display:none;width:212px;">
				            		</div>
				            		<div class="mt10">
				            			<!-- 약관체크 인증시 비회원은 동의했으므로 생략 -->
				            			
					            			<div class="pay_receipt">
					            				<span class="receipt_check"><input type="checkbox" name="item03"></span>
					            				개인정보 선택 항목의 수집에 동의합니다. <a href="javascript:popUpRules2();" class="btn_w_comm btype_a4">내용보기</a>
					            			</div>
						            		<div class="pay_receipt">
						            			<span class="receipt_check"><input type="checkbox" name="item04"></span>
						            			 배송 등을 위해 제3자 정보제공에 동의합니다. <a href="javascript:popUpRules3();" class="btn_w_comm btype_a4">내용보기</a>
						            		</div>
				            			 
				            			<div class="pay_receipt"><span class="receipt_check"><input type="checkbox" name="price_disp_yn" value="N"></span>
				            			 영수증에 상품 가격을 노출하지 않습니다. <span class="t_11gr">(직접 배송 상품만 해당)</span></div>
				            		</div> 
				            		
			            			<dl class="pay_point">
			            				<dt><span class="fl_left">적립가능액</span> <span class="fl_right"><strong id="finalProdPoint">1,440</strong>원</span></dt>	 
			            				<dd><span class="fl_left">상품 적립금</span> <span class="fl_right"><strong id="extProdPoint">1,440</strong>원</span></dd>			            				
			            				<dd><span class="fl_left">5만원이상 추가적립금</span> <span class="fl_right"><strong id="extAddPoint">0</strong>원</span></dd>
			            				<dd><span class="fl_left">멤버십</span> <span class="fl_right"><strong id="extGradePoint">0</strong>원</span></dd>
			            				<dd class="p_total"><span class="fl_left">바로온 2%</span> <span class="fl_right"><strong id="extPartnerPoint">0</strong>원</span></dd>			            				           				 
			            			</dl>
			            			<ul class="mt10 ml5">
				                    	<li class="dot_comm t_11gr">5만원이상 추가적립/멤버십/바로온2% 적립금은 비도서, 뷰티 포함 구매 시 적용됩니다. (도서 제외)</li>
				                    	<li class="dot_comm t_11gr mt5">업체배송 상품은 추가적립 대상에서 제외됩니다. (상품페이지, 쇼핑카트에서 업체배송 확인 가능)</li>
				                    	<li class="dot_comm t_11gr mt5">적립가능액은 쿠폰, 적립금등 보조결제 수단 따라 약간의 금액 차이가 있을수가 있습니다.</li>
				                    	<li class="dot_comm t_11gr mt5">적립금 지급 시기는 구매완료 시점에 자동 지급 됩니다.</li>		                    	
				                    </ul>
				            	</div>

				            	<div id="cashReceiptDiv" style="display:none;">

				            	<div>
				            		<h3 class="orderTit mt40" style="width:715px;"><img src="/webproject/resources/images/order/h3_order_step05.gif" alt="5. 현금영수증"></h3>
				            	</div>
				            	<table cellspacing="0" cellpadding="0" width="715px" class="orderTable2">
					            	<tbody><tr>
				            			<th style="letter-spacing:-0.05em">현금영수증 발급 신청</th>
				            			<td>
				            				<span><input type="radio" name="cashReceiptType" id="cashReceiptType02" value="02" class="mt3m mr3" checked="">소득공제용</span> 
				            				<span class="ml15"><input type="radio" name="cashReceiptType" value="01" class="mt3m mr3">지출증빙용</span> 
				            				<span class="ml15"><input type="radio" name="cashReceiptType" value="00" class="mt3m mr3">신청 안 함</span> 
				            			</td>
				            		</tr>
				            		<input type="hidden" name="cashReceiptInfo" id="cashReceiptInfo" value="">
				            		<input type="hidden" name="cashReceiptInfoType" id="cashReceiptInfoType" value="">
				            		<tr id="cashReceiptInfoView1">
				            			<th style="border-bottom:0;padding-bottom:0;">휴대폰 번호</th>
				            			<td style="border-bottom:0;padding-bottom:0;">
				            				<select name="cashReceiptInfo_part1" id="cashReceiptInfo_part1" style="width: 49px; height: 20px;">
				            					<option value="">선택</option>
				            					<option value="010">010</option>
				            					<option value="011">011</option>
				            					<option value="016">016</option>
				            					<option value="017">017</option>
				            					<option value="018">018</option>
				            					<option value="019">019</option>
				            					<option value="0502">0502</option>
				            					<option value="0503">0503</option>
				            					<option value="0504">0504</option>
				            					<option value="0505">0505</option>
				            					<option value="0506">0506</option>
				            					<option value="0507">0507</option>
				            					<option value="0508">0508</option>
				            					<option value="0509">0509</option>
				            				</select>	            				-
				            				<input type="text" name="cashReceiptInfo_part2" id="cashReceiptInfo_part2" maxlength="4" size="4" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            				-
				            				<input type="text" name="cashReceiptInfo_part3" id="cashReceiptInfo_part3" maxlength="4" size="4" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            			</td>
				            		</tr>
				            		<tr id="cashReceiptInfoView2" style="display: none;">
				            			<th>
			            					<select name="cashReceiptInfoTypeS" id="cashReceiptInfoTypeS">
                                                <option value="1">휴대폰번호</option>
                                                <option value="2">사업자번호</option>
                                            </select>
										</th>
										<td style="border-bottom:0;padding-bottom:0;" id="cashReceiptInfoType1">
				            				<select name="cashReceiptInfo1_part1" id="cashReceiptInfo1_part1" style="width: 49px; height: 20px;">
				            					<option value="">선택</option>
				            					<option value="010">010</option>
				            					<option value="011">011</option>
				            					<option value="016">016</option>
				            					<option value="017">017</option>
				            					<option value="018">018</option>
				            					<option value="019">019</option>
				            					<option value="0502">0502</option>
				            					<option value="0503">0503</option>
				            					<option value="0504">0504</option>
				            					<option value="0505">0505</option>
				            					<option value="0506">0506</option>
				            					<option value="0507">0507</option>
				            					<option value="0508">0508</option>
				            					<option value="0509">0509</option>
				            				</select>	            				-
				            				<input type="text" name="cashReceiptInfo1_part2" id="cashReceiptInfo1_part2" maxlength="4" size="4" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            				-
				            				<input type="text" name="cashReceiptInfo1_part3" id="cashReceiptInfo1_part3" maxlength="4" size="4" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            			</td>
				            			<td id="cashReceiptInfoType2" style="display: none;">
				            				<input type="text" maxlength="3" size="3" id="cashReceiptInfo2_part1" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            				-
				            				<input type="text" maxlength="2" size="2" id="cashReceiptInfo2_part2" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            				-
				            				<input type="text" maxlength="5" size="5" id="cashReceiptInfo2_part3" class="o_input" style="ime-mode:disabled;width:20%;" onkeypress="goNumCheck();">
				            			</td>
				            		</tr>
				            	</tbody></table>
				            	<ul class="mt10 ml5 pb40" style="width:715px; border-bottom:1px solid #d8d8d8;">
				                    	<li class="dot_comm t_11gr"><strong>소득공제용 현금영수증</strong> 발급은 주문/결제단계에서만 신청할 수 있습니다.</li>
				                    	<li class="dot_comm t_11gr mt5"><strong>예치금, 전환금 등 현금성 포인트 및 직접입금 결제 금액에 대하여 </strong>현금영수증이 발급됩니다.</li>
				                    	<li class="dot_comm t_11gr mt5"><strong>세금계산서</strong>는 상품을 수령하여,<strong> ‘구매완료’ 전환 이후</strong> 신청 가능합니다.</li>               	
			                    </ul>
        				        </div>
        				        				            	
				            	<div>
				            		<iframe id="iframe_settleInfo" src="/html/order/settleInfo_10.htm" frameborder="0" width="728" scrolling="no" height="261">

					            		<html>
						            		<head>
											<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
											<title>휴대폰 소액 결제 이용 안내</title>
											<link rel="stylesheet" href="/common/css/base.css" type="text/css">
											<link rel="stylesheet" href="/common/css/order.css" type="text/css">
											<script type="text/javascript" src="/webproject/resources/common/js/common.js" charset="euc-kr"></script>
											</head>
										<body>
											<div class="order_info mt20">
												<h2 class="mt5"><img src="/webproject/resources/images/order/h3_order_info_02.gif" alt="휴대폰 소액 결제 이용 안내"></h2>
												<div class="con01 mt15">			
													<h3 class="subtit">휴대폰 소액결제 한도는 각 통신사 회원 별 상태에 따라  한도금액에 차이가 있사오니 이용에 참고 해 주십시오 </h3>
													<h3 class="subtit mt30">휴대폰 결제 시 현금영수증 발행 안내</h3>
													<p class="mt10 ml10 t_gr">
														통신사 요금 납부 후 결제대행업체 명의의 현금영수증이 발행되며,  국세청 현금영수증 사이트에서 확인하실 수 있습니다.  			
													</p>
													<h3 class="subtit mt30">휴대폰 결제 후 취소</h3>
													<p class="mt5 ml10 t_gr">휴대폰 결제 취소는 주문하신 당월에만 가능하며 익월 취소 시에는 예치금으로 환불됩니다.</p>
												</div>
												<div class="con02 mt10 al_center">
													<h3><img src="/webproject/resources/images/order/help_pay_txt.gif" alt="결제가 안되세요?"></h3>
													<div class="mt20"><a href="https://pay.kcp.co.kr/plugin_new/file/KCPPaymentPluginSetup.exe" target="blank"><img src="/webproject/resources/images/order/btn_setup.gif" alt="결제 모듈 수동 설치"></a></div>
													<div class="mt5"><a href="http://www.kcp.co.kr/technique.plugIn.do?cmd=pluginerr" target="blank"><img src="/webproject/resources/images/order/btn_setup_help.gif" alt="수동설치 후에도 문제가 있으세요?"></a></div>
												</div>
											</div>
											<script type="text/javascript">
											window.onload = function() {
												if(parent.document.getElementById('iframe_settleInfo')) {
													parent.document.getElementById('iframe_settleInfo').height = 0;
													parent.document.getElementById('iframe_settleInfo').height = document.documentElement.scrollHeight;
												}
											}
											</script>
										</body>
										</html>
				            		</iframe>
				            	</div>
				            	
				            	<div>
				            		<iframe id="iframe_settleInfo_bandi" src="/html/order/settleInfo_bandi.htm" frameborder="0" width="728" scrolling="no" height="452"></iframe>
				            	</div>
				            	
				            </div>	           		
		           		</div>
	           		</fieldset>
            	</form>
            	
            </div>
        </div>
     </div>
     

   
     
     
     
     
</body>
</html>