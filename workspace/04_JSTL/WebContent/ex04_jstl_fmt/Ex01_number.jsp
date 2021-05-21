<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ex01_number.jsp</title>
</head>
<body>
	
	<!-- groupingUsed -->
	<fmt:formatNumber value="123456789.123456789" groupingUsed="true"/> <!-- 결과 : 123,456,789.123  --> <br>
	
	<!-- pattern="#,##0" -->
	<fmt:formatNumber value="123456789.123456789" pattern="#,##0"/> <!-- 결과 : 123,456,789  --> <br>
	<fmt:formatNumber value="123456789.123456789" pattern="#,##0.0"/> <!-- 결과 : 123,456,789.1  --> <br>
	<fmt:formatNumber value="123456789.123456789" pattern="#,##0.00"/> <!-- 결과 : 123,456,789.12  --> <br>
	
	<!-- pattern="0" -->
	<fmt:formatNumber value="123456789.123456789" pattern="0"/> <!-- 결과: 123456789 --> <br>	
	<fmt:formatNumber value="123456789.123456789" pattern="0.0"/> <!-- 결과: 123456789.1 --> <br>	
	<fmt:formatNumber value="123456789.123456789" pattern="0.00"/> <!-- 결과: 123456789.12 --> <br>
	
	<!-- type="percent" -->
	<fmt:formatNumber value="123456789.123456789" type="percent"/> <!-- 결과: 12,345,678,912% --> <br>
	
	<!-- type="currency" -->
	<fmt:formatNumber value="123456789.123456789" type="currency"/> <!-- 결과: \123,456,789 --> <br>
	<fmt:formatNumber value="123456789.123456789" type="currency" currencySymbol="$"/> <!-- 결과: $123,456,789 --> <br>
	
</body>
</html>