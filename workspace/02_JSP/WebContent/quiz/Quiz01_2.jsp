<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 풀이 1. 스크립트로 이동하기

<%
	request.setCharacterEncoding("utf-8");
	String site = request.getParameter("site");
%>
<script>
	location.href="<%=site%>"
</script>

--%>


<%-- 풀이 2. 리다이렉트로 이동하기 --%>

<%
	// site에는 전체 URL이 포함되어 있다.
	// redirect : 클라이언트에게 전체 URL을 응답하면 클라이언트가 다시 이동한다.	
	request.setCharacterEncoding("utf-8");
	response.sendRedirect(request.getParameter("site"));
	
%>
