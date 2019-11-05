<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList, book.model.vo.Book,
                       likebook.model.vo.LikeBook, book.model.vo.BookPlay" %>
    <% BookPlay bp = (BookPlay)request.getAttribute("BookPlay");
    /* int currentPage = ((Integer)request.getAttribute("currentPage")).intValue(); */
    int readpage = ((Integer)request.getAttribute("readpage")).intValue();
    int bookmakepage = ((Integer)request.getAttribute("bookmakepage")).intValue();
    
   
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>
<%@include file="/../inc/top.jsp"%>

<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">

</head>
<body>
<section class="my-section">
<!-- 도서 상세보기 시작-->
<div class="yu-bookdetailimg"style="float: left; width: 25%; height: 350px;">

<img class = detailimg src="/sori/resources/book_upfiles/<%=bp.getBookRimg()%>"></div>

<div class="yu-bookdetailinfo" style=" float: left; width: 25%; height: 350px;">
<div class="yu-booktitle"style=" height: 60px;" ><%= bp.getBookTitle() %></div>
<div class="yu-bookauthor"style="height: 60px;" ><%= bp.getAuthor() %></div>
<div class="yu-bookpublish" style="height: 60px;" ><%= bp.getPublisher() %></div>
<div class="yu-bookdate"style="height: 60px;"><%= bp.getPublishDate() %></div>

</div>
<div class="yu-bookdetailintro"style="/* border: 1px solid blue; */ float: left; width: 40%; height: 350px;">
<%= bp.getBookInfo() %>
</div> 
<!-- 도서 상세보기 끝-->
<center>

<!-- 관심도서 추가 및 취소 버튼 시작-->

<button class ="ui inverted white button" onclick="location.href='/sori/bslike?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>'">
<div class="yu-like">
 <i class="huge orange heart icon" ></i>
</div>
</button>
<button class ="ui inverted white button" onclick="location.href='/sori/like.del?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>'">
<div class="yu-like">
 <i class="huge orange heart icon" ></i>
</div>
</button>
 </center>
 <!-- 관심도서 추가 및 취소 버튼 끝-->
 
 <!-- 도서재생버튼 -->
 <!-- 도서재생 화면으로 이동하기 -->
 <%  %>
 <button class="ui inverted orange button" style=" height: 60px;" id ="yu-playbutton" 
 onclick="location.href='/sori/bplaypage?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>&rpage=<%= readpage %>&fpage=<%= bookmakepage %>&tpage=<%= bp.getBookPage() %>'">
 
 <i class="play icon"></i>
 </button>
   <!-- 도서재생버튼 끝-->
   
  <!-- 목록버튼 -->
  <center>
  <button class="ui inverted orange button" onclick="location.href='/sori/blist'">
		    목록
		  </button>
		  </center>
 <!-- 목록버튼 끝-->
 </section>
</body>
</html>