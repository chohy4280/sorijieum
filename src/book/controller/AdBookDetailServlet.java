package book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.BookDV;

/**
 * Servlet implementation class adminBookDetailServlet
 */
@WebServlet("/bdetail.ad")
public class AdBookDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBookDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 도서 한개 정보 불러오기용
		request.setCharacterEncoding("utf-8");
		
		String bookcode = request.getParameter("bookcode");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		BookDV book = new BookService().selectBookOne(bookcode);
		
		RequestDispatcher view = null;
		
		if(book != null) {
			view = request.getRequestDispatcher("views/admin/adminDetailBook.jsp");
			request.setAttribute("book", book);
			request.setAttribute("currentPage", currentPage);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서 상세보기 실패!");
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
