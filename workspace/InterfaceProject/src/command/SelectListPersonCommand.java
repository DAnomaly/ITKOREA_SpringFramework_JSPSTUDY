package command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.PersonDAO;
import dto.Person;

@WebServlet("/selectList.do")
public class SelectListPersonCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectListPersonCommand() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		JSONObject obj = new JSONObject();
		
		try {
			List<Person> list = PersonDAO.getInstance().getListPerson();
			boolean result = false;
			if(list.size() > 0) {
				result = true;
			}
			obj.put("result", result);
			
			JSONArray arr = new JSONArray();
			for (Person person : list) {
				JSONObject o = new JSONObject();
				o.put("sno", person.getSno());
				o.put("name", person.getName());
				o.put("age", person.getAge());
				o.put("birthday", person.getBirthday());
				o.put("regdate", person.getRegdate().toString());
				arr.add(o);
			}
			obj.put("list", arr);
			
			response.getWriter().println(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
