<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생 목록</title>
</head>
<body>
	<h1>학생 추가 하기</h1>
	<form action="insertStudent.do" method="post">
		<h3>학생 정보</h3>
		<label>학번<input type="text" name="sno" autofocus></label>
		<label>이름<input type="text" name="name"></label>
		<h3>학생 성적</h3>	
		<label>국어<input type="text" name="kor"></label>
		<label>영어<input type="text" name="eng"></label>
		<label>수학<input type="text" name="mat"></label>
		<br>
		<input type="submit" value="추가하기">
	</form>
	<hr>
	<h1>학생 목록 보기</h1>
	<table>
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>평균</th>
				<th>학점</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="7">학생이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.sno}</td>
				<td>${dto.name}</td>
				<td>${dto.kor}</td>
				<td>${dto.eng}</td>
				<td>${dto.mat}</td>
				<td>${dto.ave}</td>
				<td>${dto.grade}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>