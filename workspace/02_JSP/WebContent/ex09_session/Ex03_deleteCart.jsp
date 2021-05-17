<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("cart");
	response.sendRedirect("Ex03_cart.jsp");
%>