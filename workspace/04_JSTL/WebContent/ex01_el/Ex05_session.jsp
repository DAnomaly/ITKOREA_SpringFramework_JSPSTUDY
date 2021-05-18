<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.setAttribute("name","브레드");
	session.setAttribute("age", 50);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	이름: <%=session.getAttribute("name")%> <br>
	나이: <%=session.getAttribute("age")%> <br>
	<hr>
	이름: ${name}<br>
	나이: ${age}

</body>
</html>