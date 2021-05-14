<%@page import="ex09.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginDTO = null;
	if((loginDTO = (MemberDTO)session.getAttribute("loginDTO")) != null)
		response.sendRedirect("Ex03_mall.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form action="Ex03_loginCheck.jsp" method="post">
		<input type="text" name="id" placeholder="ID"><br>
	    <input type="password" name="pw" placeholder="Password"><br>
	    <button>로그인</button>
	</form>
</body>
</html>