package command.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class InsertReplyCommand3 implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// parameter
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		long groupno = Long.parseLong(request.getParameter("groupno"));
		int groupord = Integer.parseInt(request.getParameter("groupord"));
		int depth = Integer.parseInt(request.getParameter("depth"));
		// replyDTO
		BoardDTO replyDTO = new BoardDTO();
		replyDTO.setAuthor(author);
		replyDTO.setTitle(title);
		replyDTO.setContent(content);
		replyDTO.setIp(ip);
		replyDTO.setGroupno(groupno);
		replyDTO.setDepth(depth + 1);
		replyDTO.setGroupord(groupord + 1);
		
		// 기존 댓글들의 groupord를 모두 1씩 증가시킨다.
		BoardDAO.getInstance().increaseGroupordPreviousReply3(replyDTO);
		
		// dao : insertReply()
		int result = BoardDAO.getInstance().insertReply3(replyDTO);
		ModelAndView mav = null;
		if(result > 0)
			mav = new ModelAndView("selectList3.do",true);
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
