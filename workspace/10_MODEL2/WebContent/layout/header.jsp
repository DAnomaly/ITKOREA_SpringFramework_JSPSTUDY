<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%
		request.setCharacterEncoding("utf-8");
		Optional<String> opt = Optional.ofNullable(request.getParameter("title"));
		String title = opt.orElse("환영합니다");
		pageContext.setAttribute("title", title);
	%>
	<title>${title}</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/10_MODEL2/assets/css/layout.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<header class="main">
			<a href="/10_MODEL2/">
				<img src="/10_MODEL2/assets/images/daum.png" alt="로고">
			</a>
			<nav>
				<ul>
					<li><a href="/10_MODEL2/listBoardPage.b">게시판</a></li>
		<c:if test="${loginDTO == null}">
					<li><a href="/10_MODEL2/joinPage.m">회원가입</a></li>
					<li><a href="/10_MODEL2/loginPage.m">로그인</a></li>
					<li><a href="/10_MODEL2/loginPage.m">마이페이지</a></li>
		</c:if>
		<c:if test="${loginDTO != null}">
					<li><a href="/10_MODEL2/logout.m">로그아웃</a></li>
					<li><a href="/10_MODEL2/myPage.m">마이페이지</a></li>
		</c:if>
				</ul>
			</nav>
		</header>
		<section class="main">