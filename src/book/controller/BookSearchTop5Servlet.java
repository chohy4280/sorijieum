package book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.*;
import org.json.simple.JSONObject;

import book.model.service.BookService;
import book.model.vo.Book;

/**
 * Servlet implementation class BoardTop3Servlet
 */
@WebServlet("/btop5")
public class BookSearchTop5Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchTop5Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 조회 수 많은 순 상위 3개 조회 처리용 컨트롤러 : ajax 요청처리 
		ArrayList<Book> list = new BookService().selectTop5();
		System.out.println("list : " + list);
		
		//전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();
		//list 옮겨 저장할 json 배열객체 생성
		JSONArray jarr = new JSONArray();
		
		//list를 jarr로 옮기기
		for(Book b : list) {
			//b 객체 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("bcode", b.getBookCode());
			//JSON 에서 한글깨짐 막으려면, java.net.URLEncoder.encode() 메소드로 인코딩 처리
			job.put("btitle", URLEncoder.encode(b.getBookTitle(), "UTF-8"));
			job.put("bviews", b.getBookViews());
			
			jarr.add(job);
		}
		
		//json 배열을 전송용 json 객체에 저장함
		sendJson.put("list", jarr);
		
		//요청한 뷰로 응답처리한다.
		//json을 내보낼때는 response에다가 제이슨임을 명시해야 한다. 
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJson.toJSONString()); //string 형태로 바꿔서 내보내야 한다.
		out.flush(); //buffer에서도 내보내기
		out.close(); //제이슨은 네트워크 입출력이다. 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
