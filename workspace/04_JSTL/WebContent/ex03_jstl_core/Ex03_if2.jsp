<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%--
	if문
	
	1. <c:if test="조건식"></c:if>
	2. else 개념이 없다.
--%>

<%-- parameter로 전달 되고 있는 a와 b 중에서 큰 수를 출력하기 --%>
<c:if test="${param.a - param.b ge 0}">
	<c:set var="max" value="${param.a}"/>
</c:if>
<c:if test="${(param.a - param.b ge 0) eq false}">
	<c:set var="max" value="${param.b}"/>
</c:if>
	<h3>${param.a}와 ${param.b} 중 큰 수는 ${max}이다.</h3>
	
<%-- a 와 b중에서 10과 가까운 수를 출력하시오 --%>
<c:if test="${((param.a - 10) ge 0 ? (param.a - 10) : (param.a - 10) * -1 ) 
			gt ((param.b - 10) ge 0 ? (param.b - 10) : (param.b - 10) * -1 ) }">
	<h3>${param.a}와 ${param.b} 중 10에 가까운 수는 ${param.b}이다.</h3>
</c:if>
<c:if test="${((param.a - 10) ge 0 ? (param.a - 10) : (param.a - 10) * -1 ) 
			lt ((param.b - 10) ge 0 ? (param.b - 10) : (param.b - 10) * -1 )}">
	<h3>${param.a}와 ${param.b} 중 10에 가까운 수는 ${param.a}이다.</h3>
</c:if>
<c:if test="${((param.a - 10) ge 0 ? (param.a - 10) : (param.a - 10) * -1 ) 
			eq ((param.b - 10) ge 0 ? (param.b - 10) : (param.b - 10) * -1 )}">
	<h3>${param.a}와 ${param.b}는 10에 대한 차이가 동일하다</h3>
</c:if>
</body>
</html>