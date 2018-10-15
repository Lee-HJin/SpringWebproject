<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	function toggleDisplay2(num){
	    var con = document.getElementById("top_layer"+num);
 	     if(con.style.display=='none'){
	        con.style.display = 'block';
	    }else{
	        con.style.display = 'none'; 
	    }
	}
	


</script>
</head>
<body style="margin: 0;">
<div id="head">
	<div id="top_wrap">
		<div class="head_top">
			<h1 class="logo">
				<a href="<%=cp%>/main.action">
					<img alt="" src="<%=cp%>/resources/image/main/logo_2014_top.gif">
				</a>
			</h1>
			<div class="top_menu">
				<ul class="t_menu_list">
					<li class="t_menu login">
						<a href="javascript://" class="t_menu_link btn_login">로그인</a>
					</li>
					<li class="t_menu join">
						<a href="javascript://" class="t_menu_link">회원가입</a>
					</li>
					<li class="t_menu">
						<a href="javascript://" class="t_menu_link">쇼핑카트</a>
						
					</li>
					<li class="t_menu myShopping">
						<a href="javascript://" class="t_menu_link" 
						onmouseover="javascript:toggleDisplay2('01')" onmouseout="javascript:toggleDisplay2('01')">
						나의쇼핑</a>
						<div id="top_layer01" class="display_top"  style="display: none; width: 90px;"
						onmouseover="javascript:toggleDisplay2('01')" onmouseout="javascript:toggleDisplay2('01')">
							<div style="margin-top: 5px;">
								<a href="javascript://">나의쇼핑정보</a>
							</div>
							<div>
								<a href="javascript://">주문배송조회</a>
							</div>
							<div>
								<a href="javascript://">적립내역</a>
							</div>
							<div>
								<a href="javascript://">구매히스토리</a>
							</div>
							<div>
								<a href="javascript://">위시리스트</a>
							</div>
							<div>
								<a href="javascript://">회원정보</a>
							</div>
						</div>
					</li>
					<li class="t_menu">
						<a href="javascript://" class="t_menu_link">고객센터</a>
					</li>
					<li class="t_menu store">
						<a href="javascript://" class="t_menu_link"
						onmouseover="javascript:toggleDisplay2('02')" onmouseout="javascript:toggleDisplay2('02')">
						영업점안내</a>
						<div id="top_layer02" class="display_top"  style="display: none; width: 130px;"
						onmouseover="javascript:toggleDisplay2('02')" onmouseout="javascript:toggleDisplay2('02')">
							<div style="margin-top: 5px;">
								<a href="javascript://">신세계강남점</a>
							</div>
							<div>
								<a href="javascript://">신세계센텀시티점(부산)</a>
							</div>
							<div>
								<a href="javascript://">롯데월드몰점</a>
							</div>
							<div>
								<a href="javascript://">여의도신영증권점</a>
							</div>
							<div>
								<a href="javascript://">대구신세계점</a>
							</div>
							<div>
								<a href="javascript://">롯데몰수원점</a>
							</div>
							<div>
								<a href="javascript://">신세계김해점</a>
							</div>
							<div>
								<a href="javascript://">롯데스타시티점</a>
							</div>
							<div>
								<a href="javascript://">신림역점</a>
							</div>
							<div>
								<a href="javascript://">사당역점</a>
							</div>
							<div>
								<a href="javascript://">목동점</a>
							</div>
							<div>
								<a href="javascript://">롯데피트인산본점</a>
							</div>
							<div>
								<a href="javascript://">롯데울산점</a>
							</div>
						</div>
					</li>
				</ul>
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

<div class="body_section">
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
		
		<div class="b_content_wrap1">
			<div class="today_book">
				<div class="b_tit"></div>
				<div class="arrow_box">
					<button class="slide_aw left" id="slide_awL">
						<span class="aw_count_sl"></span>
					</button>	
					<button class="slide_aw right" id="slide_awR">
						<span class="aw_count_sl"></span>
					</button>
				</div>
				<div class="swiper-container swiper2">
					<div class="swiper-wrapper" 
					style="width: 3345px; height: 358px; transform: translate3d(-2676px, 0px, 0px); transition-duration: 0.3s;">
						<div class="swiper-slide one_b">
							<div class="b_wrap">
								<div class="b_img">
									<a href="javascript://">
									<!-- db구축 후에 db에서 데이터 꺼내와야함 -->
										<img src="/webproject/resources/image/main/today_book1.jpg">
									</a>
								</div>
								<dl>
									<dt>
										<a href="javascript://">
											오늘처럼 내가 싫었던 날은 없다
										</a>
									</dt>
									<dd class="author">글배우</dd>
									<dd class="b_intro">베스트셀러 ≪아무것도 아닌 지금은 없다≫ 저자 글배우가 들려주는 마음 수업. 오늘날 현대인의 고민에 그 누구보다 깊이 공감하는 카운슬러인 글배우는 3년 간 5천 명이 넘는 사람들을 만나 그들의 고민을 듣고 이야기를 나눴다. 이 책은 저자의 다년간의 고민 상담 경험을 바탕으로 일, 연애, 사랑, 인간관계, 꿈 등 누구나 마음속에 가지고 있는 고민과 걱정들을 어루만지는 공감 어린 글과 ‘내가 원하는 나’를 만들어나갈 수 있는 56개의 구체적인 방법을 알려준다. 자존감이 낮은 사람에게 ‘나를…</dd>
<%-- 									<c:choose>
										<c:when test="${fn:length(dto.movie_name)>10 }">
											<c:out value="${fn:substring(dto.movie_name,0,8) }"/>…
										</c:when>
										<c:otherwise>
											<c:out value="${dto.movie_name }"></c:out>
										</c:otherwise>
									</c:choose> --%>
								</dl>
							</div>							
						</div>
						<div class="swiper-slide">
							<ul class="b_wrap2">
								<li>
									<div class="b_img">
										<a href="javascript://">
											<img src="/webproject/resources/image/main/today_book2.jpg">
										</a>
									</div>
									<dl>
										<dt>
											<a href="javascript://">나는 회사 다니면서 공부하기…</a>
										</dt>
										<dd>『나는 회사 다니면서 공부하기로 했다』에서는 회사를 다니면서 공부를 병행해 합격률이 한 자릿수인 자격증들을 혼자, 단기간에 쟁취한 공부법의 정수를 담고 있다…</dd>
									</dl>
								</li>
								<li>
									<div class="b_img">
										<a href="javascript://">
											<img src="/webproject/resources/image/main/today_book3.jpg">
										</a>
									</div>
									<dl>
										<dt>
											<a href="javascript://">명견만리- 정치,생애,직업,탐구편</a>
										</dt>
										<dd>향후 인류에게 가장 중요한 문제들에 관해 새로운 담론을 제기하며 충격을 던졌던 〈명견만리〉. 인구쇼크, 교육, 기술 등 소수 엘리트 집단이 독점해오던 이슈들을 대중의 장으로…</dd>
									</dl>
								</li>
							</ul>	
						</div>
						<div class="swiper-slide">
							<ul class="b_wrap2">
								<li>
									<div class="b_img">
										<a href="javascript://">
											<img src="/webproject/resources/image/main/today_book4.jpg">
										</a>
									</div>
									<dl>
										<dt>
											<a href="javascript://">곁에 남아 있는 사람</a>
										</dt>
										<dd>복잡한 마음을 품고 살아가는 이들을 기록하고 싶었다는 그는 일곱 편의 단편소설에 등장하는 인물들을 통해 “자신의 인생에서 진정으로 소중한 것이 무엇인가를 성찰하고…</dd>
									</dl>
								</li>
								<li>
									<div class="b_img">
										<a href="javascript://">
											<img src="/webproject/resources/image/main/today_book5.jpg">
										</a>
									</div>
									<dl>
										<dt>
											<a href="javascript://">하마터면 열심히 살 뻔했다</a>
										</dt>
										<dd>“한 번쯤은 이렇게 살아보고 싶었다. 애쓰지 않고 흘러가는 대로. 어디로 흘러가는지 모르지만, 즐거운 마음으로 둥둥!”이라고 했던 그의 다짐처럼 우리도 인생의 파도에…</dd>
									</dl>
								</li>
							</ul>	
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
		
	   	
	</div>
	
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
	
	var swiper = new Swiper('.swiper2', {
	    spaceBetween: 0,
	    centeredSlides: true,
	    loop: true,
	    pagination: {
	        el: '.aw_count_sl',
	        type: 'fraction',
	      },
	    navigation: {
	      nextEl: '#slide_awR',
	      prevEl: '#slide_awL',
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