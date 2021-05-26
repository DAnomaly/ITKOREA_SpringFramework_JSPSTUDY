<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("loginDTO") == null){
	response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성하기</title>
	<style>
		body {
			width: 400px;
			margin: 0 auto;
			margin-top: 60px;
		}
		.container > h3 {
			text-align: center;
		}
		#author {
			outline: none;
			border: 0;
		}
		.content {
			margin: 10px;
		}
		.content:last-of-type {
			display: flex;
			justify-content: space-between;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(function(){
		const f = $('#f');
		const title = $('#title');
		f.submit(function(event){
			if(title.val() == '') {
				alert('제목은 필수입니다.');
				title.focus();
				event.preventDefault();
				return false;
			}
		})
	})
	
	</script>
</head>
<body>
	<div class="container">
		<h3>개시글 작성하기</h3>
		<form action="insert.jsp" method="post" id="f">
			<div class="content">
				<label for="author">작성자 : </label><input type="text" name="author" id="author" value="${loginDTO.id}" readonly="readonly">
			</div>
			<div class="content">
				<label for="title">제목 : </label><input type="text" name="title" id="title" autofocus="autofocus">
			</div>
			<div class="content">
				<textarea rows="5" cols="40" name="content" id="content" placeholder="본문 내용"></textarea>
			</div>
			<div class="content">
				<div class="left">
					<input type="button" value="취소" onclick="location.href='boardList.jsp'">
				</div>
				<div class="right">
					<input type="reset" value="작성 초기화">
					<input type="submit" value="등록하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>