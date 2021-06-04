<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<style>
		.hidden{
			display: none;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	// 비밀번호 정규식
	function pw_check_f(){
		const pw = $('#pw');
		const pw_text = $('#pw_text');
		var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+/]).{8,16}$/;
		if(pw.val() == ''){
			pw_text.text('');
			return true;
		} else if(!pwReg.test(pw.val())){
			pw_text.text('영어, 숫자, 특수문자를 포함한 8 ~ 16자 이내의 비밀번호를 만들어 주세요.');
			return false;
		} else {
			pw_text.text('');
			return true;
		}
	}
	// 비밀번호 재확인
	function pw1_check_f(){
		const pw = $('#pw');
		const pw1 = $('#pw1');
		const pw1_text = $('#pw1_text');
		if(pw.val() == pw1.val()){
			pw1_text.text('');
			return true;
		} else {
			pw1_text.text('비밀번호가 일치하지 않습니다.');
			return false;
		}
	}
	// 이름 확인
	function name_check_f(){
		const name = $('#name');
		if(name.val() == ''){
			$('#name_text').text('이름을 입력해 주세요.');
			return false;
		} else {
			$('#name_text').text('');
			return true;
		}
	}
	// 이메일 확인
	function email_check_f(){
		const email = $('#email');
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(email.val() == ''){
			$('#email_text').text('이메일을 입력해 주세요.');
			return false;
		} else if(!regExp.test(email.val())){
			$('#email_text').text('올바른 이메일 형식이 아닙니다.');
			return false;
		} else {
			$('#email_text').text('');
			return true;
		}
	}
	// 전화번호 확인
	function phone_check_f(){
		var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		const phone = $('#phone');
		if(phone.val() == ''){
			$('#phone_text').text('전화번호를 입력해 주세요.');
			return false;
		}
		if(!regExp.test(phone.val())){
			$('#phone_text').text('올바르지 않는 전화번호 형식입니다.');
			return false;
		}
		$('#phone_text').text('');
		return true;
	}
	// 회원정보수정 버튼
	function update_f(){
		if(!pw_check_f()){
			alert('비밀번호를 확인해 주세요.');
			$('#pw').focus();
			return;
		}
		if(!pw1_check_f()){
			alert('비밀번호 재확인을 확인해 주세요.');
			$('#pw1').focus();
			return;
		}
		if(!name_check_f()){
			alert('이름을 확인해 주세요.');
			$('#name').focus();
			return;
		}
		if(!email_check_f()){
			alert('이메일을 확인해 주세요.');
			$('#email').focus();
			return;
		}
		if(!phone_check_f()){
			alert('전화번호를 확인해 주세요.');
			$('#phone1').focus();
			return;
		}
		$.ajax({
			url: 'update.do',
			type: 'post',
			data: $('#form').serialize(),
			dataType: 'json',
			success: function(data){
					if(data.result){
						alert('성공적으로 회원정보가 수정되었습니다.');
						location.reload();
					} else {
						alert('회원정보 수정 도중 오류가 발생했습니다.');
					}
				},
			error: function(){
					alert('오류가 발생했습니다.');
					
				}
		})
	}
	// 회원 탈퇴 버튼
	function delete_f() {
		if(confirm('정말 탈퇴하시겠습니까?'))
			$.ajax({
				url: 'delete.do',
				type: 'post',
				data: 'no=' + ${loginUser.no},
				dataType: 'json',
				success: function(data){
						if(data.result){
							alert('정상적으로 회원 탈퇴되었습니다.');
							location.href='/12_AJAX/';
						} else {
							alert('회원 탈퇴중 오류가 발생했습니다.');
						}
					},
				error: function(){
						alert('오류가 발생했습니다.');
					}
			})
	}
	// 비밀번호 변경 버튼 
	function pw_btn() {
		$('#pw_btn_tr').attr('class','hidden');
		$('#pw_tr').attr('class','');
		$('#pw1_tr').attr('class','');
	}
	$(document).ready(function(){
		// 비밀번호 #pw
		const pw = $('#pw');
		pw.on('blur',pw_check_f);
		// 비밀번호 #pw1
		const pw1 = $('#pw1')
		pw1.on('blur',pw1_check_f);
		// 이름
		const name = $('#name');
		name.on('blur',name_check_f);
		// 이메일
		const email = $('#email');
		email.on('blur',email_check_f);
		// 전화번호
		const phone = $('#phone1');
		phone.on('blur',phone_check_f);
	});
	</script>
</head>
<body>
	<h3>마이페이지</h3>
	<form id="form">
		<table>
			<tbody>
				<tr>
					<th>NO</th>
					<td>
						${loginUser.no}
						<input type="hidden" name="no" value="${loginUser.no}"/>
					</td>
				</tr>
				<tr>
					<th>ID</th>
					<td>${loginUser.id}</td>
				</tr>
				<tr id="pw_btn_tr">
					<th>PW</th>
					<td><input type="button" value="비밀번호 변경" onclick="pw_btn()"></td>
				</tr>
				<tr id="pw_tr" class="hidden">
					<th>NEW PW</th>
					<td>
						<input type="password" name="pw" id="pw"/>
						<div id="pw_text" class="text"></div>
					</td>
				</tr>
				<tr id="pw1_tr" class="hidden">
					<th>PW CHECK</th>
					<td>
						<input type="password" name="pw1" id="pw1"/>
						<div id="pw1_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th>NAME</th>
					<td>
						<input name="name" value="${loginUser.name}" id="name"/>
						<div id="name_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>
						<input name="email" value="${loginUser.email}" id="email"/>
						<div id="email_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th>PHONE</th>
					<td>
						<input name="phone" value="${loginUser.phone}" id="phone"/>
						<div id="phone_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th>REGDATE</th>
					<td>${loginUser.regdate}</td>
				</tr>
			</tbody>
		</table>
	</form>
	<div>
		<input type="button" value="매인으로" onclick="location.href='/12_AJAX/'"/>
		<input type="button" value="회원정보수정" onclick="update_f()"/>
		<input type="button" value="탈퇴하기" onclick="delete_f()"/>
	</div>
</body>
</html>