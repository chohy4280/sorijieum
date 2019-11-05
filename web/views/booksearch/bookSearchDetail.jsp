<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList, book.model.vo.Book,bookmaking.model.vo.BookMaking" %>
    <% Book book = (Book)request.getAttribute("book");
    BookMaking bm =(BookMaking)request.getAttribute("bookmaking");
   
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

<div class="yu-bookdetailimg"style="float: left; width: 25%; height: 350px;">

<img class = detailimg src="/sori/resources/book_upfiles/<%=book.getBookRimg()%>"></div>

<div class="yu-bookdetailinfo" style=" float: left; width: 25%; height: 350px;">
<div class="yu-booktitle"style=" height: 60px;" ><%= book.getBookTitle() %></div>
<div class="yu-bookauthor"style="height: 60px;" ><%= book.getAuthor() %></div>
<div class="yu-bookpublish" style="height: 60px;" ><%= book.getPublisher() %></div>
<div class="yu-bookdate"style="height: 60px;"><%= book.getPublishDate() %></div>

</div>
<div class="yu-bookdetailintro"style="/* border: 1px solid blue; */ float: left; width: 40%; height: 350px;">
<%= book.getBookInfo() %>
</div> 
<center>
<!-- 관심도서 추가 -->
<button class ="ui inverted white button" onclick="location.href='/sori/bslike?bookcode=<%= book.getBookCode()%>&userId=<%= loginMember.getUserId() %>'">
<div class="yu-like">
 <i class="huge orange heart icon" ></i>
</div>
</button>
 </center>
 
 <!-- 재생버튼 -->
 <button class="ui inverted orange button" style=" height: 60px;" id ="yu-playbutton" onclick="location.href='/sori/bplay?bookcode=<%= book.getBookCode() %>'" >
 
 <i class="play icon"></i>
 </button>
  
  <!-- 목록버튼 -->
  <center>
  <button class="ui inverted orange button" onclick="location.href='/sori/blist'">
		    목록
		  </button>
		  </center>
 </section>
</body>
</html>