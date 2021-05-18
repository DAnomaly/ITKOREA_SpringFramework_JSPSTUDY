<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String key = (String)request.getAttribute("key");
	String filename = (String)request.getAttribute("filename");
%>

    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login.jsp</title>
	<link rel="stylesheet" href="/03_CAPTCHA/Login/login.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function refresh() {
			location.href='/03_CAPTCHA/Login';
		}
		
		$(document).ready(function(){
			$('#login-form').submit(function(){
				var f = $('#login-form')[0];
				var id = f.id;
				var pw = f.pw;
				var user_key = f.user_key;
				
				if (id.value == '') {
					alert('아이디를 입력해주세요.');
					id.focus();
					return false;
				}
				if (pw.value == '') {
					alert('비밀번호를 입력해주세요.');
					pw.focus();
					return false;
				}
				if (user_key.value == '') {
					alert('자동가입 방지문자를 입력해주세요.');
					user_key.focus();
					return false;
				}
			});
		});
		
	</script>
	
	
</head>
<body>
	<div class="container">
	<h1>로그인</h1>
	<form action="/03_CAPTCHA/LoginCheck" method="post" id="login-form">
		<div class="login">
			<input type="text" name="id" placeholder="아이디"><br>
			<input type="password" name="pw" placeholder="●●●●"><br>
		</div>
		<div class="captcha">
			<p>자동가입 방지문자</p>
			<input type="hidden" name="key" value="<%=key%>">
			<img id="captcahrImage" alt="자동가입 방지문자" src="/03_CAPTCHA/captcha_img/<%=filename%>"><br>
			<input type="text" name="user_key">
			<img alt="새로고침" src="/03_CAPTCHA/icon/refresh_24dp.png" onclick="refresh()"><br>
		</div>
		<div class="btn">
			<button>로그인</button>
		</div>
	</form>
	</div>
</body>
</html>