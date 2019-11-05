package book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import book.model.vo.BookMakingProgress;
import bookmaking.model.service.BookMakingService;
import likebook.model.service.LikeBookService;

/**
 * Servlet implementation class LikeBookInputServlet
 */
@WebServlet("/blike")
public class AddLikeBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLikeBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관심도서 추가
	    request.setCharacterEncoding("utf-8");
	    
	    String userId = request.getParameter("userid");
		String bookcode = request.getParameter("bookcode");
	
		int result = new LikeBookService().addLikeBook(userId, bookcode);
		if(result>0) {
			response.getWriter().append("ok"); //결과 반환
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
