package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import quit.model.service.QuitService;
import quit.model.vo.Quit;

/**
 * Servlet implementation class MemberQuitServlet
 */
@WebServlet("/quit.my")
public class MemberQuitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQuitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//// 회원 탈퇴 처리용 컨트롤러
		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		//2.변수에 담기
		String userid = request.getParameter("userid");

		int reason = Integer.parseInt(request.getParameter("reason"));
		String etc = request.getParameter("etc");
		
		//3.서비스로 보내고 결과받기
		int result = new MemberService().deleteMember(userid);	//member테이블 탈퇴여부 Y로 수정
		int result2 = new QuitService().insertQuitMember(userid,reason,etc);
		
		//4.처리결과받아서 성공/실패에 따라 뷰 내보내기
		if(result>0 && result2>0) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				//세션 객체가 존재한다면, 없애라.
				session.invalidate();
				response.sendRedirect("/sori/index.jsp");
			}
		}
		else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원 탈퇴 실패!");
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
