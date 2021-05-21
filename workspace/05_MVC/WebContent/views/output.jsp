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
<c:if test="${today ne null}">
	<h3>요청한 현재 날짜는 ${today} 입니다.</h3>
</c:if>
<c:if test="${time ne null}">
	<h3>요청한 현재 시간은 ${time} 입니다.</h3>
</c:if>
<c:if test="${lotto ne null}">
	<h3>요청한 로또 번호는 <c:forEach items="${lotto}" var="num">${num} </c:forEach> 입니다.</h3>
</c:if>
<c:if test="${gugudan ne null}">
	<p>${gugudan}</p>
</c:if>
<c:if test="${result ne null}">
	<h3>${result}</h3>
</c:if>
<c:if test="${meal ne null}">
	<h3>지금 준비된 식사는 ${meal}입니다.</h3>
</c:if>
</body>
</html>