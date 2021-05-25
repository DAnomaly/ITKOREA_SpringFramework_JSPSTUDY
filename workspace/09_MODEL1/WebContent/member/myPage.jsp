<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginDTO") == null){
		response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
	}
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myPage.jsp</title>
	<style>
		table {
			border: 1px solid black;
			padding: 8px;
			margin: 0 auto;
		}
		th, td {
			padding: 5px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function showPopup() { window.open("pwPage.jsp", "a", "width=600, height=300, left=100, top=50"); };
		
		$(document).ready(function(){
			const f = $('#f');
			f.on('submit',function(event){
				const name = $('#name');
				const email = $('#email');
				
				if(name.val() == '${loginDTO.name}' && email.val() == '${loginDTO.email}'){
					alert('수정하실 회원 정보가 없습니다.');
					event.preventDefault();
					return false;
				}
				if(name.val() == '' || email.val() == ''){
					alert('이름이나 이메일 주소가 공백입니다.');
					event.preventDefault();
					return false;
				}
			});
			
			const leave = $('#leave_btn');
			leave.click(function(){
				if(confirm('정말로 탈퇴하시겠습니까?'))
					location.href = 'leave.jsp';
			});
			
		});
	  
	</script>
</head>
<body>
	<div class="container">
		<form id="f" method="post" action="myChange.jsp">
			<table>
				<thead>
					<tr>
						<th colspan="2">${loginDTO.name}님 정보</th>
					</tr>
				</thead>		
				<tbody>
					<tr>
						<th>회원번호</th>
						<td>${loginDTO.no}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${loginDTO.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="button" value="비밀번호 변경" id="pw_btn" onclick="showPopup();"/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" value="${loginDTO.name}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" id="email" value="${loginDTO.email}"></td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${loginDTO.regdate}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<input type="submit" value="회원정보수정">
							<input type="button" value="뒤로가기" onclick="location.href='/09_MODEL1/'">
							<input type="button" value="회원탈퇴" id="leave_btn">
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>