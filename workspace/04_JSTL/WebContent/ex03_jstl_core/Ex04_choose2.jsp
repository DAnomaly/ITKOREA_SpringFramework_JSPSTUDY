<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex04_choose2.jsp</title>
</head>
<body>
	<c:set var="average" value="${(param.kor + param.eng + param.mat) div 3}"/>
	<h3>세 과목의 평균은 ${average}입니다</h3>
	
	<%-- if 태그로 학점(grade) 계산하기 --%>
	<c:set var="grade" value="F"/>
	
	<c:if test="${average - 60 ge 0}">
		<c:set var="grade" value="D"/>
	</c:if>
	<c:if test="${average - 65 ge 0}">
		<c:set var="grade" value="D+"/>
	</c:if>
	<c:if test="${average - 70 ge 0}">
		<c:set var="grade" value="C"/>
	</c:if>
	<c:if test="${average - 75 ge 0}">
		<c:set var="grade" value="C+"/>
	</c:if>
	<c:if test="${average - 80 ge 0}">
		<c:set var="grade" value="B"/>
	</c:if>
	<c:if test="${average - 85 ge 0}">
		<c:set var="grade" value="B+"/>
	</c:if>
	<c:if test="${average - 90 ge 0}">
		<c:set var="grade" value="A"/>
	</c:if>
	<c:if test="${average - 95 ge 0}">
		<c:set var="grade" value="A+"/>
	</c:if>
	
	<h3>당신의 학점은 ${grade}입니다</h3>
	
	<%-- choose 태그로 학점(grade) 계산하기 --%>
	<c:choose>
		<c:when test="${average - 90 ge 0 }">
			<c:set var="grade2" value="A"/>
		</c:when>
		<c:when test="${average - 80 ge 0 }">
			<c:set var="grade2" value="B"/>
		</c:when>
		<c:when test="${average - 70 ge 0 }">
			<c:set var="grade2" value="C"/>
		</c:when>
		<c:when test="${average - 60 ge 0 }">
			<c:set var="grade2" value="D"/>
		</c:when>
		<c:otherwise>
			<c:set var="grade2" value="F"/>
		</c:otherwise>
	</c:choose>
	
	<h3>당신의 학점은 ${grade2}입니다</h3>
	
</body>
</html>