package book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;

/**
 * Servlet implementation class bookDeleteServlet
 */
@WebServlet("/bdel.ad")
public class AdBookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBookDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 도서 삭제용
		request.setCharacterEncoding("utf-8");
		BookService bService = new BookService();
		String checkBox = request.getParameter("lists");
		String bookcode = request.getParameter("bookcode");
		int result1 = 0, result2 = 0;
		if(checkBox != null) {
		// 체크박스로 삭제
		String check[] = checkBox.split(",");
		
		for(int i = 0; i < check.length; i++) {
			result1 = bService.deleteBook(check[i]);
			}
		}else if(bookcode != null){
		// 도서 상세에서 삭제
		result2 = bService.deleteBook(bookcode);
		}
		
		// 결과처리
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result1 > 0 || result2 > 0) {
			out.println("해당 도서가 삭제되었습니다.");
		}else {
			out.println("해당 도서 삭제가 불가능합니다.");
			}
		
		
		/*if(result > 0) {
			response.sendRedirect("/sori/blist.ad");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서 삭제 실패!");
			view.forward(request, response);
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
