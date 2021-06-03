package command.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class InsertReplyCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 1단 댓글 달기
		
		// parameter
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		long groupno = Long.parseLong(request.getParameter("no"));
		// replyDTO
		BoardDTO replyDTO = new BoardDTO();
		replyDTO.setAuthor(author);
		replyDTO.setTitle(title);
		replyDTO.setContent(content);
		replyDTO.setIp(ip);
		replyDTO.setGroupno(groupno);
		replyDTO.setDepth(1);
		replyDTO.setGroupord(1);
		
		// 기존 댓글들의 groupord를 모두 1씩 증가시킨다.
		BoardDAO.getInstance().increaseGroupordPreviousReply(groupno);
		
		// dao : insertReply()
		int result = BoardDAO.getInstance().insertReply(replyDTO);
		ModelAndView mav = null;
		if(result > 0)
			mav = new ModelAndView("selectListBoard.do",true);
		else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 작성 중 오류가 발생했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		return mav;
	}

}
