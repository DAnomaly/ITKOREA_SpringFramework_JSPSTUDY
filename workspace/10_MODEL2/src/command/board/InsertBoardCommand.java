package command.board;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class InsertBoardCommand implements BoardCommand {

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
			// 업로드 진행
			multipartRequest = new MultipartRequest(request, realPath, 1024 * 1024 * 10, "utf-8",
					new DefaultFileRenamePolicy());
			// 파라미터 처리 : MultipartRequest가 담당
			String author = multipartRequest.getParameter("author");
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			String ip = multipartRequest.getParameter("ip");
			String filename = null;
			if (multipartRequest.getFile("filename") == null) {
				filename = "";
			} else {
				filename = multipartRequest.getFilesystemName("filename");
			}
			dto = new BoardDTO();
			dto.setAuthor(author);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setIp(ip);
			dto.setFilename(filename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		int result = BoardDAO.getInstance().insertBoard(dto);
		ModelAndView mav = null;
		if (result > 0) {
			mav = new ModelAndView("/10_MODEL2/listBoardPage.b",true);
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('게시글이 저장되지 않았습니다.');");
				out.println("histroy.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return mav;
	}

}
