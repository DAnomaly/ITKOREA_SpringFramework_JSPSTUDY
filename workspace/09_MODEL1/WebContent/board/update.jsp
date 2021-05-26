<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");	
	
	if(session.getAttribute("loginDTO") == null){
		response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
		return;
	}
	
	MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");

	long idx = Long.parseLong(request.getParameter("idx"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String id = ((MemberDTO)session.getAttribute("loginDTO")).getId();
	
	BoardDTO dto = new BoardDTO();
	dto.setIdx(idx);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setAuthor(id);
	
	boolean res = BoardDAO.getInstance().updateBoard(dto) != 0;
	
	pageContext.setAttribute("res", res);
%>
<c:if test="${res}">
<script>
	alert('게시글이 성공적으로 수정되었습니다.');
	location.href = 'viewPage.jsp?idx=${param.idx}';
</script>
</c:if>
<c:if test="${not res}">
<script>
	alert('게시글을 수정 중 오류가 발생했습니다.');
	history.back();
</script>
</c:if>

