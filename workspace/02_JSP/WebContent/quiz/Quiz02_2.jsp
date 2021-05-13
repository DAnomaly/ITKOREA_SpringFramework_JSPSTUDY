<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="Quiz02_error.jsp" %>

<% 
	request.setCharacterEncoding("utf-8");
	int age = Integer.parseInt(request.getParameter("age").isEmpty() ? "0" : request.getParameter("age"));
	if(age < 20) {
		request.getRequestDispatcher("Quiz02_kid.jsp").forward(request, response);
	} else {
		request.getRequestDispatcher("Quiz02_adult.jsp").forward(request, response);
	};
%>

