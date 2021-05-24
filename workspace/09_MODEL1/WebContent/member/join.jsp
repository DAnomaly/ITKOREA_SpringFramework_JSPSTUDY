<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// 2. DB로 보낼 DTO 생성
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setEmail(email);

	// 3. DTO 정검
	//    1) logger로 확인이 가장 좋음
	//    2) System.out.println()은 완성 프로젝트에 남아 있으면 안 됨
	//		System.out.println("가입정보: " + dto);
	
	// 4. MemberDAO의 save() 메소드로 DTO를 보내서 가입하기
	int res = MemberDAO.getInstance().save(dto);
	
	// 5. res
	//	  DB에 insert 처리된 레코드의 개수 반환
	//    1) 가입 성공 : 1
	//    2) 가입 실패 : 0
	if(res == 0) {
		out.println("<script>");
		out.println("alert('가입에 실패했습니다.');");
		out.println("history.back();");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('가입에 성공했습니다.');");
		out.println("location.href='/09_MODEL1/'");
		out.println("</script>");
	}
%>
