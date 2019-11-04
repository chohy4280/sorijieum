package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/enroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원 가입 처리용 컨트롤러
		request.setCharacterEncoding("UTF-8");
		
		Member member = new Member();
		
		member.setUserId(request.getParameter("userid"));
		member.setTypeNumber(Integer.parseInt(request.getParameter("typenumber")));
		member.setUserName(request.getParameter("username"));
		member.setUserPwd(request.getParameter("userpwd"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setGender(request.getParameter("gender"));
		
		String birthStr = request.getParameter("birth");
		String birthDate = birthStr.substring(0,4)+"-"+birthStr.substring(4,6)+"-"+birthStr.substring(6,8);
		Date birth = Date.valueOf(birthDate);
		member.setBirth(birth);
		
		int result = new MemberService().insertMember(member);
		System.out.println(result);
		//4.받은 결과로 성공/실패에 대한 뷰를 선택해서 내보내기. => 뷰만 내보낼때는 sendRedirect / 뷰에 값까지 같이 보낼때는 requestDispacther(<=상대경로만 사용가능)
		if(result>0) {	//성공 
			response.sendRedirect("/sori/views/member/memberLoginView.jsp");
		}
		else {			//실패
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원 가입 실패!");
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
