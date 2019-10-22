package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminmemo.model.service.AdminMemoService;
import adminmemo.model.vo.AdminMemo;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class memberDetailServlet
 */
@WebServlet("/mdetail.ad")
public class AdMemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMemberDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 회원 한명 검색용
		request.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("userid");
		
		Member m = new MemberService().selectMemberOne(userid);
		ArrayList<AdminMemo> memolist = new AdminMemoService().selectAll(userid);
		
		RequestDispatcher view = null;
		
		if(m != null) {
			view = request.getRequestDispatcher("views/admin/adminMemberDetailView.jsp");
			request.setAttribute("m", m);
			request.setAttribute("memolist", memolist);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원 상세정보 조회 실패!");
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
