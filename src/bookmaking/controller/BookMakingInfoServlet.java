package bookmaking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.vo.Book;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class BookMakingInfoServlet
 */
@WebServlet("/bminfo")
public class BookMakingInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookcode = request.getParameter("bookcode");
		Book book = new BookMakingService().selectMakingBookOne(bookcode);
		
		RequestDispatcher view = null;
		if(book != null) {
			view = request.getRequestDispatcher("views/bookmaking/bookinfo.jsp");
			request.setAttribute("book", book);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", bookcode + "번 도서정보 보기 실패!");
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
