package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishbook.model.service.WishBookService;

/**
 * Servlet implementation class UserMyWishAlarmDeleteServlet
 */
@WebServlet("/wsarmdel.my")
public class UserMyWishAlarmDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyWishAlarmDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//마이페이지 내 문의 알림 삭제용 컨트롤러
		int wishno = Integer.parseInt(request.getParameter("wishno"));
		
		int result = new WishBookService().deleteAlarm(wishno);
		
		if(result>0) {
			PrintWriter out = response.getWriter();
			out.write("div_"+wishno);
			out.flush();
			out.close();
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
