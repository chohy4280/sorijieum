<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색</title>
<%@include file="/../inc/top.jsp"%>
<%@include file="/../inc/sementic.jsp" %>
<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">

</head>

<body>
<section class="my-section">

<div class="ui right action left icon input">
  <i class="search icon"></i>
  <input type="text" placeholder="Search">
  <div class="ui basic floating dropdown button">
    <div class="text">This Page</div>
    <i class="dropdown icon"></i>
    <div class="menu">
      <div class="item">This Organization</div>
      <div class="item">Entire Site</div>
    </div>
  </div>
</div>
<table class= "yu-top5"align = "center" width="500" height= "30" border= "3">
<tr>
<td><a href="/sori/views/booksearch/bookSearchDetail.jsp">해리포터</td></a> 
<td><a href="/sori/views/booksearch/bookSearchDetail.jsp">해리포터</td></a> 
<td><a href="/sori/views/booksearch/bookSearchDetail.jsp">해리포터</td></a> 
<td><a href="/sori/views/booksearch/bookSearchDetail.jsp">해리포터</td></a> 
<td><a href="/sori/views/booksearch/bookSearchDetail.jsp">해리포터</td></a> 
</tr>
</table>
<!--  책 리스트 10개 불러와서 테이블에 담기 -->
<table class= "yu-booklist" align = "center" width="700" height= "400"  cellspacing="0" border="3" cellpading="0">


<tr>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
</tr>

<tr>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
    <td><a href="/sori/views/booksearch/bookSearchDetail.jsp"><img src="/sori/resources/images/harry2.jpg"></a><br>&nbsp;해리포터</td>
</tr>
</table>
<center>
			<div class="yu-ui buttons">
		  <button class="ui labeled icon button">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui right labeled icon button">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center>

 </section>
</body>
</html>