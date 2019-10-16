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
 * Servlet implementation class MemberMypageServlet
 */
@WebServlet("/mypage")
public class MemberMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//마이페이지로 이동 컨트롤러                                       
		//1.전송 온 값에 한글이 있으면 인코딩 처리함.
		//2.전송 온 값 꺼내서 변수에 기록 저장하기
		String userid = request.getParameter("userid");
		
		//3.모델 서비스로 전달하고 결과 받기
		Member member = new MemberService().selectMember(userid);
		
		//4.받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보내기
		RequestDispatcher view = null;
		if(member != null) {
			view = request.getRequestDispatcher("views/member/memberMyPage.jsp");
			request.setAttribute("member", member);
			view.forward(request, response);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "마이페이지로 이동 실패");
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
