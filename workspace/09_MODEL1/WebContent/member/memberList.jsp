<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");

	if(session.getAttribute("loginDTO") == null || ((MemberDTO)session.getAttribute("loginDTO")).getNo() != 1) {
		response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
	}

	// 1. 미션
	// ArrayList에 전체 회원을 담아 오기
	List<MemberDTO> list = MemberDAO.getInstance().memberList();
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 조회</title>
	<style>
		body {
			width: 560px;
			margin: 0 auto;
		}
		.member-table {
			padding: 10px;
		}
		table {
			border-collapse: collapse;
			margin: 0 auto;
			background-color: #f9f8f7;
		}
		th, td {
			padding: 5px;
		}
		tr > td:first-of-type {
			text-align: center;
			font-weight: bold;
			color: #0000FF;
		}
		thead tr {
			background-color: #909090;
		}
		tbody tr td {
			border-bottom: 1px solid #909090;
		}
		table caption {
			font-weight: bold;
			font-size: 18px;
			color: #2e2e2e;
		}
		.option {
			width: 560px;
			margin: 0 auto;
			padding: 10px;
			background-color: #d0d0d0;
		}
		.option a {
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
	<div class="member-table">
	<table>
		<caption>회원 정보 조회</caption>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>ID</th>
				<th>PW</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.no}</td>
				<td>${dto.id}</td>
				<td>${dto.pw}</td>
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td>${dto.regdate}</td>
			</tr>
</c:forEach>
		</tbody>
	</table>	
	</div>
	<div class="option">
		<a href="/09_MODEL1/">◀ 메인페이지로 이동</a>
	</div>
</body>
</html>