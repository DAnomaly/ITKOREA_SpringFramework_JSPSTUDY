<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<style>
		body {
			width: 680px;
			margin: 0 auto;
		}
		h1 {
			text-align: center;
			margin: 45px 0;
		}
		input {
			display: inline-block;
			margin-bottom: 20px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){

			// form태그 : submit
			const f = $('#f');
			f.on('submit',function(event){
				const id = $('#id');
				const pw = $('#pw');
				const pw2 = $('#pw2');
				const name = $('#name');
				const email = $('#email');
				
				if(id.val() == '' || pw.val() == '' || email.val() == ''){
					alert('필수 정보를 입력하세요.');
					event.preventDefault();
					return false;
				} else if (pw.val() != pw2.val()) {
					alert('비밀번호를 다시 확인해 주세요.');
					event.preventDefault();
					return false;
				} else if (${not empty param.chk} == false) {
					alert('아이디 중복 체크를 진행하세요.');
					event.preventDefault();
					return false;
				}
				
				
			});
			
			// 엔터키 비활성화
			document.addEventListener('keydown', function(event) {
			  	if (event.keyCode === 13) {
			   		event.preventDefault();
			  	};
			}, true);
			
			// 중복확인
			$('#check_btn').click(function(){
				const id = $('#id');
				
				if(id.val() == '') {
					alert('아이디를 먼저 입력해주세요');
					id.focus();
					return;
				}
				
				location.href = 'idCheck.jsp?id=' + id.val();
			});
			
		});
	</script>
</head>
<body>
	
	<div class="container">
		<header>
			<h1>회원 가입하기</h1>
		</header>
		<section>
			<form action="join.jsp" id="f" method="post">
				<label for="id">아이디</label><br>
				<input type="text" name="id" id="id" value="${param.id}">
				<input type="button" value="중복확인" id="check_btn"><br>
				<label for="pw">비밀번호</label><br>
				<input type="password" name="pw" id="pw"><br>
				<label for="pw2">비밀번호확인</label><br>
				<input type="password" name="pw2" id="pw2"><br>
				<label for="name">이름</label><br>
				<input type="text" name="name" id="name"><br>
				<label for="email">이메일</label><br>
				<input type="text" name="email" id="email"><br>
				<button>가입하기</button>
				<input type="reset" value="입력초기화">
				<input type="button" value="가입취소하기" id="cancel_btn" onclick="location.href='/09_MODEL1/'">
			</form>
		</section>	
	</div>
	
</body>
</html>