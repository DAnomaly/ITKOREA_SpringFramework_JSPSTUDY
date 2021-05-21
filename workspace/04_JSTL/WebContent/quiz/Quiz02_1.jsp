<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz02_1.jsp</title>
	<style>
		body {
			width: 650px;
			margin: 0px auto;
		}
		h3 {
			border-bottom: 1px solid black;
			padding-bottom: 4px;
		}
		input.size {
			outline: none;
			border: 0;
			border-bottom: 1px solid black;
		}
	
	</style>
</head>
<body>
	<form id="form" action="Quiz02_2.jsp" method="get">
		<h3>일반 forEach 연습</h3>
		<p>아래에 크기를 입력하면 폰트 크기를 확인할 수 있습니다.
		<div>
			<span>최소 크기</span>
			<input class="size" name="min_size" size="2"><br>
			<span>최대 크기</span>
			<input class="size" name="max_size" size="2"><br>
		</div>
		
		<br>
		<h3>향상 forEach 연습</h3>
		<input type="checkbox" name="food" value="불고기" id="food1"> <label for="food1">불고기</label>
		<input type="checkbox" name="food" value="닭갈비" id="food2"> <label for="food2">닭갈비</label>
		<input type="checkbox" name="food" value="순대국" id="food3"> <label for="food3">순대국</label>
		<input type="checkbox" name="food" value="자장면" id="food4"> <label for="food4">자장면</label>
		<input type="checkbox" name="food" value="해장국" id="food5"> <label for="food5">해장국</label>
		
		<br><br>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</body>
</html>