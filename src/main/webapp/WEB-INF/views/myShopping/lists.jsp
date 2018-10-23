<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<table>
	<tr>
		<th>주문번호</th>
		<th style="width: 365px;">상품명</th>
		<th>주문일자</th>
		<th>수령예상일</th>
		<th>주문금액</th>
	</tr>
	<c:if test="${empty lists }">
	<tr height="100px;">
		<td colspan="5">주문내역이 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach var="dto" items="${lists }">
	<tr>
		<td>${dto.orderId }</td>
		<c:if test="${dto.quantity>1 }">
			<td style="text-align: left;">${dto.mainTitle } 외 ${dto.quantity-1 }개</td>
		</c:if>
		<c:if test="${dto.quantity==1 }">
			<td style="text-align: left;">${dto.mainTitle }</td>
		</c:if>
		<td>${dto.handlingDate }</td>
		<td>${dto.expectedDate }</td>
		<td><fmt:formatNumber value="${dto.orderPrice }" pattern="#,###"/></td>
	</tr>
	</c:forEach>
</table>

<div style="text-align: center;">
	<p>
		<c:if test="${totalDataCount!=0 }">
			${pageIndexList }
		</c:if>
		<c:if test="${totalDataCount==0 }">
			등록된 게시글이 없습니다.
		</c:if>
	</p>
</div>
