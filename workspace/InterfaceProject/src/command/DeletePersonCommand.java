package command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.PersonDAO;

@WebServlet("/deletePerson.do")
public class DeletePersonCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletePersonCommand() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		int sno = Integer.parseInt(request.getParameter("sno"));
		int result = PersonDAO.getInstance().deletePerson(sno);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result > 0);
		response.getWriter().println(obj.toJSONString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
