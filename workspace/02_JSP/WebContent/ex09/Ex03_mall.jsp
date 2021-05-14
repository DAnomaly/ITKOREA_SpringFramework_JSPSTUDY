<%@page import="ex09.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		MemberDTO loginDTO = null;
		if((loginDTO = (MemberDTO)session.getAttribute("loginDTO")) == null)
			response.sendRedirect("Ex03_login.jsp");
	%>

	<form action="Ex03_addcart.jsp">
		<h3><%=loginDTO.getName()%>님 환영합니다</h3>
		<h3>상품 선택</h3>
		<select name="product">
			<option value="냉장고">냉장고</option>
			<option value="세탁기">세탁기</option>
			<option value="건조기">건조기</option>
		</select>
		<input type="text" name="quantity" size="3" maxlength="3">개
		<button>장바구니에 담기</button>
	</form>
</body>
</html>