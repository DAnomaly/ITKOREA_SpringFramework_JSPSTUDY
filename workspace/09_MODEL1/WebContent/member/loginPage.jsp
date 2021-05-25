<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginPage.jsp</title>
	<style type="text/css">
		body {
			width: 323px;
			margin: 0 auto;
			padding-top: 60px;
		}
		h1 {
			text-align: center;
		}
		form {
			background-color: silver;
			margin: 0 auto;
			display: flex;
			padding: 30px;
			width: 263px;
		}
		button {
			margin-left: 30px;
			height: 46px;
		}
		
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			const f = $('#f');
			const id = $('#id');
			const pw = $('#pw');
			
			f.on('submit',function(event){
				if(id.val() == '' || pw.val() == ''){
					alert('아이디와 비밀번호를 모두 입력하세요');
					event.preventDefault();
					return false;
				}
			});
			
		});
	
	</script>
</head>
<body>
	<div class="container">
		<h1>로그인</h1>
		<form method="post" action="login.jsp" id="f">
			<div class="login-box">
				<input type="text" name="id" id="id" placeholder="ID"/><br>
				<input type="password" name="pw" id="pw" placeholder="Password"/><br>
			</div>
			<div class="btn-box">
				<button>로그인</button>
			</div>
		</form>
	</div>
</body>
</html>