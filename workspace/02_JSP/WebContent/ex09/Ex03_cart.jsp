<%@page import="ex09.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ex09.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginDTO = null;
	if((loginDTO = (MemberDTO)session.getAttribute("loginDTO")) == null)
		response.sendRedirect("Ex03_login.jsp");

	List<ProductDTO> cart = (ArrayList<ProductDTO>)session.getAttribute("cart");
	if(cart == null)
		cart = new ArrayList<>();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex03_cat.jsp</title>
</head>
<body>
	<h3>장바구니 목록</h3>
	<table>
		<thead>
			<tr>
				<th>상품</th>
				<th>수량</th>
			</tr>
		</thead>
		<tbody>
	<% for(int i = 0; i < cart.size(); i++) { %>
			<tr>
				<td><%=cart.get(i).getProduct()%></td>
				<td><%=cart.get(i).getQuantity()%></td>
			</tr>
	<% } %>
		</tbody>
	</table>
	<input type="button" value="계속쇼핑하기" onclick="fn1()">
	<input type="button" value="장바구니비우기" onclick="fn2()">
</body>
<script type="text/javascript">
	function fn1() {
		location.href="Ex03_mall.jsp";
	}
	function fn2() {
		location.href="Ex03_deleteCart.jsp";
	}
</script>
</html>