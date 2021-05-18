<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	
	String name = null;
	String age = null;

	if(cookies != null && cookies.length != 0)
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("name"))
				name = cookie.getValue();
			if(cookie.getName().equals("age"))
				age = cookie.getValue();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름: ${cookie.name.value}<br>
	나이: ${cookie.age.value}<br>
	<hr>
	이름: <%=name%><br>
	나이: <%=age%><br>
</body>
</html>