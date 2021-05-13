<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int ans = Integer.parseInt(request.getParameter("ans"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		제출: <%=num1%> + <%=num2%> = <%=ans%> <br>
		정답: <%=num1%> + <%=num2%> = <%=num1+num2%> 
	</div>
	<br>
	<a href="Quiz04_1.jsp">다시풀기</a>
</body>
</html>