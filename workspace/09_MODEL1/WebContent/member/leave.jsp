<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 탈퇴할 회원 번호
	request.setCharacterEncoding("utf-8");

	long no = ((MemberDTO)session.getAttribute("loginDTO")).getNo();
	
	// 2. DAO 호출
	int res = MemberDAO.getInstance().deleteMember(no);
	
	// 3. 결과
	if(res != 0) {
		// session의 내용 제거
		session.invalidate();
		out.println("<script>");
		out.println("alert('회원탈퇴 되었습니다.');");
		out.println("location.href='/09_MODEL1/'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('오류가 발생하였습니다.');");
		out.println("location.href='/09_MODEL1/'");
		out.println("</script>");
	}
	
%>