<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = ""; 
	int age = 0;
	if(null != session.getAttribute("name"))
		name = (String)session.getAttribute("name");
	if(null != session.getAttribute("age"))
		age = (int)session.getAttribute("age");
	
	out.println("이름: " + name + "<br>");
	out.println("나이: " + age + "<br>");
	out.println("<a href='Ex01_session3.jsp'>세션 삭제하기</a>");
%>
