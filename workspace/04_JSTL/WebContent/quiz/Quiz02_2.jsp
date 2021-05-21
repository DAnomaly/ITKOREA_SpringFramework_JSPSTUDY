<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz02_2.jsp</title>
</head>
<body>
	<c:forEach begin="${param.min_size}" end="${param.max_size}" var="i">
		<font size="${i}">
			폰트 사이즈 : ${i} 
		</font> <br>
	</c:forEach>
	<ul>
	<c:forEach items="${paramValues.food}" var="f" varStatus="vs">
		<li>${vs.count}번째 음식: ${f}</li>
	</c:forEach>
	</ul>
</body>
</html>