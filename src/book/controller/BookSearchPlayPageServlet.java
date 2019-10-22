package book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookmaking.model.service.BookMakingService;
import bookmaking.model.vo.BookMaking;

/**
 * Servlet implementation class BookSearchPlayPageServlet
 */
@WebServlet("/bpage")
public class BookSearchPlayPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchPlayPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서재생 페이지 이동하기 위한 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String bookcode = request.getParameter("bookcode");
		BookMaking bm = new BookMakingService().selectPlayPage(bookcode);
		
		RequestDispatcher view = null;
		if(bm !=null) {
			view = request.getRequestDispatcher("views/boardsearch/bookSearchPlay.jsp");
			request.setAttribute("bm", bm);
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
