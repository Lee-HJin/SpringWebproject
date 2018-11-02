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
<script language="javascript">
$(document).ready(function(){
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
	
	 
	var newURL =  window.location.pathname; 
      if (newURL == '/front/main.do') {
          scrollHeight = 899
         } else {
    	  scrollHeight = 500
      } 
      
	/* 스크롤에 따른 검색과 날개 영역 변경 */
	$(window).scroll(function(){
	      if ($(this).scrollTop() > 450) {	 
	          $('.gnb_add_btn').addClass('abs_view');
	          $('.ss_top').show();
	          if(!$('.add_search').is(':visible')){
	        	  $('#head').addClass('head_mini');
	          }
	      } else {
	    	  $('#head').removeClass('head_mini');
	          $('.gnb_add_btn').removeClass('abs_view');
	          $('.ss_top').hide();
	      } 
	      
	      if ($(this).scrollTop() > scrollHeight) {
	          $('#serviceWrap').addClass('ss_fixed');
	      } else {
	          $('#serviceWrap').removeClass('ss_fixed');
	      }
	  });

	$(".add_search").click(function(){
		 $('#head').show();
		 $('#head').addClass('head_mini');
		 $('.head_mini').show();
		 $('.add_cart').hide();
		 $('.add_search').hide();
		 $('.add_close').show();
		 $('.abs_view').css('top','80px');
		});
	$(".add_close").click(function(){			
		 $('#head').removeClass('head_mini');
		 $('#head').removeAttr('style');
		 $('.head_mini').hide()
		 $('.add_cart').show();
		 $('.add_search').show();
		 $('.add_close').hide();
		 $('.abs_view').css('top','0');
		});

	/* 쉽게찾기 */
	$(".ez_search").hover(function() {
		$(".search_more_pop").show();
		},function() {
		$(".search_more_pop").hide();
	});
	$(".search_more_pop").hover(function() {
		$(".search_more_pop").show();
		},function() {
		$(".search_more_pop").hide();
	});
	/* 쉽게찾기 */

	//검색 submit
	$("#searchForm").submit(function() {
		var ad_url = $("#ad_url").val();
		
		if(ad_url != ""){
       		location.href = ad_url;
       		return false;
       	}
		
		$("#sch_keyword").val($("#sch_keyword").val().trim());
		if($("#sch_keyword").val() == "") {
			alert("검색어를 입력하세요.");
			$("#sch_keyword").focus();
			return false;
		}
		
		var sch_prod_type = $("#frm_pt").val();
		if (sch_prod_type == "03" || sch_prod_type == "07"){
 			$("#frm_ps").val("01");
  			$("#frm_s").val("pt");
		}else{
 			$("#frm_ps").val("");
  			$("#frm_s").val("");
		}
	});

	/* 바로온 */
	$("#favoriteBanner").hover(function() {
		$(".bookmark_pop").show();
		},function() {
		$(".bookmark_pop").hide();
	});
	$(".bookmark_pop").hover(function() {
		$(".bookmark_pop").show();
		},function() {
		$(".bookmark_pop").hide();
	});	
	/* 바로온 */

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

<style type="text/css">
	.m_tit{font:normal 20px '맑은 고딕','돋움';color:#000;height:24px;padding-left:5px;padding-bottom:10px}
	.m_tit_l{font:normal 20px '맑은 고딕','돋움';color:#000;height:24px;padding-left:5px;padding-bottom:10px;border-bottom:1px solid #e1e1e1}
	.m_tit_s{font:normal 18px '맑은 고딕','돋움';color:#000;height:24px;padding:18px 0 10px 24px}
	.tap_div_3 li{width:320px}
	.d_area_recomm {position:relative;margin-top:60px;clear:both; margin-top:60px}
	.d_area_recomm .swiper-container{clear:both;width:958px;padding-bottom:30px;hheight:360px;border:1px solid #e9e9e9}
	.d_area_recomm .d_area_list{margin:25px 0 0 38px;width:940px}
	.d_area_recomm .d_area_list li{float:left;width:168px;hheight:310px;margin:0 26px}
	.d_area_recomm .d_area_list .b_img{width:168px;text-align:center}.d_area_recomm .d_area_list .b_img img{width:166px;height:235px;border:1px solid #e9e9e9}
	.d_area_recomm .d_area_list dl {float:left;width:168px;margin-top:12px;font-family:돋움}
	.d_area_recomm .d_area_list dl dt{font-size:12px;letter-spacing:-0.02em;line-height:120%;font-weight:bolder}.d_area_recomm .d_area_list dl dt a{color:#333}
	.d_area_recomm .d_area_list dl .b_author{font-size:11px;margin-top:3px;line-height:130%}
	.d_area_recomm .d_area_list  .t_cate{text-align:center;margin-bottom:7px;width:168px;color:#1495cf}
	.d_area_recomm .btn_more_2014{position:absolute;right:5px;top:10px}
	.d_area_3div{width:655px;border:1px solid #e9e9e9;float:left}
	.d_area_3div .swiper-container{clear:both;width:655px;border:none}
	.d_area_3div .d_area_list li{float:left;width:132px;margin:0 30px}
	.d_area_3div .d_area_list .b_img{width:132px;text-align:center}.d_area_3div .d_area_list .b_img img{width:130px;height:185px;border:1px solid #e9e9e9}
	.d_area_3div .btn_more_2014{position:absolute;right:15px;top:20px}
	
	.d_md_recomm{overflow:hidden;margin-top:40px}
	.d_md_book{float:left;width:645px;margin:30px 0 0 0;position:relative}
	.d_md_book .swiper-container{clear:both;width:590px;height:270px;margin-left:30px}
	.d_md_book .b_img{float:left;width:180px}
	.d_md_book .b_img img{width:178px;border:1px solid #e1e1e1}
	.d_md_book dl{float:left;width:370px;margin:5px 0 0 20px}
	.d_md_book dt{font:bolder 16px 돋움; color:#000;margin-bottom:5px}
	.d_md_book dt a{color:#000}
	.d_md_book dd.t_txt{color:#888;margin-top:15px;line-height:150%}
	.d_md_book .aw_l, .d_md_book .aw_r{border:none;top:38%;z-index:10}
	.d_md_book .aw_l:hover{border-top:1px solid #666;border-bottom:1px solid #666;border-right:1px solid #666}
	.d_md_book .aw_r:hover{border-top:1px solid #666;border-bottom:1px solid #666;border-left:1px solid #666}
	.d_md_list{float:right;width:300px;height:250px;;margin:37px 15px 0 0 ;}
	.d_md_list li{float:left;width:81px;height:114px;margin:0 0 18px 18px}
	.d_md_list li img{float:left;width:75px;height:108px;border:3px solid #e1e1e1;cursor:pointer}
	.d_md_list li.active img{border:3px solid #58a7c8}
	
	.d_new_book{float:left;width:655px;height:310px;border:1px solid #e1e1e1;margin-top:60px;position:relative}
	
	.d_new_book .d_area_list {margin:0 0 0 20px}
	.d_new_book .d_area_list li{float:left;width:310px;margin:10px 3px}
	.d_new_book .d_area_list  .b_img{float:left;width:130px;text-align:center}.d_new_book .b_img img{width:128px;border:1px solid #e9e9e9}
	.d_new_book .d_area_list  dl {float:left;width:158px;margin:5px 0 0 12px;font-family:돋움}
	.d_new_book .d_area_list  dl dt{font-size:12px;letter-spacing:-0.02em;line-height:120%;font-weight:bolder}.d_new_book dl dt a{color:#333}
	.d_new_book .d_area_list  dl .b_author{font-size:11px;margin-top:3px;line-height:130%}
	.d_new_book .d_area_list  dl .t_cate{margin-bottom:7px;color:#1495cf}
	.d_new_book .btn_more_2014{position:absolute;right:15px;top:20px}
	.d_new_book .aw_type_num{position:absolute;right:15px;bottom:20px}
	
	.d_best{float:left;width:288px;height:310px;border:1px solid #e1e1e1;margin-left:13px;margin-top:60px}
	.d_best .ranking_list{width:250px;margin:10px 0 0 25px}
	.d_best .ranking_list li{margin-bottom:10px;height:14px}
	.d_best .ranking_list li .num{float:left;width:12px;height:11px;text-align:center;color:#FFF;font:normal 11px 돋움;padding-top:1px;border:1px solid #85755c;background:#a48b6d;letter-spacing:-0.05em}
	.d_best .ranking_list li:hover .num{border:1px solid #0f87bc;background:#1495ce}
	.d_best .ranking_list li .r_book{float:left;margin:0 0 0 7px;height:13px;padding:0;width:229px}
	.d_best .btn_more_2014{position:absolute;bottom:10px;left:140px}
	.d_best .best_ad{position:absolute;top:75px;right:14px;z-index:110}
	
	.d_tem_row{float:left;width:288px;height:380px;border:1px solid #e1e1e1;margin-left:13px;margin-top:60px;position:relative}
	.d_tem_row .d_area_list{margin:20px 0 0 20px}
	.d_tem_row .d_area_list li{width:250px;margin:10px 0 20px 0;overflow:hidden; }
	.d_tem_row  .b_img{float:left;width:82px;text-align:center}.d_tem_row .b_img img{width:80px;border:1px solid #e9e9e9}
	.d_tem_row  dl {float:left;width:158px;margin:5px 0 0 10px;font-family:돋움}
	.d_tem_row  dl dt{font-size:12px;letter-spacing:-0.02em;line-height:120%;font-weight:bolder}.d_new_book dl dt a{color:#333}
	.d_tem_row  dl .b_author{font-size:11px;margin-top:3px;line-height:130%}
	.d_tem_row  dl .t_cate{margin-bottom:7px;color:#1495cf}
	.d_tem_row .btn_more_2014{position:absolute;right:15px;top:20px}
	.d_tem_row .aw_type_num{position:absolute;right:15px;bottom:20px;z-index:110}
</style>

</head>
<body>

<div id="contentBody">
		<div id="contentWrap">
			<h2 class="ml10 mt30  mb10 lh0"><img src="http://image.bandinlunis.com/images/specialBook/tit_h3_discount.gif" alt="정가인하도서" class="lh0"></h2>

			<div class="content">
				<ul class="tap_menu_d1 tap_div_3 mb20">
                	<li><a href="<%=cp %>/discountBookMain.action" class="on alt">추천</a></li>
                	<li><a href="<%=cp %>/discountBookList.action?theMonth=1">이달의 신규등록</a></li>
                	<li><a href="<%=cp %>/discountBookList.action?theMonth=">분야별 전체</a></li>
                </ul>
                
				<div class="d_md_recomm">
					<h3 class="m_tit_l"><span>정가인하 추천도서</span></h3>
					<div class="d_md_book" id="mdBookList">
						<div class="aw_type_box">
							<button class="aw_l" id="mdRecommAreaLt"><span class="ns">이전</span><span class="aw_count"><span class="start_index">2</span>/<span class="end_index">6</span></span></button>
							<button class="aw_r" id="mdRecommAreaRt"><span class="ns">다음</span><span class="aw_count"><span class="start_index">2</span>/<span class="end_index">6</span></span></button>
			 			</div>
						<div class="swiper-container">
							<div class="swiper-wrapper" style="width: 4720px; height: 270px; transform: translate3d(-1180px, 0px, 0px); transition-duration: 0.5s;">
							
							<c:forEach var="dto" items="${dcSixSlideLists }">
								<ul class="swiper-slide swiper-slide-duplicate" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3835347">
												<img src="<%=cp %>/resources/image/book/${dto.bookImage }" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3835347">[정가인하] ${dto.bookTitle }</a></dt>
											<dd class="b_author">${dto.authorName } </dd>
											<dd class="mt15"><span class="rPrice">${dto.bookPrice }원</span> → ${dto.discountedPrice }원(<strong>${dto.discountRate }%↓</strong>)</dd>
											<dd class="price">판매가 : <strong><fmt:formatNumber value="${dto.discountedPrice*0.9 }" type="number"/>원</strong></dd>
											<dd class="t_txt">
												 ${dto.introduction }
											</dd>
										</dl> 
									</li>
								</ul>
							</c:forEach>
								
							</div>
						</div>
					</div>
					<div class="pagination">
						<span class="swiper-pagination-switch"></span>
						<span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span>
						<span class="swiper-pagination-switch"></span>
						<span class="swiper-pagination-switch"></span>
						<span class="swiper-pagination-switch"></span>
						<span class="swiper-pagination-switch"></span>
					</div>
					<ul class="d_md_list">
						<c:forEach var="dto" items="${dcSixSlideLists }">
						<li class="">
							<a href="/front/product/detailProduct.do?prodId=3796784">
								<img src="<%=cp %>/resources/image/book/${dto.bookImage }">
							</a>
						</li>
						</c:forEach>
						
					</ul>
				</div>
                
				<div class="d_area_recomm" id="discountAreaRecomm">
					<h3 class="m_tit"><span>분야 별 정가인하</span></h3>		
					<a href="/front/display/discountBookList.do" class="btn_more_2014"><span>더보기</span></a>
					<div class="newBookArea">
						<div class="aw_type_box">
							<button class="aw_l" id="recommAreaLt"><span class="ns">이전</span><span class="aw_count"><span class="start_index">${start }</span>/<span class="end_index">${end }</span></span></button>
							<button class="aw_r" id="recommAreaRt"><span class="ns">다음</span><span class="aw_count"><span class="start_index">${start }</span>/<span class="end_index">${end }</span></span></button>
			 			</div>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 4790px; transform: translate3d(-958px, 0px, 0px); transition-duration: 0s; height: 384px;">
							
							<c:set var="i" value="0"/>	
							<c:forEach var="dto" items="${dcRnumSlideLists}">
							<c:if test="${i eq 0 }">
								<li class="swiper-slide swiper-slide-duplicate swiper-slide-visible swiper-slide-active" style="width: 958px; height: 384px;">
									<ul class="d_area_list">
							</c:if>
									
										<li>
											<div class="t_cate">[${dto.genre }]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3827032">
													<img src="<%=cp %>/resources/image/book/${dto.bookImage }" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3827032">[정가인하] ${dto.bookTitle }</a></dt>
												<dd class="b_author">${dto.authorName }</dd>
												<dd class="mt10"><span class="rPrice">${dto.bookPrice }원</span> → ${dto.discountedPrice }원(<strong>${dto.discountRate }%↓</strong>)</dd>
												<dd class="price">판매가 : <strong><fmt:formatNumber value="${dto.discountedPrice*0.9 }" type="number"/>원</strong></dd>
											</dl>
										</li>
							<c:set var="i" value="${i+1 }"/>
							<c:if test="${i eq 4 }">
									</ul>
								</li>
							<c:set var="i" value="0"/>
							</c:if>

							</c:forEach>	
							
							</ul>
						</div>
						<div class="pagination">
							<span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span>
							<span class="swiper-pagination-switch"></span>
							<span class="swiper-pagination-switch"></span>
						</div>
					</div>
				</div>	
				
				<div class="overflow" style="margin-bottom: 20px;">
					<div class="d_new_book" id="discountTemType_3">
						<h3 class="m_tit_s"><span>이 달의 정가인하도서</span></h3>
						<a href="<%=cp %>/discountBookList.action" class="btn_more_2014"><span>더보기</span></a>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 3930px; transform: translate3d(-655px, 0px, 0px); transition-duration: 0s; height: 219px;">
							
						<c:set var="i" value="0"/>	
							<c:forEach var="dto" items="${dcOfTheMonth }">
								<c:if test="${i eq 0 }">
								<li class="swiper-slide swiper-slide-duplicate" style="width: 655px; height: 219px;">	
								<ul class="d_area_list">
								</c:if>						
									
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3858538">
												<img src="<%=cp %>/resources/image/book/${dto.bookImage }" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3858538">[정가인하] ${dto.bookTitle }</a></dt>
											<dd class="b_author">스티븐영</dd>
											<dd class="mt10"><span class="rPrice">${dto.bookPrice }원</span> → ${dto.discountedPrice }원(<strong>${dto.discountRate }%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong><fmt:formatNumber value="${dto.discountedPrice*0.9 }" type="number"/></strong></dd>
										</dl>
									</li>
								<c:set var="i" value="${i+1 }"/>
								<c:if test="${i eq 2 }">
								</ul>
								</li>
								<c:set var="i" value="0"/>
								</c:if>

							</c:forEach>	
							
							</ul>
						</div>
						<div class="pagination">
							<span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span>
							<span class="swiper-pagination-switch"></span>
							<span class="swiper-pagination-switch"></span>
							<span class="swiper-pagination-switch"></span>
						</div>
						<div class="aw_type_num">
							
							<span class="on">1</span>
							
							<span>2</span>
							
							<span>3</span>
							
							<span>4</span>
							
						</div>
					</div>
					<div class="d_best">
						<h3 class="m_tit_s"><span>베스트셀러</span></h3>
						<ul class="ranking_list">
							
						<c:forEach var="dto" items="${bestSellerTop10 }">	
							<li><span class="num">${dto.rnum }</span> <a href="" class="r_book">${dto.bookTitle }</a></li>
						</c:forEach>
							
			      		</ul>
						
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 동적으로 만들어주는 스크립트  -->
<script type="text/javascript">
$(document).ready(function(){
	templateRearrange();

});

	function templateRearrange() {
		
			$("#sortableArea").append($("#discountTemType_204"));
		
			$("#sortableArea").append($("#discountTemType_205"));
		
			$("#sortableArea").append($("#discountTemType_206"));
		
	}

	var mdBookTab = new Swiper('#mdBookList .swiper-container',{
	    onlyExternal : true,
	    pagination: '.d_md_recomm .pagination',
	    loop:true,
	    autoplay: 5000,
	    speed:500,
	    autoplayDisableOnInteraction: true,
	    //autoplayStopOnLast: true,
	    paginationClickable: true,
	    onSlideChangeStart: function(){
	      $(".d_md_recomm .start_index").html(mdBookTab.activeLoopIndex + 1);	   
	      $(".d_md_recomm .d_md_list .active").removeClass('active');	   
	      var tabIndex = 0;
	      var kwLength = $(".d_md_recomm .d_md_list li").length;
	      if(kwLength == mdBookTab.activeIndex-1){
	    	  tabIndex = 0;
	      }else{
	    	  tabIndex = mdBookTab.activeIndex-1;
	      }
	      $(".d_md_recomm .d_md_list li").eq(tabIndex).addClass('active');
	    }
	  });	  
	  $(".d_md_recomm .end_index").html(mdBookTab.paginationButtons.length);	
	  $(".d_md_recomm .d_md_list li").mouseover('touchstart mousedown',function(e){
	    e.preventDefault();
	    $(".d_md_recomm .d_md_list .active").removeClass('active');
	    
	    $(this).addClass('active');
	    mdBookTab.swipeTo( $(this).index() );
	  });
	  $('#mdRecommAreaLt').on('click', function(e){
	    e.preventDefault();
	    mdBookTab.swipePrev();
	  });
	  $('#mdRecommAreaRt').on('click', function(e){
	    e.preventDefault();
	    mdBookTab.swipeNext();
	  });
	  $(".d_md_recomm").mouseover(function(){
		  mdBookTab.stopAutoplay();
		  })
	 $(".d_md_recomm").mouseout(function(){
		 mdBookTab.startAutoplay();
		  })
	  
	 var dRecommBook = new Swiper('#discountAreaRecomm .swiper-container',{
		    pagination: '#discountAreaRecomm .pagination',
		    /* slidesPerView: 4, */
		    loop:true,
		    simulateTouch: true,
		    paginationClickable: true,
			watchActiveIndex: true,
			calculateHeight:true,
			//paginationAsRange:true,
			//createPagination:false,
		    onSlideChangeEnd: function () { 
		       $("#discountAreaRecomm .start_index").html(dRecommBook.activeLoopIndex + 1);	   
		    }
		  });
		  $("#discountAreaRecomm .end_index").html(dRecommBook.paginationButtons.length);		  
		  $('#recommAreaLt').on('click', function(e){
		    e.preventDefault();
		    dRecommBook.swipePrev();
		  });
		  $('#recommAreaRt').on('click', function(e){
		    e.preventDefault();
		    dRecommBook.swipeNext();
		  });
		  
	  var dTemBook_3 = new Swiper('#discountTemType_3 .swiper-container',{
		    pagination: '#discountTemType_3 .pagination',
		    loop:true,
		    simulateTouch: true,
		    paginationClickable: true,
			watchActiveIndex: true,
			calculateHeight:true,
		    onSlideChangeStart: function(){
		      $("#discountTemType_3 .aw_type_num .on").removeClass('on');	   
		      var tabIndex = 0;
		      var kwLength = $("#discountTemType_3 .aw_type_num span").length;
		      if(kwLength == dTemBook_3.activeIndex-1){
		    	  tabIndex = 0;
		      }else{
		    	  tabIndex = dTemBook_3.activeIndex-1;
		      }
		      $("#discountTemType_3 .aw_type_num span").eq(tabIndex).addClass('on');
		    }
		  });
		  $("#discountTemType_3 .aw_type_num span").mouseover('touchstart mousedown',function(e){
		    e.preventDefault();
		    $("#discountTemType_3 .aw_type_num .on").removeClass('on');
		    
		    $(this).addClass('on');
		    dTemBook_3.swipeTo( $(this).index() );
		  });
		  
	  var dTemBook_4 = new Swiper('#discountTemType_4 .swiper-container',{
		    pagination: '#discountTemType_4 .pagination',
		    loop:true,
		    simulateTouch: true,
		    paginationClickable: true,
			watchActiveIndex: true,
			calculateHeight:true,
		    onSlideChangeEnd: function () { 
		       $("#discountTemType_4 .start_index").html(dTemBook_4.activeLoopIndex + 1);	   
		    }
		  });
		  $("#discountTemType_4 .end_index").html(dTemBook_4.paginationButtons.length);		  
		  $('#discountTemLt_4').on('click', function(e){
		    e.preventDefault();
		    dTemBook_4.swipePrev();
		  });
		  $('#discountTemRt_4').on('click', function(e){
		    e.preventDefault();
		    dTemBook_4.swipeNext();
		  });		
		  
	  var dTemBook_5 = new Swiper('#discountTemType_5 .swiper-container',{
		    pagination: '#discountTemType_5 .pagination',
		    loop:true,
		    simulateTouch: true,
		    paginationClickable: true,
			watchActiveIndex: true,
			calculateHeight:true,
		    onSlideChangeStart: function(){
		      $("#discountTemType_5 .aw_type_num .on").removeClass('on');	   
		      var tabIndex = 0;
		      var kwLength = $("#discountTemType_5 .aw_type_num span").length;
		      if(kwLength == dTemBook_5.activeIndex-1){
		    	  tabIndex = 0;
		      }else{
		    	  tabIndex = dTemBook_5.activeIndex-1;
		      }
		      $("#discountTemType_5 .aw_type_num span").eq(tabIndex).addClass('on');
		    }
		  });
	  
		  $("#discountTemType_5 .aw_type_num span").mouseover('touchstart mousedown', function(e){
		    e.preventDefault();
		    $("#discountTemType_5 .aw_type_num .on").removeClass('on');
		    
		    $(this).addClass('on');
		    dTemBook_5.swipeTo( $(this).index() );
		  });

	  
	  
	  var dTemBook_204 = new Swiper('#discountTemType_204 .swiper-container',{
		    pagination: '#discountTemType_204 .pagination',
		    loop:true,
		    simulateTouch: true,
		    paginationClickable: true,
			watchActiveIndex: true,
			calculateHeight:true,
		    onSlideChangeEnd: function () { 
		       $("#discountTemType_204 .start_index").html(dTemBook_204.activeLoopIndex + 1);	   
		    }
		  });
		  $("#discountTemType_204 .end_index").html(dTemBook_204.paginationButtons.length);		  
		  $('#discountTemLt_204').on('click', function(e){
		    e.preventDefault();
		    dTemBook_204.swipePrev();
		  });
		  $('#discountTemRt_204').on('click', function(e){
		    e.preventDefault();
		    dTemBook_204.swipeNext();
		  });
	  
	  
	  
	  var dTemBook_205 = new Swiper('#discountTemType_205 .swiper-container',{
		    pagination: '#discountTemType_205 .pagination',
		    loop:true,
		    simulateTouch: true,
		    paginationClickable: true,
			watchActiveIndex: true,
			calculateHeight:true,
		    onSlideChangeEnd: function () { 
		       $("#discountTemType_205 .start_index").html(dTemBook_205.activeLoopIndex + 1);	   
		    }
		  });
		  $("#discountTemType_205 .end_index").html(dTemBook_205.paginationButtons.length);		  
		  $('#discountTemLt_205').on('click', function(e){
		    e.preventDefault();
		    dTemBook_205.swipePrev();
		  });
		  $('#discountTemRt_205').on('click', function(e){
		    e.preventDefault();
		    dTemBook_205.swipeNext();
		  });
  	  
</script>
<!-- 동적으로 만들어주는 스크립트 끝  --> 

</body>
</html>