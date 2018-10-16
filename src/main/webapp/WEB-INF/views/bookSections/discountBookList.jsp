<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/ra/resources/common/css/bnlBSList2.css" type="text/css">
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
			<h2 class="ml10 mt30  mb10 lh0"><img src="http://image.bandinlunis.com/images/specialBook/tit_h3_discount.gif" alt="정가인하도서" class="lh0"></h2>

			<div class="conWrap" id="selCSS2">
			
				<form name="frm" action="/front/display/discountBookList.do#tabMenu" method="get" onsubmit="javascript:return false;">
				<input type="hidden" name="page" value="1">
				<input type="hidden" name="listSize" value="20">
				<input type="hidden" name="listMode" value="detail">
				<input type="hidden" name="sort" value="sort1">	
				<input type="hidden" name="prodStat" value="N">	
				<input type="hidden" name="cateId" value="">
				<input type="hidden" name="fromDiscountRate" value="10">
				<input type="hidden" name="toDiscountRate" value="100">
				<input type="hidden" name="discountRateType" value="TOTAL">
				<input type="hidden" name="mdate" value="">
			
                <ul class="tap_menu_d1 tap_div_3 mb20 ml5" id="tabMenu">
                	<li><a href="/front/display/discountBookMain.do" class="alt">추천</a></li>
                	<li><a href="/front/display/discountBookList.do?mdate=Y&amp;sort=sort12">이달의 신규등록</a></li>
                	<li><a href="/front/display/discountBookList.do" class="on">분야별 전체</a></li>
                </ul>
                
                <div class="side_t2 ml5">
					<div class="cate_comm">
						<h2 class="cate_tit"> 
								
						 		분야별 전체
						</h2> 
						<ul class="cate_d1">
							<li class="cate_d1_li on"><a href="javascript:goCategory();" class="cate_d1_link">전체</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(2);" class="cate_d1_link">소설</a></li>	
							<li class="cate_d1_li "><a href="javascript:goCategory(7216);" class="cate_d1_link">장르소설</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(4);" class="cate_d1_link">인문/교양/철학</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(3);" class="cate_d1_link">시/에세이/기행</a></li>					
							<li class="cate_d1_li "><a href="javascript:goCategory(5);" class="cate_d1_link">역사/신화/문화</a></li>		
							<li class="cate_d1_li "><a href="javascript:goCategory(6);" class="cate_d1_link">종교</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(7);" class="cate_d1_link">사회/정치/법률</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(8);" class="cate_d1_link">경제/경영</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(9);" class="cate_d1_link">자기계발</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(11);" class="cate_d1_link">외국어/사전</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(12);" class="cate_d1_link">가정/생활/요리</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(13);" class="cate_d1_link">건강/의학/미용</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(17);" class="cate_d1_link">청소년교양</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(18);" class="cate_d1_link">예술/대중문화</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(19);" class="cate_d1_link">여행/취미/레저</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(20);" class="cate_d1_link">잡지</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(21);" class="cate_d1_link">만화</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(22);" class="cate_d1_link">컴퓨터/IT</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(23);" class="cate_d1_link">자연과학/공학</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(24);" class="cate_d1_link">대학교재</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(4208);" class="cate_d1_link">서양서</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory(6706);" class="cate_d1_link">중/고등참고서</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory('3141');" class="cate_d1_link">어린이영어</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory('3142');" class="cate_d1_link">유아동전집</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory('3137');" class="cate_d1_link">육아/자녀교육</a></li>
							<li class="cate_d1_li "><a href="javascript:goCategory('3136');" class="cate_d1_link">임신/출산/태교</a></li>
						</ul>
					</div>
				</div>
				
				<div class="con_t2">
					<h3 class="cateTit p10">
						
						<span>정가인하 도서 전체</span>

					</h3>		
					
					<div class="tap_menu_d2 mb15">
		                <ul>
							<li class="alt on"><a href="javascript:goSearch('TOTAL');" class="cart_link">전체</a></li>
		                	<li class=""><a href="javascript:goSearch('FIFTY');" class="cart_link">50% 이상</a></li>
		                	<li class=""><a href="javascript:goSearch('FORTY');" class="cart_link">40% 이상</a></li>
		                	<li class=""><a href="javascript:goSearch('THIRTY');" class="cart_link">30% 이상</a></li>
		                </ul>
		                <div class="tab_menu_line"></div>
		            </div>	
		            
		            <div class="prod_sort">								
						<div class="sorting">
							<input type="hidden" name="sorts" value="">
							<ul class="con01">
								<li><a id="sort1" style="cursor:pointer;" class="on">판매량순</a></li>
								<li><a id="sort2" style="cursor:pointer;">발행일순</a></li>
								<li><a id="sort12" style="cursor:pointer;">등록일순</a></li>
								<li><a id="sort6" style="cursor:pointer;">상품명순</a></li>
								<li><a id="sort11" style="cursor:pointer;">정가인하순</a></li>
								<li class="alt"><a id="sort10" style="cursor:pointer;">가격순</a></li>
							</ul>
						 	<div class="con02">
								<p>
									<select class="changeListSize">
										<option value="20" selected="">20개씩</option>
										<option value="40">40개씩</option>
										<option value="60">60개씩</option>
									</select>
								</p>
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
							
							<span><strong>전체</strong>에  
							총 <strong>5,314</strong> 권의   정가인하 도서가 등록되어 있습니다. </span>
							
							
 
						</h4>
						<p class="btn_cart">
							<span><input type="checkbox" name="prodIds" class="chk" onclick="javascript:check_all(document.getElementsByName('prodId'), this.checked);"> 전체</span>
							<a href="javascript:addCarts();"><span class="btn_w_comm btype_a2">쇼핑카트</span></a>
							<a href="javascript:addWishes();"><span class="btn_w_comm btype_a2">위시리스트</span></a>
						</p>
					</div>		
					<div class="fl_clear ml5">	
						<div class="prod_list_type  ">

							<ul>
							
							<!-- 리스트 1개 시작  -->
				         	<li>
				         		<input class="checkbox" type="checkbox" value="3795041" name="prodId">
								<div class="prod_thumb">
									<div class="prod_thumb_img">
										<a href="/front/product/detailProduct.do?prodId=3795041" onfocus="this.blur();">

													<img src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg" onerror="this.src='/images/common/noimg_type01.gif';">

										</a>
										<a class="btn_popup" target="_blank" href="/front/product/detailProduct.do?prodId=3795041"><span class="ico_new">새창열기</span></a>
									</div>
															
								</div>
								<dl class="prod_info">
									<dt>
										<a href="/front/product/detailProduct.do?prodId=3795041" onfocus="this.blur();">
											  [정가인하] 한국사를 바꿀 14가지 거짓과 진실
										</a>
										<!-- <span class="tit_sub">- 덧셈구구</span> -->												
										<span class="tag_area">
											<span class="tag_best"><span>베스트</span></span>
											
											
										</span>
									</dt>
									<dd class="txt_block">
										<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
										<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
									</dd>
									
										
									<dd class="mt5"><p><span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span class="txt_arrow">→</span>
														<span class="txt_reprice2">4,000원 [<strong>69%</strong> 정가인하] </span> </p>
														<p class="mt5"><span class="txt_price"><strong><em>3,600</em>원</strong>
														 (10%↓+5%P)</span></p>
									</dd>
									<dd class="txt_desc">
										<div class="review_point">
											<span style="width: 80.50%"></span>
										</div>
										<span class="ratings_num">
										<strong>8.05</strong>
										<a href="/front/product/detailProduct.do?prodId=3795041#sub10" target="_blank">리뷰<em>(19)</em></a>
										</span>
									</dd>
									<dd class="txt_bex">
										추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은 위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것 같던 흉노와 신...
									</dd>
									<dd class="txt_ebook">
										<span>지금 주문하면<strong class="t_red">2018년 10월 20일(토) 이내</strong>받을 수 있습니다.</span>
									</dd>
													
								</dl>
								<dl class="prod_btn">
									<dt>
										<span class="num_txt">수량</span>
										<input type="text" id="cntVal_3795041" value="1" class="num" size="3" maxlength="2" onkeydown="onlyNumber();" onkeyup="">
										<span class="btn_updn_wrap"><a href="javascript:cntUp('3795041','01');" class="btn_num_up">▲</a><a href="javascript:cntDown('3795041','01');" class="btn_num_dn">▼</a></span>
									</dt>
								
									
											
											<dd><a href="javascript:addCart('3795041');"><span class="btn_b_comm btype_f1">쇼핑카트</span></a></dd>
											<dd class="mt3"><a href="javascript:goOrder('3795041');"><span class="btn_w_comm btype_f1">바로구매</span></a></dd>
										
										
										
									
									<dd class="mt3"><a href="javascript:add_wish_array_common('3795041', true);"><span class="btn_w_comm btype_f1">위시리스트</span></a></dd>
								</dl>
							</li>
							<!-- 리스트 1개 끝  -->
							
							</ul>
														
						</div>
						
						<!-- 페이징 -->
						<div class="pageTypeA">
							<span class="prev-btn">	
		<!-- <img src="/images/common/btn_pagePrevG.gif" align="absmiddle" border="0"> -->

		<!-- <img src="/images/common/btn_pagePrev.gif" align="absmiddle" hspace="2" border="0"> -->
</span>
<span class="pageNum">
		<a class="on">1</a>
        <a href="/front/display/discountBookList.do?page=2#tabMenu">2</a>
        <a href="/front/display/discountBookList.do?page=3#tabMenu">3</a>
        <a href="/front/display/discountBookList.do?page=4#tabMenu">4</a>
        <a href="/front/display/discountBookList.do?page=5#tabMenu">5</a>
        <a href="/front/display/discountBookList.do?page=6#tabMenu">6</a>
        <a href="/front/display/discountBookList.do?page=7#tabMenu">7</a>
        <a href="/front/display/discountBookList.do?page=8#tabMenu">8</a>
        <a href="/front/display/discountBookList.do?page=9#tabMenu">9</a>
        <a href="/front/display/discountBookList.do?page=10#tabMenu">10</a>
</span>
<span class="next-btn">
		<a href="/front/display/discountBookList.do?page=11#tabMenu"><img src="/images/common/btn_pageNext.gif" align="absmiddle" hspace="2" border="0"></a>

</span>

						</div>
						
						<div class="prod_sort_b">
							<span><input type="checkbox" name="prodIds" class="chk" onclick="javascript:check_all(document.getElementsByName('prodId'), this.checked);"> 전체</span>
							<a href="javascript:addCarts();"><span class="btn_w_comm btype_a2">쇼핑카트</span></a>
							<a href="javascript:addWishes();"><span class="btn_w_comm btype_a2">위시리스트</span></a>
						</div>
						
						
					
					</div>		
				
				</div>
				
			</form>
			
			</div>
		</div>
	</div>




</body>
</html>