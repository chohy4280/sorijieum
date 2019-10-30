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
import book.model.vo.BookDV;
import book.model.vo.BookPlay;

/**
 * Servlet implementation class BookSearchPlayPage
 */
@WebServlet("/bplaypage")
public class BookSearchPlayPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchPlayPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서재생 플레이로 이동하기 컨트롤러
		request.setCharacterEncoding("UTF-8");
		
		String bookcode = request.getParameter("bookcode");
		String userId = request.getParameter("userId");
	   
		
		BookService bservice = new BookService();
		ArrayList<BookPlay> bplist = bservice.selectOneBookPlay(bookcode,userId);
	
		RequestDispatcher view = null;
		if(bplist.size() > 0) {
			view = request.getRequestDispatcher("views/booksearch/bookSearchPlay.jsp");
			request.setAttribute("bplist", bplist);
			request.setAttribute("bookcode",bookcode);
			request.setAttribute("userId", userId);
			
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서재생 페이지로 이동 실패!");
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
