<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if(session.getAttribute("loginDTO") == null){
		response.sendRedirect("/09_MODEL1/member/loginPage.jsp");
	} 
%>
<%
	List<BoardDTO> list = BoardDAO.getInstance().selectAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 목록</title>
	<style>
		/* body */
		body {
			width: 680px;
			margin: 0 auto;
			margin-top: 40px;
		}
		/* header */
		header h3 {
			text-align: center;
		}
		/* section */
		section {
			padding: 10px;
		}
		/* section:table */
		section > table {
			border-collapse : collapse;
			margin: 0 auto;
		}
		section th, section td {
			margin: 0;
			padding: 5px;
		}
		section table a {color:black; text-decoration: none;}
		section thead tr {background-color: gray; color: white;}
		section thead tr th:nth-of-type(1) {width: 35px;}
		section thead tr th:nth-of-type(2) {width: 200px;}
		section thead tr th:nth-of-type(3) {width: 85px;}
		section thead tr th:nth-of-type(4) {width: 85px;}
		section thead tr th:nth-of-type(5) {width: 100px;}
		section tbody tr td {border-bottom: 1px solid gray; text-align: center;}
		section tbody tr td:nth-of-type(1) {font-weight: bold;}
		section tbody tr td:nth-of-type(2) {text-align: left;}
		section tbody tr:hover {
			color: blue;
			cursor: pointer;
		}
		section tbody tr:hover td:nth-of-type(2) a {color:blue; text-decoration: underline;}
		/* footer */
		footer {
			width: 400px;
			margin: 0 auto;
		}
		footer > .left {
			float: left;
		}
		footer > .right {
			float: right;
		}
		footer a {
			text-decoration: none;
			color: black;
		}
		footer a:hover {
			color: purple;
		}
	</style>
</head>
<body>
	<div class="container">
		<header>
			<h3>개시글 목록</h3>
		</header>
		<section>
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
<c:forEach items="${list}" var="dto">
					<tr onclick="location.href='viewPage.jsp?idx=${dto.idx}'">
						<td>${dto.idx}</td>
						<td><a href="viewPage.jsp?idx=${dto.idx}">${dto.title}</a></td>
						<td>${dto.author}</td>
						<td>${dto.hit}</td>
						<td>${dto.postdate}</td>
					</tr>
</c:forEach>
				</tbody>
			</table>					
		</section>
		<footer>
			<div class="left">
				<a href="/09_MODEL1/">◀ 메인 페이지로</a>
			</div>
			<div class="right">
				<a href="insertPage.jsp">새글 작성 ▶</a>
			</div>
		</footer>
	</div>
</body>
</html>