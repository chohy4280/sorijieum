<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList, book.model.vo.Book, member.model.vo.Member, bookmaking.model.vo.BookMaking" %>
    <% Book book = (Book)request.getAttribute("book");
    BookMaking bookmaking =(BookMaking)request.getAttribute("bookmaking");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>
<%@include file="/../inc/top.jsp"%>
<%@include file="/../inc/sementic.jsp" %>
<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">

</head>
<body>
<section class="my-section">

<div class="yu-bookdetailimg"style="/* border: 1px solid gold; */float: left; width: 25%; height: 350px;">
<img class = detailimg src="/sori/resources/book_upfiles/<%=book.getBookRimg()%>"></div>

<div class="yu-bookdetailinfo" style="/* border: 1px solid red; */ float: left; width: 25%; height: 350px;">
<div class="yu-booktitle"style="/* border: 1px solid red; */ height: 60px;" ><%= book.getBookTitle() %></div>
<div class="yu-bookauthor"style="/* border: 1px solid red; */ height: 60px;" ><%= book.getAuthor() %></div>
<div class="yu-bookpublish" style="/* border: 1px solid red;  */height: 60px;" ><%= book.getPublisher() %></div>
<div class="yu-bookdate"style="/* border: 1px solid red; */ height: 60px;"><%= book.getPublishDate() %></div>

</div>
<div class="yu-bookdetailintro"style="/* border: 1px solid blue; */ float: left; width: 40%; height: 350px;">
<%= book.getBookInfo() %>
</div> 
<center>
<div class="yu-like">
 <i class="huge red heart icon" ></i>
</div>
 </center>
 <button class="ui icon button" id ="yu-playbutton" onclick="location.href='/sori/bpage'" class="yu-playbutton">
 
 <i class="play icon" ></i>
 </button>
 </section>
</body>
</html>