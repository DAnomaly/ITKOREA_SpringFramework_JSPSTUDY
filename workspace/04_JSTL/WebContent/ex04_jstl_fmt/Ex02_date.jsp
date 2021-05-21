<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex02_date.jsp</title>
</head>
<body>
	
	<c:set var="now" value="<%=new Date()%>"/>

	<!-- 디폴트 -->	
	<fmt:formatDate value="${now}"/> <!-- 결과: 2021. 5. 21 --> <br>
	
	<!-- pattern: 년 월 일 요일 -->
	<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 E요일"/> <!-- 결과: 2021년 5월 21일 금요일 --> <br>
	
	<!-- pattern: 오전/오후 시:분:초 -->
	<fmt:formatDate value="${now}" pattern="a h:mm:ss"/> <!-- 결과: 오전 10:33:33 --> <br>
	<fmt:formatDate value="${now}" pattern="H:mm:ss"/> <!-- 결과: 10:33:33 --> <br>
	
</body>
</html>