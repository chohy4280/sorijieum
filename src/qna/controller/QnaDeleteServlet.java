package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qnacomment.model.service.QnaCommentService;

/**
 * Servlet implementation class QnaDeleteServlet
 */
@WebServlet("/qdelete")
public class QnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A 글 삭제 컨트롤러
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		int typenumber = Integer.parseInt(request.getParameter("typenumber"));
		String userid = request.getParameter("userid");
		
		int result = new QnaService().deleteQna(qnano);
		
		if(result>0) {			
			if(typenumber == 1 || typenumber == 2)
				response.sendRedirect("/sori/mypage?userid="+userid);
			else
				response.sendRedirect("/sori/qlist");
		}
		else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "문의글 삭제 실패");
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
