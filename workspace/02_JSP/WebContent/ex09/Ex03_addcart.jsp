<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ex09.ProductDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	if(session.getAttribute("loginDTO") == null)
		response.sendRedirect("Ex03_login.jsp");
	
	String product = request.getParameter("product");
	String quantity = request.getParameter("quantity");
	
	// product과 quantity를 하나의 데이터로 저장하려면 DTO 또는 Map을 사용하면 된다.
	// Map 방식
	/*
	Map<String,String> products = null;
	if (session.getAttribute("cart") != null)
		products = (Map<String,String>)session.getAttribute("cart");	
	else
		products = new HashMap<>();
	
	products.put(product,quantity);
	session.setAttribute("cart", products);
	*/
	
	// DTO 방식
	ProductDTO dto = new ProductDTO();
	dto.setProduct(product);
	dto.setQuantity(quantity);
	
	List<ProductDTO> cart = (ArrayList<ProductDTO>)session.getAttribute("cart");
	if(cart == null) {
		cart = new ArrayList<>();
		session.setAttribute("cart", cart);
	}
	
	for(int i = 0; i < cart.size(); i++)
		if(cart.get(i).getProduct().equals(dto.getProduct())){
			cart.remove(i);
			break;			
		}
	
	cart.add(dto);
%>
<script>
	alert('<%=dto.getProduct()%> 제품을 장바구니에 추가했습니다.');
	if (confirm('장바구니로 가려면 "확인",계속 쇼핑하려면 "취소"를 누르세요.'))
		location.href = 'Ex03_cart.jsp';
	else
		location.href = 'Ex03_mall.jsp';
</script>

