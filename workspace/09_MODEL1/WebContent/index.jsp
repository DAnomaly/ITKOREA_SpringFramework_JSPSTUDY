<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INDEX</title>
	<style>
		a {
			text-decoration: none;
			color: black;
		}
		h1 {
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
			width: 150px;
			height: 50px;
		}
		.btn > a {
			display: block;
			width: 100%;
			height: 100%;
		}
		
	</style>
</head>
<body>
	
	<h1>회원 관리</h1>
	<div class="container">
		<div class="btn">
			<a href="/09_MODEL1/member/joinPage.jsp">회원가입</a>
		</div>	
		<div class="btn">
			<a href="/09_MODEL1/member/loginPage.jsp">로그인</a>
		</div>	
	</div>
</body>
</html>