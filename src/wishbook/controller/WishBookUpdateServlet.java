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
 * Servlet implementation class WishBookUpdateServlet
 */
@WebServlet("/wbup")
public class WishBookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서신청 수정 컨트롤러
		request.setCharacterEncoding("utf-8");
		int wishno = Integer.parseInt(request.getParameter("wishno"));
		String wishbooktitle = request.getParameter("wishbooktitle");
		String wishbookauthor = request.getParameter("wishbookauthor");
		String wishpublisher = "";
		if(wishpublisher != null) {
			wishpublisher = request.getParameter("wishpublisher");
		}
		String wishpublishdateStr = request.getParameter("wishpublishdate");
		Date wishpublishdate = null;
		if(wishpublishdateStr != null && !wishpublishdateStr.isEmpty()) {
			wishpublishdate = Date.valueOf(wishpublishdateStr);
		}
		WishBook wishbook = new WishBook(wishno, wishbooktitle, wishbookauthor, wishpublisher, wishpublishdate);
		int result = new WishBookService().updateWishBook(wishbook);
		
		RequestDispatcher view = null;
		if (result > 0) {
			response.sendRedirect("/sori/wblist");
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서신청 수정 실패");
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
