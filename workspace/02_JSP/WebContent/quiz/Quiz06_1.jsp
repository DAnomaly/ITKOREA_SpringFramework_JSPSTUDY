<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz06_1.jsp</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
	
		$(document).ready(function(){
			$('#f').on('submit',function(){
				var id = $('#f')[0].id;
				var pwd = $('#f')[0].pwd;
				var name = $('#f')[0].name;
				if(id.value == ''){
					alert('아이디를 입력해 주세요.');
					id.focus();
					return false;
				}
				if(pwd.value == ''){
					alert('비밀번호를 입력해 주세요.');
					pwd.focus();
					return false;
				}
				if(name.value == ''){
					alert('이름을 입력해 주세요.');
					name.focus();
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<h3>개인정보를 입력하세요.</h3>
	<form action="Quiz06_2.jsp" id="f">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input name="name"></td>
				</tr>
			</tbody>
		</table>
		<br>
		<input type="submit" value="확인">
	</form>
</body>
</html>