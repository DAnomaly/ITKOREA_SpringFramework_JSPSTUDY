<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie1 = new Cookie("name","브레드");
	cookie1.setMaxAge(60*10);
	response.addCookie(cookie1);
	Cookie cookie2 = new Cookie("age","50");
	cookie1.setMaxAge(60*10);
	response.addCookie(cookie2);
	response.sendRedirect("Ex06_cookie2.jsp");
%>
