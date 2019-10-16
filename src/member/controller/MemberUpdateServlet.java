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
 * Servlet implementation class MemberMyInfoServlet
 */
@WebServlet("/mupdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 수정 처리용 컨트롤러
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		
		//2.
		Member member = new Member();
		String userid = request.getParameter("userid");
		
		member.setUserId(request.getParameter("userid"));
		member.setUserPwd(request.getParameter("userpwd"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		
		//3.
		MemberService mservice = new MemberService();
		int result = mservice.updateMember(member);
		
		//4.수정이 성공 했을 때 
		if(result>0) {	//성공
			//수정된 회원 정보를 세션에 다시 기록하기 위해 세션 객체 가지고옴
			HttpSession session = request.getSession(false);
			//수정된 회원 정보 조회해서 세션에 다시 기록함.
			Member loginMember = mservice.selectMember(userid);
			session.setAttribute("loginMember", loginMember);
			
			//내 정보 보기로 페이지 바꿈: 내 정보 보기 출력 처리용 서블릿 실행함
			//쿼리스트링도 사용 가능함
			/*response.sendRedirect("/sori/views/member/memberUpdateView.jsp");*/
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('정보 수정이 완료됐습니다.'); location.href='/sori/myinfo?userid="
					+ loginMember.getUserId()+ "';</script>");
			 
			out.flush();
			out.close();
	
		}
		else {			//실패
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", userid+ " 회원 정보 수정 실패!");
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
