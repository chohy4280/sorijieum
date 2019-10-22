package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import quit.model.service.QuitService;

/**
 * Servlet implementation class memberDeleteServlet
 */
@WebServlet("/mdel.ad")
public class AdMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 회원 삭제(강제탈퇴)용
				request.setCharacterEncoding("utf-8");
				
				MemberService mService = new MemberService();
				QuitService qService = new QuitService();
				int result1 = 0, result2 = 0, result3 = 0, result4 = 0;
				String checkBox = request.getParameter("lists");
				String userid = request.getParameter("userid");
				
				if(checkBox != null) {
					// 체크박스 삭제
					String check[] = checkBox.split(",");
					System.out.println(checkBox);
					
					for(int i = 0; i < check.length; i++) {
						result1 = mService.deleteMember(check[i]);
						result2 = qService.insertMember(check[i]);
					}
				} else if(userid != null) {
				// 회원 상세보기에서 삭제
					result3 = mService.deleteMember(userid);
					result4 = qService.insertMember(userid);
				}
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				if((result1 > 0 && result2 > 0) || (result3 > 0 && result4 > 0)) {
					out.println("해당 회원이 강제탈퇴 되었습니다.");
				}else {
					out.println("해당 회원 강제탈퇴가 불가능합니다.");
				}
				
				/*if(result > 0 && result2 > 0) {

					response.sendRedirect("/sori/mlist.ad");
					
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "관리자 삭제 실패!");
					view.forward(request, response);
				}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
