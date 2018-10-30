<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%> 

<h3>${dto.warehouseName }</h3>
<div class="detail">
	<p class="desc">
		${dto.intro }
	</p>
	<p>
		<img src="<%=cp%>/resources/image/main/img_findmap17_01.jpg">
		<img src="<%=cp%>/resources/image/main/img_findmap17_02.jpg">
	</p>
</div>
<dl>
	<dt>
		<img alt="전화번호" src="<%=cp %>/resources/image/main/txt_phone.gif">
	</dt>
	<dd>
		<strong>${dto.tel }</strong>
	</dd>
	<dt>
		<img alt="주소" src="<%=cp %>/resources/image/main/txt_address.gif">
	</dt>
	<dd>
		${dto.addr }
	</dd>
	<dt>
		<img alt="영업시간" src="<%=cp %>/resources/image/main/txt_workTime.gif">
	</dt>
	<dd>
		${dto.time }
	</dd><dt>
		<img alt="찾아오시는 길" src="<%=cp %>/resources/image/main/txt_findmap.gif">
	</dt>
	<dd>
		<strong class="way_title">지하철이용시</strong>
		<p class="way_content">${dto.waySub }</p>
		<strong class="way_title">버스 이용시</strong>
		<ul class="way_content">
			<li class="wc_list">
				${dto.wayBus }
			</li>
		</ul>
	</dd>
	<dd class="map">

		<!-- 1. 약도 노드 -->
		<div id="daumRoughmapContainer1540836964077" class="root_daum_roughmap root_daum_roughmap_landing"></div>
		
		<!-- 2. 설치 스크립트 -->
		<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
		
		<!-- 3. 실행 스크립트 -->
		<script charset="UTF-8">
			new daum.roughmap.Lander({
				"timestamp" : "1540836964077",
				"key" : "qmv8",
				"mapWidth" : "685",
				"mapHeight" : "340"
			}).render();
		</script>
	</dd>
</dl>
