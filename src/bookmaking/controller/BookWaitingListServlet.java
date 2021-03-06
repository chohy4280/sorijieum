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
 * Servlet implementation class BookWaitingListServlet
 */
@WebServlet("/bwlist")
public class BookWaitingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookWaitingListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//제작해야할 도서 전체 목록 리스트 처리용 컨트롤러 - 페이징 처리함
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		BookMakingService bservice = new BookMakingService();
		int listCount = bservice.getListCountWaiting(); //테이블의 전체 목록 갯수 조회
		//총 페이지수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예? 현재 34페이지이면 31~40이 됨 (페이지그룹의 수를 10개로 한 경우)
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
		
		//조회할 목록의 시작행과 끝행 번호 전달하고 결과받기
		ArrayList<BookMakingProgress> list = bservice.selectWaitingBookList(startRow, endRow);
		ArrayList<BookMakingProgress> waitlist = bservice.selectWaitingBook();
		int dcount = new BookMakingService().getMakedBookCount();
		RequestDispatcher view = null;
		if(list.size() > 0 && waitlist.size() > 0) {
			view = request.getRequestDispatcher("views/bookmaking/bookwaitinglist.jsp");
			request.setAttribute("list", list);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("dcount", dcount);
			view.forward(request, response);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "제작해야할 도서 전체 목록  조회 실패!");
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
