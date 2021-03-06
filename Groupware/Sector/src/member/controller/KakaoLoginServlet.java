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
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/kakaologin")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		
		System.out.println(email);
		
		Master loginMaster = new MasterService().kakaologinCheck(email);
		System.out.println(loginMaster);
		

		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		if(loginMaster != null) {  
			session.setAttribute("loginMaster", loginMaster);
			response.sendRedirect("index.jsp");
			
		} else {
			session.setAttribute("result", "실패");
			response.sendRedirect("views/joins.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



