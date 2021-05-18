<%@page import="login.captcha.util.ClientDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClientDTO user = (ClientDTO)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body style="text-align: center;">
	<h1>홈페이지에 오신 걸 환영합니다.</h1>
<% if(user == null) {%>
	<h3>서비스 이용을 위해서 로그인을 먼저 해 주세요</h3>
	
	<a href="/03_CAPTCHA/Login">로그인</a>
<% } else { %>
	<h3><%=user.getId()%>님 반갑습니다!</h3>	
	
	<a href="/03_CAPTCHA/Logout">로그아웃</a>
<% } %>
</body>
</html>