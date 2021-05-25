<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
	<style>
		table {
			margin: 0 auto;
			margin-top: 30px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			const f = $('#f');
			const pw0 = $('#pw0');
			const pw = $('#pw');
			const pw1 = $('#pw1');
			f.on('submit',function(event){
				if(pw.val() == '' || pw1.val() == '' || pw0.val() == ''){
					alert('입력되지 않은 공간이 존재합니다');
					event.preventDefault();
					return false;
				}
				if(pw0.val() != '${loginDTO.pw}'){
					alert('현재 비밀번호가 일치하지 않습니다.');
					event.preventDefault();
					return false;
				}
				if(pw.val() != pw1.val()){
					alert('재확인 비밀번호가 다릅니다');
					event.preventDefault();
					return false;
				}
			});
			
		});
	</script>
</head>
<body>
	<form action="pwChange.jsp" id="f">
		<table>
			<thead>
				<tr>
					<th colspan="2">비밀번호 변경</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>현재 비밀번호</td>
						<td><input type="password" name="pw0" id="pw0"></td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" name="pw" id="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td><input type="password" name="pw1" id="pw1"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2"><input type="submit" value="비밀번호 변경"> <input type="button" value="취소" onclick="self.close();"></th>				
				</tr>
			</tfoot>
		</table>	
	</form>
</body>
</html>