package qna.controller;

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
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/qdetail")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A 상세보기 처리용 컨트롤러
		request.setCharacterEncoding("UTF-8");
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		
		QnaService qservice = new QnaService();
		int lastno = qservice.getLastNo(qnano);
		int nextno = qservice.getNextNo(qnano);
		
		qservice.updateViews(qnano);
		Qna qna = qservice.selectQnaOne(qnano);
		QnaComment qComm = new QnaCommentService().selectQnaComment(qnano);
		Qna lastQna = null;
		Qna nextQna = null;
		if(lastno != 0)
			lastQna = qservice.selectQnaOne(lastno);
		if(nextno != 0)
			nextQna = qservice.selectQnaOne(nextno);
		
		//이전페이지 url주소 받아서 판단
		String before_address = request.getHeader("referer");
		System.out.println(before_address);
		if(before_address.contains("qlist.my")) {
			qservice.deleteAlarm(qnano);
		}
		
		//4.
		RequestDispatcher view = null;
		if(qna != null) {
			view = request.getRequestDispatcher("views/boardqna/qnaDetailView.jsp");
			request.setAttribute("qna", qna); 
			request.setAttribute("qComm", qComm);
			request.setAttribute("lastQna", lastQna);
			request.setAttribute("nextQna", nextQna);
			view.forward(request, response);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", qnano+ "번 게시글 상세조회 실패");
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
