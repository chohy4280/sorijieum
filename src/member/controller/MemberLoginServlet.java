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
			//로그인 성공시에, 로그인 상태 관리를 위한 세션 객체 생성함
			HttpSession session = request.getSession();
			//자동 로그아웃 타임을 지정할 수 있다.
//					session.setMaxInactiveInterval(15*60); 	//15분동안 아무 요청이 없으면 자동 로그아웃
			session.setAttribute("loginMember", loginMember);
			
			//성공에 대한 서비스를 요청한 클라이언트에게 뷰를 내보냄.
			if(loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)
				response.sendRedirect("/sori/admain.ad");
			else
				response.sendRedirect("/sori/index.jsp");
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
