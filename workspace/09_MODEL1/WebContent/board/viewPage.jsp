<%@page import="dto.MemberDTO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	boolean isAuthor = false;
	if(dto.getAuthor().equals(loginDTO.getId()))
		isAuthor = true;
	
	pageContext.setAttribute("isAuthor", isAuthor);
	
	// 4. 조회수
	if(isAuthor == false) { // 작성자가 아니면
		if(session.getAttribute("pageHit") == null || (long)session.getAttribute("pageHit") != idx){
			// 새로고침 조회수 증가 방지
			session.setAttribute("pageHit", idx);
			BoardDAO.getInstance().updateHit(idx); // 조회수 증가
			dto.setHit(dto.getHit() + 1);
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${dto.title}</title>
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
		}
		header h1 {
			display: inline-block;
		}
		header h3 {
			margin-left: 10px;
			display: inline-block;
			color: gray;
		}
		header div.right {
			padding-top: 60px;
			padding-right: 10px;
		}
		section pre {
			font-size: 15px;
			min-height: 200px;
			border-bottom: 1px solid black; 
		}
		footer a {
			color: black;
			text-decoration: none;
		}
		footer a:hover {
			color: blue;
			text-decoration: underline;
		}
	</style>
	<script>
		function fn_del(){
			if(confirm('정말로 삭제하시겠습니까?')){
				location.href='delete.jsp?idx=${dto.idx}';
			}
		}	
	</script>
</head>
<body>
	<header>
		<h1>${dto.title}</h1>
		<h3>작성자: ${dto.author}</h3>
		<div class="right">
			<span class="hidden">작성일 </span>${dto.postdate}
			<span class="hidden">조회수 </span>(${dto.hit})
		</div>
	</header>
	<section>
		<pre>${dto.content}</pre>
	</section>
	<footer>
		<div class="left">
			<a href="boardList.jsp">◀ 게시글 목록</a>
		</div>
		<div class="right">
<c:if test="${isAuthor}">
			<input type="button" value="수정" onclick="location.href='editPage.jsp?idx=${dto.idx}'">
			<input type="button" value="삭제" id="del_btn" onclick="fn_del()">
</c:if>
		</div>
	</footer>
</body>
</html>