package bookmaking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		int page = Integer.parseInt(request.getParameter("page"));
		String bookcode = request.getParameter("bookcode");
		String userid = request.getParameter("userid");
		/*System.out.println(content + ", " + title + ", " + page + ", " + bookcode + ", " + userid);*/
		BookMakingService bmservice = new BookMakingService();
		BookMakingProgress bmp = new BookMakingProgress(bookcode, title, null, content, page, userid);
		int result = bmservice.inputInsert(bmp);
		
		
		RequestDispatcher view = null;
		if (result > 0) {
			response.sendRedirect("/sori/bmmload?bookcode="+ bookcode + "&userid="+userid);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서제작 페이지 저장 실패");
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
