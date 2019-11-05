package book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import book.model.vo.BookPlay;

/**
 * Servlet implementation class BookSearchTypeServlet
 */
@WebServlet("/bsearch")
public class BookSearchTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		 int currentPage = 1;
		   
	       if(request.getParameter("page") !=null) {
	    	   currentPage = Integer.parseInt(request.getParameter("page"));
	       }
	       
		    String search = request.getParameter("search");
			   String keyword = request.getParameter("keyword");

	       int limit = 10;  
	       
	       BookService bservice = new BookService();
	       int listCount = bservice.getListCountBookSearch(search, keyword);
	       
	       int maxPage = listCount/limit;
	       if(listCount % limit > 0)
		      maxPage++;
	       
	       int beginPage =(currentPage/limit) * limit +1;
	       int endPage = beginPage + 9;
	       if(endPage > maxPage)
	    	   endPage = maxPage;
	       
	       int startRow = (currentPage * limit)-9;
	       int endRow = currentPage * limit;
		   
		   ArrayList<BookPlay> bplist = bservice.selectBookTitleAuthor(search,keyword,startRow,endRow);
	
	
		
		RequestDispatcher view = null;
		if(bplist.size()>=0) {
			view = request.getRequestDispatcher("views/booksearch/bookSearchList.jsp");
			request.setAttribute("bplist", bplist);
			request.setAttribute("search", search);
			request.setAttribute("keyword", keyword);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			view.forward(request, response);
		}else {
			view= request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", search + "검색조회 실패");
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
