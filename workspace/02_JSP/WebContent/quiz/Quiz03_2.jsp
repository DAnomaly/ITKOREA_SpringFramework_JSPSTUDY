<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String f_name1 = request.getParameter("f-name1");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="f" action="Quiz03_3.jsp">
		<input type="hidden" name="name" value="<%=name%>">
		<input type="hidden" name="f-name1" value="<%=f_name1%>">
		<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
		<input type="text" name="f-name2"> <button>결과보기</button>
	</form>
</body>
</html>