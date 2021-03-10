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
 * Servlet implementation class MasterInsertServlet
 */
@WebServlet(urlPatterns="/insert", name="MasterInsertServlet")
public class MasterInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 추가용
		request.setCharacterEncoding("utf-8");
		
		Master master = new Master();
	
		
		master.setMasterId(request.getParameter("userid"));
		master.setMasterPwd(request.getParameter("userpwd"));
		master.setMasterName(request.getParameter("username"));
		master.setMasterPhone(request.getParameter("phone"));
		master.setMasterEmail(request.getParameter("email"));
		
		int result = new MasterService().insertMaster(master);
		
		HttpSession session = request.getSession();
		
		if(result > 0)
			response.sendRedirect("views/login.jsp");
		else {
			session.setAttribute("result", "실패");
			response.sendRedirect("views/enroll.jsp");	
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
