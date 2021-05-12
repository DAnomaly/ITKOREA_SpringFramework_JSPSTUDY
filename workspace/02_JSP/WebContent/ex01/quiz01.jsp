<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>quiz01.jsp</title>
</head>
<body>
	<%-- 테이블을 생성한다. --%>
	<%
		String[] names = {"브레드","초코","민트"};
		int[] ages = {50,30,20};
		int length = (names.length < ages.length) ? names.length : ages.length ;
	%>
	<table border="1">
		<thead>
			<tr>
				<td>순번</td>
				<td>이름</td>
				<td>나이</td>
			</tr>
			<% for (int i = 0; i < length ; i++){ %>
			<tr>
				<td><%= i+1 %></td>
				<td><%= names[i] %></td>
				<td><%= ages[i] %></td>
			</tr>
			<% } %>
		</thead>
	</table>
	
	
</body>
</html>