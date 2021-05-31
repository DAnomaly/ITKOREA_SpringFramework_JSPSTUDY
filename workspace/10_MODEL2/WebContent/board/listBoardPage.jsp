<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>
<style>
	.board_list {
		padding: 10px 30px;
	}
	.board_list table {
		text-align: center;
		border-collapse: collapse;
		box-sizing: border-box;
		background-color: #d0d0d0;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.board_list table caption {
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: bold;
		font-size: 18px;
	}
	.board_list th, .board_list td {
		font-family: 'Noto Sans KR', sans-serif;
		padding: 5px;
	}
	.board_list table th:nth-of-type(1){width:10%;}
	.board_list table th:nth-of-type(2){width:auto;}
	.board_list table th:nth-of-type(3){width:10%;}
	.board_list table th:nth-of-type(4){width:10%;}
	.board_list table th:nth-of-type(5){width:10%;}
	.board_list table td:nth-of-type(2){text-align: left;}
	.board_list table thead tr th {
		background-color: #2E64FE;
		color: white;
		border-bottom: 1px solid white;
	}
	.board_list table tbody tr td {
		border-bottom: 1px solid white;
	}
	.board_list table tbody tr:hover td{
		color: #2E64FE;
	}
	.board_list table tbody tr:hover td:nth-of-type(2){
		text-decoration: underline;
	}
	
	
</style>
<div class="board_list">
	
	<%-- 로그인을 해야만 게시글을 작성할 수 있다. --%>
	<c:if test="${loginDTO != null}">
		<input type="button" value="게시글 작성하기" onclick="location.href='/10_MODEL2/insertBoardPage.b'"/><br>	
	</c:if>
	
	
	<p>전체: ${totalRecord}개 게시물</p>
	<table>
		<caption>게시글 목록</caption>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>최종수정일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.idx}</td>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.hit}</td>
				<td>${dto.lastmodified}</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
				
				</td>
			</tr>
		</tfoot>
	</table>
	
	
	
</div>

<%@ include file="../layout/footer.jsp" %>
