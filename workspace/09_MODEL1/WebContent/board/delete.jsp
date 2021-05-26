<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");	

	// o. 비로그인 시
	if(session.getAttribute("loginDTO") == null){
		response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
		return;
	}
	
	MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");
%>
<%
	long idx = Long.parseLong(request.getParameter("idx"));
	String id = ((MemberDTO)session.getAttribute("loginDTO")).getId();
	
	int res = BoardDAO.getInstance().deleteBoard(idx, id);
	
	pageContext.setAttribute("res", res != 0);	
%>
<c:if test="${res}">
<script>
	alert('성공적으로 삭제되었습니다.');
	location.href='boardList.jsp';
</script>
</c:if>
<c:if test="${not res}">
<script>
	alert('삭제 도중 오류가 발생했습니다.');
	location.href='viewPage.jsp?idx=${param.idx}';
</script>
</c:if>
