<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		var result = ${param.result > 0};
		if (result) {
			alert('게시글이 등록되었습니다.');
			location.href="/11_MYBATIS/selectListBoard.do";
		} else {
			alert('게시글의 등록이 실패했습니다.');
			location.href="/11_MYBATIS/insertPage.do";
		}
	</script>
</head>
<body>

</body>
</html>