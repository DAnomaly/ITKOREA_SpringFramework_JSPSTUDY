package ex05;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex05
 */
@WebServlet("/Ex05")
public class Ex05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex05() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 파라미터 처리
		
		//   1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//   2) 파라미터 저장
		String name = request.getParameter("name");
		String strAge = request.getParameter("age");
		
		//   3) Null 처리
		
		// Optional 클래스는 자바8부터 지원한다.
		
		/*
			Optional<String> opt1 = Optional.of(name); // Optional.of()는 null이 아닌 인수를 처리한다.
			System.out.println(opt1.get()); // get() 메소드는 Optional에 저장된 인수를 꺼낸다.
		*/
		/*
			Optional<String> opt1 = Optional.ofNullable(name); // Optional.ofNullable은 null인 인수 또한 처리한다.
			if(!opt1.isPresent()) {
				System.out.println(opt1.get()); 
			}
		*/
		Optional<String> opt1 = Optional.ofNullable(name);
		name = opt1.orElse("Unkown");   // opt1에 값이 없으면(null이면) "Unkown"을 사용한다.
		Optional<String> opt2 = Optional.ofNullable(strAge);
		int age = Integer.parseInt(opt2.orElse("0"));
		
		System.out.println("TEST:[name=" + name +",age=" + age + "]");
		
		// 2. 응답 처리
		
		//   1) 응답(response)의 content-type을 결정한다.
		response.setContentType("text/html; charset=utf-8");
		
		//   2) 응답(response)할 수 있도록 출력 스트림을 만든다.
		// 문자 기반 스트림을 사용한다. (HTML문서는 텍스트이기 때문에)
		
		// 문자 기반 출력 스트림
		// FileWriter
		// PrintWriter - 선정 (println() 메소드가 존재하기 때문에)
		// BufferedWriter
		
		// 응답(response)에 출력 스트림을 생성한다.
		PrintWriter out = response.getWriter();
		
		//   3) HTML문서를 만든다.
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"utf-8\">");
		out.println("<title>제목</title>");
		out.println("<style>body { color: red; }</style>");
		out.println("<script>alert('반갑습니다.');</script>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>이름: " + name + "</h3>");
		out.println("<h3>나이: " + age + "</h3>");
		out.println("</body>");
		out.println("</html>");
		out.flush();
		if(out != null)
			out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
