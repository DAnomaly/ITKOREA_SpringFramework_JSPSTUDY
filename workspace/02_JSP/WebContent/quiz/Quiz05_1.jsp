<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		var $form = $('#reg-form'); 
		$form.submit(function(){
			if($form[0].id.value == ''){
				alert('아이디를 입력해 주세요.');
				return false;
			}
			if($form[0].pwd.value == ''){
				alert('비밀번호를 입력해 주세요.');
				return false;
			}
			if($form[0].name.value == ''){
				alert('이름를 입력해 주세요.');
				return false;
			}
		});
	});
	
	</script>
</head>
<body>
	<form id="reg-form" action="Quiz05_2.jsp" method="post">
		<h3>신규 회원 정보를 입력하세요</h3>
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
		<input type="submit" value="회원가입">
	</form>
</body>
</html>