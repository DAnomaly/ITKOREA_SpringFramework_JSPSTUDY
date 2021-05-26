<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// o. 비로그인 시
	if(session.getAttribute("loginDTO") == null){
		response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
		return;
	}
	
	MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");
%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	
	long idx = Long.parseLong(request.getParameter("idx"));
	
	// 2. DAO 호출 
	BoardDTO dto = BoardDAO.getInstance().selectOne(idx);
	
	pageContext.setAttribute("dto", dto);
	
	// 3. 작성자 확인
	if(!dto.getAuthor().equals(loginDTO.getId())){
		response.sendRedirect("/09_MODEL1/");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${dto.title} : 수정</title>
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
	<script>
		onload = function () {
			const f = document.getElementById('f');
			f.addEventListener('submit',function(event){
				const title = document.getElementById('title');
				const content = document.getElementById('content');
				if(title.value == ''){
					alert('제목은 여백일 수 없습니다.');
					title.focus();
					event.preventDefault();
					return false;
				}
			});
		};
	</script>
</head>
<body>
	<form id="f" action="update.jsp" method="post">
	<header>
		<h3>개시글 수정</h3>
		<input type="hidden" name="idx" value="${param.idx}"/>
		<label>제목</label> <input type="text" name="title" id="title" value="${dto.title}"/>
	</header>
	<section>
		<textarea name="content" id="content">${dto.content}</textarea>
	</section>
	<footer>
		<div class="left">
			<input type="button" value="취소" onclick="location.href='viewPage.jsp?idx=${dto.idx}'">
		</div>
		<div class="right">
			<input type="submit" value="수정">
		</div>
	</footer>
	</form>
</body>
</html>