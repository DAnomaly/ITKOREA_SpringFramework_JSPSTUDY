package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ModelAndView;
import dao.StudentDAO;
import dto.StudentDTO;

public class InsertStudentCommand implements Command {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String sno = request.getParameter("sno");
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		
		StudentDTO dto = new StudentDTO(sno, name, kor, eng, mat);
		
		int result = StudentDAO.getInstance().insertStudent(dto);
		ModelAndView mav = null;
		if(result > 0) {
			mav = new ModelAndView("selectStudentList.do",true);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록중 오류가 발생했습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return mav;
	}

}
