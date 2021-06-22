$(document).ready(function(){
	// Person Load
	fn_load();
	// EventListener
	$('#insert_btn').click(fn_insert);
});
// TABLE LOAD
function fn_load() {
	var tbody = $('#person_list');
	tbody.empty();
	$.ajax({
		url : 'selectList.do',
		type : 'get',
		dataType : 'json',
		success : function(obj) {
				if(obj.result){
					/*
						$.each([Object 또는 배열],function([인덱스],[인덱스 번째의 값]){})	
					 */
					$.each(obj.list,function(i,person){
						var tr = $('<tr>').appendTo(tbody);
						$('<td>').text(person.sno).appendTo(tr);
						$('<td>').text(person.name).appendTo(tr);
						$('<td>').text(person.age).appendTo(tr);
						$('<td>').text(person.birthday).appendTo(tr);
						$('<td>').text(person.regdate).appendTo(tr);
						$('<td>').append($('<input type="button" value="삭제" data-sno="' + person.sno + '" class="del_btn"/>')).appendTo(tr);
					});
					
					/*
					var list = obj.list;
					for (var i = 0; i < list.length; i++) {
						var person = list[i];
						var tr = $('<tr>').appendTo(tbody);
						$('<td>').text(person.sno).appendTo(tr);
						$('<td>').text(person.name).appendTo(tr);
						$('<td>').text(person.age).appendTo(tr);
						$('<td>').text(person.birthday).appendTo(tr);
						$('<td>').text(person.regdate).appendTo(tr);
						$('<td>').append($('<input type="button" value="삭제" onclick="fn_del(' + person.sno + ')"/>')).appendTo(tr);
					}
					 */
				
					$('.del_btn').click(fn_del);
				}
			},
		error : function(xhr) {
				console.log(xhr.status);
				console.log(xhr.responseText);
			}
	})
}


// #insert_btn
function fn_insert() {
	var regSNO = /^[0-9]{6}$/;
	if(!regSNO.test($('#sno').val())){
		alert('주민등록번호는 6자리 숫자입니다.');
		return false;
	}
	$.ajax({
		url : 'insertPerson.do',
		type : 'post',
		data : $('#f').serialize(),
		dataType : 'json',
		success: function(obj) {
				if(obj.result) {
					$('#sno').val('');
					$('#name').val('');
					$('#age').val('');
					$('#birthday').val('');
					alert('회원정보가 정상적으로 등록되었습니다.');
					fn_load();
				} else {
					alert('등록 중 오류가 발생하였습니다.');
				}
			},
		error: function(xhr, textStatus, errorThrown) {
			// console.log(textStatus); 노 관심
			// console.log(errorThrown); 노 관심
			// xhr.status : 상태를 정의하는 정수 값, 임의로 결정
			// console.log(xhr.status);
			// xhr.responseText : 응답된 텍스트, 예외 메시지가 전달
			if( xhr.status > 3000 || xhr.status < 4000)
				alert(xhr.responseText);
		}
	});
}

function fn_del() {
	var btn = $(this);
	if(!confirm('정말로 삭제하시겠습니까?'))
		return;
	$.ajax({
		url : 'deletePerson.do',
		type : 'get',
		data : "sno=" + btn.data("sno"),
		dataType : 'json',
		success : function(obj) {
				if(obj.result) {
					alert('성공적으로 삭제되었습니다');
					btn.parent().parent().remove();
				} else {
					alert('삭제 도중 오류가 발생했습니다.');
				}	
			}
	})
}
		