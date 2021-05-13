<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function () {
			$('#agree-form').submit(function(){
				var form = $('#agree-form')[0];
				if(form.agree.value == 'yes'){
					form.action = 'Quiz05_3.jsp';
				} else {
					form.action = 'Quiz05_no.jsp';
				}
			})
		});
	</script>
</head>
<body>
	<h3>이용 약관</h3>
	<div>
	-----------------------------------------------------<br>
	1. 회원 정보는 웹 사이트 운영을 위해서만 사용됩니다.<br>
	2. 원치 않으면 정보 제공을 하지 않을 수 있습니다.<br>
	3. 다만 이 경우 정상적인 웹 사이트 이용이 제한됩니다.<br>
	-----------------------------------------------------<br>
	</div>
	<p>위 약관에 동의하십니까?</p>
	<form id="agree-form" method="post">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="pwd" value="<%=pwd%>">
		<input type="hidden" name="name" value="<%=name%>">
		<input type="radio" name="agree" value="yes" id="yes"><label for="yes">동의 함</label>&nbsp;
		<input type="radio" name="agree" value="no" id="no" checked="checked"><label for="no">동의 안 함</label>
		<br><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>