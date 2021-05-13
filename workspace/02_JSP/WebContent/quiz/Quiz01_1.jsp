<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz01_1.jsp</title>
	<script type="text/javascript">
		function f_btn(f) {
			var site = f.site.value;
			location.href = "../quiz/Quiz01_2.jsp?site=" + site;
		}
	</script>
</head>
<body>
	<%
		String[][] sites = {
				{"구글","http://www.google.com/"},
				{"네이버","https://www.naver.com/"},
				{"다음","https://www.daum.net/"},
				{"네이트","https://www.nate.com/"}
		};
	%>
	<form>
		<select name="site">
			<% for (int i = 0; i < sites.length; i++) { %>
				<option value="<%=sites[i][1]%>"><%=sites[i][0]%></option>
			<% } %>
		</select>
		<button type="button" onclick="f_btn(this.form)">확인</button>
	</form>
</body>
</html>