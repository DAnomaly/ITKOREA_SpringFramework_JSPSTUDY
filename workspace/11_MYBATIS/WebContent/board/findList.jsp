<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>개시판</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
</head>
<body>
	<a href="/11_MYBATIS/insertPage.do">새글작성</a><br><br>
	<form action="/11_MYBATIS/findList.do">
		<select name="column">
		<c:if test="${param.column eq 'TITLE'}">
			<option value="TITLE" selected>제목</option>
		</c:if>
		<c:if test="${param.column ne 'TITLE'}">
			<option value="TITLE">제목</option>
		</c:if>
		<c:if test="${param.column eq 'AUTHOR'}">
			<option value="AUTHOR" selected>작성자</option>
		</c:if>
		<c:if test="${param.column ne 'AUTHOR'}">
			<option value="AUTHOR">작성자</option>
		</c:if>
		<c:if test="${param.column eq 'BOTH'}">
			<option value="BOTH" selected>제목/작성자</option>
		</c:if>
		<c:if test="${param.column ne 'BOTH'}">
			<option value="BOTH">제목/작성자</option>
		</c:if>
		</select>
		<input type="text" name="query" value="${param.query}">
		<input type="submit" value="검색">
		<a href="/11_MYBATIS/selectListBoard.do"><i class="fas fa-sync-alt"></i></a>
	</form>
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
				<td colspan="5">개시글을 찾지 못하였습니다.</td>
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