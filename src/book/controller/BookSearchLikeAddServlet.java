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
import member.model.vo.Member;

/**
 * Servlet implementation class BookSearchLikeAddServlet
 */
@WebServlet("/bslike")
public class BookSearchLikeAddServlet extends HttpServlet {//관심도서 추가
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchLikeAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bookcode = request.getParameter("bookcode");
		String userId = request.getParameter("userId");
		
		System.out.println(bookcode + ", "  +userId);
		
		int result = new BookService().addLikeBook(userId, bookcode);
		
		if(result > 0) {
			response.sendRedirect("sori/blist");
			
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "관심도서 추가 실패");
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
