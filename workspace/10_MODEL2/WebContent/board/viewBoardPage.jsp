<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="게시글 작성" name="title"/>
</jsp:include>
<style>
	.hidden {
		display: none;
	}
	.content_form {
		width: 100%;
	}
	.content_form .title {
		width: 100%;
		height: 32px;
		padding: 5px;
	}
	.content_form .top {
		display: inline-block;
		font-size: 22px;	
	}
	.content_form .bottom {
		display: inline-block;
		margin-left: 6px;
		font-size: 14px;
		color: gray;
	}
	.content_form .title {
		border-bottom: 1px solid black;
	}
	.content_form .content {
		padding: 10px;
	}
	.content_form .content img {
		max-height: 200px;
	}
	.content_form pre.content {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 14px;
		margin-top: 10px;
		padding: 0;
		width: 1040px;
		min-height: 320px;
		box-sizing: border-box;
		outline: none;
		resize: vertical;
	}
	.content_form .btn {
		padding: 10px 18px;
		margin: 5px;
		border: 0;
		background-color: #2E64FE;
		color: white;
		font-size: 15px;
	}
	.content_form .btn:hover {
		cursor: pointer;
	}
	form {
		display: inline-block;
	}
</style>
<script>
	function del_f(){
		if(confirm('삭제하시겠습니까?')){
			location.href="/10_MODEL2/deleteBoard.b?idx=${dto.idx}";
		}
	}
</script>
<div class="content_form">
	<div class="main">
		<div class="title">
			<p class="top">
				<span class="hidden">제목</span>
				<span id="title">${dto.title}</span>
			</p>
			<p class="bottom">
				<span class="hidden">작성자</span>
				<span id="author" class="author">${dto.author}</span>
				<span class="hidden">작성일자</span>
				<span id="modified" class="modified">${dto.lastmodified}</span>
				<span class="hidden">방문자수</span>
				<span id="hit" class="hit">(${dto.hit})</span>					
			</p>
		</div>
		<div class="content">
			<p class="hidden">내용</p>
			<div>
				<img src="./archive/${dto.filename}" alt="${dto.filename}">
			</div>
			<pre id="content" class="content">${dto.content}</pre><br><br>
		</div>
	</div>
		<div>
		<input type="button" value="목록보기" id="list_btn" class="btn" onclick="location.href='http://localhost:9090/10_MODEL2/listBoardPage.b?${referer}'"/>
	<c:if test="${dto.author == loginDTO.id}">
		<form action="/10_MODEL2/editBoardPage.b" method="post">
			<input type="hidden" name="idx" value="${dto.idx}"/>
			<input type="hidden" name="title" value="${dto.title}"/>
			<input type="hidden" name="author" value="${dto.author}"/>
			<input type="hidden" name="filename" value="${dto.filename}"/>
			<input type="hidden" name="content" value="${dto.content}"/>
			<input type="submit" value="수정" id="edit_btn" class="btn"/>
			<input type="button" value="삭제" id="del_btn" class="btn" onclick="del_f()"/>
		</form>			
	</c:if>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>
