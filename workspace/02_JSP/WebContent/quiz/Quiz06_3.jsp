<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	Cookie[] cookies = {new Cookie("address",address), new Cookie("phone",phone),new Cookie("email",email)};
	for (int i = 0; i < cookies.length; i++){
		cookies[i].setMaxAge(60*30);
		response.addCookie(cookies[i]);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz06_3.jsp</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
		
		$(document).ready(function(){
			$('#f').on('submit',function(){
				var year = $('#f')[0].year;
				var month = $('#f')[0].month;
				var day = $('#f')[0].day;
				var merry = $('#f')[0].merry;
				if(year.value == ''){
					alert('년도를 입력해 주세요.');
					year.focus();
					return false;
				}
				if(month.value == ''){
					alert('월를 입력해 주세요.');
					month.focus();
					return false;
				}
				if(day.value == ''){
					alert('일을 입력해 주세요.');
					day.focus();
					return false;
				}
				if(merry.value == ''){
					alert('결혼여부를 선택해 주세요.');
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<h3>추가정보를 입력하세요</h3>
	<form action="Quiz06_4.jsp" id="f">
		<table>
			<tbody>
				<tr>
					<td>생년월일</td>
					<td>
						<input name="year" size="4" maxlength="4">년
						<input name="month" size="2" maxlength="2">월
						<input name="day" size="2" maxlength="2">일
					</td>
				</tr>
				<tr>
					<td>결혼여부</td>
					<td>
						<input type="radio" name="merry" value="no">미혼
						<input type="radio" name="merry" value="yes">기혼
					</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="job">
							<option value="developer">개발자</option>						
							<option value="engineer">기술자</option>						
							<option value="artist">아티스트</option>						
							<option value="none">무직</option>						
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<input type="submit" value="확인">
	</form>
</body>
</html>