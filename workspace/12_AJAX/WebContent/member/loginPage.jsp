<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<body>
	<form action="login.do" method="post">
		<h3>로그인</h3>
		<div class="login_box">
			<input type="text" name="id" placeholder="ID"/><br>
			<input type="password" name="pw" placeholder="PW"/>
			<span></span>
		</div>
		<div class="login_box">
			<button>로그인</button>
		</div>
		<div>
			<span>아직 회원이 아니신가요? <a href='joinPage.do'>회원가입 하러가기</a></span>
		</div>
	</form>
</body>
</html>