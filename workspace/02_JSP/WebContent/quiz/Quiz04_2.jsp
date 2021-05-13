<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int ans = Integer.parseInt(request.getParameter("ans"));
	if(num1 + num2 == ans)
		request.getRequestDispatcher("Quiz04_YES.jsp").forward(request, response);
	else
		request.getRequestDispatcher("Quiz04_NO.jsp").forward(request, response);
		
%>
