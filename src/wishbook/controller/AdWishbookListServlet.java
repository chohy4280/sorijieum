package wishbook.controller;

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
import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class adminWishbookListServlet
 */
@WebServlet("/wblist.ad")
public class AdWishbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdWishbookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 신청도서(전체) 조회용
		// ----------------- 페이징 처리 추가 -----------------
				int currentPage; // 현재 페이지를 표시할 변수
				int limit; // 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
				int maxPage; // 전체 페이지에서 가장 마지막 페이지
				int beginPage; // 한번에 표시될 페이지가 시작할 페이지
				int endPage; // 한번에 표시될 페이지가 끝나는 페이지
				
				//현재 페이지 처리
				currentPage = 1;
				
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				//한 페이지에 보여질 목록 갯수
				limit = 10;
				
				//전체 게시글 수 조회
				int listCount  = new WishBookService().getListCountAdmin();
				
				//총 페이지 수 계산
				//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
				maxPage = (int)((double)listCount / limit + 0.9);
				
				// 현재 페이지에 보여줄 시작페이지 수
				// 1, 11, 21, 31,...
				beginPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
				
				
				// 현재 페이지=limit와 같은 경우 비긴페이지에서 limit빼주기.
				// 현재: 10, limit = 10   -> beginPage 11인데 - 10 해서 1페이지. (11페이지 못넘어가게)
				if(currentPage % limit == 0) {
			         beginPage -= limit;
			      }

				// 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
				endPage = beginPage + 10 - 1;

				if (maxPage < endPage) {
					endPage = maxPage;
				}
				
				int startRow = (currentPage - 1) * limit + 1;  // 각 페이징 페이지 마다 처음 페이지 번호(ex.1,11,21,31...)
				int endRow = startRow + limit - 1; // 각 페이징 페이지 마다 마지막 페이지 번호(ex.10,20,30,40...)
				
				ArrayList<WishBook> list = new WishBookService().selectAll(startRow, endRow);
		
		RequestDispatcher view = null;
		if(list.size() >= 0) {
			view = request.getRequestDispatcher("views/admin/adminWishBookListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "신청도서 목록 조회 실패!");
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
