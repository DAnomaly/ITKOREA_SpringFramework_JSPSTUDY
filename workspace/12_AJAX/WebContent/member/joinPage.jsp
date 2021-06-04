<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<style>
		.form_table {
			padding: 5px;
		}
		input {
			padding: 5px 10px;
		}
		.text {
			font-size: 12px;
			color: red;
			height: 16px;
		}
		.blue {
			color: blue;
		}
		td, th {
			padding: 5px;
		}
		tfoot td {
			text-align: center;
		}
		tfoot input {
			margin: 0 5px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			// 아이디
			const id = $('#id');
			id.on('input',function(){
				const id_check = $('#id_check');
				if(id.val().length > 4){
					id_check.attr('disabled',false);
				} else {
					id_check.attr('disabled',true);					
				}
				const id_text = $('#id_text');
				id_text.text('');
			})
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
			const phone1 = $('#phone1');
			phone1.on('blur',phone_check_f);
			const phone2 = $('#phone2');
			phone2.on('blur',phone_check_f);
			const phone3 = $('#phone3');
			phone3.on('blur',phone_check_f);
			// form submit()
			const join_form = $('#join_form');
			join_form.on('submit',function(event){
				$.ajax({
					url: '/12_AJAX/join.do',
					type: 'post',
					data: join_form.serialize(), // form의 모든 파라미터
					dataType: 'json',
					success: function(data){
							if(data.result){
								alert('성공적으로 가입되었습니다.');
								location.href='loginPage.do';
							} else {
								alert('가입 도중 오류가 발생했습니다.');
							}
						},
					error: function(){
							alert('오류가 발생했습니다.');
						} 
				});
				event.preventDefault();
				return false;
			});
		});

		// 비밀번호 정규식
		function pw_check_f(){
			const pw = $('#pw');
			const pw_text = $('#pw_text');
			var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+/]).{8,16}$/;
			if(!pwReg.test(pw.val())){
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
			const phone1 = $('#phone1');
			const phone2 = $('#phone2');
			const phone3 = $('#phone3');
			if(phone1.val() == ''){
				$('#phone_text').text('전화번호를 입력해 주세요.');
				return false;
			}
			if(phone2.val() == ''){
				$('#phone_text').text('전화번호를 입력해 주세요.');
				return false;
			}
			if(phone3.val() == ''){
				$('#phone_text').text('전화번호를 입력해 주세요.');
				return false;
			}
			var phone = phone1.val() + '-' + phone2.val() + '-' + phone3.val();
			if(!regExp.test(phone)){
				$('#phone_text').text('올바르지 않는 전화번호 형식입니다.');
				return false;
			}
			$('#phone_text').text('');
			return true;
		}
		// 아이디 중복 확인 버튼
		function id_check_f(){
			const id = $('#id');
			// 아이디 정규식
			var idReg = /^[A-Za-z0-9][A-Za-z0-9_-]{4,19}$/;
			if(!idReg.test(id.val())){
				alert('5 ~ 20 자 이내의 영어 또는 숫자로 만들어 주세요.');
				return;
			}
			// 중복 확인
			$.ajax({
				url: 'idCheck.do',
				type: 'post',
				data: 'id=' + id.val(),
				dataType: 'json', // 서버가 보내준 응답 데이터의 타입
				success: function(data){
					if(data.result){
						alert('사용가능한 아이디 입니다.');
						id.attr('readonly',true);
						$('#id_check').attr('disabled',true);
						$('#id_text').text('사용 가능한 아이디 입니다.');
						$('#id_text').attr('class','text blue')
					} else {
						alert('중복되는 아이디 입니다.');
						$('#id_text').text('사용할 수 없는 아이디 입니다.');
					}
				},
				error: function(){
					alert('오류가 발생했습니다.');
				}
			})
		}
		// 취소 버튼
		function cancel_f(){
			if(confirm('정말 가입을 취소하시겠습니까?'))
				location.href='/12_AJAX/';
		}
		// 가입 버튼
		function join_f(){
			if($('#id_text').attr('class') != 'text blue') {
				alert('아이디 중복확인을 해 주세요.');
				return;
			}
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
			$('#join_form').submit();
		}
	</script>
</head>
<body>
	<div>
		<h3>회원가입</h3>
		<form id="join_form" method="post">
		<table class="form_table">
			<tbody>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input type="text" name="id" id="id"/>
						<input type="button" value="중복확인" id="id_check" onclick="id_check_f()" disabled/>
						<div id="id_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td>
						<input type="password" name="pw" id="pw"/>
						<div id="pw_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th><label for="pw1">비밀번호 확인</label></th>
					<td>
						<input type="password" name="pw1" id="pw1"/>
						<div id="pw1_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input type="text" name="name" id="name"/>
						<div id="name_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td>
						<input type="text" name="email" id="email"/>
						<div id="email_text" class="text"></div>
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" name="phone1" id="phone1" size="3" max="3"/> - 
						<input type="text" name="phone2" id="phone2" size="4" max="4"/> - 
						<input type="text" name="phone3" id="phone3" size="4" max="4"/>
						<div id="phone_text" class="text"></div>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="회원가입" onclick="join_f()"/>
						<input type="button" value="취소" onclick="cancel_f()"/>
						<div></div>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
</body>
</html>