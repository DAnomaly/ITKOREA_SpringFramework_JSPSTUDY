package command.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.MemberDTO;

public class DeleteFileBoardCommand implements BoardCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 처리
		long idx = Long.parseLong(request.getParameter("idx"));
		String author = ((MemberDTO)request.getSession().getAttribute("loginDTO")).getId();
		// DAO 호출
		int result = BoardDAO.getInstance().deleteFile(idx, author);
		ModelAndView mav = null;
		if(result > 0) {
			mav = new ModelAndView("viewBoardPage.b?idx=" + idx, true);
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('게시글 수정중 오류가 발생했습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return mav;
	}
}
