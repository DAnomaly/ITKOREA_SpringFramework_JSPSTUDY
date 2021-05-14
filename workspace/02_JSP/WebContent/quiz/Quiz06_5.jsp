<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int ID = 0;
	final int PWD = 1;
	final int NAME = 2;
	final int ADDRESS = 3;
	final int PHONE = 4;
	final int EMAIL = 5;
	final int BIRTH = 6;
	final int MERRY = 7;
	final int JOB = 8;
	String[] names = {"id","pwd","name","address","phone","email","birth","merry","job"};	
	String[] values = new String[names.length];
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length != 0)
		for(Cookie cookie : cookies)
			for(int i = 0; i < names.length; i++)			
				if(cookie.getName().equals(names[i]))
					values[i] = cookie.getValue();

	for(int i = 0; i < values.length; i++)
		if(values[i] == null || values[i].isEmpty()) {
				request.setAttribute("type","CAN NOT FOUNDED COOKIE");
				request.getRequestDispatcher("Quiz06_Error.jsp").forward(request,response);
			}
	
	for (int i = 0; i < names.length; i++) {
		Cookie cookie = new Cookie(names[i], null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz06_4.jsp</title>
</head>
<body>
	<div>
		ID: <%=values[ID]%> <br>
		PWD: <%=values[PWD]%> <br>
		NAME: <%=values[NAME]%> <br>
		ADDRESS: <%=values[ADDRESS]%> <br>
		PHONE: <%=values[PHONE]%> <br>
		EMAIL: <%=values[EMAIL]%> <br>
		BIRTH: <%=values[BIRTH]%> <br>
		MERRY: <%=values[MERRY]%> <br>
		JOB: <%=values[JOB]%> <br>
	</div>
	<br>
	<button type="button" onclick="location.href='Quiz06_1.jsp'">처음으로</button>
</body>
</html>