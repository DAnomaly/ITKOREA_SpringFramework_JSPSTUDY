<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>quiz02.jsp</title>
</head>
<body>
	<%-- 1월 ~ 12월 select 태그 --%>
	<select name="month">
		<option value="">월</option>
		<% for (int m = 1; m <= 12; m++) { %>
		<option value="<%= m %>"><%= m %>월</option>
		<% } %>
	</select>
</body>
</html>