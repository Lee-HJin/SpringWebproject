<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
포인트 사용 테스트하기
<form action="<%=cp%>/testpoint_ok.action" method="post">
<input type="text" name="usedPoint">
<input type="submit" value="사용">
</form>

</body>
</html>