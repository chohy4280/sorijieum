package wishbook.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.vo.BookMakingProgress;
import bookmaking.model.service.BookMakingService;
import qna.model.service.QnaService;

import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class WishBookDetailViewServlet
 */
@WebServlet("/wbdview")
public class WishBookDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//도서신청글 상세보기 처리용 컨트롤러
		int wishno = Integer.parseInt(request.getParameter("wishno"));
		WishBookService wservice = new WishBookService();
		int lastwishno = wservice.getLastWishNo(wishno);
		int nextwishno = wservice.getNextWishNo(wishno);
		
		wservice.updateWishViews(wishno);//조회수 증가
		WishBook wb = wservice.selectWishBookOne(wishno);

		WishBook lastwishbook = null;
		WishBook nextwishbook = null;
		if(lastwishno != 0)
			lastwishbook = wservice.selectWishBookOne(lastwishno);
		if(nextwishno != 0)
			nextwishbook = wservice.selectWishBookOne(nextwishno);

		//이전페이지 url주소 받아서 판단
		String before_address = request.getHeader("referer");
		System.out.println(before_address);
		if(before_address.contains("wishbook.my")) {
			wservice.deleteAlarm(wishno);
		}
				
		RequestDispatcher view = null;
		if(wb != null) {
			view = request.getRequestDispatcher("views/boardwishbook/wishbookDetailView.jsp");
			request.setAttribute("wb", wb);
			request.setAttribute("lastwishbook", lastwishbook);
			request.setAttribute("nextwishbook", nextwishbook);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서신청 상세정보 보기 실패!");
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
