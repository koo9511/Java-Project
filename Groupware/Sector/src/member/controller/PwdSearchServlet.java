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
 * Servlet implementation class PwdSearchServlet
 */
@WebServlet("/pwdsearch")
public class PwdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String sid = request.getParameter("id");
		String sname = request.getParameter("username");
		String semail = request.getParameter("email");
		
		System.out.println(sid + ", " + sname + ", " + semail);
		
		Master loginMaster = new MasterService().searchPwd(sid, sname, semail);
		
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		if(loginMaster != null) {
			session.setAttribute("result", loginMaster.getMasterId());
			response.sendRedirect("views/member/searchPwd.jsp");
		} else {
			session.setAttribute("result", "실패");
			response.sendRedirect("views/member/searchPwd.jsp");
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
