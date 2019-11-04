package bookmaking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class BookMakingInputDeleteServlet
 */
@WebServlet("/bmdel")
public class BookMakingInputDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingInputDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서제작 제출 실패시 인풋데이터 수정
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String bookcode = request.getParameter("bookcode");
		int index = Integer.parseInt(request.getParameter("index"));
		int bookpage = Integer.parseInt(request.getParameter("bookpage"));
		int makepage = Integer.parseInt(request.getParameter("makepage"));
		System.out.println("controller:" + userid+", "+bookcode+", "+index+", "+bookpage);
		int result = new BookMakingService().deleteInput(userid, bookcode, index, bookpage, makepage);
		if(result > 0) {
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
