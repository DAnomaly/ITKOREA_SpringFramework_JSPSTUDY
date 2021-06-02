package command.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.MemberDTO;
import dto.ReplyDTO;

public class InsertReplyBoardCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 처리
		String content = request.getParameter("content");
		long boardIdx = Long.parseLong(request.getParameter("boardIdx"));
		// session
		String author = ((MemberDTO)request.getSession().getAttribute("loginDTO")).getId();
		// ip
		String ip = request.getRemoteAddr();
		// DTO
		ReplyDTO dto = new ReplyDTO();
		dto.setAuthor(author);
		dto.setContent(content);
		dto.setBoardIdx(boardIdx);
		dto.setIp(ip);
		// DAO insertReply()
		int result = BoardDAO.getInstance().insertReply(dto);
		ModelAndView mav = null;
		if(result > 0) {
			mav = new ModelAndView("viewBoardPage.b?idx=" + boardIdx,true);
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('댓글이 작성되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return mav;
	}

}
