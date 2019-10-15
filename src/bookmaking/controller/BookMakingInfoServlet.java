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
 * Servlet implementation class BookMakingInfoServlet
 */
@WebServlet("/bminfo")
public class BookMakingInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서정보 상세보기 처리용 컨트롤러
		String bookrimg = request.getParameter("bookrimg");
		BookMakingProgress bmp = new BookMakingService().selectMakingBookOne(bookrimg);
		ArrayList<BookMakingProgress> makelist = new BookMakingService().selectMakingBook();
		ArrayList<BookMakingProgress> list = new BookMakingService().selectWaitMakeBookAll();
		int dcount = new BookMakingService().getMakedBookCount();
		RequestDispatcher view = null;
		if(bmp != null && makelist.size() > 0) {
			view = request.getRequestDispatcher("views/bookmaking/bookinfo.jsp");
			request.setAttribute("bmp", bmp);
			request.setAttribute("makelist", makelist);
			request.setAttribute("list", list);
			request.setAttribute("dcount", dcount);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서정보 보기 실패!");
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
