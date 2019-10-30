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
 * Servlet implementation class BookMakingInputInsertServlet
 */
@WebServlet("/inputinsert")
public class BookMakingInputInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingInputInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서제작 페이지별 입력된 데이터 저장 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		int page = Integer.parseInt(request.getParameter("page"));
		String bookcode = request.getParameter("bookcode");
		String userid = request.getParameter("userid");
		int index = Integer.parseInt(request.getParameter("index"));
		/*System.out.println(content + ", " + title + ", " + page + ", " + bookcode + ", " + userid);*/
		BookMakingProgress bmp = new BookMakingProgress(bookcode, title, null, content, page, userid);
		int result = new BookMakingService().inputInsert(bmp, index);
		if(result>0) {
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
