package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qnacomment.model.service.QnaCommentService;

/**
 * Servlet implementation class AdQnaDeleteServlet
 */
@WebServlet("/boddel.ad")
public class AdQnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdQnaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 QNA 삭제 컨트롤러
		request.setCharacterEncoding("utf-8");
		QnaService qService = new QnaService();
		String checkBox = request.getParameter("lists");
		String qnano = request.getParameter("qnano");
		int result1 = 0, result2 = 0;
		
		if(checkBox != null) {
			// 체크박스로 삭제
			String[] check = checkBox.split(",");
			
			for(int i = 0; i < check.length; i++) {
				result1 = qService.deleteQnaAdmin(check[i]);
				}
			}else if(qnano != null){
			// 도서 상세에서 삭제
			result2 = qService.deleteQnaAdmin(qnano);
			}
			
			// 결과처리
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			if(result1 > 0 || result2 > 0) {
				out.println("해당 문의글이 삭제되었습니다.");
			}else {
				out.println("해당 문의글 삭제가 불가능합니다.");
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
