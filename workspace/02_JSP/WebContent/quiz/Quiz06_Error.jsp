<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	alert('오류: <%=request.getAttribute("type")%>\n' + 
			'세션이 만료되었습니다.');
	location.href='Quiz06_1.jsp';
</script>