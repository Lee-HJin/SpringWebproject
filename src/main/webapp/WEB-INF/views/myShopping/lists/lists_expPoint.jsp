<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<table>
	<tr>
		<th>적립일</th>
		<th style="width: 500px;">내역</th>
		<th>소멸예정금액</th>
		<th>소멸일자</th>
	</tr>
	<c:forEach var="dto" items="${lists }">
	<tr>	
		<td>${dto.savingDate }</td>
		<td>${dto.pointItem }</td>
		<td><fmt:formatNumber value="${dto.value }" pattern="#,###"/>원</td>
		<td>${dto.expirationDate }</td>		
	</tr>
	</c:forEach>
</table>

<div style="text-align: center;">
	<p>
		<c:if test="${totalDataCount!=0 }">
			${pageIndexList }
		</c:if>
		<c:if test="${totalDataCount==0 }">
		</c:if>
	</p>
</div>