package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeMoveToModifyServlet
 */
@WebServlet("/nomtm")
public class NoticeMoveToModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeMoveToModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서 신청 수정 페이지 이동 컨트롤러
		int noticeno = Integer.parseInt(request.getParameter("noticeno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		Notice notice = new NoticeService().selectOne(noticeno);
		
		RequestDispatcher view = null;
		if(notice != null) {
			view = request.getRequestDispatcher("views/boardnotice/noticeModifyView.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서신청 수정페이지로 이동 실패!");
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
