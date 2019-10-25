package qnacomment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Qna;
import qnacomment.model.service.QnaCommentService;
import qnacomment.model.vo.QnaComment;

/**
 * Servlet implementation class QnaCommentDeleteServlet
 */
@WebServlet("/qcdelete")
public class QnaCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A 답변 삭제용 컨트롤러
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		
		QnaCommentService qcservice = new QnaCommentService();
		QnaService qservice = new QnaService();
		int result = qcservice.deleteQnaComment(qnano);
		
		RequestDispatcher view = null;
		if(result>0) {
			view = request.getRequestDispatcher("/qdetail");
			qservice.deleteQnaCommYN(qnano);
			request.setAttribute("qnano", qnano);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "답변 삭제 실패!!!!");
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
