<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "notice.model.vo.Notice,java.util.ArrayList" %>
<% 
  
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
   //ArrayList<Notice> topList = (ArrayList<Notice>)request.getAttribute("toplist");
   int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
   int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
   int endPage = ((Integer)request.getAttribute("endPage")).intValue();
   int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
   int listCount = ((Integer)request.getAttribute("listCount")).intValue();
   String keyword = (String)request.getAttribute("keyword");
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/sori/resources/js/sorijieum_tts.js"></script>
<script type="text/javascript">

   $(function(){
      if(<%= list.size() %> == 0){                  // 검색 내용 없으면 페이징 버튼 없애기
         $("#pagebox1").css("display", "none");
      }
         
// 음성 tts **********************************************************************

      <%if(loginMember!=null && (loginMember.getTypeNumber()==1 || loginMember.getTypeNumber()==2)){%>
      
      //검색창이 아닌 곳에서 키 눌렀을 때 이벤트 발생
         $("body:not('#listNum')").on("keyup",function(event){
             if(event.keyCode == 57 || event.keyCode == 105){      // 9번:입력시 메인 페이지 이동
                 location.href="/sori/index.jsp";
              }else if(event.keyCode == 49 || event.keyCode == 97){   // 1번 : 전체듣기
                 audio.pause();
               audio = new Audio("/sori/resources/mp3/noticeList.mp3");
               audio.play();
               $("#listNum").focus();
               <%if(currentPage == 1){%>
               audio.addEventListener("ended", function(e) {      // 공지 읽어주기
                  var text = "";
                  for(var i=1; i<=10; i++){
                     text = document.getElementById(i+"info").value;
                     if(i==1){
                        speech("일번, "+text);
                     }else if(i==2){
                        speech("이번, "+text);
                     }else if(i==3){
                        speech("삼번, "+text);
                     }else if(i==4){
                        speech("사번, "+text);
                     }else if(i==5){
                        speech("오번, "+text);
                     }
                  }
               });
               <%}%>
               
               }else if(event.keyCode == 50 || event.keyCode == 98){   // 2번 : 검색
                  audio.pause();
                  $("#keyword").focus();
               }else if(event.keyCode == 48 || event.keyCode == 96){   // 0번 : 다시듣기
                    location.reload();
               }else if(event.keyCode == 37){
                    <% if(keyword == null && currentPage != beginPage){ %>
                       location.href="/sori/nlist?page=<%= currentPage-1  %>";
                    <% }else if(keyword != null && currentPage != beginPage){ %>
                       location.href="/sori/nosearch?page=<%= currentPage-1 %>&keyword=<%=keyword%>";
                    <% } else if(currentPage == beginPage) {%>
                       speech("첫 페이지입니다.");
                    <%}%>
              }else if(event.keyCode == 39){
                    <% if(keyword == null && currentPage != maxPage){ %>
                       location.href="/sori/nlist?page=<%= currentPage+1  %>";
                    <% }else if(keyword != null && currentPage != maxPage){ %>
                       location.href="/sori/nosearch?page=<%= currentPage+1 %>&keyword=<%=keyword%>";
                    <% }else if(currentPage == maxPage) {%>
                       speech("마지막 페이지입니다.");
                 <%}%>
              }
         });
      });


   var audio = new Audio("/sori/resources/mp3/noticeMain.mp3");
   window.onload = function(){
      <% if(keyword == null && currentPage == 1){ %>
         audio.play();
      <% }else if(keyword == null && currentPage != 1){ %>
         speech(<%= currentPage %> + " 페이지 입니다.");
         $("#listNum").focus();
         var text = "";
         for(var i=1; i<=10; i++){
            text = document.getElementById(i+"info").value;
            if(i==1){
               speech("일번, "+text);
            }else if(i==2){
               speech("이번, "+text);
            }else if(i==3){
               speech("삼번, "+text);
            }else if(i==4){
               speech("사번, "+text);
            }else if(i==5){
               speech("오번, "+text);
            }
         }
         
      <% } else if(keyword != null && currentPage != 1){ %>
         speech(<%= currentPage %> + " 페이지 입니다.");
         $("#listNum").focus();
         var text = "";
         for(var i=1; i<=10; i++){
            text = document.getElementById(i+"info").value;
            if(i==1){
               speech("일번, "+text);
            }else if(i==2){
               speech("이번, "+text);
            }else if(i==3){
               speech("삼번, "+text);
            }else if(i==4){
               speech("사번, "+text);
            }else if(i==5){
               speech("오번, "+text);
            }
         }
         <%}else if(keyword != null && currentPage == 1){%>
         var keyword = document.getElementById('keyword').value;
         speech("검색하신"+keyword+" 에 대한 결과입니다.");
         $("#listNum").focus();
         var text = "";
         for(var i=1; i<=10; i++){
            text = document.getElementById(i+"info").value;
            if(i==1){
               speech("일번, "+text);
            }else if(i==2){
               speech("이번, "+text);
            }else if(i==3){
               speech("삼번, "+text);
            }else if(i==4){
               speech("사번, "+text);
            }else if(i==5){
               speech("오번, "+text);
            }
         }
         <%}%>
   }
   
   function focus_title(){   //이름창 포커스
      audio.pause();
      audio = new Audio("/sori/resources/mp3/noticeTitle.mp3");
      audio.play();
   }
   
   function focus_listnum(){
      var KeyV = document.getElementById('listNum').value;
      var nono = "";
      if(KeyV == 1){
         nono = document.getElementById('1noticeno').value;
         location.href  = "/sori/ndlist?noticeno="+nono+"&page="+<%=currentPage%>;
      }else if(KeyV == 2){
         nono = document.getElementById('2noticeno').value;
         location.href  = "/sori/ndlist?noticeno="+nono+"&page="+<%=currentPage%>;
      }else if(KeyV == 3){
         nono = document.getElementById('3noticeno').value;
         location.href  = "/sori/ndlist?noticeno="+nono+"&page="+<%=currentPage%>;
      }else if(KeyV == 4){
         nono = document.getElementById('4noticeno').value;
         location.href  = "/sori/ndlist?noticeno="+nono+"&page="+<%=currentPage%>;
      }else if(KeyV == 5){
         nono = document.getElementById('5noticeno').value;
         location.href  = "/sori/ndlist?noticeno="+nono+"&page="+<%=currentPage%>;
      }else{
         audio.pause();
         audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
         audio.play();
         $("#listNum").val('');
      }
   }
   
   




<%}%>

</script>

</head>
<body>

<!-- Content 시작! -->
   <section class="my-section">

   <!--공지사항 시작-->
   <div class="my-content">
      <a class="massive ui yellow label" style="font-size: 30px">공지사항</a>
      <span style="color:#fbbe09; font-weight:600">│</span>
      <span style="color:grey">소리지음 공지사항입니다</span>
      <br><br><br>
      <!-- <label><input type="checkbox" id="topchk">&nbsp; 공지숨기기</label> -->
      
   <!-- 공지사항 목록 시작 -->
      <table class="my-listTable" align="center">
   
         <tr>
         
            <th width="10%">No</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="15%">작성일</th>
            <th width="10%">조회수</th>
         </tr>
                
      <% if(list.size() != 0){ 
         for(int i=0; i < list.size(); i++){
         Notice n = list.get(i);
          %>
      
         <tr id="<%= i+1 %>tr">
         <input type="hidden" id="<%= i+1 %>info" value="<%= n.getNoticeTitle() %>">
         <input type="hidden" id="<%=i+1%>noticeno" value="<%=n.getNoticeNo() %>">
            <td><%= currentPage * 5 - 4 + i %></td><td class="noticeT" style="text-align:left;">
            <a href="/sori/ndlist?noticeno=<%= n.getNoticeNo() %>&page=<%=currentPage %>" id="<%=i+1%>noticeGo"><%= n.getNoticeTitle() %></a></td>
            <td><%= n.getNoticeWriter() %></td>
            <td><%= n.getNoticeDate() %></td>
            <td><%= n.getNoticeViews() %></td>
         </tr>
         <% }}else{%>
     <td colspan='5'>검색하신 내용이 없습니다.</td>
     <%} %>
      </table>
   <!--공지사항 목록 끝-->
      <br>
      <!--공지사항 글쓰기 버튼 관리자만 보인다.  -->
   <% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)){ %>
      <div class="ye-label" align="right">
         <a class="big ui basic black label" href="/sori/views/boardnotice/noticeWrite.jsp">글쓰기</a>
      </div>
      <% } %>
      
   <!-- 페이징 시작 -->
      
<%if(keyword ==null){ %>
<div id="pagebox1" align="center">
  <a href="/sori/nlist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
      <% if((beginPage - 10) < 1){ %>
         <a href="/sori/nlist?page=1"><i class="angle grey left icon"></i></a>
      <% }else{ %>
         <a href="/sori/nlist?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
      <% } %>&nbsp;
      <% for(int p = beginPage; p <= endPage; p++){ 
            if(p == currentPage){
      %>
         <a href="/sori/nlist?page=<%= p %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
      <% }else{ %>
         <a href="/sori/nlist?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
      <% }} %>&nbsp;
      <% if((endPage + 10) < maxPage){ %>
         <a href="/sori/nlist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
      <% }else{ %>
         <a href="/sori/nlist?page=<%= endPage %>"><i class="angle grey right icon"></i></a>
      <% } %>&nbsp;
      <a href="/sori/nlist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
      </div><!-- 도서 전체 목록 페이징 끝 -->
<% }else{ %>

<div id="pagebox1" align="center">
   <a href="/sori/nosearch?page=1&keyword=<%= keyword %>"><i class="angle grey double left icon"></i></a>&nbsp;
      <% if((beginPage - 10) < 1){ %>
         <a href="/sori/nosearch?page=1&keyword=<%= keyword %>"><i class="angle grey left icon"></i></a>
      <% }else{ %>
         <a href="/sori/nosearch?page=<%= beginPage - 10 %>&keyword=<%= keyword %>"><i class="angle grey left icon"></i></a>
      <% } %>&nbsp;
      <% for(int p = beginPage; p <= endPage; p++){ 
            if(p == currentPage){
      %>
         <a href="/sori/nosearch?page=<%= p %>&keyword=<%= keyword %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
      <% }else{ %>
         <a href="/sori/nosearch?page=<%= p %>&keyword=<%= keyword %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
      <% }} %>&nbsp;
      <% if((endPage + 10) < maxPage){ %>
         <a href="/sori/nosearch?page=<%= endPage + 10 %>&keyword=<%= keyword %>"><i class="angle grey right icon"></i></a>
      <% }else{ %>
         <a href="/sori/nosearch?page=<%= endPage %>&keyword=<%= keyword %>"><i class="angle grey right icon"></i></a>
      <% } %>&nbsp;
      <a href="/sori/nosearch?page=<%= maxPage %>&keyword=<%= keyword %>"><i class="angle grey double right icon"></i></a>&nbsp;
      </div>
   <% }%>
   <!-- 페이징 끝 -->
   
   <br><hr><br>
   <!-- 검색창 시작 -->
      <center>
      <div class="NoticeSearchBox">
<form action="/sori/nosearch" method="post">
<%if(keyword != null) {%>
<input type="search" name="keyword" id="keyword" placeholder="내용입력" onfocusin="focus_title()" value="<%=keyword%>"style="border-radius:5px; width:200px; height:40px;" >
<%}else{ %>
<input type="search" name="keyword" id="keyword" placeholder="내용입력" onfocusin="focus_title()" style="border-radius:5px; width:200px; height:40px;" >
<%} %>
<input type="submit" value="검색" style="border-radius:5px; width:100px; height:40px;">

</form>
</div>
      </center>
   <!-- 검색창 끝 -->
   
   </div>
   <!--공지사항 끝-->
   <%if(loginMember!=null && (loginMember.getTypeNumber() == 1 || loginMember.getTypeNumber() == 2)) {%>
   <input type="text" id="listNum" onKeyUp="focus_listnum()">
   <%} %>
   </section>
   <!-- Content 끝! -->
</body>
</html>