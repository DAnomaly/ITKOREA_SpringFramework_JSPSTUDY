<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String filename = name + ".txt";
	System.out.println(request.getServletContext().getRealPath("/quiz"));
	File file = new File(request.getServletContext().getRealPath("/quiz"),filename);
	BufferedWriter bw = new BufferedWriter(new FileWriter(file));
	bw.write("가입 아이디: " + id + "\n");
	bw.write("가입 비밀번호: " + pwd + "\n");
	bw.write("가입 성명: " + name + "\n");
	bw.flush();
	if(bw != null)
		bw.close();
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>가입되었습니다.</h1>
	<h3>가입내용</h3>
	<%
		BufferedReader br = new BufferedReader(new FileReader(file));
		String buffer = null;
		String message = "";
		while((buffer = br.readLine()) != null){
			message += buffer + "\n";
		}
		if(br != null) {
			br.close();
		}
		out.println("<pre>" + message + "</pre>");
	%>
	
	<input type="button" value="탈퇴" onclick="location.href='Quiz05_4.jsp?filename=<%=filename%>'">
</body>
</html>