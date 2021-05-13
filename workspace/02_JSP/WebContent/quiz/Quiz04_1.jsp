<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num1 = (int)(Math.random() * 9 + 1);
	int num2 = (int)(Math.random() * 9 + 1);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		onload = () => {
			document.forms.f.addEventListener('submit', f_submit);
		}
		
		function f_submit(event){
			var reg = /^[0-9]+/;
			if(!reg.test(f.ans.value)){
				alert('정수만 입력 가능합니다. 다시 입력해 주세요.');
				event.preventDefault();
				return false;
			}
			f.action="Quiz04_2.jsp";
			f.submit();
		}
	</script>
</head>
<body>
	<h3>랜덤 계산기</h3>
	<form name="f">
		<input type="hidden" name="num1" value="<%=num1%>">
		<input type="hidden" name="num2" value="<%=num2%>">
		<p><%=num1%> + <%=num2%> = <input type="text" name="ans" size="2"><input type="submit"></p>
	</form>
</body>
</html>