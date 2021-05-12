<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 포워드 이동
	// 기존 요청(request)을 그대로 전달한다.
	// 서버 내 이동이기 때문에 이동할 경로에서 컨텍스트 패스는 작성하지 않는다.
	request.getRequestDispatcher("../ex04/Ex01_3.jsp").forward(request, response);
%>