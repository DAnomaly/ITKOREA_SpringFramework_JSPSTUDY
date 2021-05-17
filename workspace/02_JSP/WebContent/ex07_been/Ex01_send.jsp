<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex01_send.jsp</title>
</head>
<body>
	<form action="../ex07/Ex01_receive1.jsp">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="age" placeholder="나이"><br>
		<button>전송</button>
	</form>
	<hr>
	<form action="../ex07/Ex01_receive2.jsp">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="age" placeholder="나이"><br>
		<button>전송</button>
	</form>
</body>
</html>