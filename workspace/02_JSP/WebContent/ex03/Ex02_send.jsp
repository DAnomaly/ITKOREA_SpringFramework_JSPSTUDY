<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% int age = 50; %>
<script>
	function fn1() {
		location.href = './Ex02_receive.jsp?name=브레드';
	}
	function fn2() {
		location.href='../ex03/Ex02_receive.jsp?age=<%=age%>';
	}
</script>
</head>
<body>
	<input type="button" value="Ex02_receive.jsp로 보내기" onclick="fn1()">
	<input type="button" value="Ex02_receive.jsp로 보내기" onclick="fn2()">
	<input type="button" value="Ex02_receive.jsp로 보내기" onclick="location.href='/JSP/ex03/Ex02_receive.jsp?name=브레드&age=<%=age%>'">
</body>
</html>