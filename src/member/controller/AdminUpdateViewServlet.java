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
 * Servlet implementation class AdminUpdateViewServlet
 */
@WebServlet("/adupview.ad")
public class AdminUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 수정용 뷰 출력 컨트롤러
			request.setCharacterEncoding("utf-8");
			
			String userid = request.getParameter("userid");
			System.out.println(userid);
			Member m = new MemberService().selectAdminOneDetail(userid);
		
			RequestDispatcher view = null;
			
			if(m != null) {
				view = request.getRequestDispatcher("views/admin/adminUpdateForm.jsp");
				request.setAttribute("m", m);
			} else {
				view = request.getRequestDispatcher("views/common/error.jsp");
				request.setAttribute("message", "수정 페이지 출력 실패!");
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
