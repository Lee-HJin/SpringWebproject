<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반디 책 리뷰 화면</title>

<link rel="stylesheet"
	href="http://blog.bandinlunis.com/bandi_blog/css/base.css"
	type="text/css">
<link rel="stylesheet"
	href="http://blog.bandinlunis.com/bandi_blog/css/global.css"
	type="text/css">
<script src="http://blog.bandinlunis.com/bandi_blog/js/common.js"></script>

<script type="text/javascript">

	function goNextPage(Val) {
		location = "/?prod_id=4189934&usedYn=&page=" + Val;
	}

	function go_login() {

		alert("로그인 하셔야 리뷰를 쓰실수 있습니다.");
		return;

		window.open('/.action?dest=book&prod_id=4189934');

	}

	function go_write() {
		parent.location.href = '<%=cp%>/book_review_created.action'
	}

	function viewArt(inValue) {
		//this.location.href = "http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4189934&art_seq_no="+inValue;
		this.location.href = "/bandi_blog/extention/prodView.do?prod_id=4189934&usedYn=&page=1&art_seq_no="
				+ inValue;
	}

	//ajax로 회원정보 가져오기-------------------------------------------------

	function getDescription(url, inform, inflag, appendTxt) {
		try {
			var url = url;
			var req = null;
			if (window.XMLHttpRequest) {
				req = new XMLHttpRequest();

			} else {
				req = new ActiveXObject("microsoft.XMLHTTP");
				//req.overrideMimeType('text/xml');
			}

			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					if (req.status == 200) {
						//alert(req.responseText);
						//alert(req.responseText.length); req.responseText.length 가 3107이면 페이지 못찾음.
						if (req.responseText.length < 1000) {
							if (req.responseText == 5)
								inform.src = "http://blog.bandinlunis.com/bandi_blog/images/common/ico_moon1.gif";
							else if (req.responseText == 4)
								inform.src = "http://blog.bandinlunis.com/bandi_blog/images/common/ico_moon10.gif";
							else if (req.responseText == 3)
								inform.src = "http://blog.bandinlunis.com/bandi_blog/images/common/ico_moon30.gif";
							else if (req.responseText == 2)
								inform.src = "http://blog.bandinlunis.com/bandi_blog/images/common/ico_moon60.gif";
							else if (req.responseText == 1)
								inform.src = "http://blog.bandinlunis.com/bandi_blog/images/common/ico_moon100.gif";
						} else {
							//alert("회원정보를 가져오지 못했습니다.");
							if (inform.id == "member_icon_tmp") {
								//inform.src = "";
							} else {
								var tmpform = eval(inform);
								tmpform.innerHTML = "" + appendTxt;

								if (inform.id == "member_bandi_point"
										|| inform.id == "member_sell_point")
									tmpform.innerHTML = "0" + appendTxt;
							}
						}
					} else {
						//alert("접속실패");
					}
				}
			}

			//동기로 순차적으로 부름.		
			req.open("GET", url, true);
			req.send("");

		} catch (e) {
		}
	}
</script>


<style>
.commTable th {
	font-weight: normal;
	background: #f7f7f7;
	border-left: 1px solid #d8d8d8;
	padding: 10px 5px 10px 5px;
	text-align: center
}

.commTable th:first-child {
	border-left: none
}

.commTable td {
	padding: 10px 5px;
	border-bottom: 1px solid #d8d8d8;
	border-left: 1px solid #d8d8d8;
	text-align: center
}

.commTable td:first-child {
	border-left: none
}

.commTable td.noline {
	border-left: none
}

.commTable td.prod_name {
	border-left: none;
	text-align: left
}

.commTable td.total {
	font: bolder 16px verdana, 돋움;
	text-align: right;
	padding-right: 10px;
}

.commTable .book_img {
	width: 40px;
	hheight: 60px
}

.commTable .book_img img {
	width: 38px;
	border: 1px solid #d2d2d2
}

.commTable .book_name {
	display: block;
	float: left;
	margin-left: 10px
}

.commTable2 {
	font: normal 12px 굴림, Dotum, AppleGothic, sans-serif;
	border-top: 1px solid #d1d1d1;
}

.commTable2 th {
	color: #6e6e6e;
	background: #f7f7f7;
	border-bottom: 1px solid #ededed;
	padding: 12px 5px 12px 20px;
	font-weight: normal;
}

.commTable2 td {
	background: #fff;
	padding: 12px 5px 12px 20px;
	border-bottom: 1px solid #ededed;
	text-align: center
}

.commTable2 .messages {
	width: 90%;
	height: 60px;
	border: 1px solid #d1d1d1;
	font: normal 14px 돋움, Dotum, AppleGothic, sans-serif
}

.commTable2 .saleW {
	float: left;
	width: 250px
}

.orderTable2 .sale2W {
	float: left;
	margin-left: 10px
}

.commTable2 .bgcon {
	background: #e1e1e1;
}

.commTable2 .line_none {
	border-bottom: none
}

.commTable2 .pb0 {
	padding-bottom: 2px
}

.commTable2 .pl0 {
	padding-left: 0px
}

.commTable2 .s_con01 {
	display: inline-block;
	width: 130px;
}

.commTable2 .s_con02 {
	display: inline-block;
	width: 110px;
}

.commTable2 .s_con04 {
	display: inline-block;
	width: 200px
}
</style>


</head>




<body>

	<form name="mainform" id="mainform"
		action="/bandi_blog/extention/prodListTop.do">
		<input type="hidden" name="prod_id" value="4189934">

	</form>
	<div class="p_bookInfo">
		<div class="iframe_bookInfo_subCon">
			<div class="pos_rel"
				style="width: 100%; height: 25px; margin-top: 30px; *padding-top: 20px">
				<h3
					style="padding-right: 20px; font-weight: bold; font-size: 15pt; font-family: '맑은 고딕', '돋움', sans-serif; letter-spacing: -0.1em; margin-left: 0">
					리뷰 <span style="font-size: 14px; color: #666">[데이터개수]</span>
					<!-- 데이터개수 입력하기 -->
				</h3>
			</div>

			<div class="reviewList">
				<!-- boardList02 -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="commTable2">
					<colgroup>
						<col width="17%">
						<col width="55%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
						<col width="7%">
					</colgroup>
					<thead>
						<tr>
							<th class="thS">평점</th>
							<th>리뷰제목</th>
							<th>글쓴이</th>
							<th>조회</th>
							<th>공감</th>
							<th class="thE">작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- loop -->
						<tr>
							<td>
								<!-- 평점에 따른 나뭇잎개수 구현 --> <img
								src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS2.gif"
								alt=""> <!-- 나뭇잎1 --> <img
								src="http://blog.bandinlunis.com/bandi_blog/images/common/ico_gradeS0.gif"
								alt=""> <!-- 나뭇잎0 -->
							</td>
							<td style="text-align: left"><a
								href="javascript:viewArt('46031080')">제목</a></td>
							<td class="t_gr"><img id="member_icon_tmp1"
								src="http://blog.bandinlunis.com/bandi_blog/images/myLibrary/ico_bandi.gif"
								alt="" class="al_middle" style="display: none;"> 글쓴이</td>
							<td class="t_11gr">조회수</td>
							<td class="t_11gr">공감수</td>
							<td class="t_11gr">작성일</td>
						</tr>

						<!-- //loop -->
					</tbody>
				</table>
				<!-- //boardList02 -->
				<!-- page -->
				<div class="pageBG pageBGNone">
					<div class="page">
						<span class="pageNum">
							<div class="page">
								<span class="prev-btn"><a
									href="javascript:goNextPage('1')"><img
										src="/bandi_blog/images/myLibrary/btn_pagePrevG.gif" alt=""></a><a
									href="javascript:goNextPage('1')"><img
										src="/bandi_blog/images/myLibrary/btn_pagePrev.gif" alt=""></a></span><span
									class="pageNum"><a href="javascript:goNextPage('1');"
									class="on">1</a></span><span class="next-btn"><a
									href="javascript:goNextPage('1')"><img
										src="/bandi_blog/images/myLibrary/btn_pageNext.gif" alt=""></a><a
									href="javascript:goNextPage('1')"><img
										src="/bandi_blog/images/myLibrary/btn_pageNextG.gif" alt=""></a></span>
							</div>
						</span>
					</div>

					<div class="pageConR">
						<script>
							function goReview() {
								parent.location.href = '?prodId=&viewType=review';
							}
						</script>
						<form action="" name="reviewForm" method="post">
							<c:choose>

								<c:when test="${empty sessionScope.customInfo.userId }">
									<a href="javascript:go_write()"> <img
										src="http://blog.bandinlunis.com/bandi_blog/images/common/btn_writeReview.gif"
										class="al_middle" alt="리뷰쓰기">
									</a>
								</c:when>

								<c:otherwise>
									<a href="javascript:go_write()"> <img
										src="http://blog.bandinlunis.com/bandi_blog/images/common/btn_writeReview.gif"
										class="al_middle" alt="리뷰쓰기">
									</a>
								</c:otherwise>

							</c:choose>
						</form>

					</div>
				</div>
				<!-- //page -->
			</div>
		</div>
	</div>




























</body>
</html>