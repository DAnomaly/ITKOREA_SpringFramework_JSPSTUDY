<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex03_application1.jsp</title>
	<script type="text/javascript">
		onload = function(){
			const f = document.forms.insert_form;
			if('<%=request.getParameter("state")%>' == 'visited') {
				f.writer.value = '';				
				f.title.value = '';				
				f.contents.value = '';				
			}
	
			f.addEventListener('submit',function(event){
				if(f.writer.value.trim() == ''){
					alert('작성자를 입력하세요.');
					event.preventDefault();
					return false;
				} else if (f.title.value.trim() == '') {
					alert('제목을 입력하세요.');
					event.preventDefault();
					return false;
				}
				
			});
		}
	</script>
</head>
<body>
	<h3>게시글 작성하기</h3>
	<form action="<%=application.getContextPath()%>/ex05/Ex03_application2.jsp"
		name="insert_form">
		<input type="text" name="date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()))%>" placeholder="작성일"><br>
		<input type="text" name="writer" placeholder="작성자"><br>
		<input type="text" name="title" placeholder="제목"><br>
		<textarea name="contents" rows="5" cols="23"></textarea><br><br>
		<button type="submit">작성하기</button>
		<button type="reset">작성취소</button>
	</form>
</body>
</html>