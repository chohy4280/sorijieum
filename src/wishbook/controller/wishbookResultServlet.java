package wishbook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class wishbookResultServlet
 */
@WebServlet("/wbresult.ad")
public class wishbookResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishbookResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 신청도서 승인반려처리용
		request.setCharacterEncoding("utf-8");
		String searchtype = request.getParameter("searchtype");
		String keyword = request.getParameter("keyword");
		String wishstatus = request.getParameter("wishstatuss");
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		WishBook wb = new WishBook();
		int wishno = Integer.parseInt(request.getParameter("wishno"));
		wb.setWishNo(wishno);
		wb.setWishStatus(request.getParameter("wishstatus"));
		wb.setRjctReason(request.getParameter("rjctreason"));
		wb.setWishbookAdmin(request.getParameter("wishbookadmin"));
		
		int result = new WishBookService().updatetWishBookResult(wb);

		if(result > 0) {
			if(searchtype != null || keyword != null || wishstatus != null)
				response.sendRedirect("/sori/wbdetail.ad?wishno=" + wishno+"&page="+currentPage+"&searchtype="+searchtype+"&keyword="+keyword+"&wishstatus="+wishstatus);
			else 
				response.sendRedirect("/sori/wbdetail.ad?wishno=" + wishno+"&page="+currentPage);
			
			request.setAttribute("wb", wb);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "신청도서 관리자 처리 실패!");
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
