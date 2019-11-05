<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%
   WishBook wb = (WishBook)request.getAttribute("wb");
   WishBook lastwishbook = (WishBook)request.getAttribute("lastwishbook");
   WishBook nextwishbook = (WishBook)request.getAttribute("nextwishbook");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청도서 상세 보기</title>
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript" src="/sori/resources/js/sorijieum_tts.js"></script>
<script type="text/javascript">
$(function(){
      $("#delbutton").on("click", function(){
         alert("정말 삭제하시겠습니까?");
      });
   });
   
var title = "";
var author = "";
var publisher = "";
var publishdate = "";
var wishwriter = "";
var wishdate = "";

if(<%= loginMember.getTypeNumber() < 3 && wb.getWishWriter().equals(loginMember.getUserId()) %>){ //신청자일 때
   var audio = new Audio("/sori/resources/mp3/wishdetail_main.mp3");
   window.onload = function(){
      audio.play();
   } 
   
   window.onkeyup = function(){
      if(event.keyCode == 27){ //음성멈춤
         audio.pause();
          audio.currentTime = 0;
      }
      if(event.keyCode == 49 || event.keyCode == 97){ //상세보기 듣기
         title = document.getElementById('wishbooktitle').innerText;
         author = document.getElementById("wishbookauthor").innerText;
         publisher = document.getElementById("wishpublisher").innerText;
         publishdate = document.getElementById("wishpublishdate").innerText;
         audio.pause();
         speech("신청하신 도서명은, "+ title +"입니다." );
         speech("신청하신 도서의 저자명은, "+ author +" 입니다.");      
         speech("신청하신 도서의 출판사는, "+ publisher +" 입니다.");
         speech("신청하신 도서의 출판일은, "+ publishdate +" 입니다.");
      }
      if(event.keyCode == 50 || event.keyCode == 98){ //수정페이지로 이동
         audio.pause();
         location.href="/sori/wbuview?wishno=<%= wb.getWishNo() %>";
      }
      if(event.keyCode == 51 || event.keyCode == 99){ //신청글 삭제
         audio.pause();
         location.href="/sori/wbdel?wishno=<%= wb.getWishNo() %>";
      }
      if(event.keyCode == 57 || event.keyCode == 105){ //이전페이지로
         audio.pause();
         location.href="/sori/wblist";
      }
   }
}else if(<%= loginMember.getTypeNumber() < 3 && !wb.getWishWriter().equals(loginMember.getUserId()) %>){
   var audio = new Audio("/sori/resources/mp3/wishdetailmain2.mp3");
   window.onload = function(){
      audio.play();
   } 

   window.onkeyup = function(){
      if(event.keyCode == 27){ //음성멈춤
         audio.pause();
          audio.currentTime = 0;
      }
      if(event.keyCode == 49 || event.keyCode == 97){ //상세보기 듣기
         audio.pause();
         speech("도서명은, "+ title +"입니다." );
         speech("도서의 저자명은, "+ author +" 입니다.");      
         speech("도서의 출판사는, "+ publisher +" 입니다.");
         speech("도서의 출판일은, "+ publishdate +" 입니다.");
         speech("도서의 신청자는, " +wishwriter +" 입니다.");
         speech("도서의 신청일은, " +wishdate +" 입니다.");
      }
      if(event.keyCode == 57 || event.keyCode == 105){ //이전페이지로
         audio.pause();
         location.href="/sori/wblist";
      }
   }
}
</script>
<!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<!-- Content 시작! -->
   <section class="my-section">
   <!--도서신청 내용 시작-->
   <div class="my-content">
      <div class="massive ui yellow label" style="font-size: 30px">도서 신청</div>
      <span style="color:#fbbe09; font-weight:600">│</span>
      <span style="color:grey">도서신청 게시판입니다</span>
      <br><br>
   <!-- 도서신청 상세 내역 시작 -->
   <center>
      <table class="my-listTable4" style="width:50%;">
         <tr>
            <th width="20%">제목</th><td width="80%" id="wishbooktitle" value="<%= wb.getWishBookTitle() %>"><%= wb.getWishBookTitle() %></td>
         </tr>
         <tr>
            <th>저자</th><td id="wishbookauthor" value="<%= wb.getWishBookAuthor() %>"><%= wb.getWishBookAuthor() %></td>
         </tr>
         <tr>
         <% if(wb.getWishPublisher() != null){ %>
            <th>출판사</th><td id="wishpublisher" value="<%= wb.getWishPublisher() %>"><%= wb.getWishPublisher() %></td>
         <% }else{ %>
            <th>출판사</th><td id="wishpublisher" value="미작성">미작성</td>
         <% } %>
         </tr>
         <tr>
         <% if(wb.getWishPublishDate() != null){ %>
            <th>출판일</th><td id="wishpublishdate" value="<%= wb.getWishPublishDate() %>"><%= wb.getWishPublishDate() %></td>
         <% }else{ %>
            <th>출판일</th><td id="wishpublishdate" value="미작성">미작성</td>
         <% } %>
         </tr>
         <tr>
            <th>신청자</th><td id="wishwriter" value="<%= wb.getWishWriter() %>"><%= wb.getWishWriter() %></td>
         </tr>
         <tr>
            <th>신청일</th><td id="wishdate" value="<%= wb.getWishDate() %>"><%= wb.getWishDate() %></td>
         </tr>
      </table>
   </center>
   <!-- 도서신청 상세 내역 끝-->
   <% if(loginMember != null && loginMember.getUserId().equals(wb.getWishWriter())){ %>
   <!-- 관리자/작성자 수정삭제 버튼 -->
   <div align="right">
      <div class="ui buttons">
         <button class="ui positive button" onclick="location.href='/sori/wbuview?wishno=<%= wb.getWishNo() %>'">수정</button>
           <div class="or"></div>
         <button id="delbutton" class="ui button" onclick="location.href='/sori/wbdel?wishno=<%= wb.getWishNo() %>'">삭제</button>
      </div>
   </div>
   <% }else if(loginMember != null && loginMember.getUserId().substring(0, 5).equals("admin")){ %>
   <!-- 관리자/작성자 수정삭제 버튼 -->
   <div align="right">
      <div class="ui buttons">
         <button class="ui positive button" onclick="location.href='/sori/wbuview?wishno=<%= wb.getWishNo() %>'">수정</button>
           <div class="or"></div>
         <button id="delbutton" class="ui button" onclick="location.href='/sori/wbdel?wishno=<%= wb.getWishNo() %>'">삭제</button>
      </div>
   </div>
   <% } %>
   <!-- 공통 페이지 이동 버튼 -->
      <center>
         <div class="ui buttons">
         <% if(lastwishbook == null){ %>
         <button class="ui labeled icon button" onclick="last()">
          <i class="left chevron icon"></i>
          이전글
        </button>
         <% }else{ %>
        <button class="ui labeled icon button" onclick="location.href='/sori/wbdview?wishno=<%= lastwishbook.getWishNo() %>'">
          <i class="left chevron icon"></i>
          이전글
        </button>
        <% } %>
        <button class="ui button" onclick="location.href='/sori/wblist'">
          목록
        </button>
        <% if(nextwishbook == null){ %>
        <button class="ui right labeled icon button" onclick="next()">
          다음글
          <i class="right chevron icon"></i>
        </button>
        <% }else{ %>
        <button class="ui right labeled icon button" onclick="location.href='/sori/wbdview?wishno=<%= nextwishbook.getWishNo() %>'">
          다음글
          <i class="right chevron icon"></i>
        </button>
        <% } %>
      </div>
      </center>
   </div>
   <!--도서신청 내용 끝-->
   <%-- <input id="wishbooktitle" type="hidden" value="<%= wb.getWishBookTitle() %>" autocomplete="off" readonly="">
   <input id="wishbookauthor" type="hidden" value="<%= wb.getWishBookAuthor() %>" autocomplete="off" readonly="">
   <input id="wishpublisher" type="hidden" value="<%= wb.getWishPublisher() %>" autocomplete="off" readonly="">
   <input id="wishpublishdate" type="hidden" value="<%= wb.getWishPublishDate() %>" autocomplete="off" readonly="">
   <input id="wishwriter" type="hidden" value="<%= wb.getWishWriter() %>" autocomplete="off" readonly="">
   <input id="wishdate" type="hidden" value="<%= wb.getWishDate() %>" autocomplete="off" readonly=""> --%>
   </section>
   <!-- Content 끝! -->
</body>
</html>