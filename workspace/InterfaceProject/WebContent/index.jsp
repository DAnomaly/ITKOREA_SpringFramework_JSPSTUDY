<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>INDEX</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="/InterfaceProject/asset/js/index.js" charset="UTF-8"></script>
	<link rel="stylesheet" href="/InterfaceProject/asset/css/index.css"/>
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
						<td>가입일</td>
						<td>삭제</td>
					</tr>
				</thead>
				<tbody id="person_list">
					
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>