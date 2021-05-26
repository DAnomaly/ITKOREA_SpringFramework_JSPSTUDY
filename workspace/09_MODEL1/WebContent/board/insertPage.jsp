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
	<title>게시글 작성</title>
	<style>
		body {
			width: 680px;
			margin: 0 auto;
		}
		h1 h3 {
			margin: 0;
			padding: 0;
		}
		.hidden {
			display: none;
		}
		.right {float: right;}
		.left {float: left;}
		header {
			border-bottom: 1px solid black;
			padding: 10px;
		}
		header div.right {
			padding-top: 60px;
			padding-right: 10px;
		}
		section {
			padding: 10px 0;
			border-bottom: 1px solid black;
		}
		section textarea {
			font-size: 15px;
			min-height: 200px;
			width: 680px;
			box-sizing: border-box;
			resize: vertical;
		}
		footer a {
			color: black;
			text-decoration: none;
		}
		footer a:hover {
			color: blue;
			text-decoration: underline;
		}
		footer div {
			padding: 10px 0;
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
		});
		
	})
	</script>
</head>
<body>
	<form id="f" action="insert.jsp" method="post">
	<header>
		<h3>개시글 작성</h3>
		<input type="hidden" name="author" value="${loginDTO.id}"/>
		<label>제목</label> <input type="text" name="title" id="title"/>
	</header>
	<section>
		<textarea name="content" id="content"></textarea>
	</section>
	<footer>
		<div class="left">
			<input type="button" value="취소" onclick="location.href='boardList.jsp'">
		</div>
		<div class="right">
			<input type="reset" value="초기화" id="reset">
			<input type="submit" value="게시">
		</div>
	</footer>
	</form>
</body>
</html>