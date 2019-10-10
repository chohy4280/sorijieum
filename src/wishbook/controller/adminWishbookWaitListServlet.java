package wishbook.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class adminWishbookWaitListServlet
 */
@WebServlet("/wbwlist.ad")
public class adminWishbookWaitListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Object wbWaitList;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWishbookWaitListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<WishBook> wbWaitList = new WishBookService().selectWaitWishBook();
		
		RequestDispatcher view = null;
		
		if(wbWaitList.size() >= 0) {
			view = request.getRequestDispatcher("views/admin/adminIndexView.jsp");
			request.setAttribute("wbWaitList", wbWaitList);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "신청도서 정보 조회 실패!");
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
