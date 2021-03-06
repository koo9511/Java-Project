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
 * Servlet implementation class UpdateServlet
 */
@WebServlet(urlPatterns="/update", name="UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정용
				request.setCharacterEncoding("utf-8");
				
				Master master = new Master();
			
				
				master.setMasterId(request.getParameter("userid"));
				master.setMasterPwd(request.getParameter("userpwd"));
				master.setMasterName(request.getParameter("username"));
				master.setMasterPhone(request.getParameter("phone"));
				master.setMasterEmail(request.getParameter("email"));
				master.setMasterComName(request.getParameter("usercomname"));
				
				int result = new MasterService().updateMaster(master);
				
				HttpSession session = request.getSession();
				
				if(result > 0)
					response.sendRedirect("/Sector/index.jsp");
				else {
					session.setAttribute("result", "실패");
					response.sendRedirect("views/member/update.jsp");	
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
