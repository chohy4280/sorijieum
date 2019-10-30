package wishbook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishbook.model.service.WishBookService;

/**
 * Servlet implementation class MyWishBookDeleteServlet
 */
@WebServlet("/wbdel.my")
public class MyWishBookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWishBookDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내 신청도서 선택 삭제용 컨트롤러
		WishBookService wbservice = new WishBookService();
		String[] check = request.getParameterValues("delChk");
		String userid = request.getParameter("userid");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int result = 0;
		
		for(int i=0; i<check.length; i++) {
			result += wbservice.deleteWishBook((Integer.parseInt(check[i])));
		}
		
		RequestDispatcher view = null;
		if(result == check.length) {
			view = request.getRequestDispatcher("/wishbook.my");
			request.setAttribute("userid", userid);
			request.setAttribute("page", currentPage);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "삭제 실패");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
