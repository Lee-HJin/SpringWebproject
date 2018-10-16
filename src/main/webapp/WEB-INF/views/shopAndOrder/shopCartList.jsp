<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/ra/resources/common/css/bnlBSList2.css" type="text/css"/>
<link rel="stylesheet" href="/ra/resources/common/css/shopCartList.css" type="text/css"/>
<link rel="shortcut icon" href="http://image.bandinlunis.com/favicon.ico" type="image/x-icon">
<title>2조 반디앤루니스</title>

<script type="text/javascript" src="/ra/resources/common/js/common.js"></script>
<script type="text/javascript" src="/ra/resources/common/js/swfobject.js"></script>
<script type="text/javascript" src="/ra/resources/common/js/flashcommon.js"></script>
<script type="text/javascript" src="/ra/resources/common/js/AC_RunActiveContent.js"></script>

<script type="text/javascript" src="/ra/resources/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="/ra/resources/js/JUTIL/JUTIL.js" charset="utf-8"></script>
<script type="text/javascript" src="/ra/resources/js/navi.js" charset="utf-8"></script>
<script type="text/javascript" src="/ra/resources/js/partnerHeaderInfo.js"></script>

<script type="text/javascript" src="/ra/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/ra/resources/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/ra/resources/js/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="/ra/resources/js/jquery/idangerous.swiper.js"></script>

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

</head>
<body>

<div id="contentBody">
        <div id="contentWrap">
		 
             <!-- location -->
            <div id="conLocation">
				<div class="location" id="locationArea">
					<li><a href="/">홈</a>&nbsp;<img src="/ra/resources/images/searchN/ico_carte.gif">&nbsp;</li>
					<li><b>쇼핑카트</b></li>
				</div>
			</div>
            <!-- //location -->         
            <div class="conWrap pos_rel">
            	
            	<div class="orderStepN">
                    <h2><img src="/ra/resources/images/searchN/h2_bookcart.gif" alt="쇼핑카트"></h2>
                    
                    
	                    <dl class="benefitA overflow">
	                   		<dt class="bftit">나의 사용가능 혜택:</dt>
	                   		<dd>
	                   		 예치금 <strong>0</strong>원 |
	                   		적립금 <strong>1,000</strong>원 |
	                   		쿠폰 <strong>0</strong>장  | 전환금 <strong>0</strong>원
	                   		</dd>
	                    </dl>
                    
                    <p class="mt10 t_gr fl_clear">최대 90일까지 보관되며, 이후에는 위시리스트에 자동 보관됩니다.</p>
                   	<p class="step"><img src="/ra/resources/images/searchN/navi_step01.gif" alt="쇼핑카트 > 주문/결제 > 주문완료"></p>
                </div>
                
                
                <ul class="tab_cart_menu">
                	<li class="on"><a href="/front/order/shopCartList.do" class="cart_link tab_bandi">일반 상품</a></li>
                	<li><a href="/front/order/shopCartList.do?cartType=03" class="cart_link tab_bookself">북셀프 상품</a></li>
                	<li class="alt"><a href="/front/order/shopCartList.do?cartType=04" class="cart_link tab_ebook">eBook 상품</a></li>
                </ul>
                <div class="cart_bookself_info"><a href="javascript:popLayer('bookSelfInfo')"><img src="/ra/resources/images/searchN/btn_bookself_info.png" alt="주문 후 매장에서 수령 | 북셀프 안내"></a></div>
                <!-- 북셀프 안내  LAYER -->
	            <div class="bookViewPop" id="bookSelfInfo" style="visibility:hidden; margin:-5px 0 0 327px; width:300px">
	            	 <h3 class="mLine">북셀프 서비스 안내 </h3>				        
	               	 <div class="laypopCon mt10">
	                    <p>1시간도 길다! 5분이면 OK!<br>인터넷으로 구매하고 매장에서 바로 찾아가세요.</p>
	                    <p class="t_11br3 mt10">
	                    	반디앤루니스 인터넷에서 북셀프 가능 도서를 선택 후 찾기 편하신 매장을 지정 하세요.결제 후 바로 매장을 방문, 서가에서 '직접' 책을 찾으시면 됩니다.
	                    </p>
	                    <p class="al_right mt10"><a href="http://www.bandinlunis.com/pages/front/service/serviceBookSelf.jsp" target="_blank"><img src="http://image.bandinlunis.com/images/order/btn_detail_view.gif"></a></p>
	               	 </div>
	                 <p class="btnClose"><img src="http://image.bandinlunis.com/images/common/btn_close02.gif" alt="close" style="cursor:pointer;" onclick="javascript:popHidden('bookSelfInfo')"></p>
	            </div>
	            <!--// 북셀프 안내  LAYER -->
	            
     		    
	            
	            <!-- 소득공제상품(도서) -->
                <div id="bandi_deduction_list" class="pos_rel fl_clear mt40" style="">
					<h3 class="orderTit mt20"> 
						반디배송 상품 <span class="t_14 t_blue t_bold">- 도서 소득공제 대상 <span class="sp_btn sp_help" onmouseover="javascript:popLayer('deductionInfo')" onmouseout="javascript:popHidden('deductionInfo')"><span>?</span></span></span>
					</h3> 
					<div class="bookViewPop al_left" id="deductionInfo" style="visibility: hidden; left 20px; top: 25px; width: 320px;">
						 <h3 class="mLine">도서 소득공제 대상 안내</h3>
						 <div class="laypopCon "> 
							 <p class="mt5">
								저자, 발행인, 발행일, 출판사, 국제표준도서번호(ISBN. 다만, 전자책의 경우
								ECN 포함)이 기록된 간행물로 종이책(학술서, 만화, 학습참고서 포함), 전자책
								(오디오북, 웹툰, 웹소설 포함)<br>
								(※ 잡지, eBook 대여, 과세도서 제외)
							 </p> 
						 </div> 						
					</div>

					<div class="pos_abs at0 ar0 mt3" style="_top:0;_margin-top:0">
						
						<a id="bandiDeduction" class="btn_bookSelf" style="cursor:pointer;"><img src="/ra/resources/images/searchN/btn_cart_move_bookself.gif" alt="선택상품 북셀프로 주문하기"></a>
 						
						<a href="javascript:array_interest(1);"><img src="/ra/resources/images/searchN/btn_cart_wishlist02.gif" alt="선택상품 위시리스트 담기"></a>
						<a id="bandiDeduction" class="btn_del" style="cursor:pointer;"><img src="/ra/resources/images/searchN/btn_cart_del02.gif" alt="선택상품 삭제"></a>
					</div>
            	
	            	<table cellpadding="0" cellspacing="0" class="orderTable">
	            		<colgroup><col width="55"><col>
	            			<col width="92">
	            			
	            			<col width="92"><col width="72"><col width="92"><col width="90"><col width="40"></colgroup>
	            		<tbody><tr>
	            			<th colspan="2">상품명</th>
	            			
		            			<th>수령예상일</th>
	            			
	            			<th>판매가</th>
	            			<th>수량</th>
	            			<th>합계</th>
	            			<th>담기/삭제</th>   
	            			<th><input type="checkbox" id="bandiDeduction" class="checkAll"></th>                			
	            		</tr>

	            		<tr>
	            			<td>
	            				<span class="book_img"><img src="http://image.bandinlunis.com/upload/product/4034/4034224_s.jpg" onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type02.gif'"></span> 
	            			</td>
	            			<td class="prod_name">
	            				<span class="block t_14">

            						<a href="/front/product/detailProduct.do?prodId=4034224">[도서]돌이킬 수 없는 약속</a>

	            				</span>
	            				<span class="block mt3 t_gr">야쿠마루 가쿠 | 북플라자</span>
	            				
	            			</td>
	            			
	            			<td id="bandi_deli_term_48116888">
            							2018년<br>10월 13일(토)
	            			</td>
	            			
	            			<td>
	            				<strong>13,500원</strong><br>
	            				(10%<strong class="point_b">↓</strong>)<br>
	            				(<strong class="point_o">P</strong> 750원)
	            			</td>
	            			
	            			<td>
	            				<span class="num_c">
	            					<input type="text" name="cntVal" id="cntVal_48116888" value="1" class="o_input_num fl_left" size="3" onkeydown="onlyNumber();" onkeyup="cntChange('48116888');" style="text-align:right;ime-mode:disabled;">
	            					<span class="num_c_up"><img src="/ra/resources/images/searchN/btn_num_up.gif" alt="" onclick="cntUp('48116888');" style="cursor:pointer;"></span>
	            					<span class="num_c_dn"><img src="/ra/resources/images/searchN/btn_num_down.gif" alt="" onclick="cntDown('48116888');" style="cursor:pointer;"></span>
	            				</span>
            					<img src="/ra/resources/images/searchN/btn_cart_modify.gif" alt="수정" class="mt5" onclick="updateShopCart(48116888)" style="cursor:pointer;">
	            			</td>

	            			<td><strong id="costVal_48116888">13,500원</strong></td>  
	            			          			
	            			<td>
	            				<img src="/ra/resources/images/searchN/btn_cart_wishlist.gif" alt="위시리스트 담기" onclick="add_wish_common('4034224');" style="cursor:pointer;"><br>
	            				<img src="/ra/resources/images/searchN/btn_cart_del.gif" alt="삭제" class="mt5" onclick="deleteShopCart('48116888')" style="cursor:pointer;">
	            			</td>
	            			
	            			<td>
	            				<input type="checkbox" id="checkBox_48116888" name="seqArr3" class="check_bandiDeduction" value="48116888" checked="checked">
	            				<input type="hidden" class="storeId_1" value="48116888">
	            				<input type="hidden" id="storeIdVal_48116888" value="1">
	            				<input type="hidden" id="saleCostVal_48116888" value="13500">
	            				<input type="hidden" id="marketSaleVal_48116888" value="15000">
	            				<input type="hidden" id="prodPointVal_48116888" value="750">
	            				<input type="hidden" id="deliCostCondiVal_48116888" value="10000">
	            				<input type="hidden" id="deliCostVal_48116888" value="2000">
	            				<input type="hidden" id="bundleDeliYnVal_48116888" value="Y">
	            				<input type="hidden" id="prodIdArr_48116888" name="prodIdArr" value="4034224">
	            				<input type="hidden" id="prod_name_48116888" name="prod_name" value="돌이킬 수 없는 약속">
	            				<input type="hidden" id="optSeqVal_48116888" name="optSeqVal_48116888" value="">
	            				<input type="hidden" name="is_sale_yn" value="Y">
	            				<input type="hidden" id="prodTypeArr_48116888" name="prodType" value="01">
	            				<input type="hidden" id="flag_48116888" value="0">
	            				<input type="hidden" id="preSaleYnVal_48116888" value="N">
	            				<input type="hidden" id="maxVal_48116888" value="999">
	            			</td>
	            		</tr>
	            	</tbody></table>
	            	
	            	<div class="cart_pay_total">
	            		<span class="fl_left mt3 ml10" id="bandiDeduction_totOrdCnt">수량: 1종(1개)</span>
	            		<span class="fl_right al_right">
	            			<span class="di_in mt3 mr5">총 상품 금액: <span id="bandiDeduction_totSaleCost">13,500</span>원</span>
	            			<span class="di_in al_top mr5"><img src="/ra/resources/images/searchN/ico_cart_plus.gif" alt=""></span>
	            			<span class="di_in mt3 mr5">배송비: <span id="bandiDeduction_totDeliCost">0</span>원</span>
	            			<span class="di_in al_top mr5"><img src="/ra/resources/images/searchN/ico_cart_same.gif" alt=""></span>
	            			<span class="di_in mt3 mr10">주문금액 합계: <span class="t_red"><span id="bandiDeduction_totOrdCost">13,500</span>원</span></span>
	            		</span>
	            	</div>
	            	<div class="cart_point_total al_right"> 
	            		<span id="span_prevInfo"></span>
	            		<strong class="mr10">적립가능액 : <span class="point_b">상품적립금 <span id="bandiDeduction_totPoint">750</span>원</span></strong>
	            	</div>
            	</div>
	            <!-- //소득공제상품(도서) -->
	            
	            <!-- 비공제상품(반디배송 상품) -->
                <div id="bandi_list" class="pos_rel fl_clear mt20" style="display:none;">
					<h3 class="orderTit mt20">
						반디배송 상품
						
						
					</h3>
					
					<div class="bookViewPop al_left" id="undeductionInfo" style="visibility: hidden; left 20px; top: 25px; width: 320px;">
						 <h3 class="mLine">문화비(도서) 소득공제 제외 상품 안내</h3>
						 <div class="laypopCon "> 
							 <p class="mt5">
									eBook 대여상품 및 ISBN, ENC 미발급 eBook 상품은 도서 소득공제에서 제외 됩니다. 
							 </p> 
						 </div> 						
					</div>
					
					<div class="pos_abs at0 ar0 mt3" style="_top:0;_margin-top:0">
						
 							<a id="bandi" class="btn_bookSelf" style="cursor:pointer;"><img src="/ra/resources/images/searchN/btn_cart_move_bookself.gif" alt="선택상품 북셀프로 주문하기"></a>
 						
						<a href="javascript:array_interest(1);"><img src="/ra/resources/images/searchN/btn_cart_wishlist02.gif" alt="선택상품 위시리스트 담기"></a>
						<a id="bandi" class="btn_del" style="cursor:pointer;"><img src="/ra/resources/images/searchN/btn_cart_del02.gif" alt="선택상품 삭제"></a>
					</div>
					
	            	<table cellpadding="0" cellspacing="0" class="orderTable">
	            		<colgroup><col width="55"><col>
	            			<col width="92">
	            			
	            			<col width="92"><col width="72"><col width="92"><col width="90"><col width="40"></colgroup>
	            		<tbody><tr>
	            			<th colspan="2">상품명</th>
	            			
		            			<th>수령예상일</th>
	            			
	            			<th>판매가</th>
	            			<th>수량</th>
	            			<th>합계</th>
	            			<th>담기/삭제</th>   
	            			<th><input type="checkbox" id="bandi" class="checkAll"></th>                			
	            		</tr>

	            	</tbody></table>
	            	<div class="cart_pay_total">
	            		<span class="fl_left mt3 ml10" id="bandi_totOrdCnt">수량: 0종(0개)</span>
	            		<span class="fl_right al_right">
	            			<span class="di_in mt3 mr5">총 상품 금액: <span id="bandi_totSaleCost">0</span>원</span>
	            			<span class="di_in al_top mr5"><img src="/ra/resources/images/searchN/ico_cart_plus.gif" alt=""></span>
	            			<span class="di_in mt3 mr5">배송비: <span id="bandi_totDeliCost">0</span>원</span>
	            			<span class="di_in al_top mr5"><img src="/ra/resources/images/searchN/ico_cart_same.gif" alt=""></span>
	            			<span class="di_in mt3 mr10">주문금액 합계: <span class="t_red"><span id="bandi_totOrdCost">0</span>원</span></span>
	            		</span>
	            	</div>
	            	<div class="cart_point_total al_right"> 
	            		<span id="span_prevInfo"></span>
	            		<strong class="mr10">적립가능액 : <span class="point_b">상품적립금 <span id="bandi_totPoint">0</span>원</span></strong>
	            	</div>
            	</div>
            	<!-- 비공제상품(반디배송 상품) -->
            	
            	
            	
            	<div id="store_list" class="pos_rel overflow mt50" style="display:none;">
					<h3 class="orderTit mt20">업체배송 상품</h3>
					<div class="pos_abs at15 ar0 mt3" style="_top:0;_margin-top:0">
						<a href="javascript:array_interest(2);"><img src="/ra/resources/images/searchN/btn_cart_wishlist02.gif" alt="선택상품 위시리스트 담기"></a>
						<a id="store" class="btn_del" style="cursor:pointer;"><img src="/ra/resources/images/searchN/btn_cart_del02.gif" alt="선택상품 삭제"></a>
					</div>
            	
	            	<table cellpadding="0" cellspacing="0" class="orderTable">
	            		<colgroup><col width="55"><col><col width="92"><col width="72"><col width="92"><col width="92"><col width="90"><col width="40"></colgroup>
	            		<tbody><tr>
	            			<th colspan="2">상품명</th>
	            			<th>판매가</th>
	            			<th>수량</th>
	            			<th>합계</th>
	            			<th>배송비</th>
	            			<th>담기/삭제</th>   
	            			<th><input type="checkbox" id="store" class="checkAll"></th>
	            		</tr>
	            		
	            		
	            		
	            		
	            		
	            		
	            	</tbody></table>
	            	<div class="cart_pay_total">
	            		<span class="fl_left mt3 ml10" id="store_totOrdCnt">수량: 0종(0개)</span>
	            		<span class="fl_right al_right">
	            			<span class="di_in mt3 mr5">총 상품 금액: <span id="store_totSaleCost">0</span>원</span>
	            			<span class="di_in al_top mr5"><img src="/ra/resources/images/searchN/ico_cart_plus.gif" alt=""></span>
	            			<span class="di_in mt3 mr5">배송비: <span id="store_totDeliCost">0</span>원</span>
	            			<span class="di_in al_top mr5"><img src="/ra/resources/images/searchN/ico_cart_same.gif" alt=""></span>
	            			<span class="di_in mt3 mr10">주문금액 합계: <span class="t_red"><span id="store_totOrdCost">0</span>원</span></span>
	            		</span>
	            	</div>
	            	<div class="cart_point_total al_right">
	            		<span class="btn_gift_view"><img src="/ra/resources/images/searchN/bn_cart_gift.jpg"></span>
	            		<strong class="mr10">적립가능액 : <span class="point_b">상품적립금 <span id="store_totPoint">0</span>원</span></strong>
	            	</div>
            	</div>
            	
            	
            	
            	
            	<div class="pos_rel overflow mt40">
					<h3 class="orderTit02 mt20"><img src="/ra/resources/images/searchN/h3_cart_total.gif" alt="쇼핑카트 총 주문금액"></h3> 
	            	<table cellpadding="0" cellspacing="0" class="orderTable_tatol" width="960">
	            		<colgroup><col width="104"><col width="212"><col width="212"><col width="212"><col></colgroup>
	            		<tbody><tr>
	            			<th>수량</th>
	            			<th>상품정가</th>
	            			<th>상품할인</th>
	            			<th>배송비</th>
	            			<th>주문금액 합계</th>
	            		</tr>
	            		<tr>
	            			<td><span class="t_14" id="totOrdCnt">1종(1개)</span></td>
	            			<td><span id="totMarketSale">15,000</span><span class="t_14">원</span></td>
	            			<td><span id="totDiscountCost">1,500</span><span class="t_14">원</span></td>
	            			<td><span id="totDeliCost">0</span><span class="t_14">원</span></td>
	            			<td class="total"><span id="totOrdCost">13,500</span><span class="t_14">원</span></td>
	            		</tr>
	            	</tbody></table>
	            	<div class="cart_point_total_b">
	            		<strong class="ml15 fl_left mt15 mb10">적립가능액 : 
	            		<span class="point_b" id="totPoint">상품적립금 0원</span> 
	            		<span class="t_normal" id="extTotPoint"></span>
	            		</strong>	            	
	            	
	            		<ul class="cart_deli_notice fl_clear">
	            			<li>5만원 이상 추가적립/멤버십/바로온2% 적립금은 비도서, 뷰티포함 구매 시 적용 됩니다. (도서 제외)</li>
	            			<li><strong>업체배송 상품</strong>은 추가적립 대상에서 <strong>제외</strong>됩니다. (상품페이지, 쇼핑카트에서 업체배송 확인가능)</li>
	            			<li>적립가능액은 쿠폰, 적립금등 보조결제 수단 따라 약간의 금액 차이가 있을 수가 있습니다.</li>
	            			<li>적립금 지급시기는 구매완료 시점에 자동 지급 됩니다.</li>
	            		</ul>
			            <div class="bookViewPop" id="addPointInfo" style="visibility:hidden; top:0px;left:200px; width:420px">
			            	 <h3 class="mLine">추가적립금 안내 </h3>				        
			               	 <div class="laypopCon">
			                    <p class="mt10">
			                    	총 주문금액 5만원 이상 구매 시 2,000원 추가 적립
			                    </p>
			                    <ul class="mt10">
			                    	<li class="dot_comm t_11">국내도서, eBook만 구매 시 적립 불가</li>
			                    	<li class="dot_comm t_11 mt5">업체배송상품은 적립 대상에서 제외 <br>(상품상세 및 카트에서 업체배송 여부 확인 가능)</li>	
			                    	<li class="dot_comm t_11 mt5">배송비, 선물포장비 제외</li>
			                    	<li class="dot_comm t_11 mt5">취소,반품으로 인해 주문금액이 5만원에 미달시 지급된 추가적립금 차감</li>	 
			                    </ul>
			                    <p class="al_right mt5"><a href="/pages/front/service/serviceAddPoint.jsp" target="_blank"><img src="http://image.bandinlunis.com/images/order/btn_detail_view.gif"></a></p>
			               	 </div>
			                 <p class="btnClose"><img src="http://image.bandinlunis.com/images/common/btn_close02.gif" alt="close" style="cursor:pointer;" onclick="javascript:popHidden('addPointInfo')"></p>
			            </div> 
			        </div>

	            	
		            	<div class="cart_deli_info">
		            		<dl class="cart_deli_date">
		            			<dt>수령예상일 : </dt>
		            			
		            			
		            		</dl>
		            		<ul class="cart_deli_notice">
		            			<li>출고일이 다른 상품을 함께 주문하시면, 출고일이 가장 늦은 상품을 기준으로 일괄 배송합니다.</li>
		            			<li>같은 상품을 여러 개 주문하실 경우 추가 재고 확보에 시간이 더 걸릴 수 있으므로 예상 수령일보다  배송일이 2-3일 더 지연되기도 합니다.</li>
		            			<li>국내 수령지 기준이며, 해외배송은 배송방법에 따라 수령일이 최대 14일까지 늘어날 수 있습니다. </li>
		            		</ul>
		            	</div>
	            	
	            	
	            	<span class="cart_plus"></span><span class="cart_minus"></span><span class="cart_same"></span>
				</div>
				
				<div class="mt20 al_center fl_clear">
					<a href="/"><img src="/ra/resources/images/searchN/btn_cart_shopping.gif" alt="쇼핑계속하기"></a>
					<a id="btn_order" style="cursor:pointer;"><img src="/ra/resources/images/searchN/btn_cart_order.gif" alt="주문하기"></a>
				</div>
				
				<!-- 크레마 무이자 팝업 -->
				
				<div class="laypop" id="laypop_crema" style="left:230px; bottom:1400px;width:500px; display:none;text-align:left;_left:-80px;">
					<h3 class="BLine ml20">12개월 무이자 할부 상품이 있습니다</h3>
					<div class="laypopCon">
						<div id="laypop_crema_prod" style="border:1px solid #d1d1d1;background:#f9f9f9;width:420px;padding:10px 10px 5px 10px;margin:10px 0 0 10px;">
						</div>
						<ul class="dotList mt15">
							<li>위 상품은 12개월 무이자 할부가 적용됩니다.</li>
							<li>적용 카드 : 외환,신한,삼성,현대,롯데,하나SK,농협NH</li>
							<li>단, <strong>타 상품과 함께 구매 시</strong>에는 <strong>12개월 무이자 혜택을 받으실 수   없습니다.</strong> <br>이 경우 <strong>타 상품은 별도로 주문 해 주십시오.</strong> </li>
						</ul>
						<div class="btnC mt10">
							<img src="http://image.bandinlunis.com/images/order/btn_cart_crema_only.gif" alt="무이자 혜택 상품만 주문" onclick="orderCrema();" style="cursor:pointer;">
							<img src="http://image.bandinlunis.com/images/order/btn_cart_crema_with.gif" alt="선택상품 모두 주문" onclick="orderProc();" style="cursor:pointer;">
						</div>
					</div>
					<p class="btnClose"><a href="javascript:closeCon('laypop_crema')"><img src="http://image.bandinlunis.com/images/common/btn_close02.gif" alt="close"></a></p>
				</div>
				
				<!-- //크레마 무이자 팝업 -->
				
				
				<div class="pos_rel overflow mt10 mb20 cart_inside">
					<div class="cartTit">
						<h3><img src="/ra/resources/images/searchN/h3_cart_inside.gif" alt="추천inside"></h3>
					</div>
					<div class="cart_re_inside"><div class="inside_book">
						
						<dl id="BOOKCART_1_1" style="display: block;">
							<dt><img src="http://image.bandinlunis.com/upload/product/4034/4034224_s.jpg" onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type02.gif'"></dt>
							<dd class="con01">돌이킬 수 없는 약속</dd>
							<dd class="mt5 BOOKCART_1_TIT"></dd>
						</dl>
						
						<p class="mPagingD pageNum" style="width:60px"><span class="num"><span id="insideIdx">1</span>/<span id="insideMax">1</span></span><a id="btn_insidePrev" class="prev" style="cursor:pointer;"><span>◀이전</span></a><a id="btn_insideNext" class="next" style="cursor:pointer;"><span>다음▶</span></a></p>
					</div></div>
					<div class="cart_recomProd">
						<ul class="mdbookList" id="BOOKCART_1"><li>추천 상품이 없습니다.</li></ul>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
</body>
</html>