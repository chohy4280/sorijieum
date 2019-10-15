package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class adminSearchServlet
 */
@WebServlet("/adslist.ad")
public class AdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 한명 조회용
		request.setCharacterEncoding("utf-8");
		
		String searchtype = request.getParameter("searchtype");
		String keyword = request.getParameter("keyword");
		
		ArrayList<Member> list = new MemberService().selectAdminOne(searchtype, keyword);
		
		RequestDispatcher view = null;
		if(list.size() >= 0) {
			view = request.getRequestDispatcher("views/admin/adminListView.jsp");
			request.setAttribute("list", list);
		} else {
			view = request.getRequestDispatcher("view/common/error.jsp");
			request.setAttribute("message", "관리자 검색 실패!");
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
