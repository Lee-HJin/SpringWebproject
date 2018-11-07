<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인_장르소설 도서부분</title>

<!-- 베스트셀러 css -->

<link rel="stylesheet"
	href="/webproject/resources/common/css/bnlBSList2.css" type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/class.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/common.css"
	type="text/css">

<link rel="stylesheet"
	href="/webproject/resources/book_css/detail_default.css"
	type="text/css">

<link rel="stylesheet" href="/webproject/resources/book_css/pStyle.css"
	type="text/css">


<script type="text/javascript"
	src="/springwebview/resources/js/Main_01.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/JUTIL/JUTIL.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/springwebview/resources/js/swfobject.js"></script>
<script type="text/javascript">
	function toggleDisplay(num) {
		var con = document.getElementById("layer" + num);
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function toggleDisplay2(num) {
		var con = document.getElementById("left_layer" + num);
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function toggleDisplay3(num) {
		var con = document.getElementById("left2_layer" + num);
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}
</script>
<!-- Carousel BS -->
<!-- Tabs with Dropdown Menu-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 메뉴 드롭 다운 -->
<script>
	/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
</script>

<!-- 수량 jQuery -->
<script type="text/javascript">
	function modifyProductQuantity(id, quantity) {

		if (isNaN($("#" + id).val())) {
			alert('숫자만 입력가능 합니다.');
			$("#" + id).focus();
			$("#" + id).val(0);
			return;
		}

		//var v = parseFloat($("#"+id).val())+parseFloat(quantity);    
		//$("#"+id).val(Math.round(v*10)/10);

		var q = parseInt($("#" + id).val()) + parseInt(quantity);
		if (q < 0) {
			$("#" + id).val() = 0;
		}
		$("#" + id).val(q);

	};
</script>

<style>
* {
	box-sizing: border-box
}

/* Style the tab */
.tab {
	float: left;
	border: none;
	width: 100%;
	height: 100px;
	justify-content: space-around;
}

.tablinks {
	float: left;
	width: 25%;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 10px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	
}

/* Create an active/current "tab button" class */
.tab button.active {
	
}

/* Style the tab content */
.tabcontent {
	float: none;
	padding: 10px 10px;
	border: none;
	width: 100%;
	height: 350px;
	display: none;
}

/* Clear floats after the tab */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}
</style>



</head>
<body>


	<jsp:include page="../../../common/header.jsp" flush="false" />


	<div id="contentBody" style="width: 1100px;">

		<!-- 좌측 템플릿 시작 -->
		<div class="side_t2 ml5">
			<div class="cate_comm">
				<h2 class="cate_tit">장르소설</h2>
				<ul class="cate_d1">
					<!-- 중분류 -->
					<li id="kidsCate_821" class="cate_d1_li "><a
						href="/front/product/bookCategoryMain.do?cateId=821"
						class="cate_d1_link" onmouseover="javascript:toggleDisplay3('01')"
						onmouseout="javascript:toggleDisplay3('01')">공포/무협소설</a> <!-- 소분류 -->
					</li>


					<li id="kidsCate_841" class="cate_d1_li "><a
						href="/front/product/bookCategoryMain.do?cateId=841"
						class="cate_d1_link" onmouseover="javascript:toggleDisplay3('02')"
						onmouseout="javascript:toggleDisplay3('02')">추리/범죄/스릴러소설</a> <!-- 소분류 -->
					</li>


					<!-- 중분류 -->


					<li id="kidsCate_853" class="cate_d1_li "><a
						href="/front/product/bookCategoryMain.do?cateId=853"
						class="cate_d1_link" onmouseover="javascript:toggleDisplay3('03')"
						onmouseout="javascript:toggleDisplay3('03')">라이트(NT)소설</a> <!-- 소분류 -->

						<div class="cate_d2" id="left2_layer03"
							onmouseover="javascript:toggleDisplay3('03')"
							onmouseout="javascript:toggleDisplay3('03')"
							style="display: none;">

							<div class="pos_rel">
								<div class="ico_arrow"></div>
								<ul>

									<li class="cate_d2_link "><a
										href="/front/product/bookCategoryMain.do?cateId=822">나비노벨(Navi
											Novel)</a></li>

									<li class="cate_d2_link "><a
										href="/front/product/bookCategoryMain.do?cateId=826">노블엔진(Novel
											Engine)</a></li>

									<li class="cate_d2_link "><a
										href="/front/product/bookCategoryMain.do?cateId=827">메르헨
											노벨</a></li>

									<li class="cate_d2_link "><a
										href="/front/product/bookCategoryMain.do?cateId=831">소미미디어</a>
									</li>



								</ul>
							</div>
						</div></li>




					<!-- 중분류 -->


					<li id="kidsCate_873" class="cate_d1_li "><a
						href="/front/product/bookCategoryMain.do?cateId=873"
						class="cate_d1_link" onmouseover="javascript:toggleDisplay3('05')"
						onmouseout="javascript:toggleDisplay3('05')">로맨스/인터넷소설</a> <!-- 소분류 -->
					</li>


					<!-- 중분류 -->

					<li id="kidsCate_878" class="cate_d1_li "><a
						href="/front/product/bookCategoryMain.do?cateId=878"
						class="cate_d1_link" onmouseover="javascript:toggleDisplay3('06')"
						onmouseout="javascript:toggleDisplay3('06')">SF/판타지소설</a> <!-- 소분류 -->


					</li>


					<!-- 중분류 -->




				</ul>
			</div>


			<!-- left banner -->


			<!-- 좌측 템플릿 -->


			<!-- 이분야의 시리즈/총서 -->

			<div class="mt15 cate_left_box series" style="width: 170px;">
				<h4 class="cate_tem_tit">이 분야의 시리즈/총서</h4>
				<ul class="stop">

					<li>
						<dl>
							<dt>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34128"><img
									src="http://image.bandinlunis.com/upload/product/3854/3854692_s.jpg"
									onerror="this.src='/images/common/noimg_type04.gif';"></a>
							</dt>
							<dd>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34128">애거서
									크리스티 에디터스 초이스 <span>(10)</span>
								</a>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34072"><img
									src="http://image.bandinlunis.com/upload/product/3854/3854832_s.jpg"
									onerror="this.src='/images/common/noimg_type04.gif';"></a>
							</dt>
							<dd>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34072">인디아나
									텔러 <span>(2)</span>
								</a>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34067"><img
									src="http://image.bandinlunis.com/upload/product/3854/3854688_s.jpg"
									onerror="this.src='/images/common/noimg_type04.gif';"></a>
							</dt>
							<dd>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34067">애거서
									크리스티 푸아로 셀렉션 <span>(11)</span>
								</a>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34014"><img
									src="http://image.bandinlunis.com/upload/product/3852/3852311_s.jpg"
									onerror="this.src='/images/common/noimg_type04.gif';"></a>
							</dt>
							<dd>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=34014">13월의
									첫사랑 <span>(2)</span>
								</a>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=30688"><img
									src="http://image.bandinlunis.com/upload/product/3802/3802235_s.jpg"
									onerror="this.src='/images/common/noimg_type04.gif';"></a>
							</dt>
							<dd>
								<a
									href="/front/product/bookSeriesView.do?cateId=7216&prodRelSeq=30688">미야모토
									무사시 <span>(11)</span>
								</a>
							</dd>
						</dl>
					</li>

				</ul>

			</div>

			<!-- 좌측 템플릿 끝 -->


		</div>

		<!-- 가운데 레이아웃 -->

		<div class="con_t2" style="width: 850px;">

			<div class="container" style="width: 850px;">
				<!-- 		<div class="tap_menu_d2 mb15"> -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home">전체목록</a></li>

					<li><a href="#menu_best">베스트셀러</a></li>

					<li><a href="#menu_new">새로나온 책</a></li>

					<li><a href="#menu_discount">정가인하</a></li>
				</ul>


				<!-- 줄 생성 -->

				<!-- 탭 메뉴 -->

				<div class="tab-content" style="width: 800px;">

					<div id="home" class="tab-pane fade in active">
						<div class="cateM pos_rel">
							<div class="cate_main_bn">

								<div class="container" style="width: 100%">

									<div id="myCarousel" class="carousel slide"
										data-ride="carousel">
										<!-- Indicators -->
										<ol class="carousel-indicators">
											<li data-target="#myCarousel" data-slide-to="0"
												class="active"></li>
											<li data-target="#myCarousel" data-slide-to="1"></li>
											<li data-target="#myCarousel" data-slide-to="2"></li>
											<li data-target="#myCarousel" data-slide-to="3"></li>
										</ol>

										<!-- Wrapper for slides -->
										<div class="carousel-inner">
											<div class="item active">
												<img
													src="http://image.bandinlunis.com/upload/banner/20180928/banner20180928182256.jpg"
													alt="Image1" style="width: 100%;">
											</div>

											<div class="item">
												<img
													src="http://image.bandinlunis.com/upload/banner/20180827/banner20180827153634.jpg"
													alt="Image2" style="width: 100%;">
											</div>

											<div class="item">
												<img
													src="http://image.bandinlunis.com/upload/banner/20180903/banner20180903180323.jpg"
													alt="Image3" style="width: 100%;">
											</div>

											<div class="item">
												<img
													src="http://image.bandinlunis.com/upload/banner/20180906/banner20180906182627.jpg"
													alt="Image4" style="width: 100%;">
											</div>

										</div>

										<!-- Left and right controls -->

									</div>
								</div>
							</div>
							<!-- 카테고리 메인배너 -->


							<br /> <br />

							<!-- 반디 추천책 -->
							<h4
								style="width: 532px; height: 35px; padding: 0 0 0 5px; border-bottom: 1px solid #e1e1e1; font: normal 16px; color: #000; letter-spacing: -0.05em">반디앤루니스
								추천책</h4>
							<hr>

							<div class="tab" style="border-bottom: 1px solid #e1e1e1;">
								<div class="tablinks" onmouseover="openCity(event, 'book_1')">
									<a href=""> <img
										src="http://image.bandinlunis.com/upload/product/4189/4189162.jpg"
										style="cursor: pointer; width: 45%; height: 45%;">
									</a>
								</div>
								<div class="tablinks" onmouseover="openCity(event, 'book_2')">
									<a href=""> <img
										src="http://image.bandinlunis.com/upload/product/4189/4189565.jpg"
										style="cursor: pointer; width: 45%; height: 45%;">


									</a>
								</div>
								<div class="tablinks" onmouseover="openCity(event, 'book_3')">
									<a href=""> <img
										src="http://image.bandinlunis.com/upload/product/4186/4186552.jpg"
										style="cursor: pointer; width: 45%; height: 45%;">
									</a>
								</div>

								<div class="tablinks" onmouseover="openCity(event, 'book_4')">
									<a href=""> <img
										src="http://image.bandinlunis.com/upload/product/4186/4186534.jpg"
										style="cursor: pointer; width: 45%; height: 45%;">
									</a>
								</div>
							</div>
							<br />




							<div id="book_1" class="tabcontent">
								<dl>
									<dt class="pImg145">
										<a href="/front/product/detailProduct.do?prodId=4188573">
											<img
											src="http://image.bandinlunis.com/upload/product/4189/4189162.jpg"
											style="float: left;">

										</a>
									</dt>
									<br />
									<dd class="booktit">
										<a href="">죽음을 선택한 남자</a>
									</dd>
									<dd class="writer">데이비드 발다치 | 북로드</dd>
									<br />
									<dd class="bex">아마존 베스트셀러 TOP 10, 뉴욕타임스 베스트셀러 1위!전 세계 80개국
										1억 3천만 독자가 열광하는 영미문학의 거장 데이비드 발다치의 신작 스릴러!‘모든 것을 기억하는 남자’ 에이머스
										데커가 펼치는 또 한 번의 영리하고 숨 막히는 두뇌 게임전 세계 80개국 45개 언어로 출간되어 1억 3천만
										부라는 경이로운 판매고를 올린, 명실 공히...</dd>
								</dl>

							</div>

							<div id="book_2" class="tabcontent">
								<dl>
									<dt class="pImg145">
										<a href=""> <img
											src="http://image.bandinlunis.com/upload/product/4189/4189565.jpg"
											style="float: left;">

										</a>
									</dt>
									<br />
									<dd class="booktit">
										<a href="">비밀의 비밀</a>
									</dd>
									<dd class="writer">할런 코벤 | 문학수첩</dd>
									<br />
									<dd class="bex">줄리아 로버츠 주연 영화화 예정!세계 3대 미스터리 문학상 최초 석권
										스릴러의 제왕 할런 코벤 신작★USA투데이 베스트셀러 1위(종합 부문) ★뉴욕 타임스 베스트셀러 1위(하드커버
										픽션)★커커스리뷰 2016 최고의 책(미스터리·스릴러) ★라이브러리저널 2016 최고의 책(스릴러)★아마존
										2016 최고의 책 · 독자가 가장 사랑한 도서 ★전...</dd>
								</dl>
							</div>
							<div id="book_3" class="tabcontent">
								<dl>
									<dt class="pImg145">
										<a href=""> <img
											src="http://image.bandinlunis.com/upload/product/4186/4186552.jpg"
											style="float: left;">
										</a>
									</dt>
									<br />
									<dd class="booktit">
										<a href="/front/product/detailProduct.do?prodId=4187725">열화여가
											1</a>
									</dd>
									<dd class="writer">명효계 | 아르테</dd>
									<br />
									<dd class="bex">★2018년 중국 드라마 최고 화제작 열화여가 원작소설★삼생삼세 십리도화
										제작진이 선택한 새로운 이야기드라마 70억 뷰 돌파, 5주 연속 조회 수 1위여주인공 ‘열여가’와 그녀를 둘러싼
										인물들이 무림 최고 문파 ‘열화산장’을 배경으로 펼치는 사랑과 야망, 복수에 얽힌 무협사극 『열화여가』가
										아르테에서 출간되었다. 『열화여가』는 중국 국민 ...</dd>
								</dl>
							</div>
							<div id="book_4" class="tabcontent">
								<dl style="padding-top: 10px">
									<dt class="pImg145">
										<a href=""> <img
											src="http://image.bandinlunis.com/upload/product/4186/4186534.jpg"
											style="float: left;">
										</a>
									</dt>
									<br />
									<dd class="booktit">
										<a href="">강박의 연애 </a>

									</dd>
									<dd class="writer">류재현 | 마야마루</dd>
									<br />
									<dd class="bex">5년 전, 그녀는 왜 이별을 말했을까.함께했던 대학 시절이 인생에서 가장 행복한 때였다.마음을 송두리째 빼앗아 놓고 떠나간 첫사랑.갑작스러운 이별처럼 갑자기 재회한 그녀, 박지운.정리했다 여겼던 단하의 마음이 그때와 똑같이 두근거린다.우리가 무슨 사이도 아닌데 왜 이렇게 신경 쓰이게 만들지.5년을 잊으려고 애썼지만 결국 지우지 못한 첫사랑...</dd>
								</dl>
							</div>
							<div class="clearfix"></div>

						</div>

						<div class="cateS" style="margin-left: 20px;">

							<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br/>
							<!-- 분야 주간 베스트 -->
							<div class="cateBest">
								<h4>분야 주간 베스트</h4>
								<a href="/front/product/bookCategoryMain.do?cateId=7216&fullCateId=7216&listType=best" class="btn_more_2014"><span>더 보기</span></a>
								<ul>
									
									<li class="bestTop">
										<dl>
											<dt>
												<span class="rank no1">1</span>
											</dt>
											
												<dd class="pImg52 imgP"><a href="/front/product/detailProduct.do?prodId=3558781">
													
														
														
															<img src="http://image.bandinlunis.com/upload/product/3558/3558781_s.jpg" onerror="this.src='/images/common/noimg_type04.gif';">
														
													
												</a></dd>
												<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=3558781">나미야 잡화점의 기적 </a></dd>
												<dd class="writer">히가시노 게이고</dd>
											
											
											
										</dl>
									</li>
									
									<li >
										<dl>
											<dt>
												<span class="rank no2">2</span>
											</dt>
											
											
												<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4205563">나와 호랑이님 19 [한정판...</a></dd>
												<dd class="writer">카넬</dd>
											
											
										</dl>
									</li>
									
									<li >
										<dl>
											<dt>
												<span class="rank no3">3</span>
											</dt>
											
											
												<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4195259">살인의 문 2</a></dd>
												<dd class="writer">히가시노 게이고</dd>
											
											
										</dl>
									</li>
									
									<li >
										<dl>
											<dt>
												<span class="rank no4">4</span>
											</dt>
											
											
												<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4206159">Re:제로부터 시작하는 이세...</a></dd>
												<dd class="writer">나가츠키 탓페이</dd>
											
											
										</dl>
									</li>
									
									<li >
										<dl>
											<dt>
												<span class="rank no5">5</span>
											</dt>
											
											
												<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4206175">사랑하는 기생충</a></dd>
												<dd class="writer">미아키 스가루</dd>
											
											
										</dl>
									</li>
									
								</ul>
								
								
								
							</div>
						</div>


						<script>
							function openCity(evt, cityName) {
								var i, tabcontent, tablinks;
								tabcontent = document
										.getElementsByClassName("tabcontent");
								for (i = 0; i < tabcontent.length; i++) {
									tabcontent[i].style.display = "none";
								}
								tablinks = document
										.getElementsByClassName("tablinks");
								for (i = 0; i < tablinks.length; i++) {
									tablinks[i].className = tablinks[i].className
											.replace(" active", "");
								}
								document.getElementById(cityName).style.display = "block";
								evt.currentTarget.className += " active";
							}
						</script>




						<!-- 추천인사이드 -->


						<!-- 주목할만한 새로나온 책 -->

						<div id="sortableArea" class="fl_clear ml5"
							style="overflow: hidden">

							<!-- 주목할만한 새로나온책 -->
							<div class="temClassA temType2" id="dp_050">

								<h4>주목할만한 새로나온 책</h4>
								<div id="cateNewArea">


									<ul>

										<li class="po1">
										<dl>
											<dt class="pImg90"><a href="/webproject/book_info.action?isbn="><img src="http://image.bandinlunis.com/upload/product/3997/3997224.jpg" onerror="this.src='/images/common/noimg_type01.gif';"></a></dt>
											
											<dd class="booktit"><a href="">꽃길, 꿈길</a></dd>
											<dd class="writer">진양<span class="public"> | 파란</span></dd>
											<dd class="price">11,700원</dd>
											<dd class="sPoint">(10%↓+5%P)</dd>
											
											
											<dd class="bex">◎ 이 책은당신의 꿈속에서라도 함께 걸을 수만 있다면…….진양 작가의 장편소설 《꽃길, 꿈길》. 핏빛으로 물든 과거의 역모 사건과 맞물려 현재까지 이어지는 복수와 음모. 치밀한 사...</dd>
										</dl>
									</li>
									
									
						        	
									<li class="po1">
										<dl>
											<dt class="pImg90"><a href=""><img src="http://image.bandinlunis.com/upload/product/3993/3993371.jpg" onerror="this.src='/images/common/noimg_type01.gif';"></a></dt>
											
											<dd class="booktit"><a href="">탑스타의 탑 시크릿</a></dd>
											<dd class="writer">김지혜<span class="public"> | 파란</span></dd>
											<dd class="price">9,000원</dd>
											<dd class="sPoint">(10%↓+5%P)</dd>
											
											
											<dd class="bex">그로부터 평행선이 되려는 여자와 그녀와 하나의 선이 되고 싶은 남자.서로에게 유일한 선이 되기 위해 등을 맞대다 김지혜 작가의 장편소설 《탑스타의 탑 시크릿》.작가는 최고의 인기 ...</dd>
										</dl>
									</li>
									</ul>

								</div>
							</div>


							<div class="temClassA temType2" id="dp_006">
										
										<h4>MD추천도서 : NICE BOOK!<span></span></h4>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4190319">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4190/4190319.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4190319">혼효 昏曉 전 3권세트</a></dd>
														<dd class="writer">문은숙<span class="public"> | 로망띠끄</span></dd>
														<dd class="rPrice">30,000원 </dd>
														<dd class="price">27,000원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">1권.“소녀는 은파루의 황금조라 하지요.”때는 치평 4년의 겨울, 세밑이 다가올 무렵의 요주.기분전환삼아 저잣거리에 나갔던 기녀 황리는 우연찮게 소매치기 소동에 휘말린다. 어린 소...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4189678">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4189/4189678.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4189678">월드 오브 워크래프트 : 폭풍전야</a></dd>
														<dd class="writer">크리스티 골드<span class="public"> | 제우미디어</span></dd>
														<dd class="rPrice">15,800원 </dd>
														<dd class="price">14,220원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">"와우 확장팩 사이, 무슨 일이 일어난 걸까?"질문에 답해줄 소설 『폭풍전야』 소설 『폭풍전야』는 블리자드 사의 대표 게임, 월드 오브 워크래프트의 신규 확장팩 '격전의 아제로스'...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4188614">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4188/4188614.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4188614">뱅쇼를 당신에게</a></dd>
														<dd class="writer">곤도 후미에<span class="public"> | 노블엔진팝</span></dd>
														<dd class="rPrice">9,800원 </dd>
														<dd class="price">8,820원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">『얼어붙은 섬』으로 제4회 아유카와 데쓰야 상을 수상하고『새크리파이스』로 제10회 오야부 하루히코 상을 수상한 작가곤도 후미에의 미스터리 시리즈 그 두 번째 작품! 작품 소개일본 ...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4188602">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4188/4188602.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4188602">더 뉴 게이트 04 푸른색의 옛 성지</a></dd>
														<dd class="writer">카자나미 시노기<span class="public"> | 라의눈</span></dd>
														<dd class="rPrice">9,500원 </dd>
														<dd class="price">8,550원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">일본 집계 10만 부 판매고를 기록한 경이적 인기의 웹소설!신과 공주가 강제 전송된 곳은 ‘성지’ㅡ한때 「THE NEW GATE」의 세계에서 번성했던 그 도시는 천재지변의 영향으로...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4187940">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4187/4187940.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4187940">영원한 조연은 없다 1 </a></dd>
														<dd class="writer">김로아<span class="public"> | 디앤씨미디어</span></dd>
														<dd class="rPrice">13,000원 </dd>
														<dd class="price">11,700원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">“주인공이 됐으면 좀 좋아?! 왜 나는 신관 1이냐고!”현대의 강단아, 애독하던 소설의 엑스트라 신관이 되다.그것도 하필이면 한순간의 실수로 노역형을 받은 직후에.신관 엘레나가 이...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4186251">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4186/4186251.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4186251">방패 용사 성공담 19</a></dd>
														<dd class="writer">아네코 유사기<span class="public"> | 영상출판미디어</span></dd>
														<dd class="rPrice">10,000원 </dd>
														<dd class="price">9,000원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">나오후미에게 호의를 보이는 마룡의 안내를 받아, 과거에 마룡이 지배했던 대륙의 성으로 향하는 방패 용사 일행. 그 성에서, 일행은 보물을 찾는 모험자로 위장한 파도의 첨병들을 격퇴...</dd>
													</dl>
												</li>
											</ul>
										
									</div>
								
								
								<!-- 템플릿 : 2-5단 복합형 -->
								
								
								<!-- 템플릿 : 1-3단 수평형 -->
								
								
								<!-- 템플릿 TypeA 묶음상품 템플릿 -->
								
								
							
							
								<!-- 템플릿  : 5단 기본형 -->
								
								
								<!-- 템플릿 : 5단 할인형 -->
								
								
								<!-- 템플릿 : 5단 별점형 -->
								
								
								<!-- 템플릿 : 2단 기본형 -->
								
									<div class="temClassA temType2" id="dp_008">
										
										<h4>과학 (SF) 소설<span></span></h4>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4056692">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4056/4056692.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4056692">칼리반의 전쟁 1</a></dd>
														<dd class="writer">제임스 S. A. 코리<span class="public"> | 아작</span></dd>
														<dd class="rPrice">14,800원 </dd>
														<dd class="price">13,320원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">인기리 방영 중인 미드 익스팬스 시리즈 원작소설“SF판 얼음과 불의 노래” 더 빨라졌다, 더 강렬해졌다!뉴욕타임스 베스트셀러이자 로커스상을 수상하고, 휴고상에 최종 노미네이트되며 ...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4051913">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4051/4051913.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4051913">대우주시대</a></dd>
														<dd class="writer"> 네이선 로웰<span class="public"> | 구픽</span></dd>
														<dd class="rPrice">14,000원 </dd>
														<dd class="price">12,600원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">■ 작품 소개 24세기 우주를 누비는 것은 전쟁을 위한 전투선이 아닌 온 우주와 거래할 무역선. 우주 무역의 황금기가 도래했다! 은하계를 누비는 가장 현실적이고 평범한 사람들의 비...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4050158">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4050/4050158.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4050158">라마와의 랑데부</a></dd>
														<dd class="writer">아서 C. 클라크 <span class="public"> | 아작</span></dd>
														<dd class="rPrice">14,800원 </dd>
														<dd class="price">13,320원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s9">9.0</dd>
														
														<dd class="bex">지금까지 쓰인 SF에서 단 한 권을 꼽으라면 바로 이 책!고전이란 바로 이런 것이다.서기 2130년, 길이 50킬로미터의 거대한 소행성이 지구를 향해 맹렬한 속도로 다가온다. ‘라...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4047391">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4047/4047391.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4047391">저주토끼</a></dd>
														<dd class="writer">정보라<span class="public"> | 아작</span></dd>
														<dd class="rPrice">14,800원 </dd>
														<dd class="price">13,320원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">세상 몹쓸 것들을 제대로 응징하는, 어여쁜 저주 이야기한국 호러 SF/판타지 대표작가 정보라의 4년 만의 신작 소설집할아버지는 늘 말씀하셨다. “저주에 쓰이는 물건일수록 예쁘게 만...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4041440">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4041/4041440.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4041440">안드로메다 성운</a></dd>
														<dd class="writer">이반 예프레모프<span class="public"> | 아작</span></dd>
														<dd class="rPrice">14,800원 </dd>
														<dd class="price">13,320원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
														<dd class="bex">러시아 혁명 100주년, 최초의 인공위성 스푸트니크 발사 60주년을 맞이하여20세기 소련을 대표하는 전설적인 SF 드디어 한국판 출간!인본주의적 공산주의자 작가가 그리는 미래 인류...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4038208">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4038/4038208.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4038208">다크 사이드</a></dd>
														<dd class="writer">앤서니 오닐<span class="public"> | 한스미디어</span></dd>
														<dd class="rPrice">15,000원 </dd>
														<dd class="price">13,500원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s8">7.67</dd>
														
														<dd class="bex">인터스텔라, 마션, 이번엔 다크 사이드다!★★★ 20세기 폭스사 영화 제작 중 ★★★월스트리트저널, 퍼블리셔스 위클리, 북리스트, 커커스 리뷰 극찬!거칠고 어둡고 폭력적인 미래를 ...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4016903">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4016/4016903.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4016903">제5도살장</a></dd>
														<dd class="writer">커트 보니것<span class="public"> | 문학동네</span></dd>
														<dd class="rPrice">12,500원 </dd>
														<dd class="price">11,250원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s9">8.86</dd>
														
														<dd class="bex"></dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4013726">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4013/4013726.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4013726">중력의 임무</a></dd>
														<dd class="writer">할 클레민트<span class="public"> | 아작</span></dd>
														<dd class="rPrice">14,800원 </dd>
														<dd class="price">13,320원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s8">8.0</dd>
														
														<dd class="bex">최고 중력 700G의 행성에서 펼쳐지는 정통 하드 SF의 대명사 과학적 엄밀함에 못지않은 소설적 재미까지적도 지름 7만7천 킬로미터, 극 지름 3만 킬로미터의 극단적으로 찌그러진 ...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=4000119">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/4000/4000119.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=4000119">당신 인생의 이야기</a></dd>
														<dd class="writer">테드 창<span class="public"> | 엘리</span></dd>
														<dd class="rPrice">14,500원 </dd>
														<dd class="price">13,050원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s9">8.78</dd>
														
														<dd class="bex">최고의 과학소설 작가, 테드 창 작품 영화화!시카리오 드니 빌뇌브 감독, 11월 개봉작 SF 컨택트 원작! “이 소설집은 진정 경이롭다… 나는 사람의 정신이 제대로 기능하려면 일 ...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=3978912">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/3978/3978912.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=3978912">별의 계승자</a></dd>
														<dd class="writer">제임스 P. 호건<span class="public"> | 아작</span></dd>
														<dd class="rPrice">14,800원 </dd>
														<dd class="price">13,320원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s9">9.11</dd>
														
														<dd class="bex">SF 마니아들이 가장 사랑하며 복간을 기다려온 작품,세계적 SF 작가 제임스 P. 호건의 대표작 드디어 복간! 달에서 5만 년 전 우주비행사의 시체가 발견되었다우주복 안의 유골은 ...</dd>
													</dl>
												</li>
											</ul>
										
											<ul>
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=3791159">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/3791/3791159.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=3791159">바람의 열두 방향</a></dd>
														<dd class="writer">어슐러 K. 르 귄<span class="public"> | 시공사</span></dd>
														<dd class="rPrice">14,000원 </dd>
														<dd class="price">12,600원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s8">8.0</dd>
														
														<dd class="bex">미국 문학의 거장 어슐러 K. 르 귄의 초기 걸작 단편집고독에 관한 낭만적인 데뷔작 파리의 4월부터 휴고상, 네뷸러상, 로커스상에 빛나는 오멜라스를 떠나는 사람들과 혁명 전날까지르...</dd>
													</dl>
												</li>
											
										
											
												<li class="po1">
													<dl>
														<dt class="pImg90 imgP"><a href="/front/product/detailProduct.do?prodId=3601121">
														
															
															
																<img src="http://image.bandinlunis.com/upload/product/3601/3601121.jpg" onerror="this.src='/images/common/noimg_type01.gif';">
															
														
														</a></dt>
														
														<dd class="booktit"><a href="/front/product/detailProduct.do?prodId=3601121">멋진 신세계</a></dd>
														<dd class="writer">올더스 헉슬리<span class="public"> | 문예출판사</span></dd>
														<dd class="rPrice">10,000원 </dd>
														<dd class="price">9,000원</dd>
														<dd class="sPoint">(10%↓+5%P)</dd>
														
														
														
															<dd class="rStar s9">9.14</dd>
														
														<dd class="bex">영국 소설가 올더스 헉슬리의 1932년 작으로 과학문명의 과도한 발전 결과 인간성의 상실을 결과하고 만 미래사회의 모습을 그렸다. 미래의 인간은 출생시부터 인공수정에 의해 대량생산...</dd>
													</dl>
												</li>
											</ul>
										
									</div>
								

							<div class="cateInside" id="dp_029"></div>

							<script>
								$(document).ready(function() {
									$(".nav-tabs a").click(function() {
										$(this).tab('show');
									});
								});
							</script>

							<!-- Dynamic Tabs 스크립트 -->


						</div>



					</div>
					<!-- 전체 목록 끝  -->

					<!-- 베스트셀러 시작 -->

					<div id="menu_best" class="tab-pane fade">

						<div class="con_t2">


							<div class="fl_clear ml5">
								<div class="prod_list_type prod_best_type">

									<ul>

										<li><input class="checkbox" type="checkbox"
											value="4034224" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">
														1 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4034224"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4034/4034224.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4034224"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4034224');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4034224"
														onfocus="this.blur();"> 돌이킬 수 없는 약속 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>야쿠마루 가쿠</span> <span class="gap">|</span> <span>북플라자</span>
													<span class="txt_date"><span class="gap">|</span> <span>2017.02.02</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">15,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,500</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 89%;"></span>
													</div>
													<strong>8.94</strong> <a
														href="/front/product/detailProduct.do?prodId=4034224#sub10"
														target="_blank">리뷰<em>(18)</em></a>
												</dd>
												<dd class="txt_bex">일본 아마존 베스트셀러!15년 전 버려버린 과거에서 도착한 한
													통의 편지가 봉인해 둔 기억을 되살아나게 한다!“그들은 지금 교도소에서 나왔습니다!”자신이 일하던 가게의
													손님이었던 ...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5258991"
														target="_blank">이 책의 eBook : <strong>11,000</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4034224" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4034224','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4034224','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4034224');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4034224');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4034224', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4189269" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														2 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4189269"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4189/4189269.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4189269"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4189269');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4189269"
														onfocus="this.blur();"> 인생 우화 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>류시화</span> <span class="gap">|</span> <span>연금술사</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.07.30</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">16,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>14,400</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 97%;"></span>
													</div>
													<strong>9.73</strong> <a
														href="/front/product/detailProduct.do?prodId=4189269#sub10"
														target="_blank">리뷰<em>(11)</em></a>
												</dd>
												<dd class="txt_bex">천사의 실수로세상의 바보들이 한 마을에 모여 살게 되었다 우화는
													두 천사 이야기로 시작된다. 인간 세상을 내려다보며 지혜로운 자는 줄고 어리석은 자가 나날이 늘어나는 것이
													걱정된 ...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5277846"
														target="_blank">이 책의 eBook : <strong>10,080</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4189269" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4189269','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4189269','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4189269');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4189269');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4189269', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4175277" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														3 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4175277"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4175/4175277.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4175277"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4175277');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4175277"
														onfocus="this.blur();"> 고양이 1 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>베르나르 베르베르</span> <span class="gap">|</span> <span>열린책들</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.05.30</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">12,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>11,520</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 87%;"></span>
													</div>
													<strong>8.67</strong> <a
														href="/front/product/detailProduct.do?prodId=4175277#sub10"
														target="_blank">리뷰<em>(18)</em></a>
												</dd>
												<dd class="txt_bex">베르베르가 이번에는 고양이의 눈으로 인간의 미래를
													바라본다한국인이 가장 사랑하는 작가 1위(2016년 3월, 교보문고 최근 10년간 국내외 작가별 소설 누적
													판매량 집계), 베르나...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5250280"
														target="_blank">이 책의 eBook : <strong>9,500</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4175277" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4175277','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4175277','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4175277');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4175277');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4175277', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4195328" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														4 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4195328"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4195/4195328.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4195328"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4195328');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4195328"
														onfocus="this.blur();"> 곁에 남아 있는 사람 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>임경선</span> <span class="gap">|</span> <span>위즈덤하우스</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.09.05</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">13,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>11,700</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 90%;"></span>
													</div>
													<strong>9</strong> <a
														href="/front/product/detailProduct.do?prodId=4195328#sub10"
														target="_blank">리뷰<em>(1)</em></a>
												</dd>
												<dd class="txt_bex">“그 사람을 너무나 사랑하면 절로 알게 되는 것들이
													있었다”저마다의 자리에서 저마다의 고통을 품고 살아가는강인하고도 사랑스러운 사람들의 이야기―동시대 사람들의
													생생한 이야기를 간결...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5279312"
														target="_blank">이 책의 eBook : <strong>9,100</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 2018년
															10월 23일(화) 이내 </strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4195328" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4195328','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4195328','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4195328');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4195328');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4195328', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>

									</ul>




									<ul>

										<li><input class="checkbox" type="checkbox"
											value="4002576" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														5 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4002576"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4002/4002576.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4002576"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4002576');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4002576"
														onfocus="this.blur();"> 82년생 김지영 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>조남주</span> <span class="gap">|</span> <span>민음사</span>
													<span class="txt_date"><span class="gap">|</span> <span>2016.10.14</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">13,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>11,700</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 91%;"></span>
													</div>
													<strong>9.1</strong> <a
														href="/front/product/detailProduct.do?prodId=4002576#sub10"
														target="_blank">리뷰<em>(96)</em></a>
												</dd>
												<dd class="txt_bex">“사람들이 나보고 맘충이래.”한국에서 여자로 살아가는 일그
													공포, 피로, 당황, 놀람, 혼란, 좌절의연속에 대한 인생 현장 보고서 조남주 장편소설 『82년생
													김지영』이 민음사 ‘오...</dd>


												<dd class="txt_contents">
													<span class="tag_relation">연관</span> <a
														href="/front/product/bookSeriesView.do?prodRelSeq=43488&listType=series&cateId=3"
														target="_blank"><em>[관련 시리즈]</em>대통령 추천도서</a>
												</dd>


												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=7973420"
														target="_blank">이 책의 eBook : <strong>9,100</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4002576" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4002576','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4002576','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4002576');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4002576');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4002576', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4144482" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														6 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4144482"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4144/4144482.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4144482"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4144482');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4144482"
														onfocus="this.blur();"> 죄의 목소리 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>시오타 타케시</span> <span class="gap">|</span> <span>비앤엘</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.03.02</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">14,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,320</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 93%;"></span>
													</div>
													<strong>9.33</strong> <a
														href="/front/product/detailProduct.do?prodId=4144482#sub10"
														target="_blank">리뷰<em>(6)</em></a>
												</dd>
												<dd class="txt_bex">일본 쇼와시대 최대의 미제 ‘구리코·모리나가 사건’그 오랜
													미스터리의 진실을 추적해가는 실화 소설31년 전 미해결 사건에 감춰진 삶을 그리다 2017 제14회
													서점대상 3위《주간문...</dd>




												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4144482" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4144482','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4144482','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4144482');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4144482');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4144482', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4175281" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														7 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4175281"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4175/4175281.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4175281"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4175281');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4175281"
														onfocus="this.blur();"> 고양이 2 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>베르나르 베르베르</span> <span class="gap">|</span> <span>열린책들</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.05.30</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">12,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>11,520</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 90%;"></span>
													</div>
													<strong>9</strong> <a
														href="/front/product/detailProduct.do?prodId=4175281#sub10"
														target="_blank">리뷰<em>(7)</em></a>
												</dd>
												<dd class="txt_bex">베르베르가 이번에는 고양이의 눈으로 인간의 미래를 바라본다
													한국인이 가장 사랑하는 작가 1위(2016년 3월, 교보문고 최근 10년간 국내외 작가별 소설 누적 판매량
													집계), 베르...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5250282"
														target="_blank">이 책의 eBook : <strong>9,500</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4175281" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4175281','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4175281','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4175281');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4175281');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4175281', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4200433" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														8 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4200433"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4200/4200433.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4200433"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4200433"
														onfocus="this.blur();"> 메르타 할머니의 우아한 강도인생 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>카타리나 잉엘만순드베리</span> <span class="gap">|</span> <span>열린책들</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.10.10</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">14,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,320</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 0%;"></span>
													</div>
													<strong>0</strong> <a
														href="/front/product/detailProduct.do?prodId=4200433#sub10"
														target="_blank">리뷰<em>(0)</em></a>
												</dd>
												<dd class="txt_bex">79세 노인 강도 메르타 할머니가 다시 돌아왔다메르타 할머니
													시리즈 세 번째 책, 드디어 출간스웨덴의 베스트셀러 작가 카타리나 잉엘만순드베리의 장편소설 『메르타
													할머니의 우아한 강...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5287043"
														target="_blank">이 책의 eBook : <strong>9,900</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 2018년
															10월 25일(목) 이내 </strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4200433" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4200433','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4200433','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4200433');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4200433');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4200433', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>

									</ul>




									<ul>

										<li><input class="checkbox" type="checkbox"
											value="4194431" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														9 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4194431"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4194/4194431.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4194431"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4194431"
														onfocus="this.blur();"> 매스커레이드 나이트 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>히가시노 게이고</span> <span class="gap">|</span> <span>현대문학</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.08.30</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">14,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,320</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 95%;"></span>
													</div>
													<strong>9.5</strong> <a
														href="/front/product/detailProduct.do?prodId=4194431#sub10"
														target="_blank">리뷰<em>(6)</em></a>
												</dd>
												<dd class="txt_bex">히가시노 게이고 2018년 최신작절대 속지 마라, 범인도 가면을
													쓰고 있다★ 시리즈 일본 누적 판매 300만 부 돌파!★ 출간 즉시 오리콘 주간 도서 종합 랭킹 1위!★
													시리즈 제...</dd>

												<dd class="txt_contents">
													<span class="tag_event">행사</span> <a
														style="text-decoration: none;"
														href="/front/event/viewPromotionEvent.do?evtSeq=37693"
														target="_blank">매스커레이드 시리즈의 귀환! </a>


												</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5281786"
														target="_blank">이 책의 eBook : <strong>10,000</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4194431" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4194431','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4194431','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4194431');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4194431');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4194431', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4198234" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														10 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4198234"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4198/4198234.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4198234"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4198234');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4198234"
														onfocus="this.blur();"> 70세 사망법안, 가결 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>가키야 미우</span> <span class="gap">|</span> <span>왼쪽주머니</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.10.01</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">15,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,500</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 88%;"></span>
													</div>
													<strong>8.8</strong> <a
														href="/front/product/detailProduct.do?prodId=4198234#sub10"
														target="_blank">리뷰<em>(5)</em></a>
												</dd>
												<dd class="txt_bex">70세 사망법안이 가결되었다‘이 나라 국적을 지닌 자는 누구나
													70세가 되는 생일로부터 30일 이내에 반드시 죽어야 한다. 더불어 정부는 안락사 방법을 몇 종류 준비할
													방침이다. ...</dd>




												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 2018년
															10월 25일(목) 이내 </strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4198234" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4198234','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4198234','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4198234');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4198234');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4198234', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4095190" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														11 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4095190"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4095/4095190.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4095190"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4095190');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4095190"
														onfocus="this.blur();"> 노르웨이의 숲 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>무라카미 하루키</span> <span class="gap">|</span> <span>민음사</span>
													<span class="txt_date"><span class="gap">|</span> <span>2017.08.07</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">15,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,500</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 100%;"></span>
													</div>
													<strong>10</strong> <a
														href="/front/product/detailProduct.do?prodId=4095190#sub10"
														target="_blank">리뷰<em>(7)</em></a>
												</dd>
												<dd class="txt_bex">“나를 언제까지나 잊지 마, 내가 여기 있었다는 걸 기억해
													줘.” 하루키 월드의 빛나는 다이아몬드무라카미 하루키를 만나기 위해 가장 먼저 읽어야 할 책! 페이지를
													처음 펼치는 오늘...</dd>




												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4095190" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4095190','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4095190','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4095190');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4095190');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4095190', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4089088" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														12 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4089088"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4089/4089088.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4089088"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4089088');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4089088"
														onfocus="this.blur();"> 그해, 여름 손님 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>안드레 애치먼</span> <span class="gap">|</span> <span>잔</span>
													<span class="txt_date"><span class="gap">|</span> <span>2017.08.01</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">13,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>12,420</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 90%;"></span>
													</div>
													<strong>9</strong> <a
														href="/front/product/detailProduct.do?prodId=4089088#sub10"
														target="_blank">리뷰<em>(10)</em></a>
												</dd>
												<dd class="txt_bex">하나의 책, 세 가지 디자인으로 만나는 소설 《그해, 여름
													손님》 책표지는 띠지와 재킷의 유무에 따라 각기 다른 분위기를 내면서도, 소설이 담은 이국적인 매력을
													고스란히 품고 있다...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5095282"
														target="_blank">이 책의 eBook : <strong>9,660</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4089088" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4089088','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4089088','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4089088');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4089088');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4089088', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>

									</ul>




									<ul>

										<li><input class="checkbox" type="checkbox"
											value="4053957" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														13 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4053957"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4053/4053957.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4053957"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4053957');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4053957"
														onfocus="this.blur();"> 아몬드 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span> <span
														class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>손원평</span> <span class="gap">|</span> <span>창비</span>
													<span class="txt_date"><span class="gap">|</span> <span>2017.03.31</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">12,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>10,800</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 93%;"></span>
													</div>
													<strong>9.28</strong> <a
														href="/front/product/detailProduct.do?prodId=4053957#sub10"
														target="_blank">리뷰<em>(25)</em></a>
												</dd>
												<dd class="txt_bex">공감 불능 사회, 차가움을 녹이는 아몬드매혹적인 문체, 독특한
													캐릭터, 속도감 넘치는 전개!?“고통과 공감의 능력을 깨우치게 할 강력한 소설” 영화보다 강렬하고
													드라마처럼 팽팽한,...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5033714"
														target="_blank">이 책의 eBook : <strong>8,400</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 2018년
															10월 25일(목) 이내 </strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4053957" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4053957','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4053957','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4053957');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4053957');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4053957', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4201643" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														14 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4201643"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4201/4201643.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4201643"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4201643');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4201643"
														onfocus="this.blur();"> 불안 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>O. Z. 리반엘리</span> <span class="gap">|</span> <span>가쎄</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.09.29</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">13,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>12,420</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 0%;"></span>
													</div>
													<strong>0</strong> <a
														href="/front/product/detailProduct.do?prodId=4201643#sub10"
														target="_blank">리뷰<em>(0)</em></a>
												</dd>
												<dd class="txt_bex">2017년 출간돼 단기간 40만 부가 읽힌 베스트셀러40개국에
													소개된 터키 유명 작가 리반엘리의 신작리반엘리의 소설 『불안(Huzursuzluk)』은 단기간에 40만
													부가 팔려나가...</dd>

												<dd class="txt_contents">
													<span class="tag_event">행사</span> <a
														style="text-decoration: none;"
														href="http://www.bandinlunis.com/front/event/bandi/event1020619.do"
														target="_blank">투표하고 반디상품권 받자</a>

												</dd>




												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4201643" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4201643','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4201643','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4201643');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4201643');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4201643', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="3458073" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														15 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3458073"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3458/3458073.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3458073"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('3458073');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3458073"
														onfocus="this.blur();"> 몽실언니 [개정판] </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>권정생</span> <span class="gap">|</span> <span>창비</span>
													<span class="txt_date"><span class="gap">|</span> <span>2012.04.25</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">10,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>9,000</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 93%;"></span>
													</div>
													<strong>9.33</strong> <a
														href="/front/product/detailProduct.do?prodId=3458073#sub10"
														target="_blank">리뷰<em>(8)</em></a>
												</dd>
												<dd class="txt_bex">- 북트레일러 유튜브:
													http://youtu.be/7RMTF2epKdo 비메오: http://vimeo.com/40913856
													권정생 대표작 [몽실 언니](1984)의 개정 4판...</dd>




												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3458073" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3458073','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3458073','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3458073');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3458073');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3458073', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4186586" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														16 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4186586"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4186/4186586.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4186586"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4186586');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4186586"
														onfocus="this.blur();"> 11문자 살인사건 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>히가시노 게이고</span> <span class="gap">|</span> <span>RHK</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.07.13</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">14,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>13,320</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 91%;"></span>
													</div>
													<strong>9.08</strong> <a
														href="/front/product/detailProduct.do?prodId=4186586#sub10"
														target="_blank">리뷰<em>(24)</em></a>
												</dd>
												<dd class="txt_bex">“죽어도 되는 사람도 있는 거야.”그날, 애인은 어째서 살해당한
													것일까?11글자에서 시작된 의문의 연쇄 살인이것이 바로 히가시노 게이고 미스터리의 진수!일본 최고의
													이야기꾼 히가시...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5275683"
														target="_blank">이 책의 eBook : <strong>10,360</strong>원
													</a></span>
												</dd>


											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4186586" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4186586','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4186586','01');"
														class="btn_num_dn">▼</a></span>
												</dt>





												<dd class="mt3">
													<span class="btn_w_comm btype_f1"><a
														style="cursor: default;">품절</a></span>
												</dd>


												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4186586', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>

									</ul>




									<ul>

										<li><input class="checkbox" type="checkbox"
											value="2935330" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														17 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=2935330"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/2935/2935330.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=2935330"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('2935330');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=2935330"
														onfocus="this.blur();"> 데미안-세계문학전집44 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>헤르만헤세</span> <span class="gap">|</span> <span>민음사</span>
													<span class="txt_date"><span class="gap">|</span> <span>2000.12.20</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">8,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>7,200</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 86%;"></span>
													</div>
													<strong>8.62</strong> <a
														href="/front/product/detailProduct.do?prodId=2935330#sub10"
														target="_blank">리뷰<em>(50)</em></a>
												</dd>
												<dd class="txt_bex">자아의 삶을 추구하는 한 젊음의 통과의례 기록인 이 책은 내
													속에서 솟아 나오려는 것, 바로 그것을 나는 살아보려고 했다. 왜 그것이 그토록 어려웠을까라는 모토를
													앞세운 짧은 철학...</dd>


												<dd class="txt_contents">
													<span class="tag_relation">연관</span> <a
														href="/front/product/bookSeriesView.do?prodRelSeq=11833&listType=series&cateId=2"
														target="_blank"><em>[관련 시리즈]</em>민음사 세계문학전집</a>
												</dd>


												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=7309865"
														target="_blank">이 책의 eBook : <strong>0</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_2935330" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('2935330','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('2935330','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('2935330');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('2935330');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('2935330', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4023105" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														18 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4023105"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4023/4023105.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4023105"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4023105');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4023105"
														onfocus="this.blur();"> 곰돌이 푸 이야기 전집 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>알란 알렉산더 밀른, 어니스트 하워드 쉐퍼드</span> <span class="gap">|</span>
													<span>현대지성</span> <span class="txt_date"><span
														class="gap">|</span> <span>2016.12.24</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">13,800원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>12,420</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 92%;"></span>
													</div>
													<strong>9.25</strong> <a
														href="/front/product/detailProduct.do?prodId=4023105#sub10"
														target="_blank">리뷰<em>(8)</em></a>
												</dd>
												<dd class="txt_bex">세계에서 가장 유명한 곰 ‘곰돌이 푸’오리지널 컬러 일러스트
													독점 수록원작 동화 2권을 한 권에 모두 담아 출간!이 작품은 아들이 가지고 놀던 동물 인형들을 의인화한
													작품으로, 1...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5211585"
														target="_blank">이 책의 eBook : <strong>8,800</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4023105" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4023105','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4023105','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4023105');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4023105');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4023105', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="2914567" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														19 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=2914567"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/2914/2914567.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=2914567"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('2914567');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=2914567"
														onfocus="this.blur();"> 인간실격 - 세계문학전집 103(20쇄) </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>
														<span class="tag_recom"><span>반디추천</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>다자이 오사무</span> <span class="gap">|</span> <span>민음사</span>
													<span class="txt_date"><span class="gap">|</span> <span>2004.05.15</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">8,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>7,200</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 85%;"></span>
													</div>
													<strong>8.52</strong> <a
														href="/front/product/detailProduct.do?prodId=2914567#sub10"
														target="_blank">리뷰<em>(42)</em></a>
												</dd>
												<dd class="txt_bex">작가가 자전적인 체험을 바탕으로, 오직 순수함만을 갈망하던 여린
													심성의 한 젊은이가 인간들의 위선과 잔임함에 의해 파멸되어 가는 과정을 그렸다. 은 어느 누구도 쉽게
													접근할 수 없...</dd>


												<dd class="txt_contents">
													<span class="tag_relation">연관</span> <a
														href="/front/product/bookSeriesView.do?prodRelSeq=11833&listType=series&cateId=2"
														target="_blank"><em>[관련 시리즈]</em>민음사 세계문학전집</a>
												</dd>


												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=7298398"
														target="_blank">이 책의 eBook : <strong>5,600</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 2018년
															10월 25일(목) 이내 </strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_2914567" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('2914567','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('2914567','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('2914567');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('2914567');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('2914567', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>



										<li><input class="checkbox" type="checkbox"
											value="4200746" name="prodId">
											<div class="prod_thumb">
												<span class="ranking"> <span class="rank_num">


														20 </span>
												</span>
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=4200746"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/4200/4200746.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">


													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=4200746"><span
														class="ico_new">새창열기</span></a>
												</div>

												<a class="btn_preview"
													href="javascript:popPreview('4200746');">미리 보기</a>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=4200746"
														onfocus="this.blur();"> 반짝반짝 공화국 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>

														<span class="tag_free"><span>무료배송</span></span>

													</span>
												</dt>
												<dd class="txt_block">
													<span>오가와 이토</span> <span class="gap">|</span> <span>위즈덤하우스</span>
													<span class="txt_date"><span class="gap">|</span> <span>2018.10.05</span></span>
												</dd>
												<dd class="mt5">
													<p>
														<span class="txt_reprice">14,000원</span> <span
															class="txt_arrow">→</span> <span class="txt_price"><strong><em>12,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 98%;"></span>
													</div>
													<strong>9.78</strong> <a
														href="/front/product/detailProduct.do?prodId=4200746#sub10"
														target="_blank">리뷰<em>(9)</em></a>
												</dd>
												<dd class="txt_bex">전하고 싶었던 마음, 듣고 싶었던 말…‘츠바키 문구점’이 다시
													한 번 당신의 마음을 배달합니다. 아름다운 손편지로 누군가의 간절한 마음을 대신 전해주는 가슴 뭉클한
													기적으로 많은 ...</dd>



												<dd class="txt_ebook">
													<span><a
														href="/front/product/detailProduct.do?prodId=5284569"
														target="_blank">이 책의 eBook : <strong>9,800</strong>원
													</a></span>
												</dd>


												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red"> 오늘 </strong>받을 수
														있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_4200746" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('4200746','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('4200746','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('4200746');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('4200746');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('4200746', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>

									</ul>



								</div>


								<!-- 페이징 -->
								<div class="pageTypeA">

									<span class="prev-btn"> <!-- <img src="/images/common/btn_pagePrevG.gif" align="absmiddle" border="0"> -->

										<!-- <img src="/images/common/btn_pagePrev.gif" align="absmiddle" hspace="2" border="0"> -->
									</span> <span class="pageNum"> <a class="on">1</a> <a
										href="/front/product/bookCategoryMain.do?page=2&cateId=2&listType=best">2</a>
										<a
										href="/front/product/bookCategoryMain.do?page=3&cateId=2&listType=best">3</a>
										<a
										href="/front/product/bookCategoryMain.do?page=4&cateId=2&listType=best">4</a>
										<a
										href="/front/product/bookCategoryMain.do?page=5&cateId=2&listType=best">5</a>
									</span> <span class="next-btn"> <!-- <img src="/images/common/btn_pageNext.gif" align="absmiddle" hspace="2" border="0"> -->

									</span>


								</div>

							</div>

						</div>
						<!-- con_t2 -->
					</div>
					<!-- 베스트셀러 끝 -->

					<!-- 새로나온 책 시작  -->
					<div id="menu_new" class="tab-pane fade">
						<div class="con_t2">

							<div class="prod_sort">
								<div class="sorting">
									<input type="hidden" name="sorts" value="">
									<ul class="con01">
										<li><a id="sort1" style="cursor: pointer;" class="on">판매량순</a></li>
										<li><a id="sort2" style="cursor: pointer;">발행일순</a></li>
										<li><a id="sort12" style="cursor: pointer;">등록일순</a></li>
										<li><a id="sort6" style="cursor: pointer;">상품명순</a></li>
										<li><a id="sort11" style="cursor: pointer;">정가인하순</a></li>
										<li class="alt"><a id="sort10" style="cursor: pointer;">가격순</a></li>
									</ul>

								</div>

								<h4>

									<span><strong>새로나온 책</strong>에 총 <strong>5,314</strong>
										권의 정가인하 도서가 등록되어 있습니다. </span>



								</h4>
								<p class="btn_cart">
									<span><input type="checkbox" name="prodIds" class="chk"
										onclick="javascript:check_all(document.getElementsByName('prodId'), this.checked);">
										전체</span> <a href="javascript:addCarts();"><span
										class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
										href="javascript:addWishes();"><span
										class="btn_w_comm btype_a2">위시리스트</span></a>
								</p>
							</div>
							<div class="fl_clear ml5">
								<div class="prod_list_type  ">

									<ul>

										<!-- 리스트 1개 시작  -->
										<li><input class="checkbox" type="checkbox"
											value="3795041" name="prodId">
											<div class="prod_thumb">
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">

													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3795041"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> [정가인하] 한국사를 바꿀 14가지 거짓과 진실 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
													<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
												</dd>


												<dd class="mt5">
													<p>
														<span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span
															class="txt_arrow">→</span> <span class="txt_reprice2">4,000원
															[<strong>69%</strong> 정가인하]
														</span>
													</p>
													<p class="mt5">
														<span class="txt_price"><strong><em>3,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 80.50%"></span>
													</div>
													<span class="ratings_num"> <strong>8.05</strong> <a
														href="/front/product/detailProduct.do?prodId=3795041#sub10"
														target="_blank">리뷰<em>(19)</em></a>
													</span>
												</dd>
												<dd class="txt_bex">추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은
													위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것
													같던 흉노와 신...</dd>
												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red">2018년
															10월 20일(토) 이내</strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3795041" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3795041','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3795041','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3795041');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3795041');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3795041', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>
										<!-- 리스트 1개 끝  -->


										<!-- 리스트 2번째 시작  -->
										<li><input class="checkbox" type="checkbox"
											value="3795041" name="prodId">
											<div class="prod_thumb">
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">

													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3795041"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> [정가인하] 한국사를 바꿀 14가지 거짓과 진실 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
													<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
												</dd>


												<dd class="mt5">
													<p>
														<span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span
															class="txt_arrow">→</span> <span class="txt_reprice2">4,000원
															[<strong>69%</strong> 정가인하]
														</span>
													</p>
													<p class="mt5">
														<span class="txt_price"><strong><em>3,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 80.50%"></span>
													</div>
													<span class="ratings_num"> <strong>8.05</strong> <a
														href="/front/product/detailProduct.do?prodId=3795041#sub10"
														target="_blank">리뷰<em>(19)</em></a>
													</span>
												</dd>
												<dd class="txt_bex">추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은
													위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것
													같던 흉노와 신...</dd>
												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red">2018년
															10월 20일(토) 이내</strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3795041" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3795041','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3795041','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3795041');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3795041');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3795041', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>
										<!-- 리스트 2번째 끝  -->


										<!-- 리스트 3번째 시작  -->
										<li><input class="checkbox" type="checkbox"
											value="3795041" name="prodId">
											<div class="prod_thumb">
												<div class="prod_thumb_img">
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> <img
														src="http://image.bandinlunis.com/upload/product/3795/3795041.jpg"
														onerror="this.src='/images/common/noimg_type01.gif';">

													</a> <a class="btn_popup" target="_blank"
														href="/front/product/detailProduct.do?prodId=3795041"><span
														class="ico_new">새창열기</span></a>
												</div>

											</div>
											<dl class="prod_info">
												<dt>
													<a href="/front/product/detailProduct.do?prodId=3795041"
														onfocus="this.blur();"> [정가인하] 한국사를 바꿀 14가지 거짓과 진실 </a>
													<!-- <span class="tit_sub">- 덧셈구구</span> -->
													<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


													</span>
												</dt>
												<dd class="txt_block">
													<span>KBS역사추적팀, 윤영수</span> <span class="gap">|</span> <span>지식파수꾼</span>
													<span class="txt_date"><span class="gap">|</span> <span>2011.05.11</span></span>
												</dd>


												<dd class="mt5">
													<p>
														<span class="txt_junga">정가 <span class="txt_junga">13,000원</span></span><span
															class="txt_arrow">→</span> <span class="txt_reprice2">4,000원
															[<strong>69%</strong> 정가인하]
														</span>
													</p>
													<p class="mt5">
														<span class="txt_price"><strong><em>3,600</em>원</strong>
															(10%↓+5%P)</span>
													</p>
												</dd>
												<dd class="txt_desc">
													<div class="review_point">
														<span style="width: 80.50%"></span>
													</div>
													<span class="ratings_num"> <strong>8.05</strong> <a
														href="/front/product/detailProduct.do?prodId=3795041#sub10"
														target="_blank">리뷰<em>(19)</em></a>
													</span>
												</dd>
												<dd class="txt_bex">추적과 추리의 역사 장금이는 요리사였을까? 정말 계백장군은
													위대했고, 의자왕은 무기력했을까? KBS 역사추적은 ‘과연?’이라는 물음에서 시작된다. 전혀 관계없을 것
													같던 흉노와 신...</dd>
												<dd class="txt_ebook">
													<span>지금 주문하면<strong class="t_red">2018년
															10월 20일(토) 이내</strong>받을 수 있습니다.
													</span>
												</dd>

											</dl>
											<dl class="prod_btn">
												<dt>
													<span class="num_txt">수량</span> <input type="text"
														id="cntVal_3795041" value="1" class="num" size="3"
														maxlength="2" onkeydown="onlyNumber();" onkeyup="">
													<span class="btn_updn_wrap"><a
														href="javascript:cntUp('3795041','01');"
														class="btn_num_up">▲</a><a
														href="javascript:cntDown('3795041','01');"
														class="btn_num_dn">▼</a></span>
												</dt>



												<dd>
													<a href="javascript:addCart('3795041');"><span
														class="btn_b_comm btype_f1">쇼핑카트</span></a>
												</dd>
												<dd class="mt3">
													<a href="javascript:goOrder('3795041');"><span
														class="btn_w_comm btype_f1">바로구매</span></a>
												</dd>




												<dd class="mt3">
													<a
														href="javascript:add_wish_array_common('3795041', true);"><span
														class="btn_w_comm btype_f1">위시리스트</span></a>
												</dd>
											</dl></li>
										<!-- 리스트 3번째 끝  -->


									</ul>

								</div>

							</div>
							<!-- 베스트셀러 끝 -->

							<!-- 페이징 -->
							<div class="pageTypeA">
								<span class="prev-btn"> <!-- <img src="/images/common/btn_pagePrevG.gif" align="absmiddle" border="0"> -->

									<!-- <img src="/images/common/btn_pagePrev.gif" align="absmiddle" hspace="2" border="0"> -->
								</span> <span class="pageNum"> <a class="on">1</a> <a
									href="/front/display/discountBookList.do?page=2#tabMenu">2</a>
									<a href="/front/display/discountBookList.do?page=3#tabMenu">3</a>
									<a href="/front/display/discountBookList.do?page=4#tabMenu">4</a>
									<a href="/front/display/discountBookList.do?page=5#tabMenu">5</a>
									<a href="/front/display/discountBookList.do?page=6#tabMenu">6</a>
									<a href="/front/display/discountBookList.do?page=7#tabMenu">7</a>
									<a href="/front/display/discountBookList.do?page=8#tabMenu">8</a>
									<a href="/front/display/discountBookList.do?page=9#tabMenu">9</a>
									<a href="/front/display/discountBookList.do?page=10#tabMenu">10</a>
								</span> <span class="next-btn"> <a
									href="/front/display/discountBookList.do?page=11#tabMenu"><img
										src="/images/common/btn_pageNext.gif" align="absmiddle"
										hspace="2" border="0"></a>

								</span>

							</div>

							<div class="prod_sort_b">
								<span><input type="checkbox" name="prodIds" class="chk"
									onclick="javascript:check_all(document.getElementsByName('prodId'), this.checked);">
									전체</span> <a href="javascript:addCarts();"><span
									class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
									href="javascript:addWishes();"><span
									class="btn_w_comm btype_a2">위시리스트</span></a>
							</div>



						</div>

					</div>
					<!-- 새로나온 책 끝  -->



					<!-- 정가인하 시작 -->
					<div id="menu_discount" class="tab-pane fade">
						<div class="con_t2">
							<div class="prod_sort">


								<h4>

									<span><strong>전체</strong>에 총 <strong>${dataCount }</strong>
										권의 정가인하 도서가 등록되어 있습니다. </span>

								</h4>
								<p class="btn_cart">
									<span><input type="checkbox" name="prodIds" class="chk"
										onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);">
										전체</span> <a href="javascript:addCarts();"><span
										class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
										href="javascript:addWishes();"><span
										class="btn_w_comm btype_a2">위시리스트</span></a>
								</p>
							</div>

							<div class="fl_clear ml5">
								<c:forEach var="dto" items="${lists }">
									<div class="prod_list_type  ">

										<ul>

											<!-- 리스트 1개 시작  -->
											<li><input class="checkbox" type="checkbox"
												value="${dto.isbn }" name="isbn">
												<div class="prod_thumb">
													<div class="prod_thumb_img">
														<a href="/front/product/detailProduct.do?isbn=3795041"
															onfocus="this.blur();"> <img
															src="<%=cp %>/resources/image/book/${dto.bookImage }">
														</a> <a class="btn_popup" target="_blank"
															href="/front/product/detailProduct.do?isbn=3795041"><span
															class="ico_new">새창열기</span></a>
													</div>

												</div>
												<dl class="prod_info">
													<dt>
														<a href="/front/product/detailProduct.do?isbn=3795041"
															onfocus="this.blur();"> [정가인하] ${dto.bookTitle } </a>
														<!-- <span class="tit_sub">- 덧셈구구</span> -->
														<span class="tag_area"> <span class="tag_best"><span>베스트</span></span>


														</span>
													</dt>
													<dd class="txt_block">
														<span>${dto.authorName }</span> <span class="gap">|</span>
														<span>${dto.publisher }</span> <span class="txt_date"><span
															class="gap">|</span> <span>${dto.publishDate }</span></span>
													</dd>


													<dd class="mt5">
														<p>
															<span class="txt_junga">정가 <span class="txt_junga">${dto.bookPrice }원</span></span><span
																class="txt_arrow">→</span> <span class="txt_reprice2">${dto.discountedPrice }원
																[<strong>${dto.discountRate }%</strong> 정가인하]
															</span>
														</p>
														<p class="mt5">
															<span class="txt_price"><strong><em><fmt:formatNumber
																			value="${dto.discountedPrice*0.9 }" type="number" /></em>원</strong>
																(10%↓+5%P)</span>
														</p>
													</dd>
													<dd class="txt_desc">
														<div class="review_point">
															<span style="width: ${dto.rate*10}%"></span>
														</div>
														<span class="ratings_num"> <strong>${dto.rate }</strong>
															<a
															href="/front/product/detailProduct.do?isbn=3795041#sub10"
															target="_blank">리뷰<em>(${dto.reviewCnt })</em></a>
														</span>
													</dd>
													<dd class="txt_bex">${dto.introduction }</dd>
													<dd class="txt_ebook">
														<span>지금 주문하면 <strong class="t_red">내일</strong> 받을
															수 있습니다.
														</span>
													</dd>

												</dl>
												<dl class="prod_btn">
													<dt>
														<span class="num_txt">수량</span> <input type="text"
															id="cntVal_${dto.isbn }" value="1" class="num" size="3"
															maxlength="2" onkeydown="onlyNumber();" onkeyup="">
														<span class="btn_updn_wrap"><a
															href="javascript:cntUp('${dto.isbn }');"
															class="btn_num_up">▲</a><a
															href="javascript:cntDown('${dto.isbn }');"
															class="btn_num_dn">▼</a></span>
													</dt>

													<dd>
														<a href="javascript:addCart('${dto.isbn }');"><span
															class="btn_b_comm btype_f1">쇼핑카트</span></a>
													</dd>
													<dd class="mt3">
														<a href="javascript:goOrder('${dto.isbn }');"><span
															class="btn_w_comm btype_f1">바로구매</span></a>
													</dd>
													<dd class="mt3">
														<a
															href="javascript:add_wish_array_common('${dto.isbn }', true);"><span
															class="btn_w_comm btype_f1">위시리스트</span></a>
													</dd>
												</dl></li>
											<!-- 리스트 1개 끝  -->

										</ul>

									</div>
								</c:forEach>


								<c:if test="${dataCount!=0 }">
							${pageIndexListforJ }
						</c:if>
								<c:if test="${dataCount==0 }">
									<div class="pageTypeA">
										<span class="pageNum"> 등록된 책이 없습니다. </span>
									</div>
								</c:if>


								<div class="prod_sort_b">
									<span><input type="checkbox" name="prodIds" class="chk"
										onclick="javascript:check_all(document.getElementsByName('isbn'), this.checked);">
										전체</span> <a href="javascript:addCarts();"><span
										class="btn_w_comm btype_a2">쇼핑카트</span></a> <a
										href="javascript:addWishes();"><span
										class="btn_w_comm btype_a2">위시리스트</span></a>
								</div>



							</div>





						</div>

					</div>
					<!-- 정가인하 끝 -->



				</div>
				<!-- tabContent -->

			</div>
			<!-- Dynamic Tabs Div -->

		</div>

		<!-- 가운데 레이아웃 -->


	</div>
	<!-- footer -->
	<jsp:include page="../../../common/footer.jsp" flush="false" />
</body>
</html>