<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INDEX</title>
</head>
<body>
	<ul>
	<c:if test="${empty loginUser}">
		<li><a href="joinPage.do">회원가입</a></li>
		<li><a href="loginPage.do">로그인</a></li>
	</c:if>
	<c:if test="${not empty loginUser}">
		<li><a href="myPage.do">마이페이지</a></li>
		<li><a href="logout.do">로그아웃</a></li>
	</c:if> 
	</ul>
</body>
</html>