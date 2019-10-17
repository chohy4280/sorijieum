package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchIdServlet
 */
@WebServlet("/searchid")
public class MemberSearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 찾기용 컨트롤러
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		
		Member member = new MemberService().selectMemberSearchId(username, phone);

		RequestDispatcher view = null;
		if(member != null) {
			if(member.getQuitYN().equals("N")) {
				view = request.getRequestDispatcher("views/member/memberSearchIdComplete.jsp");
				request.setAttribute("member", member);
				view.forward(request, response);
			}
			else {
				/*response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('존재하지 않는 회원 정보입니다.'); "
						+ "location.href='/sori/views/member/memberSearchIdPwd.jsp';</script>");
				out.flush();
				out.close();*/
				view = request.getRequestDispatcher("views/member/memberSearchIdComplete.jsp");
				request.setAttribute("message", "입력하신 정보와 일치하는 회원 정보가 존재하지 않습니다.");
				view.forward(request, response);
			}
		}
		else {
			view = request.getRequestDispatcher("views/member/memberSearchIdComplete.jsp");
			request.setAttribute("message", "입력하신 정보와 일치하는 회원 정보가 존재하지 않습니다.");
			view.forward(request, response);
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
