<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String f_name1 = request.getParameter("f-name1");
	String f_name2 = request.getParameter("f-name2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=name%>님의 선호도 조사 결과</h3>
	<ul>
		<li>좋아하는 연예인: <%=f_name1%> </li>
	    <li>좋아하는 운동선수: <%=f_name2%> </li>
	</ul>
</body>
</html>