package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/memberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 처리용 컨트롤러
		String userid = request.getParameter("userid");	//String 타입이니까 "" 사용, 대소문자 구분함
		String userpwd = request.getParameter("userpwd");
		
		Member loginMember = new MemberService().loginCheck(userid,userpwd);
		
		//4.받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보내기.
		if(loginMember != null) {
			//탈퇴여부 확인 하고 로그인세션 부여함
			if(loginMember.getQuitYN().equals("N")) {
				//로그인 성공시에, 로그인 상태 관리를 위한 세션 객체 생성함
				HttpSession session = request.getSession();

				session.setAttribute("loginMember", loginMember);
				
				if(loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)
					response.sendRedirect("/sori/admain.ad");
				else
					response.sendRedirect("/sori/index.jsp");
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				 
				out.println("<script>alert('탈퇴처리 된 계정입니다. 확인 후 다시 로그인 해주세요.'); "
						+ "location.href='/sori/views/member/memberLoginView.jsp';</script>");
				 
				out.flush();
				out.close();
			}
		}
		else {
			//뷰를 지정하고, 뷰한테 값도 함께 내보낼 때 사용함.
			//상대경로만 사용할 수 있음.(절대경로 사용 못함)
			//모든 서블릿은 루트(contents directory)에서 실행되고 있음.
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			//뷰에 출력시킬 값을 request 객체에 기록 저장함.
			request.setAttribute("message", "로그인 실패!!!!!!");
			//뷰를 내보냄
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
