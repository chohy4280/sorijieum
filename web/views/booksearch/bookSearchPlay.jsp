<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.util.ArrayList, book.model.vo.Book,book.model.vo.BookPlay " %>
    <% Book book = (Book)request.getAttribute("book");
       ArrayList<BookPlay> bplist = (ArrayList<BookPlay>)request.getAttribute("bplist");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 재생 </title>
<%@include file="/../inc/top.jsp"%>
<!-- CUSTOM CSS -->
	<link rel="stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">
	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<section class="my-section">
<center>

<div id ="readbook" border="1px" cellspacing="0">
<%for(int i=0; i<bplist.size(); i++ ) {
 if(i%1 == 0) {%> 


<textarea>
<%=bplist.get(i).getBookmaketxt()%>
</textarea>
</div>
<% }} %>



<button onclick ="location='bookSearchDetail.jsp'" class="ui left labeled icon button">
  <i class="left arrow icon"></i>
  이전
</button>
</center>

</section>
</body>
</html>