<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String filename = request.getParameter("filename");
	
	File file = new File(request.getServletContext().getRealPath("/quiz"),filename);
	if(file.exists())
		file.delete();
%>
<script>
	alert('탈퇴되었습니다.');
	location.href="Quiz05_1.jsp";
</script>