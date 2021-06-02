package command.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;

public class DeleteReplyBoardCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// parameter
		long boardIdx = Long.parseLong(request.getParameter("boardIdx"));
		long idx = Long.parseLong(request.getParameter("idx"));
		// BoardDAO > deleteReply()
		int result = BoardDAO.getInstance().deleteReply(idx);
		// result 
		ModelAndView mav = null;
		if(result > 0) {
			mav = new ModelAndView("/10_MODEL2/viewBoardPage.b?idx=" + boardIdx,true);
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 중 오류가 발생했습니다.');");
				out.println("histroy.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return mav;
	}

}
