<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex02_priority.jsp</title>
</head>
<body>
	
	<%
		pageContext.setAttribute("model", "a-class");
		request.setAttribute("model", "b-class");
		session.setAttribute("model", "c-class");
		application.setAttribute("model", "d-class");
	%>

	${model}<br>
	${requestScope.model}<br>
	${sessionScope.model}<br>
	${applicationScope.model}	
	
	
	
</body>
</html>