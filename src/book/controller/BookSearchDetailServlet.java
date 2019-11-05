package book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import book.model.vo.BookPlay;
import likebook.model.vo.LikeBook;
import mybook.model.service.MyBookService;
import mybook.model.vo.MyBook;

/**
 * Servlet implementation class BookSearchDetailServlet
 */
@WebServlet("/bsdetail")
public class BookSearchDetailServlet extends HttpServlet { //도서상세정보 보기
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서 한개 정보 불러오기 (도서상세보기)
		request.setCharacterEncoding("utf-8");
		
		String bookcode = request.getParameter("bookcode");
		String userId = request.getParameter("userId");
		
	    BookService bservice = new BookService();
	    BookPlay bp = bservice.selectOne(bookcode, userId);
	    
	   /* MyBookService mservice = new MyBookService();
	    MyBook mb = mservice.selectOneMyBookUser(bookcode, userId);*/

		RequestDispatcher view = null;
		
		if(bp !=null) {
			view = request.getRequestDispatcher("views/booksearch/bookSearchDetail.jsp");
			request.setAttribute("BookPlay",bp);
			/*request.setAttribute("MyBook", mb);*/
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서불러오기 실패");
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
