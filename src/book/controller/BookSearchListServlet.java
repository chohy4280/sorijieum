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
import book.model.vo.BookPlay;
import notice.model.service.NoticeService;

/**
 * Servlet implementation class BookSearchListServlet
 */
@WebServlet("/blist")
public class BookSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서 전체 목록 보기 출력 처리용 
		request.setCharacterEncoding("utf-8");
		
	  
       int currentPage = 1;
       if(request.getParameter("page") !=null) {
    	   currentPage = Integer.parseInt(request.getParameter("page"));
       }
       
       int limit = 10;
       BookService bservice = new BookService();
       
       int listCount = bservice.getListCount();

		
		//총 페이지 수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
				
				int beginPage = (currentPage / limit) * limit + 1;
				if(currentPage % limit == 0) {
			         beginPage -= limit;
			    	}
				int endPage = beginPage + (limit - 1); //+ 9
				if(endPage > maxPage) {
					endPage = maxPage;
					}
				
				//currentPage에 출력할 목록의 조회할 행 번호 계산
				int startRow = (currentPage * limit) - 9;
				int endRow = currentPage * limit;
       
       ArrayList<BookPlay> bplist = bservice.selectList(startRow,endRow);
       
       RequestDispatcher view = null;
       if(bplist.size() >= 0) {
    	   view = request.getRequestDispatcher("views/booksearch/bookSearchList.jsp");
    	   request.setAttribute("bplist",bplist);
    	   request.setAttribute("maxPage", maxPage);
    	   request.setAttribute("currentPage", currentPage);
    	   request.setAttribute("beginPage",beginPage);
    	   request.setAttribute("endPage", endPage);
    	   request.setAttribute("listCount",listCount);
    	   view.forward(request, response);
    	   
       }else {
    	   view = request.getRequestDispatcher("views/common/error.jsp");
    	   request.setAttribute("message", currentPage + "페이지 목록 불러오기 실패");
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
