<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="ex09.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (id == null || pw == null)
		response.sendRedirect("Ex03_login.jsp");
		
	// id/pw/name을 저장하고 있는 빈
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	switch (id) {
	case "admin": dto.setName("관리자"); break;
	case "superman": dto.setName("슈퍼맨"); break;
	case "bread": dto.setName("빵"); break;
	}

	// DB대용 Map
	Map<String,String> db = new HashMap<>();
	db.put("admin","1234");
	db.put("superman","1234");
	db.put("bread","1234");

	// DB를 갔다 왔다고 가정
	// 여기에서는 id와 pw가 같으면 로그인 성공으로 가정
	boolean isMember = false;
	
	if(db.containsKey(dto.getId()) && dto.getPw().equals(db.get(dto.getId()))){
		session.setAttribute("loginDTO", dto);
		isMember = true;
	}

	// 로그인 화면으로 되돌아가기
	if(isMember) 
		response.sendRedirect("Ex03_mall.jsp");
	else
		response.sendRedirect("Ex03_login.jsp");
%>