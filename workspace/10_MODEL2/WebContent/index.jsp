<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="layout/header.jsp">
	<jsp:param value="환영합니다" name="title"/>
</jsp:include>
	<h1>홈페이지에 오신 걸 환영합니다</h1>
<%@ include file="layout/footer.jsp" %>
