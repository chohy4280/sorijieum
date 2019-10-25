package qnacomment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import qnacomment.model.service.QnaCommentService;
import qnacomment.model.vo.QnaComment;

/**
 * Servlet implementation class MyQnaCommentServlet
 */
@WebServlet("/qcselect.my")
public class MyQnaCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQnaCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내 문의에 대한 답변 조회
		int myqno = Integer.parseInt(request.getParameter("myqno"));
		
		QnaCommentService qservice = new QnaCommentService();
		QnaComment qcomm = qservice.selectQnaComment(myqno);
		
		JSONObject job = new JSONObject();
		job.put("myqno", qcomm.getQnaNo());
		job.put("comment", URLEncoder.encode(qcomm.getQnaComments()));
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(job.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
