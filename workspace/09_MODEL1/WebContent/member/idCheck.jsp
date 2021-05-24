<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	
	
	// 2. MemberDAO의 isUsableId() 호출
	boolean res = MemberDAO.getInstance().isUsableId(id);
	
	// 3. res
	out.println("<script>");
	if(res) {
		// 가입 가능한 ID이면 true 반환,
		out.println("alert('사용 가능한 아이디입니다.')");
		out.println("location.href='joinPage.jsp?id=" + id + "&chk=true'");
	} else {
		// 가입 불가능한 ID이면 false 반환,
		out.println("alert('중복되는 아이디입니다. 다른 아이디를 이용해 주세요.')");
		out.println("location.href='joinPage.jsp'");
	}
	out.println("</script>");
	
	
%>