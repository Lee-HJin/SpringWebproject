<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:include page="./admin_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<h2>고객 상담</h2>
		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">검색</div>
				<div class="panel-body">
					<form action="/admin_consultation.action" method="get">
						<div class="col-lg-10">
							<div class="col-lg-2 form-group">
								<select class="form-control" name="searchKey">
									<option value="">선택</option>
									<option value="consultId">상담아이디</option>
									<option value="userId">사용자아이디</option>
									<option value="email">이메일</option>
									<option value="subject">제목</option>
									<option value="contents">내용</option>
								</select>
							</div>
							<div class="col-lg-10 form-group">
								<div class="col-lg-6">
									<input type="text" class="form-control" id="searchValue"
										placeholder="검색어를 입력하세요" name="searchValue">
								</div>
								<div class="col-lg-2">
									<button type="submit" class="btn btn-default">검색</button>
								</div>
							</div>
						</div>

						<div class="col-lg-10 form-group">
							<div class="col-lg-1">
								<label for="pwd">상담일</label>
							</div>

							<div class="col-lg-3">

								<input type="date" class="form-control" name="startDate">
							</div>

							<div class="col-lg-3">
								<input type="date" class="form-control" name="endDate">
							</div>

							<div class="col-lg-4 checkbox">
								<label><input type="checkbox" name="solved"> 처리</label>
								<label><input type="checkbox" name="unsolved">미처리</label>
							</div>
						</div>

					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">상담 리스트</div>
				<div class="panel-body">
					<div class="table">
						<form name="userList" method="post" action="">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">no</th>
										<th scope="col">상담아이디</th>
										<th scope="col">유저아이디</th>
										<th scope="col">이메일</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th scope="col">상담일자</th>
										<th scope="col">처리여부</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="user" items="${userList}" varStatus="status">
										<tr>
											<td>${(status.index + pageMaker.cri.numPerPage * (pageMaker.cri.page-1))+1 }</td>
											<td>${user.userId }</td>
											<td>${user.userName }</td>
											<td>${user.nickName }</td>
											<td>${user.memberGrade }</td>
											<td>${user.point }</td>
											<td>${user.email}</td>
											<td>${user.phone }</td>
											<td>${user.zipCode}${user.address1 }${user.address2 }</td>
											<td>
												<button type="button" class="btn" id="del_btn"
													onclick="deleteUser('${user.userId}')">삭제</button> 
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>

					</div>


					<div style="display: table; margin: 0 auto;">
						<ul class="pagination">
							<c:if test="${pageMaker.pre }">
								<li><a
									onclick="paging('<%=cp %>/admin_users.action?page=${pageMaker.startPage-1}')">&lt;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li><a
									href="<%=cp %>/admin_users.action?page=${idx}&searchKey=${pageMaker.cri.searchKey}&searchValue=${pageMaker.cri.searchValue}">${idx }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.nex }">
								<li><a
									href="<%=cp %>/admin_users.action?page=${pageMaker.endPage+1}&searchKey=${pageMaker.cri.searchKey}&searchValue=${pageMaker.cri.searchValue}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
</body>
</html>