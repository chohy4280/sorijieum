package adminmemo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminmemo.model.service.AdminMemoService;
import adminmemo.model.vo.AdminMemo;

/**
 * Servlet implementation class AdMemoInsertServlet
 */
@WebServlet("/mminsert.ad")
public class AdMemoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMemoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 메모 등록용
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		
		AdminMemo admemo = new AdminMemo();
		admemo.setAdminId(request.getParameter("adminid"));
		admemo.setAdminMemo(request.getParameter("adminmemo"));
		admemo.setUserId(userid);
		
		int result = new AdminMemoService().insertAdminMemo(admemo);
		
		if(result > 0) {
			response.sendRedirect("/sori/mdetail.ad?userid="+userid);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "관리자 메모 추가 실패");
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
