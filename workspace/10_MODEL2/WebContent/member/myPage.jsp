<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>

<link rel="stylesheet" href="/10_MODEL2/assets/css/layout.css">
<style>
	.my_form {
		width: 300px;
		margin: 0 auto;
	}
	#f input:not([type="button"]) {
		padding: 5px;
		width: 100%;
		height: 50px;
		box-sizing: border-box;
	}
	#f input[type="button"] {
		width: 100%;
		height: 50px;
		line-height: 50px;
		background-color: orange;
		border: none;
		font-size: 18px;
	}
	#f input[type="button"]:hover {
		cursor: pointer;
	}
	#change_btn {
		background-color: #909090;
	}
	.message {
		font-size: 12px;
		color: crimson;
	}
	.title {
		font-weight: 700;
		font-size: 14px;
	}
</style>
<script>
	$(document).ready(function(){
		const pw_btn = $('#pw_btn');
		pw_btn.click(function(){
			location.href = '/10_MODEL2/updatePwPage.m';
		})
		
		const update_btn = $('#update_btn');
		update_btn.click(function(){
			const f = $('#f');
			const name = $('#name');
			const email = $('#email');
			if(name.val() == '${loginDTO.name}' && email.val() == '${loginDTO.email}'){
				alert('변경할 정보가 없습니다.');
				return;
			}
			f.attr('action','/10_MODEL2/updateMember.m');
			f.submit();
		})
	})

</script>
<div class="my_form">
	<form id="f" method="post">
		<%-- 아이디 --%>
		<span class="title">아이디</span><br>
		<input type="text" name="id" id="id" value="${loginDTO.id}" disabled="disabled"><br>
		<span class="message"></span><br>
		<%-- 비밀번호 --%>
		<span class="title">비밀번호 변경</span><br>
		<input type="button" value="비밀번호 변경하기" id="pw_btn"><br>
		<span class="message"></span><br>
		<%-- 이름 --%>
		<span class="title">이름</span><br>
		<input type="text" id="name" name="name" value="${loginDTO.name}"><br><br>
		<%-- 이메일 --%>
		<span class="title">이메일</span><br>
		<input type="text" id="email" name="email" value="${loginDTO.email}"><br>
		<span class="message"></span><br><br>
		<%-- 인증(캡차, SMS, 이메일) --%>
		<%-- 약관 동의 --%>
		<input type="button" value="회원정보수정" id="update_btn"/>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>