

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionLogin
 */
@WebServlet("/sessionLogin")
public class SessionLogin extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out  = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		System.out.println("id : " + id);
		System.out.println("pass : " + pass);
		
		if(id.equals("id001") && pass.equals("12345")) {
			// 등록된 회원이다
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
			rd.forward(request, response);
			
		}else {
			// 등록된 회원이 아니다
			out.println("<script>");
			out.println("alert('등록된 회원이 아닙니다.');");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
