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
<title>Insert title here</title>

<link rel="stylesheet" href="/webproject/resources/book_css/base.css"
	type="text/css">
<link rel="stylesheet" href="/webproject/resources/book_css/global.css"
	type="text/css">

<script type="text/javascript">
	function goReview(Val) {
		location.href = '<%=cp%>/book_review.action?isbn=' + Val;
	}
</script>

</head>
<body>

	<div class="p_bookInfo">
		<div class="iframe_bookInfo_subCon">
			<div style="width: 99%; height: 25px; margin-top: 30px;">
				<h3
					style="padding-right: 22px; font-weight: bold; font-size: 15pt; font-family: '맑은 고딕', '돋움', sans-serif; letter-spacing: -0.1em">
					리뷰</h3>
			</div>
			<!-- 리뷰보기 -->
			<div class="reviewDetail" style="width: 99%">
				<div class="reviewDetailT" style="width: 99%">
					<div class="reviewDetailB" style="width: 99%" >
						<ul>

							<li class="title overflow"><strong class="fl_left mr10"
								style="font: normal 16px 맑은 고딕">${dto.reviewTitle }</strong> <span
								class="fl_right mt3 mr10"> <span class=" t_11gr pb5 mr5">${dto.username }</span>
									<img
									src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS2.gif"
									alt=""><img
									src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS2.gif"
									alt=""><img
									src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS2.gif"
									alt=""><img
									src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS2.gif"
									alt=""><img
									src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS2.gif"
									alt="">
							</span></li>
							<li class="contents" style="LINE-HEIGHT: 20px;">
								
								<p class="info mb15">
									<span class="t_11br3 ">조회: <strong>${dto.hitCount }</strong></span>
									| <span class="t_11br3 ">공감: <strong>${dto.thumbup }</strong></span>
									| <span class="t_11br3 ">작성일: ${dto.created }</span>
								</p>


								<p class="mt15"></p>
								<p>
									<font size="3"> </font>
								</p>
								<p style="margin: 0cm 0cm 10pt;">
									<font face="맑은 고딕"> ${dto.contents } </font>
								</p>
								<p>
									<font size="3"> </font><br>
								</p>
								<p></p>
							</li>
						</ul>

						<!-- btn area -->
						<div class="btnA">
							<span class="ilike"><button onclick="reviewVote('0')"
									class="btn_ilike 0">
									<span>공감하기</span>
								</button> <span class="ilike_count">0</span></span>

						</div>

					</div>
				</div>
			</div>
			<!-- //리뷰보기 -->

			<!-- btn area -->
			<div class="btnR">
				<a href="javascript:goReview(${dto.isbn })"><img
					src="http://blog.bandinlunis.com/bandi_blog/images/common/btnW_list.gif"
					alt="목록으로 돌아가기"></a>
			</div>

			<ul class="listRN mt20">
				<li><img
					src="http://blog.bandinlunis.com/bandi_blog/images/common/list_prev.gif"
					alt="이전글" class="al_middle"> <a
					href="javascript:go_view('46033622')">외상환자를 살리는 '업'의 무거움</a>
					<p class="t_gr">
						<a href="http://blog.bandinlunis.com/bandi_blog/mediamatrix"
							target="blog">zixia</a>
					</p></li>
				<li class="alt"><img
					src="http://blog.bandinlunis.com/bandi_blog/images/common/list_next.gif"
					alt="다음글" class="al_middle"> <a
					href="javascript:go_view('46033690')">벼랑끝에서 치열하게 싸우는 사람들...</a>
					<p class="t_gr">
						<a href="http://blog.bandinlunis.com/bandi_blog/miyaa30"
							target="blog">miyaa30</a>
					</p></li>
			</ul>
		</div>

	</div>

</body>
</html>