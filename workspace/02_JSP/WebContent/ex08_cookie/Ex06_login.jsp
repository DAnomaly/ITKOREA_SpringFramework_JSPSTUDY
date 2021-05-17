<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length != 0)
		for(Cookie cookie : cookies)
			if(cookie.getName().equals("id"))
				id = cookie.getValue();
	
	// Cookie가 없으면 id = null;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex06_login.jsp</title>
	<style>
		.blind {
			display: none;
		}
		.container{
			display: flex;
		}
		.container button {
			margin-left: 5px;
		}
		.container > div > input {
			width: 145px;
		}
	</style>
	<script type="text/javascript">
		onload = function(){
			var id = '<%=id%>';
			if(id != 'null'){
				document.getElementById('id').value = id;
				document.getElementById('chk-id').setAttribute('checked','checked');
			}
		}
	</script>
</head>
<body>
	<div class="container">
		<form action="/JSP/ex08/Ex06_idCheck.jsp" method="post">
			<div class="container">
				<div>
					<label for="id" class="blind">아이디</label>
					<input type="text" name="id" id="id" placeholder="아이디"><br>
					<label for="pw" class="blind">비밀번호</label>
					<input type="password" name="pw" id="pw" placeholder="●●●●"><br>
				</div>	
				<button>로그인</button><br><br>
			</div>
			<input type="checkbox" name="chk-id" id="chk-id"><label for="chk-id">아이디 기억하기</label>
		</form>
	</div>
</body>
</html>