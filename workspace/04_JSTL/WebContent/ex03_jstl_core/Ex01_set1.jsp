<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	Taglib의 core 라이브러리
	
	1. 지시어를 작성해야 한다.
	   - <%@ %>
	2. 다음과 같이 작성한다.
	   - <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	3. 변수 선언, 분기문, 반복문 등을 태그로 지원한다.
	4. 모든 taglib는 EL문을 사용한다.
--%>    

<%-- core 라이브러리의 지시어 작성 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%--
	// 변수를 선언하고 EL 사용을 위해서 pageContext에 담아두기
	String name = "브레드";
	int age = 50;
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("age", age);
--%>

<%--
	변수 선언 태그 : set
	직전의 Java 작업을 아래 태그로 대신할 수 있다.
--%>
<c:set var="name" value="브레드" scope="page"/>
<c:set var="age" value="50" scope="page"/>
	이름: ${name}<br>
	나이: ${age}<br>
	
<%--
	// 변수를 선언하고 다른 페이지로 보내기 위해서 request에 저장
	String phone = "010-1111-1111";
	String address = "서울시 마포구 서강로";
	request.setAttribute("phone", phone);
	request.setAttribute("address", address);
--%>
<c:set var="phone" value="010-1111-1111" scope="request"/>
<c:set var="address" value="서울시 마포구 서강로" scope="request"/>
	연락처: ${phone}<br>
	주소: ${address}<br>
	
<%-- request 값을 유지하고 이동하는 forward --%>
<%--
	request.getRequestDispatcher("Ex01_set2.jsp").forward(request, response);
--%>
<%-- jsp 액션 태그는 추가 parameter를 전달할 수 있다 --%>
<% 
	request.setCharacterEncoding("utf-8");
%>
<jsp:forward page="Ex01_set2.jsp">
	<jsp:param value="브레드" name="name"/>
	<jsp:param value="50" name="age"/>
</jsp:forward>
</body>
</html>