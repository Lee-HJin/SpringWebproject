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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function deleteUser() {

		User = document.userList;

	}
</script>

</head>

<jsp:include page="./admin_header.jsp" />

<body>



	<div class="users_table">
		<form name="userList" method="post" action="">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">no</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">닉네임</th>
						<th scope="col">등급</th>
						<th scope="col">포인트</th>
						<th scope="col">이메일</th>
						<th scope="col">전화번호</th>
						<th scope="col">주소</th>
						<th>삭제</th>
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
								<button type="button" class="btn"
									onclick="location.href='<%=cp %>/admin_users_delete.action?userId=${user.userId }'">삭제</button>
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
					href="<%=cp %>/admin_users.action?page=${pageMaker.startPage-1}">&lt;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li><a href="<%=cp %>/admin_users.action?page=${idx}">${idx }</a></li>
			</c:forEach>
			<c:if test="${pageMaker.nex }">
				<li><a
					href="<%=cp %>/admin_users.action?page=${pageMaker.endPage+1}">&gt;</a></li>
			</c:if>
		</ul>
	</div>


</body>
</html>
































