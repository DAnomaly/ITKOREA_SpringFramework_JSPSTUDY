<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		[TIP]
	▷ setAttribute로 받아온 데이터는 getAttribute로 불러오자
	▷ getParameter가 아니다
--%>

<%
	request.setCharacterEncoding("utf-8");
	String name = "";
	int age = 0;
	if (request.getAttribute("name") != null)
		name = (String) request.getAttribute("name");
	if (request.getAttribute("age") != null)
		age = (int) request.getAttribute("age");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex02_request2.jsp</title>
</head>
<body>
	<h3>이름 : <%=name%></h3>
	<h3>나이 : <%=age%></h3>
</body>
</html>