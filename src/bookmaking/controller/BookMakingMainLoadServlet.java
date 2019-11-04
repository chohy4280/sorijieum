package bookmaking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import book.model.vo.BookMakingProgress;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class BookMakingMainLoadServlet
 */
@WebServlet("/bmmload")
public class BookMakingMainLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingMainLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서제작 제작화면이동 컨트롤러
		try {
		String bookcode = request.getParameter("bookcode");
		String userid = request.getParameter("userid");
		String indexStr = request.getParameter("index");
		int index = Integer.parseInt(indexStr);
		/*System.out.println(index);*/
		ArrayList<BookMakingProgress> list = new BookMakingService().selectBookMakingPopupLoad(bookcode, userid);
		int result = new BookMakingService().bookMakingInsert(bookcode, userid);
		int makestatus = new BookMakingService().bookMakingUpdate(bookcode);
		int making = new BookMakingService().insertBookMaking(bookcode);
		RequestDispatcher view = null;
		if(list.size() != 0 && result > 0 && makestatus > 0 && making > 0) {
			view = request.getRequestDispatcher("views/bookmaking/bookmakingmain.jsp");
			request.setAttribute("list", list);
			request.setAttribute("index", index);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", " 실패!");
			view.forward(request, response);
		}
		} catch (NumberFormatException e) {
			e.printStackTrace();
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
