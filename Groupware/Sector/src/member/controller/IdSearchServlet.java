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
 * Servlet implementation class IdSearchServlet
 */
@WebServlet("/idsearch")
public class IdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String sname = request.getParameter("username");
		String semail = request.getParameter("useremail");
		String sphone = request.getParameter("sphone");
		
		System.out.println(sname + "," + semail + ", " + sphone);
		
		Master loginMaster = new MasterService().searchId(sname, semail, sphone);
		
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		if(loginMaster != null) {
			session.setAttribute("result", loginMaster.getMasterId());
			response.sendRedirect("views/member/searchId.jsp");
		}else {
			session.setAttribute("result", "실패");
			response.sendRedirect("views/member/searchId.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
