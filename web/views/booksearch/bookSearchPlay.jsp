<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.util.ArrayList, book.model.vo.Book,book.model.vo.BookPlay,
         mybook.model.vo.MyBook" %>
    <% BookPlay bp = (BookPlay)request.getAttribute("BookPlay");
       MyBook mb = (MyBook)request.getAttribute("MyBook");
       ArrayList<BookPlay> bplist = (ArrayList<BookPlay>)request.getAttribute("bplist");
       int readpage = ((Integer)request.getAttribute("readpage")).intValue();
       int bookmakepage = ((Integer)request.getAttribute("bookmakepage")).intValue();
       
       
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
<button class ="ui inverted orange button" onclick="">
<div class="yu-bookplay">
		    <i class="huge right chevron icon"></i>
	</div>	
	</button>
<div id ="readbook" style=" border: 1px solid blue; width: 500px; height: 00px;">

<% for(int i=0; i<1; i++){ %>

<textarea id="textbook" font-size= "20" rows="20" cols="100">
<%=bplist.get(i).getBookmakepage() %>페이지---------------------<%=bplist.get(i).getBookmaketxt()%>
</textarea>
<!-- </div> -->
<% } %>
</center>


</section>
</body>
</html>