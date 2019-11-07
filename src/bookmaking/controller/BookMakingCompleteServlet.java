package bookmaking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.vo.BookMakingProgress;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class BookMakingCompleteServlet
 */
@WebServlet("/bmcomp")
public class BookMakingCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서제작  제출 컨트롤러
		request.setCharacterEncoding("utf-8");
		String bookcode = request.getParameter("bookcode");
		String userid = request.getParameter("userid");
		int endpage = Integer.parseInt(request.getParameter("endpage"));
		int page = Integer.parseInt(request.getParameter("page"));
		int bookpage = Integer.parseInt(request.getParameter("bookpage"));
		BookMakingService bmservice = new BookMakingService();
		BookMakingProgress bmp = new BookMakingProgress(userid, bookcode);
		int result = bmservice.insertMakeBook(bmp, page, bookpage);
		int results = bmservice.insertMakePage(bmp, bookcode, page, endpage);
		int resultss = bmservice.insertCompleteyn(bmp, page, endpage);
		
		if (result > 0 && results > 0 && resultss > 0) {
			response.getWriter().append("ok");
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
