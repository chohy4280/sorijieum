<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import = "java.util.ArrayList, book.model.vo.Book, member.model.vo.Member" %>
 <%@include file="/../inc/top.jsp"%>
<%@include file="/../inc/sementic.jsp" %>
 <%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색</title>

<script type="text/javascript" scr = "resources/js/jqeury-3.4.1.min.js"></script>
<script type ="text/javascript">
$('.ui.dropdown').dropdown({direction:'auto'});

</script>
<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">

</head>

<body>
<section class="my-section">
<!-- 검색창 시작 -->
<center>
<div class="SearchBox" style="height: 50px; border: 2px solid red;">
<form action="/sori/bsearch" method="post">
<select class="search" name="search" id="search" style="border-radius:5px; width:100px; height:40px">
<option value="booktitle">도서명</option>
<option value="author">저자명</option>
</select>
<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius:5px; width:200px; height:40px;" >
<input type="submit" value="검색" style="border-radius:5px; width:100px; height:40px;">

</form>
</div>
</center>
<!-- 검색창 끝 -->


<!-- 신작 5개 불러오기  -->

<div class="yu-recent5" style="border: 2px solid red;width: 200px; height: 50px; margin-top:10px;">
<span class="yu-recent55" style="border:2px solid blue; width:150px; height:50px;">해리포터</span>
</div>
<!-- 도서 검색 결과 리스트 -->
<%-- <center>
<div class="ListAll" align = "center">
<div>총 <%= list.size() %>권</div>
</div>
</center> --%>

<%for(Book b : list) {%>
<div class= "yu-book" style= "border: 2px solid blue; width: 250px; height: 300px; float:left; margin-left:40px; margin-top: 50px;">
<div class= "yu-booktitle" style="border: 2px solid red; width: 250px; height:40px;"onclick="location.href='/sori/bsdetail?booktitle=<%=b.getBookTitle()%>'"><%=b.getBookTitle()%></div>
<div class = "yu-bookimg" style="border: 2px solid yellow; width: 250px; height:260px;"><img class= "yu-bookimg1" src="/sori/resources/book_upfiles/<%= b.getBookRimg()%>"></div>
</div>
<% } %>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- 페이징 -->
<div id="pagebox" align="center">
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
<% if((endPage +  10) < maxPage){ %>
   <a href="/sori/blist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
<% }else{ %>
   <a href="/sori/blist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/blist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
</div><!-- 페이징 -->


 </section>
</body>
</html>