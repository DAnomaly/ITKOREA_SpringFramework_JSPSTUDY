<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	String pw = request.getParameter("pw");
	long no = ((MemberDTO)session.getAttribute("loginDTO")).getNo();

	// 2. DB로 보낼 DTO 생성
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	dto.setPw(pw);
	
	// 3. MemberDAO에서 비밀번호 변경
	int res = MemberDAO.getInstance().updatePw(dto);
	
	// 4. res 성공 유무
	if(res > 0){
		// 비밀번호 변경 성공
		// session의 loginDTO 비밀번호 갱신
		((MemberDTO)session.getAttribute("loginDTO")).setPw(pw);
		out.println("<script>");
		out.println("alert('비밀번호가 성공적으로 변경되었습니다.');");
		out.println("self.close();");
		out.println("</script>");
	} else {
		// 비밀번호 변경 실패
		out.println("<script>");
		out.println("alert('비밀번호 변경 도중 오류가 발생했습니다');");
		out.println("history.back();");
		out.println("</script>");
	}
	
%>
