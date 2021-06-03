<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>삭제 결과</title>
	<script>
		var result = ${param.rs gt 0};
		if(result){
			alert('삭제되었습니다');
			location.href = 'selectList.do';
		} else {
			alert('삭제 실패 하였습니다.');
			history.back();
		}
	</script>
</head>
<body>
</body>
</html>