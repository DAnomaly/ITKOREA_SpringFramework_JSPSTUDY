<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = Optional.ofNullable(request.getParameter("name")).orElse("기본이름");
	int age = Integer.parseInt(Optional.ofNullable(request.getParameter("age")).orElse("0"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex02_receive.jsp</title>
<script>
	alert('이름은 <%=name%>이고 나이는 <%=age%>입니다.');
	history.back();
</script>
</head>
</html>