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

/**
 * Servlet implementation class QnaUpdateServlet
 */
@WebServlet("/qupdate")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//문의글 수정 컨트롤러
		request.setCharacterEncoding("UTF-8");
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userid = request.getParameter("userid");
		
		Qna qna = new Qna();
		qna.setQnaNo(qnano);
		qna.setQnaTitle(title);
		qna.setQnaContent(content);
		qna.setQnaWriter(userid);
		
		int result = new QnaService().updateQna(qna);
		
		RequestDispatcher view = null;
		if(result>0) {
			view = request.getRequestDispatcher("/qdetail");
			request.setAttribute("qnano",qnano);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "문의글 수정 실패!!!");
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
