package makebook.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import likebook.model.vo.LikeBookLB;
import makebook.model.service.MakeBookService;
import makebook.model.vo.MakeBookBBM;

/**
 * Servlet implementation class MakerMakedBookListServlet
 */
@WebServlet("/makebook.my")
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
		//이용자 관심도서 페이지 이동 컨트롤러
		String userid = request.getParameter("userid");
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 3;  //한 페이지에 출력할 목록 갯수
		
		MakeBookService mbservice = new MakeBookService();
		ArrayList<MakeBookBBM> mblist = mbservice.selectMakeBookList(userid);	//참여도서 목록 조회
		int listCount = mblist.size(); //참여도서 전체 개수		
	
		//총 페이지수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
	
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예) 현재 34페이지이면 31~40이 됨 (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		if(currentPage % limit == 0) {
			beginPage -= limit;
		}
		int endPage = beginPage + (limit - 1); //+ 2
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage에 출력할 목록의 조회할 행 번호 계산
		int startnum = (currentPage * limit) - 2;
		int endnum = currentPage * limit;
		
		//조회할 목록의 시작행과 끝행 번호 전달하고 결과받기
		ArrayList<MakeBookBBM> pageList = new ArrayList<MakeBookBBM>();
		
		for(int i=startnum-1; i<endnum; i++) {
			if(i == listCount)
				break;
			pageList.add(mblist.get(i));
		}
		
		RequestDispatcher view = null;
		if(mblist.size() >=0) {
			view = request.getRequestDispatcher("views/member/makerMakeBook.jsp");
			request.setAttribute("mblist", pageList);
			request.setAttribute("listCount", listCount);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "내서재 이동 실패");
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
