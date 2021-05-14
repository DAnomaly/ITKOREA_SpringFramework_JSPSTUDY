<%@page import="ex09.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex02_login.jsp</title>
</head>
<body>
	<%
		MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");
	%>
	
	
	<% if (loginDTO == null){ %>
	<form action="Ex02_loginCheck.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"> <br>
		<input type="password" name="pw" placeholder="●●●●"> <br>
		<button>로그인</button>
	</form>
	<% } else { %>
	<form action="Ex02_logout.jsp">
		<%=loginDTO.getName()%>님 환영합니다. <br><br>
		<button>로그아웃</button>
	</form>
	<% } %>
</body>
</html>