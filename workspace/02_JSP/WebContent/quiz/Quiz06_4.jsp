<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	String birth = year + "-" + month + "-" + day;
	String merry = request.getParameter("merry");
	String job = request.getParameter("job");
	
	Cookie[] cookies = {new Cookie("birth",birth), new Cookie("merry",merry),new Cookie("job",job)};
	for (int i = 0; i < cookies.length; i++){
		cookies[i].setMaxAge(60*30);
		response.addCookie(cookies[i]);
	}
	
	response.sendRedirect("Quiz06_5.jsp");
%>