<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="rc_books_list">
	<c:forEach var="cate" items="${lst }">
	<li>
		<div class="rb_image">
			<a href="javascript://">
				<img src="<%=cp%>/resources/image/book/${cate.bookImage}">
			</a>
			<dl class="rb_title">
				<dt>${cate.bookTitle }</dt>
				<dd>${cate.authorName }</dd>
			</dl>
		</div>
	</li>
	</c:forEach>
</ul>
