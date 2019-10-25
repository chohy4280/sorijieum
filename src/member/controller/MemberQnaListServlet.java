package member.controller;

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
import qnacomment.model.service.QnaCommentService;
import qnacomment.model.vo.QnaComment;

/**
 * Servlet implementation class MemberQnaListServlet
 */
@WebServlet("/qlist.my")
public class MemberQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내 문의내역 이동 처리용 컨트롤러
		String userid = request.getParameter("userid");
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		
		QnaService qservice = new QnaService();
		QnaCommentService qcservice = new QnaCommentService();
		ArrayList<Qna> alarmlist = qservice.selectQnaAlarmList(userid);
		ArrayList<Qna> myqlist = qservice.selectMyQnaList(userid); //내 문의글만 검색
		int listCount = myqlist.size(); //내 문의 전체 개수
		ArrayList<QnaComment> myqclist = new ArrayList<QnaComment>();
		if(listCount > 0) {	//내 문의 리스트와 답변 리스트 개수 맞추기 위해 답변이 없어도 null을 리스트에 추가
			for(int i=0; i<listCount; i++) {
				if(myqlist.get(i).getQnaStatus().equals("Y"))
					myqclist.add(qcservice.selectQnaComment(myqlist.get(i).getQnaNo()));
				else
					myqclist.add(null);
			}
		}
	
		//총 페이지수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
	
		//currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예) 현재 34페이지이면 31~40이 됨 (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		int endPage = beginPage + (limit - 1); //+ 9
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage에 출력할 목록의 조회할 행 번호 계산
		int startnum = (currentPage * limit) - 9;
		int endnum = currentPage * limit;
		
		//조회할 목록의 시작행과 끝행 번호 전달하고 결과받기
		ArrayList<Qna> pageList = new ArrayList<Qna>();
		ArrayList<QnaComment> pageCommList = new ArrayList<QnaComment>();
		
		for(int i=startnum-1; i<endnum; i++) {
			if(i == listCount)
				break;
			pageList.add(myqlist.get(i));
			pageCommList.add(myqclist.get(i));
		}
		
		RequestDispatcher view = null;
		if(myqlist.size()>=0) {
			view = request.getRequestDispatcher("views/member/memberMyQna.jsp");
			request.setAttribute("alarmlist", alarmlist);
			request.setAttribute("myqlist", pageList);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("listcount", listCount);
			request.setAttribute("myqclist", pageCommList);
		}
		else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "내 문의내역 조회 실패");
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
