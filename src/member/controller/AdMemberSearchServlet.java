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
 * Servlet implementation class memberSearchServlet
 */
@WebServlet("/mslist.ad")
public class AdMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 회원 검색용
		request.setCharacterEncoding("utf-8");
		
		String searchtype = request.getParameter("searchtype");
		String keyword = request.getParameter("keyword");
		String gender = request.getParameter("gender");
		String typenumber = request.getParameter("typenumber");
		
		ArrayList<Member> list = new MemberService().selectMemberSearch(searchtype, keyword, gender, typenumber);
		
		RequestDispatcher view = null;
		if(list.size() >= 0) {
			view = request.getRequestDispatcher("views/admin/adminMemberListView.jsp");
			request.setAttribute("list", list);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원 검색 실패!");
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
