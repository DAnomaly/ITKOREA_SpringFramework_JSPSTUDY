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
			<option value="TITLE">제목</option>
			<option value="AUTHOR">작성자</option>
			<option value="BOTH">제목/작성자</option>
		</select>
		<input type="text" name="query">
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
				<td colspan="5">작성된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="dto" varStatus="k">
			<tr>
				<td>${seq - k.index}</td>
			<c:if test="${dto.depth eq 0}">
				<td>${dto.title}&nbsp;<a href="./insertReplyPage.do?no=${dto.no}">답글</a></td>
			</c:if>
			<c:if test="${dto.depth ne 0}">
				<td>&nbsp;&nbsp;ㄴ&nbsp;${dto.title}</td>
			</c:if>
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