<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INDEX</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			// Person Load
			
			// EventListener
			$('#insert_btn').click(fn_insert);
		});
		// TABLE LOAD
		function fn_load() {
			var tbody = $('#person_list');
			tbody.empty();
		}
		
		
		// #insert_btn
		function fn_insert() {
			var regSNO = /^[0-9]{6}$/;
			if(!regSNO.test($('#sno').val())){
				alert('주민등록번호는 6자리 숫자입니다.');
				return false;
			}
			$.ajax({
				url : 'insertPerson.do',
				type : 'post',
				data : $('#f').serialize(),
				dataType : 'json',
				success: function(obj) {
						if(obj.result) {
							alert('회원정보가 정상적으로 등록되었습니다.');
						} else {
							alert('등록 중 오류가 발생하였습니다.');
						}
					},
				error: function(xhr, textStatus, errorThrown) {
					// console.log(textStatus); 노 관심
					// console.log(errorThrown); 노 관심
					// xhr.status : 상태를 정의하는 정수 값, 임의로 결정
					// console.log(xhr.status);
					// xhr.responseText : 응답된 텍스트, 예외 메시지가 전달
					if( xhr.status > 3000 || xhr.status < 4000)
						alert(xhr.responseText);
				}
			});
		}
		
	</script>
	<style>
		.container {
			width: 1080px;
			margin: 0 auto;
		}
		.insert_form {
			width: 200px;
			float: left;
		}
		.list_form {
			width: 800px;
			float: right;
		}
		table {
			background-color: #a0a0a0;
			border-collapse: collapse;
			width: 760px;
		}
		table tr td:nth-of-type(1) {}
		table tr td:nth-of-type(2) {}
		table tr td:nth-of-type(3) {}
		table tr td:nth-of-type(4) {}
		
	</style>
</head>
<body>
	<div class="container">
		<div class="insert_form">
			<form id="f">
				<input type="text" name="sno" id="sno" placeholder="주민등록번호(6자리)"/><br/>
				<input type="text" name="name" id="name" placeholder="이름"/><br/>
				<input type="text" name="age" id="age" placeholder="나이"/><br/>
				<input type="text" name="birthday" id="birthday" placeholder="생일(yyyy-mm-dd)"/><br/>
				<input type="button" value="등록하기" id="insert_btn"/>
			</form>
		</div>
		<div class="list_form">
			<table>
				<thead>
					<tr>
						<td>주민번호</td>
						<td>이름</td>
						<td>나이</td>
						<td>생일</td>
					</tr>
				</thead>
				<tbody id="person_list">
					
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>