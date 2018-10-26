<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webproject/resources/css/searchN.css"
	type="text/css">
</head>
<body><jsp:include page="../search/header.jsp" flush="false" /></body>
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
								id="slider-range-pdate1" value="0"> <input type="hidden"
								id="slider-range-pdate2" value="12">
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
		<!--// 검색 옵션 영역 --> <!-- 작가 소개 영역 -->
		<div class="info_writer" id="AREA_G_1" style="display: none;"></div>
		<!--// 작가 소개 영역 --> <!-- 시리즈 영역 -->
		<div class="info_serise" id="AREA_C_3_A" style="display: none;">
			<dl class="list_style2" id="AREA_C_3_1"></dl>
		</div>
		<!--// 시리즈 영역 --> <!-- 수상작 영역 -->
		<div class="info_serise" id="AREA_C_3_B" style="display: none;">
			<dl class="list_style2" id="AREA_C_3_2"></dl>
		</div>
		<!--// 수상작 영역 --> <!-- 검색 리스트 시작 -->

		<div class="view_type" id="AREA_G_2">
			<ul>
				<li>
					<div class="thumb_area" onmouseover="onImage(4109026);"
						onmouseout="outImage(4109026);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=4109026"> <img
								src="http://image.bandinlunis.com/upload/product/4109/4109026.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
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
								class="tit_category">[도서]</span><strong>세월의 <em
									class="emph_on">설거지</em></strong></a> <span class="tit_sub">- 안정효의
								3인칭 자서전</span>
							<div class="tag_area">
								<span class="tag_recom"><span>반디 추천</span></span><span
									class="tag_free"><span>무료 배송</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('안정효');">안정효</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('세경북스');">세경북스</a></span><span
								class="pubdate">2017년 10월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>17,000원</span> → <strong><em>15,300</em>원</strong> (<em>10%</em>할인
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
				<li>
					<div class="thumb_area" onmouseover="onImage(4202644);"
						onmouseout="outImage(4202644);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=4202644"> <img
								src="http://image.bandinlunis.com/upload/product/4202/4202644.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=4202644"
								class="btn_new" id="blank_link_4202644" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a> <a
								href="javascript:popPreview(4202644);" class="btn_preview"
								id="preview_link_4202644"><span class="ico_preview">미리
									보기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=4202644"><span
								class="tit_category">[도서]</span><strong><em
									class="emph_on">설거지</em> 누가 할래</strong></a> <span class="tit_sub">-
								오래오래 행복하게, 집안일은 공평하게</span>
							<div class="tag_area">
								<span class="tag_best"><span>베스트</span></span><span
									class="tag_free"><span>무료 배송</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('야마우치 마리코');">야마우치
										마리코</a> 저
							</span><span class="translator"><a href="#"
									onclick="javascript:changeKwd('황혜숙');">황혜숙</a> 역</span><span
								class="publisher"><a href="#"
									onclick="javascript:changeKwd('웅진지식하우스');">웅진지식하우스</a></span><span
								class="pubdate">2018년 10월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>13,800원</span> → <strong><em>12,420</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 100%"></span>
							</div>
							<strong>10</strong> <a
								href="/front/product/detailProduct.do?prodId=4202644#sub10"
								target="_blank">리뷰<em>(1)</em></a>
						</dd>
						<dd class="txt_ebook">
							<span><a
								href="/front/product/detailProduct.do?prodId=5290074"
								target="_blank">이 책의 eBook : <strong>9,700</strong>원
							</a></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="4202644"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_4202644" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('4202644','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('4202644','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(4202644);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(4202644);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(4202644, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(2655285);"
						onmouseout="outImage(2655285);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=2655285"> <img
								src="http://image.bandinlunis.com/upload/product/largeimage/2655285.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=2655285"
								class="btn_new" id="blank_link_2655285" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=2655285"><span
								class="tit_category">[도서]</span><strong>여보게<em
									class="emph_on">설거지</em>는했는가
							</strong></a>
							<div class="tag_area">
								<span class="tag_free"><span>무료 배송</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('활안대선사');">활안대선사</a>
									저
							</span><span class="translator"><a href="#"
									onclick="javascript:changeKwd('김성우');">김성우</a> 역</span><span
								class="publisher"><a href="#"
									onclick="javascript:changeKwd('휴먼앤북스');">휴먼앤북스</a></span><span
								class="pubdate">2007년 03월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>13,500원</span> → <strong><em>12,150</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_soldout">
							<span><strong>품절된 상품입니다.</strong></span>
						</dd>
						<dd class="txt_ebook">
							<span><a
								href="/front/product/detailProduct.do?prodId=7066114"
								target="_blank">이 책의 eBook : <strong>8,100</strong>원
							</a></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dd>
							<span class="btn_type white"><a style="cursor: default;">품절/절판</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(2655285, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(2620405);"
						onmouseout="outImage(2620405);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=2620405"> <img
								src="http://image.bandinlunis.com/upload/product/largeimage/2620405.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=2620405"
								class="btn_new" id="blank_link_2620405" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=2620405"><span
								class="tit_category">[도서]</span><strong><em
									class="emph_on">설거지</em> 그리고 주식투자</strong></a>
							<div class="tag_area">
								<span class="tag_free"><span>무료 배송</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('김종서');">김종서</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('참콘경제연구소');">참콘경제연구소</a></span><span
								class="pubdate">2006년 11월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>12,000원</span> → <strong><em>10,800</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_soldout">
							<span><strong>품절된 상품입니다.</strong></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dd>
							<span class="btn_type white"><a style="cursor: default;">품절/절판</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(2620405, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area product" onmouseover="onImage(5151039);"
						onmouseout="outImage(5151039);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=5151039"> <img
								src="http://image.bandinlunis.com/upload/product/5151/5151039_0.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=5151039"
								class="btn_new" id="blank_link_5151039" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=5151039"><span
								class="tit_category">[오피스문구]</span><strong>[104889]참그린
									석류식초 <em class="emph_on">설거지</em> 450ml
							</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('');"></a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('LG생활건강');">LG생활건강</a></span><span
								class="pubdate">2017년 11월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>4,500원</span> → <strong><em>3,900</em>원</strong> (<em>13%</em>할인
								+ <em>1%</em>포인트)
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
							<input id="" type="checkbox" class="checkbox" value="5151039"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_5151039" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('5151039','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('5151039','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(5151039);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(5151039);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(5151039, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(3084148);"
						onmouseout="outImage(3084148);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=3084148"> <img
								src="http://image.bandinlunis.com/upload/product/3084/3084148.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=3084148"
								class="btn_new" id="blank_link_3084148" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=3084148"><span
								class="tit_category">[도서]</span><strong><em
									class="emph_on">설거지</em>를 끝내고 나서</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('이재숙');">이재숙</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('보는소리');">보는소리</a></span><span
								class="pubdate">2010년 01월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>11,000원</span> → <strong><em>9,900</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_ebook">
							<span><a
								href="/front/product/detailProduct.do?prodId=7196467"
								target="_blank">이 책의 eBook : <strong>4,400</strong>원
							</a></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="3084148"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_3084148" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('3084148','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('3084148','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(3084148);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(3084148);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(3084148, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(2517351);"
						onmouseout="outImage(2517351);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=2517351"> <img
								src="http://image.bandinlunis.com/upload/product/largeimage/2517351.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=2517351"
								class="btn_new" id="blank_link_2517351" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=2517351"><span
								class="tit_category">[도서]</span><strong><em
									class="emph_on">설거지</em>하는대통령님</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('최운상');">최운상</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('순수');">순수</a></span><span
								class="pubdate">2005년 11월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>7,000원</span> → <strong><em>6,300</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_soldout">
							<span><strong>품절된 상품입니다.</strong></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dd>
							<span class="btn_type white"><a style="cursor: default;">품절/절판</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(2517351, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(1613467);"
						onmouseout="outImage(1613467);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=1613467"> <img
								src="http://image.bandinlunis.com/upload/product/largeimage/1613467.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=1613467"
								class="btn_new" id="blank_link_1613467" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=1613467"><span
								class="tit_category">[도서]</span><strong><em
									class="emph_on">설거지</em>보다쉬운인터넷</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('진미령');">진미령</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('문학세계사');">문학세계사</a></span><span
								class="pubdate">2000년 02월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>8,500원</span> → <strong><em>7,650</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_soldout">
							<span><strong>품절된 상품입니다.</strong></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dd>
							<span class="btn_type white"><a style="cursor: default;">품절/절판</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(1613467, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(7811202);"
						onmouseout="outImage(7811202);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=7811202"> <img
								src="http://image.bandinlunis.com/images/common/bookImg_19.gif"
								alt="">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=7811202"
								class="btn_new" id="blank_link_7811202" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=7811202"><span
								class="tit_category">[eBook]</span><strong><span
									id="7811202"></span>노팬티 <em class="emph_on">설거지</em> 아줌마를 - 밤에
									읽는 책 87</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('적파랑');">적파랑</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('so what');">so what</a></span><span
								class="pubdate">2016년 03월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>1,000원</span> → <strong><em>1,000</em>원</strong> (<em>0%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 0.61Mbyte</span> <span>지원 기기 : 크레마(전자책), 아이폰,
								아이패드, 안드로이드폰, 안드로이드패드, PC</span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="7811202"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_7811202" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('7811202','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('7811202','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(7811202);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(7811202, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(7066114);"
						onmouseout="outImage(7066114);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=7066114"> <img
								src="http://image.bandinlunis.com/upload/product/largeimage/2655285.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=7066114"
								class="btn_new" id="blank_link_7066114" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=7066114"><span
								class="tit_category">[eBook]</span><strong><span
									id="7066114"></span>여보게, <em class="emph_on">설거지</em>는 했는가</strong></a>
							<div class="tag_area">
								<span class="tag_best"><span>베스트</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('활안 대선사 저/김성우 엮음');">활안
										대선사 저/김성우 엮음</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('휴먼&amp;북스');">휴먼&amp;북스</a></span><span
								class="pubdate">2007년 03월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>8,100원</span> → <strong><em>8,100</em>원</strong> (<em>10%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 4.7Mbyte</span> <span>지원 기기 : 크레마(전자책), 아이폰,
								아이패드, 안드로이드폰, 안드로이드패드, PC</span>
						</dd>
						<dd class="txt_ebook">
							<span><a
								href="/front/product/detailProduct.do?prodId=2655285"
								target="_blank">이 책의 종이책 : <strong>12,150</strong>원
							</a></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="7066114"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_7066114" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('7066114','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('7066114','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:add_basket_ebook(7066114,1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(7066114);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(7066114, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(5290074);"
						onmouseout="outImage(5290074);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=5290074"> <img
								src="http://image.bandinlunis.com/upload/product/5290/5290074.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=5290074"
								class="btn_new" id="blank_link_5290074" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=5290074"><span
								class="tit_category">[eBook]</span><strong><span
									id="5290074"></span><em class="emph_on">설거지</em> 누가 할래 : 오래오래
									행복하게, 집안일은 공평하게</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('야마우치 마리코');">야마우치
										마리코</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('웅진지식하우스');">웅진지식하우스</a></span><span
								class="pubdate">2018년 10월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>9,700원</span> → <strong><em>9,700</em>원</strong> (<em>0%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 39.57Mbyte</span> <span>지원 기기 : 크레마(전자책),
								아이폰, 아이패드, PC</span>
						</dd>
						<dd class="txt_ebook">
							<span><a
								href="/front/product/detailProduct.do?prodId=4202644"
								target="_blank">이 책의 종이책 : <strong>12,420</strong>원
							</a></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="5290074"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_5290074" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('5290074','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('5290074','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:add_basket_ebook(5290074,1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(5290074);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(5290074, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area product" onmouseover="onImage(G0029F1);"
						onmouseout="outImage(G0029F1);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=G0029F1"> <img
								src="http://image.bandinlunis.com/upload/product/G002/G0029F1.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=G0029F1"
								class="btn_new" id="blank_link_G0029F1" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a> <a
								href="javascript:goZoomProduct(G0029F1);" class="btn_large"><span
								class="ico_large">미리 보기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=G0029F1"><span
								class="tit_category">[GIFT]</span><strong>주방 <em
									class="emph_on">설거지</em> 매직 싹싹 수세미 실리콘 고무 장갑
							</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="publisher"><a
									href="#" onclick="javascript:changeKwd('갓샵');">갓샵</a></span><span
								class="pubdate">2018년 07월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>30,000원</span> → <strong><em>23,400</em>원</strong> (<em>22%</em>할인
								+ <em>1%</em>포인트)
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
							<input id="" type="checkbox" class="checkbox" value="G0029F1"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_G0029F1" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('G0029F1','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('G0029F1','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(G0029F1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(G0029F1);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(G0029F1, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(5185573);"
						onmouseout="outImage(5185573);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=5185573"> <img
								src="http://image.bandinlunis.com/upload/product/5185/5185573.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=5185573"
								class="btn_new" id="blank_link_5185573" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=5185573"><span
								class="tit_category">[eBook]</span><strong><span
									id="5185573"></span>왜 엄마만 <em class="emph_on">설거지</em> 해? - 자녀와
									함께하는 글쓰기</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('손바닥논술연구소');">손바닥논술연구소</a>
									저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('그린북아시아');">그린북아시아</a></span><span
								class="pubdate">2018년 01월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>900원</span> → <strong><em>900</em>원</strong> (<em>0%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 4.1Mbyte</span> <span>지원 기기 : 크레마(전자책), 아이폰,
								아이패드, 안드로이드폰, 안드로이드패드, PC</span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="5185573"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_5185573" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('5185573','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('5185573','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:add_basket_ebook(5185573,1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(5185573);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(5185573, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(7196467);"
						onmouseout="outImage(7196467);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=7196467"> <img
								src="http://image.bandinlunis.com/upload/product/3084/3084148.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=7196467"
								class="btn_new" id="blank_link_7196467" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=7196467"><span
								class="tit_category">[eBook]</span><strong><span
									id="7196467"></span><em class="emph_on">설거지</em>를 끝내고 나서</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('이재숙');">이재숙</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('보는소리');">보는소리</a></span><span
								class="pubdate">2010년 01월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>4,400원</span> → <strong><em>4,400</em>원</strong> (<em>0%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 0.57Mbyte</span> <span>지원 기기 : 크레마(전자책), 아이폰,
								아이패드, 안드로이드폰, 안드로이드패드, PC</span>
						</dd>
						<dd class="txt_ebook">
							<span><a
								href="/front/product/detailProduct.do?prodId=3084148"
								target="_blank">이 책의 종이책 : <strong>9,900</strong>원
							</a></span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="7196467"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_7196467" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('7196467','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('7196467','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:add_basket_ebook(7196467,1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(7196467);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(7196467, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area product" onmouseover="onImage(5150956);"
						onmouseout="outImage(5150956);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=5150956"> <img
								src="http://image.bandinlunis.com/upload/product/5150/5150956_0.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=5150956"
								class="btn_new" id="blank_link_5150956" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=5150956"><span
								class="tit_category">[오피스문구]</span><strong>프라임핸디<em
									class="emph_on">설거지</em>통(대/그린/창신리빙)
							</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('');"></a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('창신리빙');">창신리빙</a></span><span
								class="pubdate">2017년 11월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>19,000원</span> → <strong><em>16,300</em>원</strong> (<em>14%</em>할인
								+ <em>1%</em>포인트)
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
							<input id="" type="checkbox" class="checkbox" value="5150956"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_5150956" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('5150956','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('5150956','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(5150956);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(5150956);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(5150956, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area product" onmouseover="onImage(6697792);"
						onmouseout="outImage(6697792);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=6697792"> <img
								src="http://image.bandinlunis.com/upload/product/6697/6697792_0.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=6697792"
								class="btn_new" id="blank_link_6697792" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a> <a
								href="javascript:goZoomProduct(6697792);" class="btn_large"><span
								class="ico_large">미리 보기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=6697792"><span
								class="tit_category">[GIFT]</span><strong>스테인레스 타원형 <em
									class="emph_on">설거지</em>대야 [w173]
							</strong></a>
							<div class="tag_area">
								<span class="tag_free"><span>무료 배송</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="publisher"><a
									href="#" onclick="javascript:changeKwd('어반띵즈');">어반띵즈</a></span><span
								class="pubdate">2016년 09월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>53,000원</span> → <strong><em>53,000</em>원</strong> (<em>0%</em>할인
								+ <em>1%</em>포인트)
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
							<input id="" type="checkbox" class="checkbox" value="6697792"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_6697792" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('6697792','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('6697792','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(6697792);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(6697792);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(6697792, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area product" onmouseover="onImage(6697793);"
						onmouseout="outImage(6697793);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=6697793"> <img
								src="http://image.bandinlunis.com/upload/product/6697/6697793_0.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=6697793"
								class="btn_new" id="blank_link_6697793" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a> <a
								href="javascript:goZoomProduct(6697793);" class="btn_large"><span
								class="ico_large">미리 보기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=6697793"><span
								class="tit_category">[GIFT]</span><strong>스테인레스 D형 <em
									class="emph_on">설거지</em>대야 [w171]
							</strong></a>
							<div class="tag_area">
								<span class="tag_free"><span>무료 배송</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="publisher"><a
									href="#" onclick="javascript:changeKwd('어반띵즈');">어반띵즈</a></span><span
								class="pubdate">2016년 09월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>53,000원</span> → <strong><em>53,000</em>원</strong> (<em>0%</em>할인
								+ <em>1%</em>포인트)
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
							<input id="" type="checkbox" class="checkbox" value="6697793"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_6697793" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('6697793','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('6697793','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(6697793);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(6697793);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(6697793, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(7469844);"
						onmouseout="outImage(7469844);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=7469844"> <img
								src="http://image.bandinlunis.com/upload/product/7469/7469844.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=7469844"
								class="btn_new" id="blank_link_7469844" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=7469844"><span
								class="tit_category">[eBook]</span><strong><span
									id="7469844"></span>여보게, <em class="emph_on">설거지</em>는 했는가</strong></a>
							<div class="tag_area">
								<span class="tag_best"><span>베스트</span></span>
							</div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('활안 대선사 저/김성우 엮음');">활안
										대선사 저/김성우 엮음</a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('휴먼&amp;북스');">휴먼&amp;북스</a></span><span
								class="pubdate">2014년 01월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>8,100원</span> → <strong><em>8,100</em>원</strong> (<em>0%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 4.7Mbyte</span> <span>지원 기기 : 크레마(전자책), 아이폰,
								아이패드, 안드로이드폰, 안드로이드패드, PC</span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="7469844"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_7469844" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('7469844','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('7469844','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:add_basket_ebook(7469844,1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(7469844);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(7469844, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area" onmouseover="onImage(5045573);"
						onmouseout="outImage(5045573);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=5045573"> <img
								src="http://image.bandinlunis.com/upload/product/5045/5045573.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=5045573"
								class="btn_new" id="blank_link_5045573" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=5045573"><span
								class="tit_category">[eBook]</span><strong><span
									id="5045573"></span>신진대사와 조직갈등 : 과거를 <em class="emph_on">설거지</em>하자</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('서울교육방송');">서울교육방송</a>
									저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('미디어 북');">미디어 북</a></span><span
								class="pubdate">2017년 04월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>500원</span> → <strong><em>500</em>원</strong> (<em>0%</em>할인
								+ <em>5%</em>포인트)
							</p>
						</dd>
						<dd class="txt_desc">
							<div class="review_point">
								<span style="width: 0%"></span>
							</div>
						</dd>
						<dd class="txt_file">
							<span>파일크기 : 0.2Mbyte</span> <span>지원 기기 : 크레마(전자책), 아이폰,
								아이패드, 안드로이드폰, 안드로이드패드, PC</span>
						</dd>
					</dl>
					<dl class="btn_area">
						<dt>
							<input id="" type="checkbox" class="checkbox" value="5045573"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_5045573" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('5045573','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('5045573','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:add_basket_ebook(5045573,1);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(5045573);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(5045573, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
				<li>
					<div class="thumb_area product" onmouseover="onImage(5150955);"
						onmouseout="outImage(5150955);">
						<div class="thumb_left_big">
							<a href="/front/product/detailProduct.do?prodId=5150955"> <img
								src="http://image.bandinlunis.com/upload/product/5150/5150955_0.jpg"
								onerror="this.src='/images/common/noimg_type01.gif'">
							</a>
						</div>
						<div class="btn_popup">
							<a href="/front/product/detailProduct.do?prodId=5150955"
								class="btn_new" id="blank_link_5150955" target="_blank"
								style="display: none;"><span class="ico_new">새창열기</span></a>
						</div>
					</div>
					<dl class="book_contents">
						<dt>
							<a href="/front/product/detailProduct.do?prodId=5150955"><span
								class="tit_category">[오피스문구]</span><strong>프라임핸디<em
									class="emph_on">설거지</em>통(대/화이트/창신리빙)
							</strong></a>
							<div class="tag_area"></div>
						</dt>
						<dd class="txt_block">
							<span class="info"><span class="author first_child">
									<a href="#" onclick="javascript:changeKwd('');"></a> 저
							</span><span class="publisher"><a href="#"
									onclick="javascript:changeKwd('창신리빙');">창신리빙</a></span><span
								class="pubdate">2017년 11월</span></span>
						</dd>
						<dd class="txt_price">
							<p>
								<span>19,000원</span> → <strong><em>16,300</em>원</strong> (<em>14%</em>할인
								+ <em>1%</em>포인트)
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
							<input id="" type="checkbox" class="checkbox" value="5150955"
								title="선택"><span class="num_txt">수량</span><input
								type="text" id="cntVal_5150955" value="1" class="num" size="3"
								maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
								class="btn_updn_wrap"><a
								href="javascript:cntUp('5150955','01');" class="btn_num_up">▲</a><a
								href="javascript:cntDown('5150955','01');" class="btn_num_dn">▼</a></span>
						</dt>
						<dd>
							<span class="btn_type brown"><a
								href="javascript:addCart(5150955);">쇼핑카트</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:goOrder(5150955);">바로구매</a></span>
						</dd>
						<dd>
							<span class="btn_type white"><a
								href="javascript:add_wish_array_common(5150955, true);">위시리스트</a></span>
						</dd>
					</dl>
				</li>
			</ul>
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
		<!--// 페이징 영역 --> <!-- 컨텐츠 영역 --> <article class="pop_cont"
			id="AREA_G_3_1" style=""> <header class="cont_bg">
		<hgroup>
		<h2>
			오늘의 책 <span id="AREA_G_3_1_TOTAL">(7)</span>
		</h2>
		<h3>반디앤루니스와 리뷰어들이 함께 읽고 쓴 독서 감상기입니다.</h3>
		</hgroup> <a href="#" onclick="showMoreTodayBook(this);" class="link_more"
			style="display: block;">더보기</a> </header> <article class="cont_wrap">
		<ul id="AREA_G_3_1_DETAIL">
			<li class="first_child">
				<div class="thumb_left_big">
					<a
						href="/front/display/recommendToday.do?todayYear=2008&amp;todayMonth=12&amp;todayDay=24"
						target="_blank"> <img
						src="http://image.bandinlunis.com/upload/product/2878/2878942_s.jpg"
						onerror="this.src='/images/common/noimg_type01.gif'"> <span
						class="mask"></span>
					</a>
				</div>
				<div class="book_content">
					<hgroup>
					<h4>
						<a
							href="/front/display/recommendToday.do?todayYear=2008&amp;todayMonth=12&amp;todayDay=24"
							target="_blank">개인용 머그잔을 사용하는 당신에게</a> <span>&lt;2008년 12월
							24일 오늘의 책&gt;</span>
					</h4>
					<h5>
						<a href="/front/product/detailProduct.do?prodId=2878942"
							target="_blank">하린맘의 친환경 살림법</a>
					</h5>
					</hgroup>
					<div class="book_info">
						<span class="first_chaild">정미경 저</span> <span>중앙엠앤비</span>
					</div>
					<p>
						&nbsp; &nbsp; #1. 큰 그릇에 한꺼번에 반찬 담아 설거짓감 줄이기 식기 세척기를 사용하면 손으로 <em
							class="emph_on">설거지</em>할 때보다 물 소비량이 70% 줄어든다. 큰 접시에 여러 나물을 함께
						담아내는 것도 방법이다. #2. 캔보다는 유리병에 담긴 음료 마시기 알루미늄 캔 내부는 플라스틱으로 코팅돼 있어,
						뜨거운 음료나 먹다 남은 용기에서 환경호르몬 비스페놀이 나올 수 있다. #3. 비닐봉지 ...
					</p>
				</div>
			</li>
			<li>
				<div class="thumb_left_big">
					<a
						href="/front/display/recommendToday.do?todayYear=2012&amp;todayMonth=9&amp;todayDay=25"
						target="_blank"> <img
						src="http://image.bandinlunis.com/upload/product/3496/3496580_s.jpg"
						onerror="this.src='/images/common/noimg_type01.gif'"> <span
						class="mask"></span>
					</a>
				</div>
				<div class="book_content">
					<hgroup>
					<h4>
						<a
							href="/front/display/recommendToday.do?todayYear=2012&amp;todayMonth=9&amp;todayDay=25"
							target="_blank">독성물질 속에서 살아가는 당신을 위한 경고</a> <span>&lt;2012년
							9월 25일 오늘의 책&gt;</span>
					</h4>
					<h5>
						<a href="/front/product/detailProduct.do?prodId=3496580"
							target="_blank">독성프리</a>
					</h5>
					</hgroup>
					<div class="book_info">
						<span class="first_chaild">데브라 린 데드 저</span> <span>제효영 역</span> <span>윌컴퍼니</span>
					</div>
					<p>
						않는 말들을 조잘대곤 했다. 나중에 안 일이지만, 할머니 역시 물과 세제를 낭비하는 나의 <em
							class="emph_on">설거지</em> 방식이 못마땅하셔서, 먼저 <em class="emph_on">설거지</em>를
						하시려고 무던히 애쓰셨다고 했다. 한참 후 나와 할머니의 이런 실랑이를 전해 들은 온 가족은 박장대소를 했다.
						&nbsp; 아아. 그리운 할머니. 현명하셨던 할머니. 결국 할머니가 옳았다. 그릇을 깨끗이 하기 위해 반드시 사용해야
						한다고 철없던 시절의 내가 박박 우겨댔던, 각종 ...
					</p>
				</div>
			</li>
			<li>
				<div class="thumb_left_big">
					<a
						href="/front/display/recommendToday.do?todayYear=2013&amp;todayMonth=9&amp;todayDay=26"
						target="_blank"> <img
						src="http://image.bandinlunis.com/upload/product/3521/3521830_s.jpg"
						onerror="this.src='/images/common/noimg_type01.gif'"> <span
						class="mask"></span>
					</a>
				</div>
				<div class="book_content">
					<hgroup>
					<h4>
						<a
							href="/front/display/recommendToday.do?todayYear=2013&amp;todayMonth=9&amp;todayDay=26"
							target="_blank">살림의 고단함, 삶의 따뜻함</a> <span>&lt;2013년 9월 26일
							오늘의 책&gt;</span>
					</h4>
					<h5>
						<a href="/front/product/detailProduct.do?prodId=3521830"
							target="_blank">살림하는 여자들의 그림책</a>
					</h5>
					</hgroup>
					<div class="book_info">
						<span class="first_chaild">베아트리스 퐁타넬 저</span> <span>심영아 역</span> <span>이봄</span>
					</div>
					<p>
						붙는 줄도 모른다. 살림살이라곤 장롱과 서랍장과 같은 번듯한 가구 대신 몇 개의 궤짝이 전부이며, 길어온 물을 아끼기
						위해 <em class="emph_on">설거지</em>거리를 하나라도 줄이려고 큰 솥에 수프를 담아 몇 개의 수저를
						돌려쓰며 식사를 한다. &nbsp; 살림이라는 녹록치 않은, 고단한 노동으로 점철된 삶의 연속이 이 생을 마칠 때까지
						계속될 것임을 뼈저리게 알고 있음에도 불구하고 이 책 속 주인공들의 집안에는 벽난로의 따뜻한 ...
					</p>
				</div>
			</li>
			<li>
				<div class="thumb_left_big">
					<a
						href="/front/display/recommendToday.do?todayYear=2012&amp;todayMonth=2&amp;todayDay=24"
						target="_blank"> <img
						src="http://image.bandinlunis.com/upload/product/2812/2812384_s.jpg"
						onerror="this.src='/images/common/noimg_type01.gif'"> <span
						class="mask"></span>
					</a>
				</div>
				<div class="book_content">
					<hgroup>
					<h4>
						<a
							href="/front/display/recommendToday.do?todayYear=2012&amp;todayMonth=2&amp;todayDay=24"
							target="_blank">어느 나태한 씨의 유쾌한 일주일</a> <span>&lt;2012년 2월
							24일 오늘의 책&gt;</span>
					</h4>
					<h5>
						<a href="/front/product/detailProduct.do?prodId=2812384"
							target="_blank">세상은언제나금요일은아니지</a>
					</h5>
					</hgroup>
					<div class="book_info">
						<span class="first_chaild">호어스트에버스 저</span> <span>김혜은 역</span> <span>작가정신</span>
					</div>
					<p>
						처지라면 그럴 수도 없다.” (15-16쪽) &nbsp; 호어스트 씨가 월요일을 사는 모습이다. 물론 여기에서 할
						일이란 대개, <em class="emph_on">설거지</em>나 빨래 등의 집안일, 세금신고 같은 잡다한 것들이다.
						누구나 해야 하지만 귀찮아하는 것들 말이다. 그런데 그는 이 일들을 미루며 조급해하지 않는다. 뻔뻔하리만치 당당하게
						온갖 핑계를 대가며 다른 일들로 시간을 채운다. 누군가에게 분명 ‘헛짓으로 시간을 낭비’하는 것으로 보일 ...
					</p>
				</div>
			</li>
			<li>
				<div class="thumb_left_big">
					<a
						href="/front/display/recommendToday.do?todayYear=2013&amp;todayMonth=1&amp;todayDay=15"
						target="_blank"> <img
						src="http://image.bandinlunis.com/upload/product/3210/3210054_s.jpg"
						onerror="this.src='/images/common/noimg_type01.gif'"> <span
						class="mask"></span>
					</a>
				</div>
				<div class="book_content">
					<hgroup>
					<h4>
						<a
							href="/front/display/recommendToday.do?todayYear=2013&amp;todayMonth=1&amp;todayDay=15"
							target="_blank">지금 우리에겐 사랑마저 사치다</a> <span>&lt;2013년 1월
							15일 오늘의 책&gt;</span>
					</h4>
					<h5>
						<a href="/front/product/detailProduct.do?prodId=3210054"
							target="_blank">야성의 사랑학</a>
					</h5>
					</hgroup>
					<div class="book_info">
						<span class="first_chaild">목수정 저</span> <span>웅진지식하우스</span>
					</div>
					<p>
						그 중에서도 OECD 최고 수준의 남녀임금차를 자랑하는 한국여성들의 처지는 특히 참혹하다. 식당가서 하루 12시간씩
						서빙하고 <em class="emph_on">설거지</em> 하는 아주머니들이 한 달에 얼마나 쉬고 어느 정도의 급여를
						받는지 물어보라. (한겨레출판에서 나온 《4천원 인생》보면 여기자가 감자탕 집에서 홀서빙 하고 쓴 이야기도 좀 나온다)
						여성이란 이유로 부당한 차별을 받는 것은 임금 외에도 너무 많으나 우린 외면하고 산다. 모나지 않게, ...
					</p>
				</div>
			</li>
		</ul>
		</article> </article> <!-- 오늘의 책 페이징 영역 -->
		<div class="paging" id="AREA_G_3_1_PAGE" style="display: none;"></div>
		<!--// 오늘의 책 페이징 영역 --> <article class="pop_cont" id="AREA_G_3_2"
			style=""> <header class="cont_bg"> <hgroup>
		<h2>
			테마북 <span id="AREA_G_3_2_TOTAL">(1)</span>
		</h2>
		<h3>회원분들이 생각하는 이슈와 테마 그리고 추천도서</h3>
		</hgroup> </header> <article class="cont_wrap">
		<ul id="AREA_G_3_2_DETAIL">
			<li class="first_child">
				<div class="inner_box">
					<h4>
						<a
							href="/front/bookPeople/themaBookDetail.do?themaBookGrpSeq=123626"
							target="_blank">오늘 저녁엔 뭘 먹지?</a>
					</h4>
					<span class="txt_edited"><em>edited by</em> <a
						href="http://blog.bandinlunis.com/bandi_blog/hotwitch"
						class="link" target="_blank">수행체</a>님</span>
					<p>
						이 과정을 겪고 있다. 산더미처럼 쌓아둔 <em class="emph_on">설거지</em>를 끝내고 부랴부랴 멸치랑
						마른 새우 볶아 비린내 없애서 쌀뜨물 붓고 살짝 끓인 다음 건져 버리고 ...
					</p>
				</div>
				<div class="inner_box box2">
					<div class="box_product">
						<dl class="list_product">
							<dt>
								<h5>
									<a
										href="/front/bookPeople/themaBookDetail.do?themaBookGrpSeq=123626"
										target="_blank">연관 추천 상품 (2)</a>
								</h5>
							</dt>
							<dd style="">
								<a href="/front/product/detailProduct.do?prodId=3779990"
									target="_blank">식객Ⅱ 전 3권 [일반판]</a>
							</dd>
							<dd style="">
								<a href="/front/product/detailProduct.do?prodId=7208878"
									target="_blank">심야식당 1권~15권</a>
							</dd>
						</dl>
						<a href="/front/product/detailProduct.do?prodId=3779990"
							class="thumb_right_small" alt=""><img
							src="http://image.bandinlunis.com/upload/product/3750/3750926_s.jpg"
							width="60" height="85"
							onerror="this.src='/images/common/noimg_type01.gif'"></a> <span
							class="layer_left"></span>
					</div>
				</div>
			</li>
		</ul>
		</article> </article> <!--// 컨텐츠 영역 --> </section>
	</div>
	</article>
</div>
</body>
</html>