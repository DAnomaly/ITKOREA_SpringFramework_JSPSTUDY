<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	if(name.isEmpty()) { name = "기본이름"; }
	String strAge = request.getParameter("age").trim();
	int age = 0;
	if(!strAge.isEmpty()) { age = Integer.parseInt(strAge); }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('이름은 <%=name%>이고, 나이는 <%=age%>살이다.');
	history.back();
</script>
</head>
</html>