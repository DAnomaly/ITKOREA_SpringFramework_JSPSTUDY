<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<%--
	for (int i = 0; i < 10; i++) {
		out.println(i + "<br>");
	}
--%>
<c:forEach var="i" begin="0" end="9" step="1">
	${i} <br>
</c:forEach>
	<hr>
	
<%-- Java 배열을 forEach문으로 사용하기 --%>
<%
	String[] hobbies = {"낚시","운동","등산"};
	pageContext.setAttribute("hobbies", hobbies);
%>
<c:forEach items="${hobbies}" var="hobby">
	취미: ${hobby}<br>
</c:forEach>
	<hr>
	
<%-- var Status : index, count --%>
<c:forEach var="hobby" items="${hobbies}" varStatus="k">
	${hobby}의 인덱스: ${k.index}, 순번: ${k.count}<br>
</c:forEach>
	<hr>
	
<%-- ArrayList forEach문으로 사용하기 --%>
<%
	List<String> list = new ArrayList<>();
	list.add("튀김");
	list.add("떡볶이");
	list.add("순대");
	pageContext.setAttribute("list", list);
%>
<c:forEach var="food" items="${list}">
	${food}
</c:forEach>

</body>
</html>