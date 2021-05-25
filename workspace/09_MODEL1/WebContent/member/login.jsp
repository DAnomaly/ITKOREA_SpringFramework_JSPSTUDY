<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 2. DB로 보낼 DTO 생성
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	
	// 3. DTO를 DAO로 전송
	MemberDTO loginDTO = MemberDAO.getInstance().login(dto);
	
	// 4. 로그인이 되었다면 loginDTO(로그인 된 회원 정보)를 session에 올린다.
	if(loginDTO != null) {
		// 로그인 성공
		session.setAttribute("loginDTO", loginDTO);
		response.sendRedirect("/09_MODEL1/");
	} else {
		// 로그인 실패
		out.println("<script>");
		out.println("alert('존재하지 않는 아이디 이거나 올바르지 않는 비밀번호 입니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
%>
    
    