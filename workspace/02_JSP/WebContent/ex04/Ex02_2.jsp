<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	JSP 액션태그
	
	1. JSP에서 기본으로 사용할 수 있는 태그이다.
	2. 태그명에 jsp가 prefix값으로 사용된다. (jsp로 시작한다.) 
--%>

<%-- 
	포워드 태그
	
	1. forword를 하는 태그이다.
	2. 기존 request는 그대로 전달한다.
	3. 새로운 request(요청)을 추가할 수 있다. 
--%>
<jsp:forward page="../ex04/Ex02_3.jsp">
	<jsp:param value="50" name="age"/>
</jsp:forward>
