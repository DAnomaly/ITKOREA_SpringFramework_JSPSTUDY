<%@page import="ex02_el.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Person> people = new ArrayList<>();
	pageContext.setAttribute("people", people);
	
	Person p1 = new Person();
	p1.setName("브레드");
	p1.setAge(50);
	people.add(p1);
	
	Person p2 = new Person();
	p2.setName("보트");
	p2.setAge(30);
	people.add(p2);
	
	Person p3 = new Person();
	p3.setName("키보드");
	p3.setAge(10);
	people.add(p3);

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
	<p>이름: ${people[0].name}</p>
	<p>나이: ${people[0].age}</p>
	<hr>
	<p>이름: ${people[1].name}</p>
	<p>나이: ${people[1].age}</p>
	<hr>
	<p>이름: ${people[2].name}</p>
	<p>나이: ${people[2].age}</p>
	
	
</body>
</html>