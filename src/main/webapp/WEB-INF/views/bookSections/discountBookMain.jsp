<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                	<li><a href="/front/display/discountBookMain.do" class="on alt">추천</a></li>
                	<li><a href="/front/display/discountBookList.do?mdate=Y&amp;sort=sort12">이달의 신규등록</a></li>
                	<li><a href="/front/display/discountBookList.do">분야별 전체</a></li>
                </ul>
                
				<div class="d_md_recomm">
					<h3 class="m_tit_l"><span>정가인하 추천도서</span></h3>
					<div class="d_md_book" id="mdBookList">
						<div class="aw_type_box">
							<button class="aw_l" id="mdRecommAreaLt"><span class="ns">이전</span><span class="aw_count"><span class="start_index">2</span>/<span class="end_index">6</span></span></button>
							<button class="aw_r" id="mdRecommAreaRt"><span class="ns">다음</span><span class="aw_count"><span class="start_index">2</span>/<span class="end_index">6</span></span></button>
			 			</div>
						<div class="swiper-container">
							<div class="swiper-wrapper" style="width: 4720px; height: 270px; transform: translate3d(-1180px, 0px, 0px); transition-duration: 0.5s;"><ul class="swiper-slide swiper-slide-duplicate" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3835347">
												<img src="http://image.bandinlunis.com/upload/product/3835/3835347.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3835347">[정가인하] 올 댓 피시</a></dt>
											<dd class="b_author">송윤형 </dd>
											<dd class="mt15"><span class="rPrice">13,000원</span> → 6,500원(<strong>50%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>5,850원</strong></dd>
											<dd class="t_txt">
												'원시리즈‘로 요리책 스테디 셀러 시장을 연영진닷컴의 새로운 요리책 시리즈! 집에서 요리는 하는 사람이라면 누구나 하나쯤은 갖고 있다는 ‘원시리즈’. 우리 식단과 가장 가까운 밑반찬, 국찌개, 밥상 그리고 손님상까지 ... 집에서 요리로 할 수 있는 모든 분야를 다루며 요리가 낯선 사람들이 가장 편하게 찾을 수 있는 요리 친구이자 조언가로 큰 사랑을 받았었다.요리책으로는 이례적으로 100만부 판매와, 그해(2005년) 히트상품으로 지정되기도 했던, ‘원시리즈’를 출간한 영진닷컴에서 새로운 요리책 ... 
											</dd>
										</dl> 
									</li>
								</ul>
								
								<ul class="swiper-slide" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3796784">
												<img src="http://image.bandinlunis.com/upload/product/3796/3796784.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3796784">[정가인하]PD 고전을 탐하다</a></dt>
											<dd class="b_author">고영규 </dd>
											<dd class="mt15"><span class="rPrice">15,500원</span> → 4,000원(<strong>74%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>3,600원</strong></dd>
											<dd class="t_txt">
												출판사 서평 위로 식지 않는 인문학 열풍 속, 왜 동양고전인가? 수천 년 전 동양고전에서 현재의 삶에 대한 답을 구하다! 지난해부터 고전 읽기 열풍이 이어지고 있다. 고전(古典)의 세계에 발을 담그기 위해서는 고전(苦戰)을 각오해야 함에도 불구하고 우리 사회는 왜 고전에 열광하는가. 대답은 ‘그럼에도 불구하고’에 있다. 그럼에도 불구하고 힘든 싸움을 거쳐 고전의 세계에 입문하게 되면 세상을 보는 넓은 시야를 가질 수 있기 때문이다. 이 책은 어려운 고전 읽기를 조금이나마 쉽게 접근할 수 있도록 오... 
											</dd>
										</dl> 
									</li>
								</ul>
								
								<ul class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3835343">
												<img src="http://image.bandinlunis.com/upload/product/3835/3835343.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3835343">[정가인하] 더디쉬의 홈메이드 아침밥</a></dt>
											<dd class="b_author">더디쉬 </dd>
											<dd class="mt15"><span class="rPrice">12,000원</span> → 6,000원(<strong>50%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>5,400원</strong></dd>
											<dd class="t_txt">
												아침밥에 대한 상식을 깨자. 이제는 간편하고 간단한 아침밥Break+fast의 시대! 최소 7분, 최대 20분이면 아침밥이 뚝딱~영단어 브렉퍼스트(Breakfast)는 ‘밤사이의 긴 공복을 깨워주는 식사’라는 의미를 담고 있습니다. 잠을 자는 동안의 쉬고 있던 신체에 영양을 공급해 주는 아침밥은 신체리듬을 각성시키고 집중력을 높여주며 학습 능률과 다이어트에도 큰 도움을 줍니다. 하지만 바쁜 아침에 식사를 챙겨 먹는 게 쉬운 일만은 아니죠.[더디쉬의 홈메이드 아침밥]은 세수하고 씻을 시간도 안 되는... 
											</dd>
										</dl> 
									</li>
								</ul>
								
								<ul class="swiper-slide" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3829267">
												<img src="http://image.bandinlunis.com/upload/product/3829/3829267.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3829267">[정가인하] 페이퍼 원더랜드</a></dt>
											<dd class="b_author">미셜 로모 </dd>
											<dd class="mt15"><span class="rPrice">13,800원</span> → 4,900원(<strong>64%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>4,410원</strong></dd>
											<dd class="t_txt">
												●오리고! 붙이고! 즐겨라!누구나 쉽게 멋진 3D 종이 장난감을 만들 수 있다!흔히 종이를 이용한 놀이로 종이접기를 떠올린다. 종이접기는 입증된 교육적 효과로 인해 유아 교육에 있어 필수과정으로 자리하고 있다. 그런데 해외에선 종이공작이 종이접기의 인기를 넘어선지 오래다. 종이접기보다 쉽고, 간단한 반면에 입체감과 완성도면에서 월등하기 때문에 성취감이 크기 때문이다. 간단히 말해 종이접기가 2D라면 종이공작은 3D라고 할 수 있다. 이번에 소개하는 '페이퍼 원더랜드'는 종이접기에서 한층 더 발전한... 
											</dd>
										</dl> 
									</li>
								</ul>
								
								<ul class="swiper-slide" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3828578">
												<img src="http://image.bandinlunis.com/upload/product/3828/3828578.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3828578">[정가인하] 어밴던</a></dt>
											<dd class="b_author">멕 캐봇 </dd>
											<dd class="mt15"><span class="rPrice">13,000원</span> → 3,000원(<strong>77%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>2,700원</strong></dd>
											<dd class="t_txt">
												 
											</dd>
										</dl> 
									</li>
								</ul>
								
								<ul class="swiper-slide" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3785561">
												<img src="http://image.bandinlunis.com/upload/product/3785/3785561.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3785561">[정가인하]포스트모던인가 새로운 중세인가[개정판]</a></dt>
											<dd class="b_author">움베르토 에코 </dd>
											<dd class="mt15"><span class="rPrice">15,000원</span> → 6,000원(<strong>60%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>5,700원</strong></dd>
											<dd class="t_txt">
												왜 사람들은 스포츠에 매달리는가, 좁은 영화관에서 컬트무비를 즐기는 이들의 문화. 심리학적 상태는 어떠한가? 등 에코가 이 책에서 던지는 질문들은 끝이 없다. 깊은 이론적 성찰과 현란한 글쓰기를 절묘하게 혼합해 '다른 식으로' 살고 꿈꾸기를 바라는 모든 사람들을 후리는 에코의 글쓰기의 매력이 한껏 뿜어나오는 책이다. 
											</dd>
										</dl> 
									</li>
								</ul>
								
								<ul class="swiper-slide" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3835347">
												<img src="http://image.bandinlunis.com/upload/product/3835/3835347.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3835347">[정가인하] 올 댓 피시</a></dt>
											<dd class="b_author">송윤형 </dd>
											<dd class="mt15"><span class="rPrice">13,000원</span> → 6,500원(<strong>50%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>5,850원</strong></dd>
											<dd class="t_txt">
												'원시리즈‘로 요리책 스테디 셀러 시장을 연영진닷컴의 새로운 요리책 시리즈! 집에서 요리는 하는 사람이라면 누구나 하나쯤은 갖고 있다는 ‘원시리즈’. 우리 식단과 가장 가까운 밑반찬, 국찌개, 밥상 그리고 손님상까지 ... 집에서 요리로 할 수 있는 모든 분야를 다루며 요리가 낯선 사람들이 가장 편하게 찾을 수 있는 요리 친구이자 조언가로 큰 사랑을 받았었다.요리책으로는 이례적으로 100만부 판매와, 그해(2005년) 히트상품으로 지정되기도 했던, ‘원시리즈’를 출간한 영진닷컴에서 새로운 요리책 ... 
											</dd>
										</dl> 
									</li>
								</ul>
								
							<ul class="swiper-slide swiper-slide-duplicate" style="width: 590px; height: 270px;">
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3796784">
												<img src="http://image.bandinlunis.com/upload/product/3796/3796784.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3796784">[정가인하]PD 고전을 탐하다</a></dt>
											<dd class="b_author">고영규 </dd>
											<dd class="mt15"><span class="rPrice">15,500원</span> → 4,000원(<strong>74%↓</strong>)</dd>
											<dd class="price">판매가 : <strong>3,600원</strong></dd>
											<dd class="t_txt">
												출판사 서평 위로 식지 않는 인문학 열풍 속, 왜 동양고전인가? 수천 년 전 동양고전에서 현재의 삶에 대한 답을 구하다! 지난해부터 고전 읽기 열풍이 이어지고 있다. 고전(古典)의 세계에 발을 담그기 위해서는 고전(苦戰)을 각오해야 함에도 불구하고 우리 사회는 왜 고전에 열광하는가. 대답은 ‘그럼에도 불구하고’에 있다. 그럼에도 불구하고 힘든 싸움을 거쳐 고전의 세계에 입문하게 되면 세상을 보는 넓은 시야를 가질 수 있기 때문이다. 이 책은 어려운 고전 읽기를 조금이나마 쉽게 접근할 수 있도록 오... 
											</dd>
										</dl> 
									</li>
								</ul></div>
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
						
						<li class="">
							<a href="/front/product/detailProduct.do?prodId=3796784">
								<img src="http://image.bandinlunis.com/upload/product/3796/3796784.jpg">
							</a>
						</li>
						
						<li class="active">
							<a href="/front/product/detailProduct.do?prodId=3835343">
								<img src="http://image.bandinlunis.com/upload/product/3835/3835343.jpg">
							</a>
						</li>
						
						<li class="">
							<a href="/front/product/detailProduct.do?prodId=3829267">
								<img src="http://image.bandinlunis.com/upload/product/3829/3829267.jpg">
							</a>
						</li>
						
						<li class="">
							<a href="/front/product/detailProduct.do?prodId=3828578">
								<img src="http://image.bandinlunis.com/upload/product/3828/3828578.jpg">
							</a>
						</li>
						
						<li class="">
							<a href="/front/product/detailProduct.do?prodId=3785561">
								<img src="http://image.bandinlunis.com/upload/product/3785/3785561.jpg">
							</a>
						</li>
						
						<li class="">
							<a href="/front/product/detailProduct.do?prodId=3835347">
								<img src="http://image.bandinlunis.com/upload/product/3835/3835347.jpg">
							</a>
						</li>
						
					</ul>
				</div>
                
				<div class="d_area_recomm" id="discountAreaRecomm">
					<h3 class="m_tit"><span>분야 별 정가인하</span></h3>		
					<a href="/front/display/discountBookList.do" class="btn_more_2014"><span>더보기</span></a>
					<div class="newBookArea">
						<div class="aw_type_box">
							<button class="aw_l" id="recommAreaLt"><span class="ns">이전</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">3</span></span></button>
							<button class="aw_r" id="recommAreaRt"><span class="ns">다음</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">3</span></span></button>
			 			</div>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 4790px; transform: translate3d(-958px, 0px, 0px); transition-duration: 0s; height: 384px;">
								<li class="swiper-slide swiper-slide-duplicate" style="width: 958px; height: 384px;">
									<ul class="d_area_list">
									
										<li>
											<div class="t_cate">[유아]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3827032">
													<img src="http://image.bandinlunis.com/upload/product/3827/3827032.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3827032">[정가인하] 1000 스티커 백과</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">12,000원</span> → 5,000원(<strong>58%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>4,500원</strong></dd>
											</dl>
										</li>
									
										<li>
											<div class="t_cate">[역사/신화/문화]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3785583">
													<img src="http://image.bandinlunis.com/upload/product/3785/3785583.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3785583">[정가인하]아프리카이야기</a></dt>
												<dd class="b_author">조제카 푸타로타</dd>
												<dd class="mt10"><span class="rPrice">19,000원</span> → 6,000원(<strong>68%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>6,000원</strong></dd>
											</dl>
										</li>
							
										<li>
											<div class="t_cate">[가정/생활/요리]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3824617">
													<img src="http://image.bandinlunis.com/upload/product/3824/3824617.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3824617">[정가인하] 루디'S 커피의 세계 세계의 커피</a></dt>
												<dd class="b_author">김재현</dd>
												<dd class="mt10"><span class="rPrice">10,000원</span> → 3,900원(<strong>61%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>3,510원</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 958px; height: 384px;">
									<ul class="d_area_list">
								
										<li>
											<div class="t_cate">[자기계발]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3793743">
													<img src="http://image.bandinlunis.com/upload/product/3298/3298392.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3793743">[정가인하]바보라도 연봉1억을 받을 수 있다</a></dt>
												<dd class="b_author">이토요시유키</dd>
												<dd class="mt10"><span class="rPrice">12,000원</span> → 6,900원(<strong>43%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>6,210원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[가정/생활/요리]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3786322">
													<img src="http://image.bandinlunis.com/upload/product/3786/3786322.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3786322">[정가인하]생활의발견</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">6,000원</span> → 2,200원(<strong>63%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>1,980원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[소설]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803029">
													<img src="http://image.bandinlunis.com/upload/product/3803/3803029.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803029">[정가인하]카라마조프 가의 형제들 전3권 세트</a></dt>
												<dd class="b_author">표도로 도스토예프스키</dd>
												<dd class="mt10"><span class="rPrice">28,000원</span> → 22,400원(<strong>20%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>20,160원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[장르소설]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3837532">
													<img src="http://image.bandinlunis.com/upload/product/3837/3837532.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3837532">[정가인하] 보이드 문</a></dt>
												<dd class="b_author">마이클 코넬리</dd>
												<dd class="mt10"><span class="rPrice">14,000원</span> → 5,900원(<strong>58%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>5,310원</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 958px; height: 384px;">
									<ul class="d_area_list">
								
										<li>
											<div class="t_cate">[유아]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3786012">
													<img src="http://image.bandinlunis.com/upload/product/3786/3786012.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3786012">[정가인하]쉿 불을 끄면 펼쳐지는 그림자 극장...</a></dt>
												<dd class="b_author">어린이문화연구회</dd>
												<dd class="mt10"><span class="rPrice">17,000원</span> → 12,000원(<strong>29%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>10,800원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[여행/취미/레저]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3786428">
													<img src="http://image.bandinlunis.com/upload/product/3786/3786428.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3786428">[정가인하]KING스도쿠-초급</a></dt>
												<dd class="b_author">스도쿠동호회</dd>
												<dd class="mt10"><span class="rPrice">8,500원</span> → 4,000원(<strong>53%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>3,600원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[외국어/사전]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3830859">
													<img src="http://image.bandinlunis.com/upload/product/3830/3830859.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3830859">[정가인하] 처음 만난 외국인과의 대화 메뉴얼</a></dt>
												<dd class="b_author">Mr. Sun</dd>
												<dd class="mt10"><span class="rPrice">12,000원</span> → 6,000원(<strong>50%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>5,400원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[유아]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3846271">
													<img src="http://image.bandinlunis.com/upload/product/3846/3846271.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3846271">[정가인하] 달님 안녕 시리즈 전4권 세트</a></dt>
												<dd class="b_author">하야시 아키코</dd>
												<dd class="mt10"><span class="rPrice">33,000원</span> → 26,000원(<strong>21%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>23,400원</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 958px; height: 384px;">
									<ul class="d_area_list">
								
										<li>
											<div class="t_cate">[유아]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3827032">
													<img src="http://image.bandinlunis.com/upload/product/3827/3827032.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3827032">[정가인하] 1000 스티커 백과</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">12,000원</span> → 5,000원(<strong>58%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>4,500원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[역사/신화/문화]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3785583">
													<img src="http://image.bandinlunis.com/upload/product/3785/3785583.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3785583">[정가인하]아프리카이야기</a></dt>
												<dd class="b_author">조제카 푸타로타</dd>
												<dd class="mt10"><span class="rPrice">19,000원</span> → 6,000원(<strong>68%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>6,000원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[가정/생활/요리]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3824617">
													<img src="http://image.bandinlunis.com/upload/product/3824/3824617.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3824617">[정가인하] 루디'S 커피의 세계 세계의 커피</a></dt>
												<dd class="b_author">김재현</dd>
												<dd class="mt10"><span class="rPrice">10,000원</span> → 3,900원(<strong>61%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>3,510원</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
															
							<li class="swiper-slide swiper-slide-duplicate" style="width: 958px; height: 384px;">
									<ul class="d_area_list">
								
										<li>
											<div class="t_cate">[자기계발]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3793743">
													<img src="http://image.bandinlunis.com/upload/product/3298/3298392.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3793743">[정가인하]바보라도 연봉1억을 받을 수 있다</a></dt>
												<dd class="b_author">이토요시유키</dd>
												<dd class="mt10"><span class="rPrice">12,000원</span> → 6,900원(<strong>43%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>6,210원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[가정/생활/요리]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3786322">
													<img src="http://image.bandinlunis.com/upload/product/3786/3786322.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3786322">[정가인하]생활의발견</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">6,000원</span> → 2,200원(<strong>63%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>1,980원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[소설]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803029">
													<img src="http://image.bandinlunis.com/upload/product/3803/3803029.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803029">[정가인하]카라마조프 가의 형제들 전3권 세트</a></dt>
												<dd class="b_author">표도로 도스토예프스키</dd>
												<dd class="mt10"><span class="rPrice">28,000원</span> → 22,400원(<strong>20%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>20,160원</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="t_cate">[장르소설]</div>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3837532">
													<img src="http://image.bandinlunis.com/upload/product/3837/3837532.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3837532">[정가인하] 보이드 문</a></dt>
												<dd class="b_author">마이클 코넬리</dd>
												<dd class="mt10"><span class="rPrice">14,000원</span> → 5,900원(<strong>58%↓</strong>)</dd>
												<dd class="price">판매가 : <strong>5,310원</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li></ul>
						</div>
						<div class="pagination"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span><span class="swiper-pagination-switch"></span><span class="swiper-pagination-switch"></span></div>
					</div>
				</div>	
				
				<div class="overflow">
					<div class="d_new_book" id="discountTemType_3">
						<h3 class="m_tit_s"><span>이 달의 정가인하도서</span></h3>
						<a href="/front/display/discountBookList.do?mdate=Y&amp;sort=sort12" class="btn_more_2014"><span>더보기</span></a>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 3930px; transform: translate3d(-655px, 0px, 0px); transition-duration: 0s; height: 219px;"><li class="swiper-slide swiper-slide-duplicate" style="width: 655px; height: 219px;">
									<ul class="d_area_list">
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3858538">
												<img src="http://image.bandinlunis.com/upload/product/3858/3858538.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3858538">[정가인하] 마이크로메이징 - 위대한 리더십을 위하여</a></dt>
											<dd class="b_author">스티븐영</dd>
											<dd class="mt10"><span class="rPrice">11,000원</span> → 3,600원(<strong>67%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
								
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3859913">
												<img src="http://image.bandinlunis.com/upload/product/3859/3859913.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3859913">[정가인하] 성공을 경영하라</a></dt>
											<dd class="b_author">로버트J.허볼드</dd>
											<dd class="mt10"><span class="rPrice">12,000원</span> → 3,600원(<strong>70%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
									</ul>
								</li>
								
								
								<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 655px; height: 219px;">
									<ul class="d_area_list">
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3878480">
												<img src="http://image.bandinlunis.com/upload/product/3878/3878480.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3878480">[정가인하] 문학소녀의 추상화랑</a></dt>
											<dd class="b_author">노무라 미즈키</dd>
											<dd class="mt10"><span class="rPrice">20,000원</span> → 10,000원(<strong>50%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>9,000원</strong></dd>
										</dl>
									</li>
								
								
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3878487">
												<img src="http://image.bandinlunis.com/upload/product/3878/3878487.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3878487">[정가인하] [정가인하]성공 창업을 위한 실전상권의 법칙</a></dt>
											<dd class="b_author">정연강</dd>
											<dd class="mt10"><span class="rPrice">4,000원</span> → 3,600원(<strong>10%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 655px; height: 219px;">
									<ul class="d_area_list">
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3878479">
												<img src="http://image.bandinlunis.com/upload/product/3878/3878479.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3878479">[정가인하] 반쪽 달이 떠오르는 하늘 ONE DAY</a></dt>
											<dd class="b_author">하시모토 츠무구</dd>
											<dd class="mt10"><span class="rPrice">13,000원</span> → 6,500원(<strong>50%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>5,850원</strong></dd>
										</dl>
									</li>
								
								
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3877770">
												<img src="http://image.bandinlunis.com/upload/product/3877/3877770.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3877770">[정가인하] 이솝이야기 2</a></dt>
											<dd class="b_author">AESOP</dd>
											<dd class="mt10"><span class="rPrice">3,800원</span> → 2,000원(<strong>47%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>1,800원</strong></dd>
										</dl>
									</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 655px; height: 219px;">
									<ul class="d_area_list">
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3875852">
												<img src="http://image.bandinlunis.com/upload/product/3875/3875852.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3875852">[정가인하] [정가인하]1대1 영문법 내비게이션</a></dt>
											<dd class="b_author">선진호</dd>
											<dd class="mt10"><span class="rPrice">5,000원</span> → 3,600원(<strong>28%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
								
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3859406">
												<img src="http://image.bandinlunis.com/upload/product/3859/3859406.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3859406">[정가인하] 행복한 학교</a></dt>
											<dd class="b_author">CLAYTON M.CHRISTENSEN</dd>
											<dd class="mt10"><span class="rPrice">13,000원</span> → 3,600원(<strong>72%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 655px; height: 219px;">
									<ul class="d_area_list">
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3858538">
												<img src="http://image.bandinlunis.com/upload/product/3858/3858538.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3858538">[정가인하] 마이크로메이징 - 위대한 리더십을 위하여</a></dt>
											<dd class="b_author">스티븐영</dd>
											<dd class="mt10"><span class="rPrice">11,000원</span> → 3,600원(<strong>67%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
								
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3859913">
												<img src="http://image.bandinlunis.com/upload/product/3859/3859913.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3859913">[정가인하] 성공을 경영하라</a></dt>
											<dd class="b_author">로버트J.허볼드</dd>
											<dd class="mt10"><span class="rPrice">12,000원</span> → 3,600원(<strong>70%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
									</ul>
								</li>
								
									
							<li class="swiper-slide swiper-slide-duplicate" style="width: 655px; height: 219px;">
									<ul class="d_area_list">
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3878480">
												<img src="http://image.bandinlunis.com/upload/product/3878/3878480.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3878480">[정가인하] 문학소녀의 추상화랑</a></dt>
											<dd class="b_author">노무라 미즈키</dd>
											<dd class="mt10"><span class="rPrice">20,000원</span> → 10,000원(<strong>50%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>9,000원</strong></dd>
										</dl>
									</li>
								
								
								
									<li>
										<div class="b_img">
											<a href="/front/product/detailProduct.do?prodId=3878487">
												<img src="http://image.bandinlunis.com/upload/product/3878/3878487.jpg" alt="">
											</a>
										</div>
										<dl>
											<dt><a href="/front/product/detailProduct.do?prodId=3878487">[정가인하] [정가인하]성공 창업을 위한 실전상권의 법칙</a></dt>
											<dd class="b_author">정연강</dd>
											<dd class="mt10"><span class="rPrice">4,000원</span> → 3,600원(<strong>10%↓</strong>)</dd>
											<dd class="price mt5">판매가 : <strong>3,240원</strong></dd>
										</dl>
									</li>
								
									</ul>
								</li></ul>
						</div>
						<div class="pagination"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span><span class="swiper-pagination-switch"></span><span class="swiper-pagination-switch"></span><span class="swiper-pagination-switch"></span></div>
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
			      			
			      			 
							 
							 
								<li><span class="num">1</span> <a href="/front/product/detailProduct.do?prodId=3803030" class="r_book">안나 카레니나 전3권 세트</a></li>
							
			      			 
							 
							 
								<li><span class="num">2</span> <a href="/front/product/detailProduct.do?prodId=3803029" class="r_book">카라마조프 가의 형제들 전3권 세...</a></li>
							
			      			 
							 
							 
								<li><span class="num">3</span> <a href="/front/product/detailProduct.do?prodId=3827032" class="r_book">1000 스티커 백과</a></li>
							
			      			 
							 
							 
								<li><span class="num">4</span> <a href="/front/product/detailProduct.do?prodId=4042071" class="r_book">요리가 간편해지는 만능육수 레시피</a></li>
							
			      			 
							 
							 
								<li><span class="num">5</span> <a href="/front/product/detailProduct.do?prodId=3846271" class="r_book">달님 안녕 시리즈 전4권 세트</a></li>
							
			      			 
							 
							 
								<li><span class="num">6</span> <a href="/front/product/detailProduct.do?prodId=3916742" class="r_book">내 마음대로 말하는 영어회화 10...</a></li>
							
			      			 
							 
							 
								<li><span class="num">7</span> <a href="/front/product/detailProduct.do?prodId=3998039" class="r_book">작은 일이라서 기도합니다</a></li>
							
			      			 
							 
							 
								<li><span class="num">8</span> <a href="/front/product/detailProduct.do?prodId=3835347" class="r_book">올 댓 피시</a></li>
							
			      			 
							 
							 
								<li><span class="num">9</span> <a href="/front/product/detailProduct.do?prodId=3940283" class="r_book">성과를 지배하는 바인더의 힘</a></li>
							
			      			 
							 
							 
								<li><span class="num">10</span> <a href="/front/product/detailProduct.do?prodId=3785695" class="r_book">새로운삶을이끄는힐링의힘</a></li>
							
			      		</ul>
						
					</div>
				</div>
				
				<div id="sortableArea" class="fl_clear">
				
				
					
				
				
				
					
				
				
				<div class="d_area_recomm" id="discountTemType_204">
					<h3 class="m_tit"><span>수입서적 특가도서</span></h3>	
					<a href="http://www.bandinlunis.com/front/product/bookCategoryMain.do?cateId=4208" class="btn_more_2014"><span>더보기</span></a>		
					<div class="newBookArea">
						<div class="aw_type_box">
							<button class="aw_l" id="discountTemLt_204"><span class="ns">이전</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">2</span></span></button>
							<button class="aw_r" id="discountTemRt_204"><span class="ns">다음</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">2</span></span></button>
						</div>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 3832px; transform: translate3d(-958px, 0px, 0px); transition-duration: 0s; height: 345px;"><li class="swiper-slide swiper-slide-duplicate" style="width: 958px; height: 345px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697824">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781484710753.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697824">Legend of the Neverbeast ...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">5,810원(30%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697821">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423171348.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697821">Doc McStuffins Read-Along...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">5,810원(30%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697819">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423151968.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697819">Cars Toons Moon Mater Rea...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7375406">
													<img src="http://image.bandinlunis.com/upload/product/201305/9781423160144.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7375406">Cars Toons : Air Mater Re...</a></dt>
												<dd class="b_author">Auerbach. Annie / Kryczko. Ted / Jerem. David</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 958px; height: 345px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697830">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423120872.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697830">The Easter Egg Hunt Read-...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697829">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781484706862.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697829">Star Wars: The Empire Str...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697828">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781484706671.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697828">Star Wars: A New Hope Rea...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697827">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423168881.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697827">Planes Read-Along Storybo...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">5,810원(30%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 958px; height: 345px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697824">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781484710753.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697824">Legend of the Neverbeast ...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">5,810원(30%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697821">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423171348.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697821">Doc McStuffins Read-Along...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">5,810원(30%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697819">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423151968.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697819">Cars Toons Moon Mater Rea...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7375406">
													<img src="http://image.bandinlunis.com/upload/product/201305/9781423160144.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7375406">Cars Toons : Air Mater Re...</a></dt>
												<dd class="b_author">Auerbach. Annie / Kryczko. Ted / Jerem. David</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
															
							<li class="swiper-slide swiper-slide-duplicate" style="width: 958px; height: 345px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697830">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423120872.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697830">The Easter Egg Hunt Read-...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697829">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781484706862.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697829">Star Wars: The Empire Str...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697828">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781484706671.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697828">Star Wars: A New Hope Rea...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">6,640원(20%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7697827">
													<img src="http://image.bandinlunis.com/upload/product/201506/9781423168881.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7697827">Planes Read-Along Storybo...</a></dt>
												<dd class="b_author">Disney</dd>
												<dd class="mt10"><span class="rPrice">8,300원</span> → <strong class="price">5,810원(30%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li></ul>
						</div>
						<div class="pagination"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span><span class="swiper-pagination-switch"></span></div>
					</div>
				</div><div class="d_area_recomm" id="discountTemType_205">
					<h3 class="m_tit"><span>망설이던 세트도서 정가인하 구매 찬스!</span></h3>	
							
					<div class="newBookArea">
						<div class="aw_type_box">
							<button class="aw_l" id="discountTemLt_205"><span class="ns">이전</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">2</span></span></button>
							<button class="aw_r" id="discountTemRt_205"><span class="ns">다음</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">2</span></span></button>
						</div>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 3832px; transform: translate3d(-958px, 0px, 0px); transition-duration: 0s; height: 361px;"><li class="swiper-slide swiper-slide-duplicate" style="width: 958px; height: 361px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3837516">
													<img src="http://image.bandinlunis.com/upload/product/3687/3687001.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3837516">[정가인하] 화폐전쟁 전 4권세트</a></dt>
												<dd class="b_author">쑹훙빙</dd>
												<dd class="mt10"><span class="rPrice">60,000원</span> → <strong class="price">54,000원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803029">
													<img src="http://image.bandinlunis.com/upload/product/3803/3803029.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803029">[정가인하]카라마조프 가의 형제들 전3권 세트</a></dt>
												<dd class="b_author">표도로 도스토예프스키</dd>
												<dd class="mt10"><span class="rPrice">22,400원</span> → <strong class="price">20,160원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803024">
													<img src="http://image.bandinlunis.com/upload/product/3718/3718840.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803024">[정가인하]삼국지 전10권 세트</a></dt>
												<dd class="b_author">이문열</dd>
												<dd class="mt10"><span class="rPrice">80,000원</span> → <strong class="price">80,000원(0%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803019">
													<img src="http://image.bandinlunis.com/upload/product/3121/3121489.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803019">[정가인하]수호지 - 전10권 SET</a></dt>
												<dd class="b_author">시내암</dd>
												<dd class="mt10"><span class="rPrice">88,000원</span> → <strong class="price">79,200원(10%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 958px; height: 361px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3859972">
													<img src="http://image.bandinlunis.com/upload/product/3843/3843063.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3859972">[정가인하] 눈물을 마시는 새 전 4권세트</a></dt>
												<dd class="b_author">이영도</dd>
												<dd class="mt10"><span class="rPrice">49,000원</span> → <strong class="price">44,100원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3859069">
													<img src="http://image.bandinlunis.com/upload/product/3685/3685392.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3859069">[정가인하] 시계마을 티키톡 영어 동화 시리즈...</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">65,000원</span> → <strong class="price">58,500원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3858840">
													<img src="http://image.bandinlunis.com/upload/product/3843/3843059.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3858840">[정가인하] 민음사 세계문학전집 F 세트 전 ...</a></dt>
												<dd class="b_author">민음사 편집부</dd>
												<dd class="mt10"><span class="rPrice">471,600원</span> → <strong class="price">424,440원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3846271">
													<img src="http://image.bandinlunis.com/upload/product/3846/3846271.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3846271">[정가인하] 달님 안녕 시리즈 전4권 세트</a></dt>
												<dd class="b_author">하야시 아키코</dd>
												<dd class="mt10"><span class="rPrice">26,000원</span> → <strong class="price">23,400원(10%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 958px; height: 361px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3837516">
													<img src="http://image.bandinlunis.com/upload/product/3687/3687001.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3837516">[정가인하] 화폐전쟁 전 4권세트</a></dt>
												<dd class="b_author">쑹훙빙</dd>
												<dd class="mt10"><span class="rPrice">60,000원</span> → <strong class="price">54,000원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803029">
													<img src="http://image.bandinlunis.com/upload/product/3803/3803029.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803029">[정가인하]카라마조프 가의 형제들 전3권 세트</a></dt>
												<dd class="b_author">표도로 도스토예프스키</dd>
												<dd class="mt10"><span class="rPrice">22,400원</span> → <strong class="price">20,160원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803024">
													<img src="http://image.bandinlunis.com/upload/product/3718/3718840.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803024">[정가인하]삼국지 전10권 세트</a></dt>
												<dd class="b_author">이문열</dd>
												<dd class="mt10"><span class="rPrice">80,000원</span> → <strong class="price">80,000원(0%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3803019">
													<img src="http://image.bandinlunis.com/upload/product/3121/3121489.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3803019">[정가인하]수호지 - 전10권 SET</a></dt>
												<dd class="b_author">시내암</dd>
												<dd class="mt10"><span class="rPrice">88,000원</span> → <strong class="price">79,200원(10%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li>
								
															
							<li class="swiper-slide swiper-slide-duplicate" style="width: 958px; height: 361px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3859972">
													<img src="http://image.bandinlunis.com/upload/product/3843/3843063.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3859972">[정가인하] 눈물을 마시는 새 전 4권세트</a></dt>
												<dd class="b_author">이영도</dd>
												<dd class="mt10"><span class="rPrice">49,000원</span> → <strong class="price">44,100원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3859069">
													<img src="http://image.bandinlunis.com/upload/product/3685/3685392.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3859069">[정가인하] 시계마을 티키톡 영어 동화 시리즈...</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">65,000원</span> → <strong class="price">58,500원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3858840">
													<img src="http://image.bandinlunis.com/upload/product/3843/3843059.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3858840">[정가인하] 민음사 세계문학전집 F 세트 전 ...</a></dt>
												<dd class="b_author">민음사 편집부</dd>
												<dd class="mt10"><span class="rPrice">471,600원</span> → <strong class="price">424,440원(10%)</strong></dd>
											</dl>
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3846271">
													<img src="http://image.bandinlunis.com/upload/product/3846/3846271.jpg" alt="">
												</a>
											</div>
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3846271">[정가인하] 달님 안녕 시리즈 전4권 세트</a></dt>
												<dd class="b_author">하야시 아키코</dd>
												<dd class="mt10"><span class="rPrice">26,000원</span> → <strong class="price">23,400원(10%)</strong></dd>
											</dl>
										</li>
								
									</ul>
								</li></ul>
						</div>
						<div class="pagination"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span><span class="swiper-pagination-switch"></span></div>
					</div>
				</div></div>
				
				<div class="d_area_recomm d_area_3div" id="discountTemType_4">
					<h3 class="m_tit_s"><span>뽀롱뽀롱 뽀로로</span></h3>	
					<a href="http://www.bandinlunis.com/front/kids/kidsShop.do?shopType=01" class="btn_more_2014"><span>더보기</span></a>	
					<div class="newBookArea">
						<div class="aw_type_box">
							<button class="aw_l" id="discountTemLt_4"><span class="ns">이전</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">2</span></span></button>
							<button class="aw_r" id="discountTemRt_4"><span class="ns">다음</span><span class="aw_count"><span class="start_index">1</span>/<span class="end_index">2</span></span></button>
			 			</div>
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 2620px; transform: translate3d(-655px, 0px, 0px); transition-duration: 0s; height: 295px;"><li class="swiper-slide swiper-slide-duplicate" style="width: 655px; height: 295px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3730076">
													<img src="http://image.bandinlunis.com/upload/product/3730/3730076.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3730076">뽀로로 붙였다 떼었다 가방스티커 놀이북 탈것</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">5,000원</span> → <strong class="price">4,500원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=2852199">
													<img src="http://image.bandinlunis.com/upload/product/2852/2852199.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=2852199">뽀로로 판퍼즐</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">5,500원</span> → <strong class="price">4,950원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3166404">
													<img src="http://image.bandinlunis.com/upload/product/3166/3166404.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3166404">뽀롱뽀롱 뽀로로 손가방 판퍼즐 (68조각)</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">6,000원</span> → <strong class="price">5,400원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
								
								<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 655px; height: 295px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3006443">
													<img src="http://image.bandinlunis.com/upload/product/3006/3006443.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3006443">뽀로로와 함께 하는 사물 한글 카드 100</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">15,000원</span> → <strong class="price">13,500원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3237089">
													<img src="http://image.bandinlunis.com/upload/product/3237/3237089.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3237089">뽀롱뽀롱 뽀로로 에듀 사운드북</a></dt>
												<dd class="b_author">키즈아이콘 편집부</dd>
												<dd class="mt10"><span class="rPrice">22,000원</span> → <strong class="price">19,800원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3812044">
													<img src="http://image.bandinlunis.com/upload/product/3812/3812044.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3812044">뽀로로 사운드 시계놀이책 일어날 시간이야 뽀로...</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">28,000원</span> → <strong class="price">22,400원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 655px; height: 295px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3730076">
													<img src="http://image.bandinlunis.com/upload/product/3730/3730076.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3730076">뽀로로 붙였다 떼었다 가방스티커 놀이북 탈것</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">5,000원</span> → <strong class="price">4,500원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=2852199">
													<img src="http://image.bandinlunis.com/upload/product/2852/2852199.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=2852199">뽀로로 판퍼즐</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">5,500원</span> → <strong class="price">4,950원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3166404">
													<img src="http://image.bandinlunis.com/upload/product/3166/3166404.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3166404">뽀롱뽀롱 뽀로로 손가방 판퍼즐 (68조각)</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">6,000원</span> → <strong class="price">5,400원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
															
							<li class="swiper-slide swiper-slide-duplicate" style="width: 655px; height: 295px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3006443">
													<img src="http://image.bandinlunis.com/upload/product/3006/3006443.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3006443">뽀로로와 함께 하는 사물 한글 카드 100</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">15,000원</span> → <strong class="price">13,500원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3237089">
													<img src="http://image.bandinlunis.com/upload/product/3237/3237089.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3237089">뽀롱뽀롱 뽀로로 에듀 사운드북</a></dt>
												<dd class="b_author">키즈아이콘 편집부</dd>
												<dd class="mt10"><span class="rPrice">22,000원</span> → <strong class="price">19,800원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=3812044">
													<img src="http://image.bandinlunis.com/upload/product/3812/3812044.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=3812044">뽀로로 사운드 시계놀이책 일어날 시간이야 뽀로...</a></dt>
												<dd class="b_author">편집부</dd>
												<dd class="mt10"><span class="rPrice">28,000원</span> → <strong class="price">22,400원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li></ul>
						</div>
						<div class="pagination"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span><span class="swiper-pagination-switch"></span></div>
					</div>
				</div>	
				<div class="d_tem_row">
					<h3 class="m_tit_s"><span>추천 e-book</span></h3>
					<a href="http://www.bandinlunis.com/front/product/eBookCategoryMain.do?listType=down" class="btn_more_2014"><span>더보기</span></a>
					<div class="newBookArea" id="discountTemType_5">
						<div class="swiper-container">
							<ul class="swiper-wrapper" style="width: 1440px; transform: translate3d(-288px, 0px, 0px); transition-duration: 0s; height: 298px;"><li class="swiper-slide swiper-slide-duplicate" style="width: 288px; height: 298px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7530302">
													<img src="http://image.bandinlunis.com/upload/product/7530/7530302.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7530302">뒤랑 시리즈 세트(1~5)</a></dt>
												<dd class="b_author">안드레아스 프란츠</dd>
												<dd class="mt10"><span class="rPrice">25,000원</span> → <strong class="price">25,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7642466">
													<img src="http://image.bandinlunis.com/upload/product/7642/7642466.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7642466">[세트] 바로 쓸수있는 일상회화표현 핸드북 (...</a></dt>
												<dd class="b_author">LINK BOOK 교재개발팀</dd>
												<dd class="mt10"><span class="rPrice">6,000원</span> → <strong class="price">6,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
								
								<li class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 288px; height: 298px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7699422">
													<img src="http://image.bandinlunis.com/upload/product/7699/7699422.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7699422">[고화질세트] 박경리 원작 만화 토지 (전17...</a></dt>
												<dd class="b_author">박경리원작, 오세영 글, 박명운 그림</dd>
												<dd class="mt10"><span class="rPrice">85,000원</span> → <strong class="price">85,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7689141">
													<img src="http://image.bandinlunis.com/upload/product/7689/7689141.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7689141">[세트] 절대지식 시리즈 (전4권)</a></dt>
												<dd class="b_author">사사키 다케시 외</dd>
												<dd class="mt10"><span class="rPrice">25,000원</span> → <strong class="price">25,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 288px; height: 298px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7657040">
													<img src="http://image.bandinlunis.com/upload/product/7657/7657040.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7657040">[세트] 꼭 읽어야 할 한국 대표 소설 11-...</a></dt>
												<dd class="b_author">지하련</dd>
												<dd class="mt10"><span class="rPrice">3,000원</span> → <strong class="price">2,700원(10%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7642463">
													<img src="http://image.bandinlunis.com/upload/product/7642/7642463.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7642463">[세트] 바로talk 여행 외국어 (전5권)</a></dt>
												<dd class="b_author">LINK BOOK 교재개발팀</dd>
												<dd class="mt10"><span class="rPrice">9,800원</span> → <strong class="price">9,800원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
								
								
								<li class="swiper-slide" style="width: 288px; height: 298px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7530302">
													<img src="http://image.bandinlunis.com/upload/product/7530/7530302.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7530302">뒤랑 시리즈 세트(1~5)</a></dt>
												<dd class="b_author">안드레아스 프란츠</dd>
												<dd class="mt10"><span class="rPrice">25,000원</span> → <strong class="price">25,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7642466">
													<img src="http://image.bandinlunis.com/upload/product/7642/7642466.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7642466">[세트] 바로 쓸수있는 일상회화표현 핸드북 (...</a></dt>
												<dd class="b_author">LINK BOOK 교재개발팀</dd>
												<dd class="mt10"><span class="rPrice">6,000원</span> → <strong class="price">6,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li>
								
															
							<li class="swiper-slide swiper-slide-duplicate" style="width: 288px; height: 298px;">
									<ul class="d_area_list">
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7699422">
													<img src="http://image.bandinlunis.com/upload/product/7699/7699422.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7699422">[고화질세트] 박경리 원작 만화 토지 (전17...</a></dt>
												<dd class="b_author">박경리원작, 오세영 글, 박명운 그림</dd>
												<dd class="mt10"><span class="rPrice">85,000원</span> → <strong class="price">85,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
								
								
										<li>
											<div class="b_img">
												<a href="/front/product/detailProduct.do?prodId=7689141">
													<img src="http://image.bandinlunis.com/upload/product/7689/7689141.jpg" alt="">
												</a>
											</div>
											
											<dl>
												<dt><a href="/front/product/detailProduct.do?prodId=7689141">[세트] 절대지식 시리즈 (전4권)</a></dt>
												<dd class="b_author">사사키 다케시 외</dd>
												<dd class="mt10"><span class="rPrice">25,000원</span> → <strong class="price">25,000원(0%)</strong></dd>
											</dl>
											
											
										</li>
								
									</ul>
								</li></ul>
						</div>
						<div class="pagination"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span><span class="swiper-pagination-switch"></span><span class="swiper-pagination-switch"></span></div>
						<div class="aw_type_num">
							
							<span class="on">1</span>
							
							<span>2</span>
							
							<span>3</span>
							
						</div>
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