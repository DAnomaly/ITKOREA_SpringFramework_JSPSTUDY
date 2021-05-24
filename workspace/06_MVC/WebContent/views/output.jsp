<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<c:if test="${date ne null}">
	<h3>오늘 날짜는 ${date} 입니다.</h3>
</c:if>
<c:if test="${time ne null}">
	<h3>현재 시각은 ${time} 입니다.</h3>
</c:if>
</body>
</html>