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
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndlist")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 상세보기 처리용 컨트롤러
		//no라는 이름의 정수가 왔다(noticeListView.jsp에 27번)
		
		int noticeno = Integer.parseInt(request.getParameter("no"));
		
		NoticeService nservice = new NoticeService();
		
		Notice notice = nservice.selectOne(noticeno);
		nservice.updateReadCount(noticeno);
		
		RequestDispatcher view = null;
		if(notice != null) {//성공 -->뷰에다 전달
			view = request.getRequestDispatcher("views/boardnotice/noticeDetailView.jsp");
			request.setAttribute("notice", notice);
		}else {//실패 -->에러메세지 전달
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", noticeno + "번 공지 상세보기 실패");
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
