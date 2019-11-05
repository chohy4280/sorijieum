package book.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.BookPlay;
import mybook.model.service.MyBookService;
import mybook.model.vo.MyBook;

/**
 * Servlet implementation class BookSearchPlayPage
 */
@WebServlet("/bplaypage")
public class BookSearchPlayPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchPlayPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서재생 플레이로 이동하기 컨트롤러
		// 버튼 누르면 mybook에 userid랑 bookcode랑 readpage=1 저장되게 한다. 
		//  + sdate rdate sysdate 
		request.setCharacterEncoding("UTF-8");

		String bookcode = request.getParameter("bookcode");
		String userId = request.getParameter("userId");
	    int rpage = Integer.parseInt(request.getParameter("rpage"));
	   
		System.out.println("controller " + userId + bookcode + rpage);
		
		
	    MyBookService myservice = new MyBookService();
	    MyBook mbb = myservice.selectOneMyBookUser(bookcode, userId);
		int result1 = myservice.insertReadPage(userId, bookcode, mbb, rpage);   //mybook에 아이디, 도서코드, readpage = 1로 추가
	    int result2 = myservice.updateReadPage(userId, bookcode, mbb, rpage); //mybook에 값이 있으면 rdate를 오늘날짜로 변경
	     BookService bservice = new BookService();
	      BookPlay bp = bservice.getselectOneBookPlay(bookcode, rpage);
	   	
	      RequestDispatcher view = null;
		
		if(result1 > 0  || result2 > 0 && bp != null && mbb!=null) {
			view = request.getRequestDispatcher("views/booksearch/bookSearchPlay.jsp");
			request.setAttribute("bookcode", bookcode);
			request.setAttribute("userId", userId);
			request.setAttribute("rpage", rpage);
			request.setAttribute("bp", bp);
		}else{
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서불러오기 실패");
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
