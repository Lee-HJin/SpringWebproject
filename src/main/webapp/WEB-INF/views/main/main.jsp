<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<%=cp%>/resources/css/main.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resources/css/swiper_min.css">

<title>Insert title here</title>
<script type="text/javascript">
	
	function toggleDisplay(num){
	    var con = document.getElementById("layer"+num);
 	     if(con.style.display=='none'){
	        con.style.display = 'block';
	    }else{
	        con.style.display = 'none'; 
	    }
	}
	


</script>
</head>
<body>
<div id="head">
	<div id="wrap">
		<div class="head_wrap">
			<div class="head">
				<h1 class="logo">
					<a href="<%=cp%>/main.action">
						<img alt="" src="<%=cp%>/resources/image/main/logo_2014_top.gif">
					</a>
				</h1>
			</div>
		</div>
	</div>
	
	<div class="wrap_header">
		<div class="header_menu">
			<ul class="menu_wrap">
				<li class="menu">			
					<a href="javascript://" class="menu_link menu_total" 
					onmouseover="javascript:toggleDisplay('01')" onmouseout="javascript:toggleDisplay('01')">
					<%-- <img alt="" src="<%=cp%>/resources/image/sp_gnb_menu1.png"> --%>
						<span></span>
					</a>
					
					<div id="layer01" class="display_wrap display_total" style="display: none;"
					onmouseover="javascript:toggleDisplay('01')" onmouseout="javascript:toggleDisplay('01')">
						<div class="cate01">
							<h3><a href="<%=cp %>/main.action">도서</a></h3>
							<ul class="cate_list">
								<li><em>소설</em></li>
								<li><em>장르소설</em></li>
								<li>시/에세이/기행</li>
								<li>청소년교양</li>
								<li>경제/경영</li>
								<li><em>자기계발</em></li>
							</ul>
							
							<ul class="cate_list">
								<li>유아</li>
								<li>육아/자녀교육</li>
								<li>어린이</li>
								<li>어린이영어</li>
								<li>아동전집</li>
								<li>정가제 Free</li>
							</ul>
							
							<ul class="cate_list">
								<li>가정/생활/요리</li>
								<li>건강/의학/미용</li>
								<li>여행/취미/레저</li>
								<li>잡기</li>
								<li>만화</li>
							</ul>
							
							<ul class="cate_list clear">
								<li><em>인문/교양/철학</em></li>
								<li>역사/신화/문화</li>
								<li>종교</li>
								<li>사회/정치/법률</li>
								<li>예술/대중문화</li>
								<li>자연과학/공학</li>
							</ul>
							
							<ul class="cate_list">
								<li><em>초등참고서</em></li>
								<li><em>중/고등참고서</em></li>
								<li>&nbsp;</li>
								<li><em>외국어/사전</em></li>
								<li>대학교재</li>
								<li>컴퓨터/IT</li>
							</ul>
							
							<ul class="cate_list">
								<li>서양서</li>
								<li>일본서</li>
							</ul>
						</div>
						<div class="cate02">
							<h3><a href="<%=cp %>/main.action">키즈샵</a></h3>
							<ul class="cate_list">
								<li><em>유아</em></li>
								<li>어린이</li>
								<li>유아동전집</li>
							</ul>
							
							<ul class="cate_list">
								<li>유아/자녀교육</li>
								<li>임신/출산/태교</li>
								<li>교구완구</li>
							</ul>
							
							<ul class="cate_list">
								<li><em>초등참고서</em></li>
								<li>어린이 영어</li>
								<li>교구완구</li>
							</ul>
						</div>	
						<div class="cate03">
							<h3><a href="<%=cp %>/main.action">수험서</a></h3>
							<ul class="cate_list">
								<li>공무원</li>
								<li>국가고시</li>
								<li>임용시험</li>
								<li>대기업/공기업/면접</li>
								<li>대표저자수험서</li>
							</ul>
							
							<ul class="cate_list">
								<li>국가기술자격증</li>
								<li>국가전문자격증</li>
								<li>민간전문자격증</li>
								<li>외국자격증</li>
							</ul>
							
							<ul class="cate_list">
								<li>편입/진학/전문대학원</li>
								<li>공부법/안내서</li>
							</ul>
						</div>
						<span></span>
					</div>	
				</li>
				
				<li class="menu">
					<a href="javascript://" class="menu_link menu_book" 
					onmouseover="javascript:toggleDisplay('02')" onmouseout="javascript:toggleDisplay('02')">
						<span></span>
					</a>
					
					<div id="layer02" class="display_wrap display_book" style="display: none;"
					onmouseover="javascript:toggleDisplay('02')" onmouseout="javascript:toggleDisplay('02')">
						<div class="cate_book01">
							<h3><a href="<%=cp %>/main.action">도서</a></h3>
							<div class="cate_menu">
								<ul>
									<li>베스트셀러</li>
									<li>새로나온 책</li>
									<li>주간 탑클릭</li>
									<li>정가인하도서</li>
									<li>오늘의 책</li>
									<li>이달의 추천책</li>
									<li>미디어 추천책</li>
									<li class="gap">작가 프로필</li>
									<li>이벤트</li>
									<li class="gap">북셀프안내</li>
									<li>대량주문 안내</li>
									<li>반디e캐쉬안내</li>
								</ul>
							</div>
							<div class="cate_list_wrap">
								<ul class="cate_list">
									<li><em>소설</em></li>
									<li><em>장르소설</em></li>
									<li><em>시/에세이/기행</em></li>
									<li>청소년교양</li>
									<li>경제/경영</li>
									<li><em>자기계발</em></li>
								</ul>
								<ul class="cate_list">
									<li>유아</li>
									<li>육아/자녀교육</li>
									<li><em>어린이</em></li>
									<li>어린이영어</li>
									<li>아동전집</li>
									<li>정가제 Free</li>
								</ul>
								<ul class="cate_list">
									<li>가정/생활/요리</li>
									<li>건강/의학/미용</li>
									<li>여행/취미/레저</li>
									<li>잡지</li>
									<li>만화</li>
								</ul>
								<ul class="cate_list clear">
									<li><em>인문/교양/철학</em></li>
									<li>역사/신화/문화</li>
									<li>종교</li>
									<li>사회/정치/법률</li>
									<li>예술/대중문화</li>
									<li>자연과학/공학</li>
								</ul>
								<ul class="cate_list">
									<li><em>초등참고서</em></li>
									<li><em>중/고등참고서</em></li>
									<li>&nbsp;</li>
									<li><em>외국어/사전</em></li>
									<li>대학교재</li>
									<li>컴퓨터/IT</li>
								</ul>
								<ul class="cate_list">
									<li>서양서</li>
									<li>일본서</li>
								</ul>
							</div>
						</div>
						<div class="cate_book02">
							<h3><a href="<%=cp %>/main.action">수험서</a></h3>
							<div class="cate_list_wrap cate_exam">
								<ul class="cate_list exam">
									<li><em>공무원</em></li>
									<li>국가고시</li>
									<li>임용시험</li>
									<li><em>대기업/공기업/면접</em></li>
									<li>대표저자수험서</li>
								</ul>
								<ul class="cate_list">
									<li>국가기술자격증</li>
									<li>국가전문자격증</li>
									<li>민간전문자격증</li>
									<li>외국자격증</li>
								</ul>
								<ul class="cate_list exam clear">
									<li>편입/진학/전문대학원</li>
									<li>공부법/안내서</li>
								</ul>
							</div>
						</div>
						<span></span>
					</div>
				</li>
				<li class="menu">
					<a href="javascript://" class="menu_link menu_best">
						<span></span>
					</a>
				</li>
				<li class="menu">
					<a href="javascript://" class="menu_link menu_new">
						<span></span>
					</a>
				</li>
				<li class="menu">
					<a href="javascript://" class="menu_link menu_sale">
						<span></span>
					</a>
				</li>
			</ul>	
		</div>
	</div>
</div>

<div id="body">
	
	<div class="swiper-container swiper1">
   		<div class="swiper-wrapper">
     		<div class="swiper-slide">
     			<a href="javascript://"><img src="<%=cp%>/resources/image/main/box1.jpg"></a>
     		</div>
     		<div class="swiper-slide">
     			<ul>
     				<li class="s_box03">
     					<a href="javascript://"><img src="<%=cp%>/resources/image/main/box3_1.jpg"></a>
     				</li>
     				<li class="s_box03">
     					<a href="javascript://"><img src="<%=cp%>/resources/image/main/box3_2.jpg"></a>
     				</li>
     				<li class="s_box03 alt">
     					<a href="javascript://"><img src="<%=cp%>/resources/image/main/box3_3.jpg"></a>
     				</li>
     			</ul>
     		</div>
     	</div>
     	
     	<div class="swiper-pagination"></div>

	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
    </div>

</div>

<div id="body" style="width: 1100px;height: 145px;margin: 0 auto;position: relative;clear: both; background-color: #fff">
	<ul class="mini_banner">
		<li id="mini_bn01">
			<div class="swiper-container bn_swiper1">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner01.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner02.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner03.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner04.jpg"></a>
					</div>
				</div>
				
				<div class="arrow_box">
					<span class="arrow_count"></span>
					<button class="ban_awN"></button>
					<button class="ban_awP"></button>
				</div>
				
			</div>
		</li>
		<li id="mini_bn01">
			<div class="swiper-container bn_swiper2">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner2_01.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner2_02.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner2_03.jpg"></a>
					</div>
				</div>
				
				<div class="arrow_box">
					<span class="arrow_count"></span>
					<button class="ban_awN"></button>
					<button class="ban_awP"></button>
				</div>
			</div>
		</li>
		<li id="mini_bn01">
			<div class="swiper-container bn_swiper3">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner3_01.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner3_02.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner3_03.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner3_04.jpg"></a>
					</div>
					<div class="swiper-slide">
						<a href="javascript://"><img src="<%=cp%>/resources/image/main/banner3_05.jpg"></a>
					</div>
				</div>
				
				<div class="arrow_box">
					<span class="arrow_count"></span>
					<button class="ban_awN"></button>
					<button class="ban_awP"></button>
				</div>
			</div>
		</li>
	</ul>
	
	
	
   	<script src="<%=cp%>/resources/js/swiper_min.js"></script>
	


	<script type="text/javascript">
	
	var swiper = new Swiper('.swiper1', {
	    spaceBetween: 0,
	    centeredSlides: true,
	    autoplay: {
	      delay: 5000,
	      disableOnInteraction: false,
	    },loop: true,
	    pagination: {
	      el: '.swiper-pagination',
	      clickable: true,
	    },
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	  }); 
	
	var swiper = new Swiper('.bn_swiper1', {
	    spaceBetween: 0,
	    centeredSlides: true,
	    loop: true,
	    pagination: {
	        el: '.arrow_count',
	        type: 'fraction',
	      },
	    navigation: {
	      nextEl: '.ban_awP',
	      prevEl: '.ban_awN',
	    },
	  });
	
	var swiper = new Swiper('.bn_swiper2', {
	    spaceBetween: 0,
	    centeredSlides: true,
	    loop: true,
	    pagination: {
	        el: '.arrow_count',
	        type: 'fraction',
	      },
	    navigation: {
		      nextEl: '.ban_awP',
		      prevEl: '.ban_awN',
	    },
	  }); 
	
	var swiper = new Swiper('.bn_swiper3', {
	    spaceBetween: 0,
	    centeredSlides: true,
	    loop: true,
	    pagination: {
	        el: '.arrow_count',
	        type: 'fraction',
	      },
	    navigation: {
		      nextEl: '.ban_awP',
		      prevEl: '.ban_awN',
	    },
	  }); 
	
	</script>
</div>





<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>