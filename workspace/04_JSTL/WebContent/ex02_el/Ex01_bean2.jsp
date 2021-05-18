<%@page import="ex02_el.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Person person = new Person();
	person.setName(request.getParameter("name"));
	person.setAge(Integer.parseInt(request.getParameter("age")));

	// EL 표현을 위해서 4개 영역에 저장
	pageContext.setAttribute("p", person);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%-- EL의 객체 표현 방법 --%>
	이름: ${p.getName()}<br>
	나이: ${p.getAge()}<br>
	<hr>
	이름: ${p.name}<br>
	나이: ${p.age}<br>
</body>
</html>