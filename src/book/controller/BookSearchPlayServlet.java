package book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;

/**
 * Servlet implementation class BookSearchPlayServlet
 */
@WebServlet("/bplay")
public class BookSearchPlayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchPlayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
	
		String bookcode = request.getParameter("bookcode");
		Book book = new BookService().selectPlay(bookcode);
		
		RequestDispatcher view = null;
		if(book != null) {
			view = request.getRequestDispatcher("views/booksearch/bookSearchPlay.jsp");
			request.setAttribute("bookcode", "bookcode");
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "");
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
