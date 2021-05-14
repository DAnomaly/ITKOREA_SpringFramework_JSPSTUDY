<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex04_change_cookie.jsp</title>
</head>
<body>
	<%--
		쿠키를 변경하는 과정
		
		1. 서버가 클라이언트의 모든 쿠키를 읽는다.
		2. 변경할 쿠키를 찾는다.
		3. 같은 쿠키이름을 가진 새로운 쿠키를 만들어 덮어쓰기한다.
	--%>
	<%
		// 쿠키이름 "name"인 쿠키를 "초코", 1일간 유지로 변경한다.
		
		// 1. 변경할 쿠키를 만든다.
		Cookie ck = new Cookie("name","가위");
		ck.setMaxAge(60*60*24);
		
		// 2. 전체 쿠키를 읽는다.
		Cookie[] cookies = request.getCookies();
		
		// 3. 같은 쿠키를 찾는다.
		Cookie f_ck = null;
		if(cookies != null && cookies.length != 0)
			for (Cookie cookie : cookies) 
				if(cookie.getName().equals("name"))
					response.addCookie(ck); // 덮어쓰기한다.
		
		// 4. 다시 전체 쿠키를 확인해 본다.
		Cookie[] cookies2 = request.getCookies();
		if(cookies2 != null && cookies2.length != 0)
			for(Cookie cookie : cookies2) {
				out.println("쿠키이름 : " + cookie.getName() + "<br>");
				out.println("유효시간 : " + cookie.getMaxAge() + "<br>");
				out.println("쿠키값 : " + cookie.getValue() + "<br>");
				out.println("<br>");
			}
				
	%>
</body>
</html>