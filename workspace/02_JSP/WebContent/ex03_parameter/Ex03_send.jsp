<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn(f) {
		// f는 document.forms.sned_form과 같다.
		
		// 스크립트 코드를 통해서 f의 action을 지정한 뒤 submit을 할 수 있다.
		f.action = '../ex03/Ex03_receive.jsp';
		f.submit();
	}
</script>
</head>
<body>
	<form name="send-form">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="age" placeholder="나이"><br>
		<p><input type="button" value="전송" onclick="fn(this.form)"></p>
	</form>
</body>
</html>