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
	.insert_form {
		width: 100%;
	}
	.insert_form #title,.insert_form textarea, .insert_form .btn {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 14px;
	} 
	
	.insert_form p {
		margin-top: 5px;
	}
	.insert_form input[readonly] {
		border: none;
		outline: none;
	}
	.insert_form input[type="text"], .insert_form input[type="file"] {
		padding: 5px;
		width: 90%;
		height: 30px;
	}
	.insert_form input[type="file"] {
		outline: none;
	}
	.insert_form textarea {
		padding: 8px;
		width: 1040px;
		min-height: 360px;
		box-sizing: border-box;
		outline: none;
		resize: vertical;
	}
	.insert_form .btn {
		padding: 10px 18px;
		margin: 5px;
		border: 0;
		background-color: #2E64FE;
		color: white;
		font-size: 15px;
	}
</style>
<script>
	$(document).ready(function(){
		const f = $('#f');
		const title = $('#title');
		const insert_btn = $('#insert_btn');
		insert_btn.click(function(){
			if (title.val() == ''){
				alert('제목은 필수입니다.');
				title.focus();
				return;
			}
			f.attr('action','/10_MODEL2/insertBoard.b');
			f.submit();
		});
		
		const list_btn = $('#list_btn');
		list_btn.click(function(){
			location.href="/10_MODEL2/listBoardPage.b";
		});
	})

</script>
<div class="insert_form">
	<form id="f" method="post" enctype="multipart/form-data">
		<div>
			<span class="title">작성자</span>&nbsp;&nbsp;
			<input type="text" id="author" name="author" value="${loginDTO.id}" readonly/><br>
			<p class="title"><label for="title">제목</label>&nbsp;&nbsp;
			<input type="text" id="title" name="title" autofocus/></p>
			<p class="title">첨부&nbsp;&nbsp;
			<input type="file" id="filename" name="filename"/></p>
			<p class="content"><label for="content">내용</label></p>
			<textarea id="content" name="content"></textarea><br><br>
		</div>
		<div>
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
			<input type="button" value="저장하기" id="insert_btn" class="btn"/>
			<input type="reset" value="초기화" id="reset_btn" class="btn"/>
			<input type="button" value="목록보기" id="list_btn" class="btn"/>
		</div>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>
