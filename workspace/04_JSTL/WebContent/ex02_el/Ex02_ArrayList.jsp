<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = new ArrayList<>();
	pageContext.setAttribute("list", list);

	list.add("브레드");
	list.add("초코");
	list.add("윌크");
	list.add("체리");
	list.add("보틀");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${list[0]}<br>
	${list[1]}<br>
	${list[2]}<br>
	${list[3]}<br>
	${list[4]}<br>
</body>
</html>