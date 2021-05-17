<%@page import="ex07.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex01_receive1.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String strAge = request.getParameter("age");
		if(name.isEmpty()) { name = "기본이름"; }
		int age = strAge.isEmpty() ? 0 : Integer.parseInt(strAge);
		
		// 파라미터를 받아서 빈(Bean)을 만든다.
		
		// 1. 생성자로 만든 빈
		Person p1 = new Person("브레드", 50);
		
		// 2. setter로 만든 빈
		Person p2 = new Person(); // 디폴트 생성자 사용
		p2.setName(name);
		p2.setAge(age);
	%>
	
	<h3>이름: <%=p1.getName()%></h3>
	<h3>나이: <%=p1.getAge()%></h3>
	
	<h3>이름: <%=p2.getName()%></h3>
	<h3>나이: <%=p2.getAge()%></h3>
	
</body>
</html>