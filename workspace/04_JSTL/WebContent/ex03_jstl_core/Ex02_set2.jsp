<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<%--
		EL 크기 비교 연산자 특징
		1. 문자열이 전달되면 "사전 편찬 순"으로 비교한다.
		2. 숫자가 전달되면 "숫자의 크기 순"으로 비교한다.
		3. 문자열이 전될되는 경우를 대비해서 크기 비교는 아래와 같이 한다.
			${a > b} => ${a - b > 0}
			${a < b} => ${a - b < 0}
	--%>
	
	${a} + ${b} = ${a + b}<br>
	${a} - ${b} = ${a - b}<br>
	${a} * ${b} = ${a * b}<br>
	${a} / ${b} = ${a div b}<br>
	${a} % ${b} = ${a mod b}<br>
	
	${a} &gt; ${b} = ${a - b gt 0}<br>
	${a} &ge; ${b} = ${a - b ge 0}<br>
	${a} &lt; ${b} = ${a - b lt 0}<br>
	${a} &le; ${b} = ${a - b le 0}<br>
	${a} = ${b} = ${a - b eq 0}<br>
	${a} &ne; ${b} = ${a - b ne 0}<br>
	
	a = null = ${empty a}<br>
	
	${a}와 ${b}중 큰 값 ${(a - b gt 0) ? a : b}
	
</body>
</html>