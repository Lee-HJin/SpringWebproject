<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="rc_books_list">
	<c:forEach var="rc" items="${lst }">
	<li>
		<div class="rb_image">
			<a href="javascript://">
				<img src="<%=cp%>/resources/image/book/${rc.bookImage}">
			</a>
			<dl class="rb_title">
				<dt>${rc.bookTitle }</dt>
				<dd>${rc.authorName }</dd>
			</dl>
		</div>
	</li>
	</c:forEach>
</ul>
