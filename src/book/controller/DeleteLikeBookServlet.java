package book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import likebook.model.service.LikeBookService;

/**
 * Servlet implementation class DeleteLikeBookServlet
 */
@WebServlet("/dlike")
public class DeleteLikeBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLikeBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관심도서 삭제
		request.setCharacterEncoding("utf-8");
		    
		
		    String userId = request.getParameter("userid");
			String bookcode = request.getParameter("bookcode");
		
			int result = new LikeBookService().addDeleteLikeBook(userId, bookcode);
			if(result>0) {
				response.getWriter().append("ok"); //메세지를 반환
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
