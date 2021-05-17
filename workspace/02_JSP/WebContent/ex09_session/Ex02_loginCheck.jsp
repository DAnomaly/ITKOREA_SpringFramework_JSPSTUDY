<%@page import="ex09.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DB로 보낸다고 가정하고 빈 생성
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName("브레드"); // 임의로 결정
	
	// DB를 갔다 왔다고 가정
	// 여기에서는 id와 pw가 같으면 로그인 성공으로 가정
	boolean isMember = id.equals(pw);
	
	if (isMember) {
		session.setAttribute("loginDTO",dto);
	} else {
		out.println("<script>alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');</script>");
	}
	
	// 로그인 화면으로 되돌아가기
	out.println("<script>location.href='Ex02_login.jsp'</script>");
%>