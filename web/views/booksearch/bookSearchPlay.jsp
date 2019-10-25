<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.util.ArrayList, book.model.vo.Book, member.model.vo.Member, bookmaking.model.vo.BookMaking" %>
    <% Book book = (Book)request.getAttribute("book");
    BookMaking bm =(BookMaking)request.getAttribute("bookmaking");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 재생 </title>
<%@include file="/../inc/top.jsp"%>
<!-- CUSTOM CSS -->
	<link rel="stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">
</head>
<body>
<section class="my-section">
<center>

<textarea row= "60" cols="100">
<%= bm.getBookrtxt() %>
</textarea>




<button onclick ="location='bookSearchDetail.jsp'" class="ui left labeled icon button">
  <i class="left arrow icon"></i>
  이전
</button>
</center>

</section>
</body>
</html>