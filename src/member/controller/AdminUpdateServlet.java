package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.View;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class adminUpdateServlet
 */
@WebServlet("/adup.ad")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 수정용
		request.setCharacterEncoding("utf-8");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		Member m = new Member();
		m.setUserId(request.getParameter("userid"));
		m.setUserPwd(request.getParameter("userpwd"));
		m.setEmail(request.getParameter("email"));
		m.setPhone(request.getParameter("phone"));
		m.setBirth(Date.valueOf(request.getParameter("birth")));
		
		int result = new MemberService().updateAdmin(m);
		
		if(result > 0) {
			response.sendRedirect("/sori/addetail.ad?userid=" + m.getUserId()+"&page="+currentPage);
			request.setAttribute("currentPage", currentPage);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "관리자 정보 수정 실패!");
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
