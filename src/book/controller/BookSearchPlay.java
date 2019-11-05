package book.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.BookDV;
import book.model.vo.BookPlay;
import mybook.model.service.MyBookService;

/**
 * Servlet implementation class BookSearchPlay
 */
@WebServlet("/bplay")
public class BookSearchPlay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchPlay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     //페이지 넘길때 마다 이어읽기, 최근 읽은 날짜를 mybook에 추가하는 서블릿
		request.setCharacterEncoding("utf-8");
		
		String bookcode = request.getParameter("bookcode");
		String userId = request.getParameter("userid");
		int rpage = Integer.parseInt(request.getParameter("rpage"));
		
		MyBookService myservice = new MyBookService();
		int result = myservice.updatePlayBook(userId, bookcode, rpage); // 다음 버튼 누를때 마다 readpage, readrdate 추가용
		
		if(result>0) {
			response.getWriter().append("ok"); //결과 반환
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
