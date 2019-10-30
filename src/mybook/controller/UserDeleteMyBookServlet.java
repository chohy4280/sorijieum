package mybook.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybook.model.service.MyBookService;

/**
 * Servlet implementation class UserDeleteMyBookServlet
 */
@WebServlet("/mybdel.my")
public class UserDeleteMyBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteMyBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내서재 목록 삭제
		MyBookService mbservice = new MyBookService();
		String[] check = request.getParameterValues("delChk");
		String userid = request.getParameter("userid");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int result = 0;
		
		System.out.println(check);
		for(int i=0; i<check.length; i++) {
			result += mbservice.deleteMyBook(userid,check[i]);
		}
		
		RequestDispatcher view = null;
		if(result == check.length) {
			view = request.getRequestDispatcher("/myboook.my");
			request.setAttribute("userid", userid);
			request.setAttribute("page", currentPage);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "삭제 실패");
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
