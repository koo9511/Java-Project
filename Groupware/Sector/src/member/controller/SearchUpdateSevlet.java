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
 * Servlet implementation class SearchUpdateSevlet
 */
@WebServlet(urlPatterns="/searchupdate", name="SUpdateServlet")
public class SearchUpdateSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUpdateSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Master master = new Master();
	
		master.setMasterId(request.getParameter("userid"));
		master.setMasterPwd(request.getParameter("userpwd"));
		
		System.out.println(master.getMasterId() + ", " + master.getMasterPwd());

		int result = new MasterService().searchUpdate(master);
		
		
		HttpSession session = request.getSession();
		
		if(result > 0)
			
			response.sendRedirect("/Sector/index.jsp");
		else {
			session.setAttribute("result", master.getMasterId());
			response.sendRedirect("views/member/searchupdate.jsp");	
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
