package notice.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSearchTypeServlet
 */
@WebServlet("/nosearch")
public class NoticeSearchTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchTypeServlet() {
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
		
		
		int limit = 5;
		
		NoticeService nservice = new NoticeService();
		int listCount = nservice.getListCountNoticeSearch(search,keyword);
		
		int maxPage = listCount/limit;
		if(listCount % limit > 0)
			maxPage++;
		
		int beginPage = (currentPage/limit) * limit +1;
		int endPage = beginPage + 4;
		if(endPage > maxPage)
			endPage = maxPage;
		
		int startnum = (currentPage * limit)-4;
		int endnum = currentPage * limit;
		
		ArrayList<Notice> list = nservice.selectNoitceSearch(search,keyword,startnum, endnum);
		ArrayList<Notice> toplist = nservice.selectTopFixed();
		RequestDispatcher view = null;
		if(list.size() >= 0) {
			view = request.getRequestDispatcher("views/boardnotice/noticeListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("search", search);
			request.setAttribute("keyword", keyword);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("toplist",toplist);
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
