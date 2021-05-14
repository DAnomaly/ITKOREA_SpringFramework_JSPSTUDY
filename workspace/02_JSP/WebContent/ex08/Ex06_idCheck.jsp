<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");

	if(request.getParameter("chk-id") != null){ // 체크를 하지 않으면 null이다.
		// 1. 체크를 했다.
		// 아이디를 쿠키에 보관해 둔다.
		Cookie cookie = new Cookie("id",id);
		cookie.setMaxAge(60*60*24*15);
		response.addCookie(cookie);
	} 
	// 2. 체크를 해제했다.
	else {
		Cookie cookie = new Cookie("id",null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	
	response.sendRedirect("Ex06_login.jsp");
%>