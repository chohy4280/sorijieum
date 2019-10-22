package qnacomment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qnacomment.model.service.QnaCommentService;
import qnacomment.model.vo.QnaComment;

/**
 * Servlet implementation class QnaCommentInsertServlet
 */
@WebServlet("/qcinsert")
public class QnaCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//QNACOMMET 작성 컨트롤러
		request.setCharacterEncoding("UTF-8");
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		String commwriter = request.getParameter("commwriter");
		String commcontent = request.getParameter("commcontent");
		
		QnaComment qcomm = new QnaComment();
		qcomm.setQnaNo(qnano);
		qcomm.setQnaComWriter(commwriter);
		qcomm.setQnaComments(commcontent);
		
		QnaCommentService qcservice = new QnaCommentService();
		
		int result = qcservice.insertQnaComment(qcomm);

	
		RequestDispatcher view = null;
		if(result>0) {
			view = request.getRequestDispatcher("/qdetail");
			new QnaService().insertQnaCommYN(qnano);
			request.setAttribute("qnano", qnano);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "답변 작성 실패");
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
