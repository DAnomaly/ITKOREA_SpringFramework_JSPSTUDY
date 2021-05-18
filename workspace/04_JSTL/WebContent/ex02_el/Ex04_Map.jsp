<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String,Object> map = new HashMap<>();
	pageContext.setAttribute("map", map);
	
	map.put("name", "브레드");
	map.put("age",50);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>맵 EL</title>
</head>
<body>
	이름: ${map.name}<br>
	나이: ${map.age}
	<hr>
	이름: ${map.get("name")}<br>
	나이: ${map.get("age")}
</body>
</html>