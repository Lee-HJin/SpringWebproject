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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	
	function hoverImg(num) {
		
		var img = document.getElementById("link_img"+num).src;
 		var link = document.getElementById("img_link"+num).href;
		
		document.getElementById("bs_link").href = link;
		document.getElementById("bs_img").src = img;
	}
	
	


	

</script>
</head>
<body style="margin: 0;">
<jsp:include page="./header.jsp" flush="false"/>




<div id="body">
	
	<div class="swiper-container swiper1">
   		<div class="swiper-wrapper">
     		<div class="swiper-slide">
     			<a href="javascript://"><img src="<%=cp%>/resources/image/main/box1_1.jpg"></a>
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
     		<div class="swiper-slide">
     			<a href="javascript://"><img src="<%=cp%>/resources/image/main/box1_2.jpg"></a>
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
	</div>
		
	<div class="b_content_wrap1" style="overflow: hidden;">
		<div class="today_book">
			<div class="b_tit tit_book"></div>
			<div class="b_arrow_box">
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
		<div class="best_seller">
			<div class="b_tit">
				<span>베스트셀러</span>
			</div>
			<div class="bs_area">
				<div class="rank_wrap">
					<ul class="rank_list">
						<li><!-- foreach로 데이터 돌린다 -->
							<span class="list_n">1</span>
							<a id="img_link0" class="list_title" href="javascript://00" onmouseover="hoverImg('0')">죽고싶지만 떡볶이는 먹고…
							<img id="link_img0" src="<%=cp%>/resources/image/main/4181047.jpg" style="display: none;"></a>
						</li>
						<li>
							<span class="list_n">2</span>
							<a id="img_link1" class="list_title" href="<%=cp %>/main.action" onmouseover="hoverImg('1')">돌이킬 수 없는 약속
							<img id="link_img1" src="<%=cp%>/resources/image/main/4034224.jpg" style="display: none;"></a>
						</li>
						<li>
							<span class="list_n">3</span>
							<a href="javascript://" class="list_title">초격차</a>
						</li>
						<li>
							<span class="list_n">4</span>
							<a href="javascript://" class="list_title">골든 아워 1</a>
						</li>
						<li>
							<span class="list_n">5</span>
							<a href="javascript://" class="list_title">인생 우화</a>
						</li>
						<li>
							<span class="list_n">6</span>
							<a href="javascript://" class="list_title">뼈있는 아무말 대잔치</a>
						</li>
						<li>
							<span class="list_n">7</span>
							<a href="javascript://" class="list_title">언어의 온도[100만부 돌…</a>
						</li>
						<li>
							<span class="list_n">8</span>
							<a href="javascript://" class="list_title">열두 발자국</a>
						</li>
						<li>
							<span class="list_n">9</span>
							<a href="javascript://" class="list_title">고양이 1</a>
						</li>
						<li>
							<span class="list_n">10</span>
							<a href="javascript://" class="list_title">죄의 목소리</a>
						</li>
					</ul>
					<a class="more_link" href="javascript://"></a>
				</div>
				<div class="bs_image">
					<a id="bs_link" href="javascript://">
						<img id="bs_img" src="<%=cp%>/resources/image/main/4181047.jpg">
					</a>
				</div>
			</div>	
		</div>
		<div class="recommend_book">
			<div class="rc_title">
				<h4>
					<span>추천도서</span>
					&nbsp;&nbsp;오늘 조회 하신 상품과 유사한 속성을 지닌 상품을 추천합니다.
				</h4>
				<div class="rc_title_aw"></div>
			</div>
			<div class="rc_body">
				<div>
					<div class="recent_book">
						<div class="rb_awbox">
							<button class="slide_aw left" id="rb_awL">
								<span class="aw_count_rb"></span>
							</button>	
							<button class="slide_aw right" id="rb_awR">
								<span class="aw_count_rb"></span>
							</button>
						</div>
						<h4>오늘본 상품</h4>
						<div class="swiper-container swiper3">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="rb_image">
										<a href="javascript://">
											<img src="<%=cp%>/resources/image/main/4202644.jpg">
										</a>
										<dl class="rb_title">
											<dt>설거지 누가 할래</dt>
											<dd>야먀우치 마리코</dd>
										</dl>
									</div>
								</div>
								<div class="swiper-slide">
									<div class="rb_image">
										<a href="javascript://">
											<img src="<%=cp%>/resources/image/main/4198240.jpg">
										</a>
										<dl class="rb_title">
											<dt>미키는 늘 너의 이…</dt>
											<dd>미키 마우스</dd>
										</dl>
									</div>	
								</div>
							</div>
						</div>
					</div>
					<button class="rc_btn"></button>
					<div class="rc_books">
						<h4>최근 본 도서와 유사한 분야 또는 주제를 다룬 도서</h4>
						<ul class="rc_books_list">
							<li>
								<div class="rb_image">
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/3983105.jpg">
									</a>
									<dl class="rb_title">
										<dt>언어의 온도[100…</dt>
										<dd>이기주</dd>
									</dl>
								</div>
							</li>
							<li>
								<div class="rb_image">
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/4201046.jpg">
									</a>
									<dl class="rb_title">
										<dt>골든아워 2</dt>
										<dd>이국종</dd>
									</dl>
								</div>
							</li>
							<li>
								<div class="rb_image">
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/4200595.jpg">
									</a>
									<dl class="rb_title">
										<dt>참 잘했어요</dt>
										<dd>박광수</dd>
									</dl>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="new_book">
			<h3 class="nb_title"></h3>
			<ul class="nb_tab_menu">
				<li>
					<a href="javascript://">전체</a>
				</li>
				<li>
					<a href="javascript://">소설</a>
				</li>
				<li>
					<a href="javascript://">인문/교양/철학</a>
				</li>
				<li>
					<a href="javascript://">시/에세이/기행</a>
				</li>
				<li>
					<a href="javascript://">사회/정치/법률</a>
				</li>
				<li>
					<a href="javascript://">경제/경영</a>
				</li>
				<li>
					<a href="javascript://">자기계발</a>
				</li>
				<li>
					<a href="javascript://">가정/생활/요리</a>
				</li>
				<li>
					<a href="javascript://">여행/취미/레저</a>
				</li>
			</ul>
			<div class="nb_list1">
				<div class="b_arrow_box">
					<button class="slide_aw left" id="nb_awL">
						<span class="aw_count_nb"></span>
					</button>	
					<button class="slide_aw right" id="nb_awR">
						<span class="aw_count_nb"></span>
					</button>
				</div>
				<div class="swiper-container swiper4">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4203179.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
							 	<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4202644.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
							<a href="javascript://">
								<img src="<%=cp%>/resources/image/main/4201858.jpg">
							</a>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4203116.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>	
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4201995.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4202623.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide first">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4200746.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>	
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4203203.jpg">
								</a>
								<dl class="rb_title">
									<dt>열 살, 변하기 시작한 아들에게 해서는 안...</dt>
									<dd>오야노 메구미</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4198414.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>	
						</div>
						<div class="swiper-slide">
							<div class="wrap_b_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4192753.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="issue_book">
			<h3 class="ib_title"></h3>
			<h4 class="ib_subtitle">도대체 행복이 뭐에요?</h4>
			<div class="ib_list">
				<div class="b_arrow_box">
					<button class="slide_aw left" id="ib_awL">
						<span class="aw_count_ib"></span>
					</button>	
					<button class="slide_aw right" id="ib_awR">
						<span class="aw_count_ib"></span>
					</button>
				</div>
				<div class="swiper-container swiper5">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/3785296.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/3054578.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4106911.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4200744.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4198136.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4197660.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4194760.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4191313.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="wrap_ib_img">
								<a href="javascript://">
									<img src="<%=cp%>/resources/image/main/4189057.jpg">
								</a>
								<dl class="rb_title">
									<dt>설거지 누가 할래</dt>
									<dd>야먀우치 마리코</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="theme_book">
		<div class="b_arrow_box">
			<button class="slide_aw left" id="tb_awL">
				<span class="aw_count_tb"></span>
			</button>	
			<button class="slide_aw right" id="tb_awR">
				<span class="aw_count_tb"></span>
			</button>
		</div>
		<div class="swiper-container swiper6">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<h3 class="tb_title">< CEO의 자격 > 진정한 리더의 자격</h3>
					<ul class="tb_list">
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
					</ul>
				</div>
				<div class="swiper-slide">
					<h3 class="tb_title">< 주말 여행> 주말에 떠나보자</h3>
					<ul class="tb_list">
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
					</ul>
				</div>
				<div class="swiper-slide">
					<h3 class="tb_title"><직장인> 직장인으로 살아간다는것</h3>
					<ul class="tb_list">
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
						<li>
							<div class="tb_img">
								<a>
									<img src="<%=cp%>/resources/image/main/4191050.jpg">
								</a>
							</div>
							<dl class="rb_title">
								<dt>설거지 누가 할래</dt>
								<dd>야먀우치 마리코</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="sale_book">
		<h3 class="sb_title"></h3>
		<a class="more_link" href="javascript://"></a>
		<ul class="sb_list">
			<li>
				<div class="sb_img">
					<a href="javascript://">
						<img src="<%=cp%>/resources/image/main/3827032.jpg">
					</a>						
				</div>
				<dl>
					<dt>
						<a href="javascript://">[정가인하] 1000 스티커 백과</a>
					</dt>
					<dd class="sb_author">편집부</dd>
					<dd class="sb_price">재정가 : 5,000원</dd>
					<dd class="sb_reprice">판매가 : 4,500원</dd>
				</dl>
			</li>
			<li>
				<div class="sb_img">
					<a href="javascript://">
						<img src="<%=cp%>/resources/image/main/3803030.jpg">
					</a>						
				</div>
				<dl>
					<dt>
						<a href="javascript://">[정가인하] 안나 카레니나 전3권 세트</a>
					</dt>
					<dd class="sb_author">레프 니콜라예비치 톨스토이</dd>
					<dd class="sb_price">재정가 : 30,800원</dd>
					<dd class="sb_reprice">판매가 : 30,800원</dd>
				</dl>
			</li>
		</ul>
	</div>
</div>
<div class="body_section_tale">
	<div class="bandi_n_lunis">
		<h3 class="bnl_title"></h3>
		<div class="bnl_info">
			<div class="info_box">
				<div class="swiper-container bnl_swiper1">
					<div class="swiper-wrapper">
						<div class="swiper-slide">	
							<dl>
								<dt>
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/bnl_info01.jpg">
									</a>
								</dt>
								<dd class="ifb_title">반디앤루니스를 읽다</dd>
								<dd class="ifb_txt">한 손으로 쉽고 빠르게 모든 혜택을 누려보세요!</dd>
							</dl>
						</div>
						<div class="swiper-slide">
							<dl>
								<dt>
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/bnl_info02.jpg">
									</a>
								</dt>
								<dd class="ifb_title">나는 책 입니다</dd>
								<dd class="ifb_txt">일상에 묻혀 잠시 잊고 있었던 책을 떠올려 보세요.</dd>
							</dl>
						</div>
					</div>
					<div class="arrow_box ">
						<span class="arrow_count"></span>
						<button class="ban_awN"></button>
						<button class="ban_awP"></button>
					</div>
				</div>
			</div>
			<div class="info_box">
				<div class="swiper-container bnl_swiper2">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<dl>
								<dt>
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/bnl_store01.jpg">
									</a>
								</dt>
								<dd class="ifb_title">반디앤루니스 롯데피트인산본점</dd>
								<dd class="ifb_txt">책나라 군포의 문화 힐링 스팟</dd>
							</dl>
						</div>
						<div class="swiper-slide">
							<dl>
								<dt>
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/bnl_store02.jpg">
									</a>
								</dt>
								<dd class="ifb_title">반디앤루니스 대구신세계점</dd>
								<dd class="ifb_txt">대구 서점의 새로운 랜드마크</dd>
							</dl>
						</div>
						<div class="swiper-slide">
							<dl>
								<dt>
									<a href="javascript://">
										<img src="<%=cp%>/resources/image/main/bnl_store03.jpg">
									</a>
								</dt>
								<dd class="ifb_title">반디앤루니스 신세계센텀시티점</dd>
								<dd class="ifb_txt">배움과 체험이 가득한 멀티컬쳐스토어</dd>
							</dl>
						</div>
					</div>
					<div class="arrow_box">
						<span class="arrow_count"></span>
						<button class="ban_awN"></button>
						<button class="ban_awP"></button>
					</div>
				</div>
			</div>
		</div>
		<div class="bnl_custom">
			<h4 class="bnlc_title">자주묻는 질문</h4>
			<a href="javascript://" class="more_link"></a>
			<ul class="q_list">
				<li>
					<a href="javascript://">자주묻는 질문 넣기</a>
				</li>
				<li>
					<a href="javascript://">자주묻는 질문 넣기</a>
				</li>
				<li>
					<a href="javascript://">자주묻는 질문 넣기</a>
				</li>
				<li>
					<a href="javascript://">자주묻는 질문 넣기</a>
				</li>
				<li>
					<a href="javascript://">자주묻는 질문 넣기</a>
				</li>
				<li>
					<a href="javascript://">자주묻는 질문 넣기</a>
				</li>
			</ul>
			<div class="bnl_banner">
			<a href="javascript://">
				<img src="<%=cp%>/resources/image/main/bnl_banner.jpg">
			</a>
		</div>
		</div>
	</div>
</div>

	
	<script src="<%=cp%>/resources/js/swiper_min.js"></script>
	<script src="<%=cp%>/resources/js/main.js"></script>
	
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>