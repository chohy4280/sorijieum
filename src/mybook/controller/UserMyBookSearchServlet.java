package mybook.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybook.model.service.MyBookService;
import mybook.model.vo.MyBookMYB;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class UserMyBookSearchServlet
 */
@WebServlet("/mybsearch.my")
public class UserMyBookSearchServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyBookSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //이용자 내서재 검색
      request.setCharacterEncoding("UTF-8");
      String userid = request.getParameter("userid");
      String keyword = request.getParameter("keyword");
      int currentPage = 1;
      if(request.getParameter("page") != null) {
         currentPage = Integer.parseInt(request.getParameter("page"));
      }
      int limit = 3;  //한 페이지에 출력할 목록 갯수
      
      MyBookService mybservice = new MyBookService();
      ArrayList<MyBookMYB> myblist = mybservice.searchMyBookList(userid,keyword);
      int listCount = myblist.size();
      System.out.println("listcount: "+ listCount);
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
      
      ArrayList<MyBookMYB> pageList = new ArrayList<MyBookMYB>();
      for(int i=startnum-1; i<endnum; i++) {
         if(i == listCount)
            break;
         pageList.add(myblist.get(i));
      }
      
      System.out.println(pageList);
      RequestDispatcher view = null;
      if(pageList.size()>=0) {
         view = request.getRequestDispatcher("views/member/userMyBook.jsp");
         request.setAttribute("myblist", pageList);
         request.setAttribute("keyword", keyword);
         request.setAttribute("maxPage", maxPage);
         request.setAttribute("currentPage", currentPage);
         request.setAttribute("beginPage", beginPage);
         request.setAttribute("endPage", endPage);
         request.setAttribute("listCount", listCount);
      }
      else {
         view = request.getRequestDispatcher("views/common/error.jsp");
         request.setAttribute("message", "내 서재 검색 실패!!");
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