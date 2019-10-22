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
 * Servlet implementation class QnaCommentUpdateServlet
 */
@WebServlet("/qcupdate")
public class QnaCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A 답변 수정용 컨트롤러
		request.setCharacterEncoding("UTF-8");
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		String writer = request.getParameter("qcwriter");
		String content = request.getParameter("commUpdateContent");
		
		QnaComment qComm = new QnaComment();
		qComm.setQnaNo(qnano);
		qComm.setQnaComWriter(writer);
		qComm.setQnaComments(content);
		
		QnaCommentService qcservice = new QnaCommentService();
		int result = qcservice.updateQnaComment(qComm);
		/*Qna qna = new QnaService().selectQnaOne(qnano);
		QnaComment qComm2 = qcservice.selectQnaComment(qnano);*/
		
		
		System.out.println("업데이트 서블릿으로 왔다!!!!!!!!!!"+result);
		
		RequestDispatcher view = null;
		if(result>0) {
			view = request.getRequestDispatcher("/qdetail");
			request.setAttribute("qnano", qnano);
			/*request.setAttribute("qna", qna);
			request.setAttribute("qComm", qComm2);*/
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "답변 수정 실패!!");
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
