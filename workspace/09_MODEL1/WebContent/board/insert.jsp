<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");

	String author = request.getParameter("author");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 2. DTO에 담기
	BoardDTO dto = new BoardDTO();
	dto.setAuthor(author);
	dto.setTitle(title);
	dto.setContent(content);
	
	// 3. DAO 호출
	int res = BoardDAO.getInstance().insertBoard(dto);
	pageContext.setAttribute("res", res);
%>

<%-- 결과 --%>
<c:if test = "${res eq 1}">
	<script>
		alert('게시글이 성공적으로 등록되었습니다.');
		location.href='boardList.jsp';
	</script>
</c:if>
<c:if test="${res eq 0}">
	<script>
		alert('게시글 등록 중 오류가 발생했습니다.');
		history.back();
	</script>
</c:if>