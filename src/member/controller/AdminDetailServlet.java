package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminDetailServlet
 */
@WebServlet("/addetail.ad")
public class AdminDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 상세보기 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("userid");
		
		Member m = new MemberService().selectAdminOneDetail(userid);
		
		RequestDispatcher view = null;
		if(m != null) {
			view = request.getRequestDispatcher("views/admin/adminDetailView.jsp");
			request.setAttribute("m", m);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "관리자 상세조회 실패!");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
