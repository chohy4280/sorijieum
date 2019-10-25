package adminmain.controller;

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
import member.model.service.MemberService;
import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;
import quit.model.service.QuitService;
import quit.model.vo.Quit;
import wishbook.model.service.WishBookService;
import wishbook.model.vo.WishBook;

/**
 * Servlet implementation class AdminMainServlet
 */
@WebServlet("/admain.ad")
public class AdminMainServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ArrayList<WishBook> wishbList = new WishBookService().selectWaitWishBook();
      ArrayList<Book> wbList = new BookService().seletWaitBook();
      ArrayList<Book> mbList = new BookService().selectMakeBook();
      ArrayList<Book> dbList = new BookService().selectDoneBook();
      
      ArrayList<Qna> newQList = new QnaService().selectAllSystdate();
      ArrayList<Qna> uaQList = new QnaService().selectAllUnanswer();
      
      ArrayList<Member> newUList = new MemberService().selectNewUserSystdate();
      ArrayList<Quit> quitUList = new QuitService().selectQuitUserSysdate();
      ArrayList<Member> totalUList = new MemberService().selectAllUser();
      
      ArrayList<Member> newMList = new MemberService().selectNewMakerSystdate();
      ArrayList<Quit> quitMList = new QuitService().selectQuitMakerSysdate();
      ArrayList<Member> totalMList = new MemberService().selectAllMaker();
      
      
      RequestDispatcher view = null;
      if(wbList.size() >= 0 && mbList.size() >= 0 && dbList.size() >= 0 && newQList.size() >= 0 && uaQList.size() >= 0 &&
            newUList.size() >= 0 && quitUList.size() >= 0 && totalUList.size() >= 0 && newMList.size() >= 0 && quitMList.size() >= 0 && totalMList.size() >= 0) {
         view = request.getRequestDispatcher("views/admin/adminIndexView.jsp");
         request.setAttribute("wishbList", wishbList);
         request.setAttribute("wbList", wbList);
         request.setAttribute("mbList", mbList);
         request.setAttribute("dbList", dbList);
         
         request.setAttribute("newQList", newQList);
         request.setAttribute("uaQList", uaQList);
         
         request.setAttribute("newUList", newUList);
         request.setAttribute("quitUList", quitUList);
         request.setAttribute("totalUList", totalUList);
         
         request.setAttribute("newMList", newMList);
         request.setAttribute("quitMList", quitMList);
         request.setAttribute("totalMList", totalMList);
      }else {
         view = request.getRequestDispatcher("views/common/error.jsp");
         request.setAttribute("message", "관리자 메인화면 로딩 실패!");
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