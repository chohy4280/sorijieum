<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import = "java.util.ArrayList, book.model.vo.Book,book.model.vo.BookPlay" %>

 <% 
    ArrayList<BookPlay> bplist = (ArrayList<BookPlay>)request.getAttribute("bplist"); 
    BookPlay bp = (BookPlay)request.getAttribute("bp");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	String search = (String)request.getAttribute("search");
	String keyword = (String)request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색</title>
 <%@include file="/../inc/top.jsp"%>
 <script src="/sori/resources/js/sorijieum_tts.js"></script>
<script type ="text/javascript">

$(function(){
	
	/* $("#booktitle").focus(function(){
		var audio = new Audio("/sori/resources/mp3/booksearchtitle.mp3");
		audio.play();
	});
	
	$("#author").focus(function(){
		var audio = new Audio("/sori/resources/mp3/booksearchauthor.mp3");
		audio.play();
	}); */
	
});

var audio = new Audio("/sori/resources/mp3/booksearchmain.mp3");
window.onload = function(){
   audio.play();
} 
window.onkeyup = function(){
	if(event.keyCode == 27){ //음성멈춤
		audio.pause();
	    audio.currentTime = 0;
	}
	else if(event.keyCode == 49 || event.keyCode == 97){ //도서명 검색 
		audio.pause();
		$("#booktitle").focus();
		var audio = new Audio("/sori/resources/mp3/booksearchtitle.mp3");
		audio.play();
	}
	else if(event.keyCode == 50 || event.keyCode == 98){ //저자명 검색 
		audio.pause();
		$("#author").focus();
		var audio = new Audio("/sori/resources/mp3/booksearchauthor.mp3");
		audio.play();
	}
	else if(event.keyCode == 51 || event.keyCode == 99){ //신청글 삭제
		audio.pause();
		location.href="/sori/index.jsp";
	}
	else if(event.keyCode == 48 || event.keyCode == 96){ //다시듣기
		audio.play();
	}
}

</script>
<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">

</head>

<body>
<section class="my-section">

<center>

<div class="ListAll" align = "center">
<div>총 <%= listCount %>권</div></div> 

<h3 align= "center"><a href="/sori/blist">처음으로</a></h3>


<!-- 도서검색창 시작 -->
<div class="SearchBox" style="height: 50px;">
<form action="/sori/bsearch" method="post">
<select name="search"  style="border-radius:5px; width:100px; height:40px">
<option id="booktitle" value="booktitle">도서명</option>
<option id="author" value="author">저자명</option>
</select>
<input type="search" name="keyword"  placeholder="내용입력" style="border-radius:5px; width:200px; height:40px;" >
<input type="submit" value="검색" style="border-radius:5px; width:100px; height:40px;">

</form>
</div>
</center>
<!-- 도서 검색창 끝 -->


<!-- 신작 5개 불러오기 시작 -->
<table id="recentTop" border="1" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>조회수</th></tr>
</table>
<!-- 신작 5개 불러오기 끝 -->

<!-- 도서 전체 결과 리스트 -->
<%for(int i=0; i<bplist.size(); i++ ) {
if(i%5 == 0){ %> 
<br><br><br>
<% } %>
<div class= "yu-book" style= "width: 250px; height: 310px;float:left; margin-left:40px; margin-top: 10px; margin-bottom:100px;">
<% if(loginMember != null && loginMember.getTypeNumber() != 1 && loginMember.getTypeNumber() != 3){ %>
<div class= "yu-booktitle" style="width: 250px; height:40px; " onclick="location.href='/sori/bsdetail?bookcode=<%=bplist.get(i).getBookCode()%>&page=<%=currentPage%>&userId=<%=loginMember.getUserId() %>&rpage=<%=bplist.get(i).getReadpage() %>'"><%=bplist.get(i).getBookTitle()%></div>
<% }else{ %>
<div class= "yu-booktitle" style="width: 250px; height:40px; "><%=bplist.get(i).getBookTitle()%></div>
<% } %>
<div class = "yu-bookimg" style="width: 250px; height:270px;"><img class= "yu-bookimg1"style= "width:250px;
	height: 270px;"src="/sori/resources/book_upfiles/<%= bplist.get(i).getBookRimg()%>"></div>
</div>
<% } %>
<!-- 도서 전체 결과 리스트 끝 -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<!--도서 페이징 처리 시작 -->

<div id="pagebox" align="center">
<%if(keyword ==null){ %>
   <a href="/sori/blist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
<% if((beginPage - 10) < 1){ %>
   <a href="/sori/blist?page=1"><i class="angle grey left icon"></i></a>
<% }else{ %>
   <a href="/sori/blist?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
<% } %>&nbsp;
<% for(int p = beginPage; p <= endPage; p++){ 
      if(p == currentPage){
%>
   <a href="/sori/blist?page=<%= p %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
<% }else{ %>
   <a href="/sori/blist?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
<% }} %>&nbsp;
<% if((endPage +  10) > maxPage){ %>
   <a href="/sori/blist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
<% }else{ %>
   <a href="/sori/blist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/blist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
</div><!-- 도서 전체 목록 페이징 끝 -->
<% }else{ %>

<div id="pagebox" align="center">
   <a href="/sori/bsearch?page=1&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&nbsp;
<% if((beginPage - 10) < 1){ %>
   <a href="/sori/bsearch?page=1&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
<% }else{ %>
   <a href="/sori/bsearch?page=<%= beginPage - 10 %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
<% } %>&nbsp;
<% for(int p = beginPage; p <= endPage; p++){ 
      if(p == currentPage){
%>
   <a href="/sori/bsearch?page=<%= p %>&search=<%=search%>&keyword=<%=keyword%>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
<% }else{ %>
   <a href="/sori/bsearch?page=<%= p %>&search=<%=search%>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&nbsp;
<% }} %>&nbsp;
<% if((endPage +  10) > maxPage){ %>
   <a href="/sori/bsearch?page=<%= endPage + 10 %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
<% }else{ %>
   <a href="/sori/bsearch?page=<%= maxPage %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/bsearch?page=<%= maxPage %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&nbsp;
<% } %>
</div>
 </section>
</body>
</html>