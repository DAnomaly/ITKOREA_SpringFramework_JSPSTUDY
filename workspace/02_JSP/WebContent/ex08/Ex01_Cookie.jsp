<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex01_Cookie.jsp</title>
</head>
<body>
	
	<%
		// 쿠키는 서버가 만든다.
		// 자바 영역은 서버 영역이다.
		
		// 1. 쿠키 만들기
		Cookie cookie = new Cookie("name","브레드"); // new Cookie(쿠키이름, 값);
		
		// 2. 쿠키의 유효시간 정하기
		// 언제까지 쿠키의 데이터를 보관할 것인가?
		cookie.setMaxAge(15*24*60*60); // 15일간 보관하는 쿠키 (초 단위)
		
		// 3. 쿠키를 클라이언트에게 보내기
		// 서버가 클라이언트에게 전달 : 응답 (response)
		response.addCookie(cookie);
	%>
	
	<%--
		쿠키 확인 경로
		
		크롬 : chrome://settings/cookies/
		웨일 : whale://settings/siteData/
	--%>
	
	<%--
		쿠키의 이름, 유효시간, 값 확인
		
		1. 이름 : cookie.getName()
		2. 유효시간 : cookie.getMaxAge()
		3. 값 : cookie.getValue()
	--%>
	
	<h3>쿠키 확인</h3>
	쿠키 이름 : <%=cookie.getName()%> <br>
	쿠키 유효시간 : <%=cookie.getMaxAge()%> <br>
	쿠키 값 : <%=cookie.getValue()%>
	
</body>
</html>