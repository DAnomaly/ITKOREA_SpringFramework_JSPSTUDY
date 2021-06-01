package command.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.MemberDTO;

public class DeleteBoardCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터처리
		long idx = Long.parseLong(request.getParameter("idx"));
		// 작성자 체크
		String author = ((MemberDTO)request.getSession().getAttribute("loginDTO")).getId();
		/*
		 * 삭제의 고찰
		 * 1. DELETE : 뎃글이 달려 있는지 정검해야 한다. 뎃글이 없어야 삭제할 수 있다.
		 * 2. UPDATE : STATE만 삭제 상태로 수정하면 된다. 
		 */
		// DAO의 deleteBoard() 메소드 호출
		int result = BoardDAO.getInstance().deleteBoard(idx,author);
		// 결과 호출
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				// 삭제 성공
				out.println("<script>");
				out.println("alert('정상적으로 삭제되었습니다.');");
				out.println("location.href='/10_MODEL2/listBoardPage.b'");
				out.println("</script>");
			} else {
				// 삭제 실패
				out.println("<script>");
				out.println("alert('삭제 도중 오류가 발생했습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
