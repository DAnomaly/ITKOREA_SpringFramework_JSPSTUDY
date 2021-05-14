<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	Cookie[] cookies = {new Cookie("id",id), new Cookie("pwd",pwd),new Cookie("name",name)};
	for (int i = 0; i < cookies.length; i++){
		cookies[i].setMaxAge(60*30);
		response.addCookie(cookies[i]);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz06_2.jsp</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
		
		$(document).ready(function(){
			$('#f').on('submit',function(){
				var address = $('#f')[0].address;
				var phone = $('#f')[0].phone;
				var email = $('#f')[0].email;
				if(address.value == ''){
					alert('주소를 입력해 주세요.');
					year.focus();
					return false;
				}
				if(phone.value == ''){
					alert('전화번호를 입력해 주세요.');
					month.focus();
					return false;
				}
				if(email.value == ''){
					alert('이메일을 입력해 주세요.');
					day.focus();
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<h3>추가정보를 입력하세요</h3>
	<form action="Quiz06_3.jsp" id="f">
		<table>
			<tbody>
				<tr>
					<td>주소</td>
					<td>
						<input name="address">
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input name="phone">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input name="email">
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<input type="submit" value="확인">
	</form>
</body>
</html>