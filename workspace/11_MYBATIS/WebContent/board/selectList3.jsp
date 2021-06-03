<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>개시판</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
	<style>
		.hidden_tr {
			display: none;
		}
		.view_tr {
			
		}
		.link {
			color: blue;
			font-size: 12px;
		}
		.link:hover {
			color: red;
			cursor: pointer;
		}
		.del_dto {
			font-size: 12px;
			text-decoration: none;
			color: blue;
		}
		.del_dto:hover {
			color: red;
			cursor: pointer;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"; integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			const links = $('.link');
			$.each(links, function(i, link){
				$(link).click(function(){
					var tr = $(link).parent().parent().next();
					if(tr.attr('class') == 'hidden_tr')
						tr.attr('class','view_tr');
					else
						tr.attr('class','hidden_tr');
				});
			});
		});
		
		function cancel(t){
			var ctr = $(t).parent().parent().parent();
			ctr.attr('class','hidden_tr');
		}
	</script>
</head>
<body>
	<a href="/11_MYBATIS/insertPage3.do">새글작성</a><br><br>
	<form action="">
		<select name="column">
			<option value="TITLE">제목</option>
			<option value="AUTHOR">작성자</option>
			<option value="BOTH">제목/작성자</option>
		</select>
		<input type="text" name="query">
		<input type="submit" value="검색">
		<a href="/11_MYBATIS/selectList.do"><i class="fas fa-sync-alt"></i></a>
	</form>
	<span>총 개시글 : ${totalRecord}</span>
	<table>
		<thead>
			<tr>
				<th>NO</th>
				<th>TITLE</th>
				<th>AUTHOR</th>
				<th>LASTMODIFIED</th>
				<th>HIT</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">작성된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="dto" varStatus="k">
		<c:if test="${dto.state eq 0}">
			<tr>
				<td>${seq - k.index}</td>
			<c:if test="${dto.depth eq 0}">
				<td>
					${dto.title}&nbsp;
					<span class="link">답글</span>
					<a href="delete.do?no=${dto.no}" class="del_dto">삭제</a>
				</td>
			</c:if>
			<c:if test="${dto.depth ne 0}">
				<td>
					<c:forEach begin="1" end="${dto.depth}" step="1">
						&nbsp;&nbsp;
					</c:forEach>
					ㄴ&nbsp;${dto.title}
					<span class="link">답글</span>
					<a href="delete.do?no=${dto.no}" class="del_dto">삭제</a>
				</td>
			</c:if>
				<td>${dto.author}</td>
				<td>${dto.lastmodified}</td>
				<td>${dto.hit}</td>
			</tr>
			<tr class="hidden_tr">
				<td colspan="5">
					<form action="insertReply3.do" method="post">
						<input type="hidden" name="groupno" value="${dto.groupno}"/>
						<input type="hidden" name="groupord" value="${dto.groupord}"/>
						<input type="hidden" name="depth" value="${dto.depth}"/>
						<input type="hidden" name="content" value=""/>
						<input type="text" name="author" placeholder="작성자"/><br>
						<textarea name="title" placeholder="내용"></textarea>
						<input type="submit" value="작성"/>
						<input type="button" value="취소" onclick="cancel(this)"/>
					</form>
				</td>
			</tr>
		</c:if>
		<c:if test="${dto.state ne 0}">
			<tr>
				<td colspan="5">삭제된 개시글 입니다.</td>
			</tr>
		</c:if>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${paging}</td>
			</tr>
		</tfoot>
	</table>
	
	
</body>
</html>