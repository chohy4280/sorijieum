package bookmaking.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import book.model.vo.BookMakingProgress;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class BookMakingMainLoadServlet
 */
@WebServlet("/bmmload")
public class BookMakingMainLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingMainLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서제작 제작화면이동 컨트롤러
		String bookcode = request.getParameter("bookcode");
		String userid = request.getParameter("userid");
		int currentPage = 1;
		BookMakingProgress bmp = new BookMakingService().selectBookMakingMainLoad(bookcode, userid);
		int result = new BookMakingService().bookMakingInsert(bookcode, userid);
		RequestDispatcher view = null;
		if(bmp != null && result > 0) {
			view = request.getRequestDispatcher("views/bookmaking/bookmakingmain.jsp");
			request.setAttribute("bmp", bmp);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", " 실패!");
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
