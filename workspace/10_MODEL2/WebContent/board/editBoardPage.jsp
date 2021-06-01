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
	.edit_form {
		width: 100%;
	}
	.font-12px {
		font-size: 12px;
	}
	
	.edit_form #title,.insert_form textarea, .insert_form .btn {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 14px;
	} 
	
	.edit_form p {
		margin-top: 5px;
	}
	.edit_form input[readonly] {
		border: none;
		outline: none;
	}
	.edit_form input[type="text"], .insert_form input[type="file"] {
		padding: 5px;
		width: 90%;
		height: 30px;
	}
	.edit_form input[type="file"] {
		outline: none;
	}
	.edit_form textarea {
		padding: 8px;
		width: 1040px;
		min-height: 320px;
		box-sizing: border-box;
		outline: none;
		resize: vertical;
	}
	.edit_form .btn {
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
		const edit_btn = $('#edit_btn');
		edit_btn.click(function(){
			if (title.val() == ''){
				alert('제목은 필수입니다.');
				title.focus();
				return;
			}
			f.attr('action','/10_MODEL2/editBoard.b');
			f.submit();
		});
		
		const list_btn = $('#list_btn');
		list_btn.click(function(){
			location.href="/10_MODEL2/listBoardPage.b";
		});
	})

</script>
<div class="edit_form">
	<form id="f" method="post" enctype="multipart/form-data">
		<div>
			<input type="hidden" name="idx" value="${param.idx}"/>
			<span class="title">작성자</span>&nbsp;&nbsp;
			<input type="text" id="author" name="author" value="${loginDTO.id}" readonly/><br>
			<p class="title"><label for="title">제목</label>&nbsp;&nbsp;
			<input type="text" id="title" name="title" value="${param.title}"/></p>
		<c:if test="${empty param.filename}">
			<p class="title">
				첨부&nbsp;&nbsp;
				<input type="file" id="filename" name="filename"/>
			</p>
		</c:if>
		<c:if test="${not empty param.filename}">
			<p class="title">
				첨부&nbsp;&nbsp;
				<span class="font-12px">[기존 첨부파일: ${param.filename}]</span> 
				<input type="file" id="filename" name="filename"/>
				<input type="button" value="첨부삭제" onclick="location.href='deleteFileBoard.b?idx=${param.idx}'"/>
			</p>
		</c:if>
			<p class="content"><label for="content">내용</label></p>
			<textarea id="content" name="content">${param.content}</textarea><br><br>
		</div>
		<div>
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
			<input type="button" value="수정하기" id="edit_btn" class="btn"/>
			<input type="reset" value="초기화" id="reset_btn" class="btn"/>
			<input type="button" value="목록보기" id="list_btn" class="btn"/>
		</div>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>
