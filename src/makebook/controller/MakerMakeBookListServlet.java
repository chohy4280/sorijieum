package makebook.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import makebook.model.service.MakeBookService;
import makebook.model.vo.MakeBook;

/**
 * Servlet implementation class MakerMakedBookListServlet
 */
@WebServlet("/makedbook.my")
public class MakerMakeBookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakerMakeBookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//제작자 참여도서 목록 조회용 컨트롤러
		String userid = request.getParameter("userid");
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 5;  //한 페이지에 출력할 목록 갯수
		
		MakeBookService mbservice = new MakeBookService();
		int listcount = mbservice.getListCount(userid);
		
		//총 페이지수 계산
		int maxPage = listcount / limit;
		if(listcount % limit > 0)
			maxPage++;
	
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예) 현재 34페이지이면 31~40이 됨 (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		int endPage = beginPage + (limit - 1); //+ 4
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage에 출력할 목록의 조회할 행 번호 계산
		int startnum = (currentPage * limit) - 4;
		int endnum = currentPage * limit;
		
		//해당 페이지의 목록 조회
		ArrayList<MakeBook> mblist = mbservice.selectMakeBookList(userid,startnum,endnum);
		ArrayList<Book> blist = new ArrayList<Book>();
		Book book = new Book();
		BookService bservice = new BookService();
		for(int i=0; i<mblist.size(); i++) {
			String bookcode = mblist.get(i).getBookCode();
			
		}

		
		RequestDispatcher view = null;
		if(mblist.size()>=0) {
			view = request.getRequestDispatcher("views/member/makerMakeBook.jsp");
			request.setAttribute("mblist", mblist);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("listcount", listcount);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message",	"참여도서 페이지 로드 실패");
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
