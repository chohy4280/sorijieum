package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServletServlet
 */
@WebServlet("/nlist")
public class NoticeListServlet extends HttpServlet { //공지사항 전체 글 목록 보기
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int currentPage = 1;
      if(request.getParameter("page") !=null) {
         currentPage = Integer.parseInt(request.getParameter("page"));
      }
      
      //한 페이지에 출력할 게시물 수
      int limit = 5;
      
      NoticeService nservice = new NoticeService();
      int listCount = nservice.getListCount();
      
      //총 페이지 수 계산
      int maxPage = listCount / limit;
      if(listCount % limit > 0)
         maxPage++;
      
      //currentPage가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
            
            int beginPage = (currentPage / limit) * limit + 1;
            if(currentPage % limit == 0) {
                  beginPage -= limit;
                }
            int endPage = beginPage + (limit - 1); //+ 9
            if(endPage > maxPage) {
               endPage = maxPage;
               }
            
            //currentPage에 출력할 목록의 조회할 행 번호 계산
            int startnum = (currentPage * limit) - 4;
            int endnum = currentPage * limit;
   
      ArrayList<Notice> list = nservice.selectAll(startnum, endnum);
      //ArrayList<Notice> toplist = nservice.selectTopFixed();
      
      RequestDispatcher view = null;
      if(list.size() > 0) {
         view = request.getRequestDispatcher("views/boardnotice/noticeListView.jsp");
         request.setAttribute("list", list);
         //request.setAttribute("toplist", toplist);
         request.setAttribute("maxPage", maxPage);
         request.setAttribute("currentPage", currentPage);
         request.setAttribute("beginPage", beginPage);
         request.setAttribute("endPage", endPage);
         request.setAttribute("listCount", listCount);
         
         view.forward(request, response);
      }else {
         view = request.getRequestDispatcher("views/common/error.jsp");
         request.setAttribute("message", "공지사항 전체 목록 조회 실패!");
         view.forward(request, response);
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