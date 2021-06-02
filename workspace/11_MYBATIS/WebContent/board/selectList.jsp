<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>개시판</title>
</head>
<body>
	<a href="/11_MYBATIS/insertPage.do">새글작성</a><br>
	<span>총 개시글 : ${totalRecord}</span>
	<table>
		<thead>
			<tr>
				<th>NO</th>
				<th>TITLE</th>
				<th>AUTHOR</th>
				<th>LASTMODIFIED</th>
				<th>HIT</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">작성된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="dto" varStatus="k">
			<tr>
				<td>${seq - k.index}</td>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.lastmodified}</td>
				<td>${dto.hit}</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${paging}</td>
			</tr>
		</tfoot>
	</table>
	
	
</body>
</html>