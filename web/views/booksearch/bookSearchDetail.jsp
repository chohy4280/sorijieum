<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList, book.model.vo.Book, member.model.vo.Member" %>
    <% Book book = (Book)request.getAttribute("book");%>
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
<img class = detailimg src="/sori/resources/book_images/<%=book.getBookRimg()%>"></div>

<div class="yu-bookdetailinfo" style="/* border: 1px solid red; */ float: left; width: 25%; height: 350px;">
<div class="yu-booktitle"style="/* border: 1px solid red; */ height: 60px;" ><%= book.getBookTitle() %></div>
<div class="yu-bookauthor"style="/* border: 1px solid red; */ height: 60px;" ><%= book.getAuthor() %></div>
<div class="yu-bookpublish" style="/* border: 1px solid red;  */height: 60px;" ><%= book.getPublisher() %></div>
<div class="yu-bookdate"style="/* border: 1px solid red; */ height: 60px;"><%= book.getPublishDate() %></div>

</div>
<div class="yu-bookdetailintro"style="/* border: 1px solid blue; */ float: left; width: 40%; height: 350px;">
<%= book.getBookInfo() %>
</div> 

 <button class="yu-likebutton">
 <i class="heart icon"></i>
 </button>
 
 <button onclick= "location='bookSearchPlay.jsp'" class="yu-palybutton">
 <i class="paly icon"></i>
 </button>
 </section>
</body>
</html>