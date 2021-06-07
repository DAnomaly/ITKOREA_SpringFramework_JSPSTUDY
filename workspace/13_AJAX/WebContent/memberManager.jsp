<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매인페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			selectMemberList();
			$('#insert_btn').on('click',insert);
			$('#update_btn').on('click',update);
			$('#reset_btn').on('click',reset);
		});
		
		function selectMemberList() {
			$('#memberList').empty();
			$.ajax({
				url: 'selectMemberList.do',
				type: 'get',
				dataType: 'json',
				success: function(result) {
						if( result.isExist ) { // 목록이 있다면
							generateMemberList(result);
						} else {
							var td = $('<td colspan="6">').text('회원 목록이 없습니다.');
							$('<tr>').append(td).appendTo('#memberList');
						}	
					},
				error: function(xhr, status, error){
						console.log("회원 목록 로드 에러" + "\n" + status + " : " + error);
					}
			})
		}
		
		function generateMemberList(result) {
			for (var i = 0; i < result.list.length; i++) {
				var member = result.list[i];
				var tr = $('<tr>').attr('id','tr_no_' + member.no);
				$('<td>').text(member.no).appendTo(tr);
				$('<td>').text(member.id).appendTo(tr);
				$('<td>').text(member.name).appendTo(tr);
				$('<td>').text(member.gender).appendTo(tr);
				$('<td>').text(member.address).appendTo(tr);
				$('<td>').html('<input type="button" value="조회" onclick="search(' + member.no + ')"/> <input type="button" value="삭제" onclick="del(' + member.no + ')"/>').appendTo(tr);
				$('#memberList').append(tr);
			}
		}
		function search(no) {
			$.ajax({
				url: 'selectMemberOne.do',
				type: 'post',
				data: 'no=' + no,
				dataType: 'json',
				success: function(result) {
						$('#no').val(result.member.no);
						$('#id').val(result.member.id);
						$('#name').val(result.member.name);
						if(result.member.gender == '남')
							$('#male').click();
						else
							$('#female').click(); 
						$('#address').val(result.member.address);
					},
				error: function(xhr, status, error){
						console.log("회원 검색 로드 에러" + "\n" + status + " : " + error);
					}
			});
		}
		function del(no) {
			if(confirm('정말로 삭제하시겠습니까?')){
				$.ajax({
					url: 'deleteMember.do',
					type: 'post',
					data: 'no=' + no,
					dataType: 'json',
					success: function(data) {
							if(data.result) {
								alert('삭제되었습니다.');
								$('#tr_no_' + no).remove();
							} else {
								alert('삭제 도중 오류가 발생했습니다.');
							}
						},
					error: function(xhr, status, error){
							console.log("회원 삭제 에러" + "\n" + status + " : " + error);
						}
				});
			}
		}
		function insert() {
			$.ajax({
				url: 'insertMember.do',
				type: 'post',
				data: $('form').serialize(),
				dataType: 'json',
				success: function(data) {
					if(data.result) {
						alert('성공적으로 추가되었습니다.');
						selectMemberList();
						$('#reset_btn').click();
					} else {
						alert('추가 도중 오류가 발생했습니다.');
					}
				},
				error: function(xhr, status, error){
					console.log("회원 추가 에러" + "\n" + status + " : " + error);
				}
			})
		}
		function update() {
			if($('#no').val() == null || $('#no').val() == '') {
				alert('회원목록에서 먼저 조회버튼을 이용해 주세요.');
				return;
			}
			$.ajax({
				url: 'updateMember.do',
				type: 'post',
				data: $('form').serialize(),
				dataType: 'json',
				success: function(data) {
					if(data.result) {
						alert('성공적으로 수정되었습니다.');
						selectMemberList();
						$('#reset_btn').click();
					} else {
						alert('수정 도중 오류가 발생했습니다.');
					}
				},
				error: function(xhr, status, error){
					console.log("회원 수정 에러" + "\n" + status + " : " + error);
				}
			})
		}
		function reset() {
			$('#no').val(null);
		}
	</script>
	<style>
		* {
			padding: 0;
			margin: 0;
			box-sizing: border-box;
		}
		.container {
			width: 1080px;
			margin: 0 auto;
			margin-top: 60px;
			display: flex;
			justify-content: space-between;
		}
		.left {
			width: 380px;
			height: 280px;
			background-color: #606060;
			padding: 5px;
			border-radius: 5px;
			font-size: 12px;
			color: #eee;
		}
		.left h3 {
			font-size: 18px;
			margin-left: 5px;
			margin-bottom: 5px;
			color: #fff;
		}
		.left input, .left select {
			margin: 0 5px;
			padding: 5px 10px;
			margin-bottom: 10px;
			font-size: 12px;
		}
		.left input[type="button"], .left input[type="reset"]{
			float: right;
			margin: 5px; 
			font-size: 12px;
			font-weight: bold;
			outline: none;
			border: 1px solid #fff;
			border-radius: 3px;
			cursor: pointer;
		}
		.left input[type="text"], .left select {
			outline: none;
			border: 0;
			border-radius: 5px;
			backgroun-color: #eee;
		}
		.left input[type="text"] {
			padding: 8px 10px;
		}
		.left input[type="button"] {
			background-color: #2E64FE;
			border: 1px solid #5882FA;
			color: white;
		}
		.right {
			width: 680px;
			text-align: center;
		}
		table {
			margin: 0 auto;
			margin-top: 10px;
			border-collapse: collapse;
			width: 650px;
			font-size: 12px;
		}
		td, th {
			padding: 5px 10px;
			text-align: center;
		}
		th {
			background-color: gray;
			color: white;
		}
		td {
			background-color: #E6E6E6;
			border-bottom: 1px solid #fff;
		}
		
		thead tr th:nth-of-type(1) { width: 10%; }
		thead tr th:nth-of-type(2) { width: 10%; }
		thead tr th:nth-of-type(3) { width: 10%; }
		thead tr th:nth-of-type(4) { width: 10%; }
		thead tr th:nth-of-type(5) { width: 10%; }
		thead tr th:nth-of-type(6) { width: 10%; }

		tbody tr td:nth-of-type(1) {
			font-weight: bold;
		}
		tbody tr td:nth-of-type(6) input {
			border: 1px solid #FAFAFA;
			border-radius: 5px;
			outline: 0;
			padding: 2px 5px;
			background-color: #F2F2F2;
			cursor: pointer;
		}

		tbody tr:hover td {
			background-color: #D8D8D8;
		}

	</style>
</head>
<body>

	<div class="container">
		<%-- 회원삽입/수정/보기 --%>
		<div class="left">
		<form id="form">
			<input type="hidden" name="no" id="no"/>
			<h3>삽입/수정/보기</h3>
			아이디<br>
			<input type="text" name="id" id="id"/><br>
			이름<br>
			<input type="text" name="name" id="name"/><br>
			성별<br>
			<label><input type="radio" name="gender" value="남" id="male"/>남</label>
			<label><input type="radio" name="gender" value="여" id="female"/>여</label><br>
			주소<br>
			<select name="address" id="address">
				<option value="">지역 선택</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="울산">울산</option>
				<option value="부산">부산</option>
			</select>
			<br>
			<input type="button" value="회원등록" id="insert_btn">
			<input type="button" value="정보수정" id="update_btn">
			<input type="reset" value="초기화" id="reset_btn">
		</form>
		</div>
		<%-- 회원목록/삭제 --%>
		<div class="right">
			<h3>회원목록/삭제</h3>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>주소</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="memberList">
				
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>