package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaSerachServlet
 */
@WebServlet("/qsearch")
public class QnaSerachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaSerachServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A 검색 처리용 컨트롤러
		request.setCharacterEncoding("UTF-8");
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		QnaService qservice = new QnaService();
		
		ArrayList<Qna> list = qservice.searchQna(type, keyword);
		int listCount = list.size(); //검색된 개수
		
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
		int endPage = beginPage + (limit - 1); //+ 9
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage에 출력할 목록의 조회할 행 번호 계산
		int startnum = (currentPage * limit) - 9;
		int endnum = currentPage * limit;
		
		ArrayList<Qna> pageList = new ArrayList<Qna>();
		
		for(int i=startnum-1; i<endnum; i++) {
			if(i == listCount)
				break;
			pageList.add(list.get(i));
		}
		
		ArrayList<Qna> toplist = qservice.selectQnaTopList();	//고정글 리스트를 따로 받아옴
		RequestDispatcher view = null;
		if(list.size()>=0) {
			view = request.getRequestDispatcher("views/boardqna/qnaListView.jsp");
			request.setAttribute("list", pageList);
			request.setAttribute("type", type);
			request.setAttribute("keyword", keyword);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("toplist", toplist);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "문의글 검색 실패!!");
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
