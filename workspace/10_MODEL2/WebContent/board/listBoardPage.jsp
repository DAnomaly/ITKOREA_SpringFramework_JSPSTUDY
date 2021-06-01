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
	.board_list .top {
		width: 100%;
		height: 30px;
		text-align: right;
	}
	.board_list .top input {
		border: 0;
		padding: 8px 20px;
		border-radius: 3px;
		background-color: #909090;
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.board_list .top input:hover {
		cursor: pointer;
	}
	.board_list .cnt {
		color: #807060;
	}
	.board_list table {
		margin: 0 auto;
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
	.board_list table tbody tr:hover {
		color: #2E64FE;
		cursor: pointer;
	}
	.board_list table tbody tr:hover td {
		color: #2E64FE;
	}
	.board_list table tbody tr:hover td:nth-of-type(2) a {
		text-decoration: underline;
		color: #2E64FE;
	}
	.board_list table tfoot .now_page {
		font-weight: bold;
		color: white;
	}
	.board_list .del {
		color: gray;
	}
	.board_list tr.del:hover td {
		color: gray;
		cursor: default;
	}
	.board_list .center {
		text-align: center;
	}
	#f {
		margin-top: 5px;
		width: 100%;
		height: 40px;
		display: flex;
	}
	#f select, #f input {
		margin: 5px;
		display: inline-block;
		padding: 5px 10px;
		height: 28px;
		box-sizing: border-box;
		background-color: #d0d0d0;
		outline: none;
		border: 0;
		border-radius: 3px;
	}
	#f select, #f input[type="submit"]  {
		background-color: #1E54EE;
		color: white;
	}
</style>
<div class="board_list">
	<div class="top">
		<%-- 로그인을 해야만 게시글을 작성할 수 있다. --%>
	<c:if test="${loginDTO != null}">
		<input type="button" value="게시글 작성하기" onclick="location.href='/10_MODEL2/insertBoardPage.b'"/><br>	
	</c:if>
	</div>
	<p class="cnt">전체: ${totalRecord}개 게시물</p>
	<table>
		<caption>게시글 목록</caption>
		<thead>
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>최종수정일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto" varStatus="i">
		<c:if test="${dto.state == -1 }">
			<tr class="del">
				<td class="del">${seq - i.index}</td>
				<td colspan="4" class="center del">삭제된 게시글로 비공개 처리되었습니다.</td>
			</tr>
		</c:if>
		<c:if test="${dto.state == 0 }">
			<tr onclick="location.href='/10_MODEL2/viewBoardPage.b?idx=${dto.idx}'">
				<td>${seq - i.index}</td>
				<td><a href="/10_MODEL2/viewBoardPage.b?idx=${dto.idx}">${dto.title}</a></td>
				<td>${dto.author}</td>
				<td>${dto.hit}</td>
				<td>${dto.lastmodified}</td>
			</tr>
		</c:if>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					${paging}
				</td>
			</tr>
		</tfoot>
	</table>
	
	<form id="f" action="/10_MODEL2/findBoard.b">
		<div>
			<select name="column">
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
				<option value="AUTHOR">작성자</option>
			</select>
		</div>
		<div>
			<input type="text" name="query"/>
		</div>
		<div>
			<input type="submit" value="검색"/>
		</div>
	</form>
	
	
	
</div>

<%@ include file="../layout/footer.jsp" %>
