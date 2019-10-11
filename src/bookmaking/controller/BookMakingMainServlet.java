package bookmaking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.vo.Book;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class BookMakingMainServlet
 */
@WebServlet("/bmkmain")
public class BookMakingMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Book> makelist = new BookMakingService().selectMakingBook();
		ArrayList<Book> waitlist = new BookMakingService().selectWaitingBook();
		RequestDispatcher view = null;
		if(makelist.size() > 0) {
			view = request.getRequestDispatcher("views/bookmaking/bmmain.jsp");
			request.setAttribute("makelist", makelist);
		}else if(waitlist.size() > 0) {
			view = request.getRequestDispatcher("views/bookmaking/bmmain.jsp");
			request.setAttribute("waitlist", waitlist);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서제작 접근 실패!");
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
