package member.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.model.service.MasterService;
import member.model.vo.Master;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns="/login", name="LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
//		request.setCharacterEncoding("utf-8");
		
		
		String masterId = request.getParameter("userid");
		String masterPwd = request.getParameter("userpwd");
		
		
		System.out.println(masterId +", " + masterPwd);
		
		Master loginMaster = new MasterService().loginCheck(masterId, masterPwd);
		

		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		if(loginMaster != null) {  

			session.setAttribute("loginMaster", loginMaster);
			response.sendRedirect("index.jsp");
			
		}else {
//			RequestDispatcher view = request.getRequestDispatcher("views/login.jsp");
//			request.setAttribute("result", "실패");
//			view.include(request, response);
			session.setAttribute("result", "실패");
			response.sendRedirect("views/login.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}










