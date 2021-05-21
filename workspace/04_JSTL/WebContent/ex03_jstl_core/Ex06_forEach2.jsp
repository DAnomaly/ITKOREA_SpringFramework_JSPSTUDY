<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%	request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex06_forEach2.jsp</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr onclick="javascript:alert('${dto.no}번 글')">
					<td>${dto.no}</td>
					<td>${dto.title}</td>
					<td>${dto.content}</td>
					<td>${dto.author}</td>
					<td>${dto.like}</td>
				</tr>
			</c:forEach>
		</tbody>	
	</table>
</body>
</html>