<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	
	long no = ((MemberDTO)session.getAttribute("loginDTO")).getNo();
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// 2. DTO에 담기
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	dto.setName(name);
	dto.setEmail(email);


	// 3. DAO 호출
	int res = MemberDAO.getInstance().updateMyPage(dto);
	
	// 4. 결과
	if (res != 0) {
		// 성공
		MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");
		loginDTO.setName(name);
		loginDTO.setEmail(email);
		out.println("<script>");
		out.println("alert('회원정보가 성공적으로 변경되었습니다.');");
		out.println("location.href='/09_MODEL1/member/myPage.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('회원정보 수정 중 오류가 발생했습니다');");
		out.println("location.href='/09_MODEL1/member/myPage.jsp'");
		out.println("</script>");
	}
	
%>
    
    
