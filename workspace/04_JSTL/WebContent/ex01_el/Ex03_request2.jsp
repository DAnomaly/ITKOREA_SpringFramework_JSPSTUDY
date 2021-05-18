<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex03_request2.jsp</title>
</head>
<body>
	<%
		// 표현식을 사용하면,
		String name = (String) request.getAttribute("name");
		String age = (String) request.getAttribute("age");
	%>
	<h3>이름: <%=name%></h3>
	<h3>나이: <%=age%></h3>

		
	<h3>이름: ${name}</h3>
	<h3>나이: ${age}</h3>
	
</body>
</html>