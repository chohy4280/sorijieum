package likebook.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import likebook.model.service.LikeBookService;
import likebook.model.vo.LikeBookLB;
import mybook.model.vo.MyBookMYB;

/**
 * Servlet implementation class UserLikeBookServlet
 */
@WebServlet("/likebook.my")
public class UserLikeBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLikeBookServlet() {
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
		
		LikeBookService lbservice = new LikeBookService();
		ArrayList<LikeBookLB> lblist = lbservice.selectLikeBookList(userid);	//관심도서 목록 조회
		int listCount = lblist.size(); //내서재 전체 개수		
	
		//총 페이지수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
	
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예) 현재 34페이지이면 31~40이 됨 (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		int endPage = beginPage + (limit - 1); //+ 2
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage에 출력할 목록의 조회할 행 번호 계산
		int startnum = (currentPage * limit) - 2;
		int endnum = currentPage * limit;
		
		//조회할 목록의 시작행과 끝행 번호 전달하고 결과받기
		ArrayList<LikeBookLB> pageList = new ArrayList<LikeBookLB>();
		
		for(int i=startnum-1; i<endnum; i++) {
			if(i == listCount)
				break;
			pageList.add(lblist.get(i));
		}
		
		RequestDispatcher view = null;
		if(lblist.size() >=0) {
			view = request.getRequestDispatcher("views/member/userLikeBook.jsp");
			request.setAttribute("lblist", pageList);
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
