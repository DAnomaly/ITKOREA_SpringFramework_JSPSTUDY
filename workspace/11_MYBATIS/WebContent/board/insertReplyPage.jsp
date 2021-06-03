<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글 작성</title>
</head>
<body>
	<form action="/11_MYBATIS/insertReply.do" method="post">
		<input type="hidden" name="no" value="${param.no}"/>
		<h3>댓글 작성하기</h3>
		<ul>
			<li>
				<span>작성자</span>
				<input type="text" name="author" autofocus/>
			</li>
			<li>
				<span>제목</span>
				<input type="text" name="title" required/>
			</li>
			<li>
				<span>내용</span>
				<textarea name="content" rows="5" cols="80"></textarea>
			</li>
		</ul>
		<div>
			<button>저장하기</button>
			<input type="reset" value="작성초기화"/>
		</div>
	</form>
</body>
</html>