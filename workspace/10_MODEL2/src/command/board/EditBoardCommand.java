package command.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class EditBoardCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		final String DIRECTORY = "archive";
		String realPath = request.getServletContext().getRealPath(DIRECTORY);
		File dir = new File(realPath);
		if (!dir.exists())
			dir.mkdirs();
		MultipartRequest multipartRequest = null;
		BoardDTO dto = null;
		try {
			multipartRequest = new MultipartRequest(request, realPath, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			// 파라미터 처리
			// 파일 검사
			long idx = Long.parseLong(multipartRequest.getParameter("idx"));
			String author = multipartRequest.getParameter("author");
			// 수정된 파라미터
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			String filename = multipartRequest.getFilesystemName("filename");
			String ip = multipartRequest.getParameter("ip");
			// dto 생성
			dto = new BoardDTO();
			dto.setIdx(idx);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setIp(ip);
			dto.setFilename(filename);
			dto.setAuthor(author);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// DB 호출
		int result = BoardDAO.getInstance().updateBoard(dto); 
		ModelAndView mav = null;
		if(result > 0) {
			mav = new ModelAndView("viewBoardPage.b?idx=" + dto.getIdx(), true);
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
