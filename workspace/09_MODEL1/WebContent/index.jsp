<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INDEX</title>
	<style>
		body {
			width: 680px;
			margin: 0 auto;
		}
	
		a {
			text-decoration: none;
			color: black;
		}
		h1, h3 {
			text-align: center;
		}
	
		.container {
			width: 500px;
			margin: 0 auto;
			text-align: center;
			display: flex;
			justify-content: space-between;
		}
		.btn {
			background-color: #58D3F7;
			width: 150px;
			height: 50px;
		}
		.btn > a {
			display: block;
			width: 100%;
			height: 100%;
		}
		
		.admin {
			background-color: #909090;
		}
		.admin a {
			color: white;
		}
	</style>
</head>
<body>
	<h1>회원 관리</h1>
	
<c:if test="${loginDTO ne null}">
	<h3>${loginDTO.name}님 반갑습니다</h3>
</c:if>	

	<div class="container">
	
<c:if test="${loginDTO eq null}">
		<div class="btn">
			<a href="/09_MODEL1/member/joinPage.jsp">회원가입</a>
		</div>
		<div class="btn">
			<a href="/09_MODEL1/member/loginPage.jsp">로그인</a>
		</div>
</c:if>

<c:if test="${loginDTO ne null}">
		<div class="btn">
			<a href="/09_MODEL1/board/boardList.jsp">게시판</a>
		</div>
		<div class="btn">
			<a href="/09_MODEL1/member/logout.jsp">로그아웃</a>
		</div>
		<div class="btn">
			<a href="/09_MODEL1/member/myPage.jsp">개인정보보기</a>
		</div>		
</c:if>

	</div>
	
<c:if test="${loginDTO.no eq 1}">
	
	<div class="admin">
		<h4>관리자 페이지</h4>
		<a href="/09_MODEL1/member/memberList.jsp">회원목록보기</a>
	</div>
			
</c:if>

</body>
</html>