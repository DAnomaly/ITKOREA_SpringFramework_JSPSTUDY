<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>성인</h3>
	<p>당신의 나이는 <%=request.getParameter("age")%>살 이므로 주류 구매가 가능합니다.</p>
	<a href="javascript:history.back()">처음으로 이동</a>

</body>
</html>