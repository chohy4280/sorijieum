package wishbook.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class WishBookInsertServlet
 */
@WebServlet("/wbins")
public class WishBookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서신청 추가 컨트롤러
		request.setCharacterEncoding("utf-8");
		WishBook wishbook = new WishBook();
		wishbook.setWishWriter(request.getParameter("wishwriter"));
		wishbook.setWishBookTitle(request.getParameter("wishbooktitle"));
		wishbook.setWishBookAuthor(request.getParameter("wishbookauthor"));
		wishbook.setWishPublisher(request.getParameter("wishpublisher"));
		String wishpublishdateStr = request.getParameter("wishpublishdate");
		Date wpdate = null;
		if(wishpublishdateStr != null && !wishpublishdateStr.isEmpty()) {
		String wishpublishdate = wishpublishdateStr.substring(0,4)+"-"+wishpublishdateStr.substring(4,6)+"-"+wishpublishdateStr.substring(6,8);
		wpdate = Date.valueOf(wishpublishdate);
	    wishbook.setWishPublishDate(wpdate);
		}
		/*Date wishpublishdate = null;
		if(wishpublishdateStr != null && !wishpublishdateStr.isEmpty()) {
			wishpublishdate = Date.valueOf(wishpublishdateStr);
			wishbook.setWishPublishDate(wishpublishdate);
		}*/
		
		int result = new WishBookService().insertWishBook(wishbook);
		
		RequestDispatcher view = null;
		if (result > 0) {
			response.sendRedirect("/sori/wblist");
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서신청 실패");
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
