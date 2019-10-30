<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress" %>
<%
	ArrayList<BookMakingProgress> list = (ArrayList<BookMakingProgress>)request.getAttribute("list");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int dcount = ((Integer)request.getAttribute("dcount")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제작중인 도서</title>
<%@ include file="/../inc/top.jsp"%>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">

</script>
</head>
<body>
<br>
<!-- content 시작 -->
	<div class="ye-bookstatus">
		<div class="ye-bookstatus-title">
			<h2 style="font-family: 'S-Core Dream 6';">
				<i class="yellow book icon"></i> 제작현황
			</h2>
		</div><!-- bookstatus_title -->
		<div class="ye-guide" align="right">
			<i class="yellow big info circle icon" style="margin-left: 10px;"></i>
			<button class="ui yellow button"
				onclick="location.href='/sori/views/bookmaking/guide.jsp'"
				style="width: 150px; height: 10px; font-size: 10pt; 
				text-align: center; font-family: 'S-Core Dream 5'; 
				padding: 10px 5px 23px; margin:0px 40px 0px 10px;">제작가이드라인 안내</button>
		</div><!-- guide -->
		<div class="ye-book2">
			<div class="ye-bookmaking2">
			<a style="font-weight: bold;margin-left:5px;">제작중인 도서</a><br><br>
			<% for(int i = 0; i < list.size(); i++){ 
				int makep = (list.get(i).getMakepage());
				int bookp = (list.get(i).getBookPage());
				int pwidth = (int)(((double)makep / bookp) * 100);
			%>
			<%-- <script type="text/javascript">
				var count = document.getElementsByClassName("ye-bm2").length;
			</script>
			<% 
				int count = <%= count %>;
				if(count <= 9){ 
			%> --%>
			<div class="ye-bm2">
			<% if(list.get(i).getBookTitle().length() < 17){ %>
			<div class="ui large basic label" align="center" style="width: 230px;"
			onclick="location.href='/sori/bminfo?bookrimg=<%= list.get(i).getBookRimg() %>'">
			<p style="text-align:center;font-size:1rem;"><%= list.get(i).getBookTitle() %></p>
			</div><br>
			<% }else { %>
			<div class="ui large basic label" align="center" style="width: 230px;"
			onclick="location.href='/sori/bminfo?bookrimg=<%= list.get(i).getBookRimg() %>'">
			<p style="text-align:center;font-size:1rem;"><%= list.get(i).getBookTitle().substring(0, 17) %>..</p>
			</div><br>
			<% } %>
			<a href="/sori/bminfo?bookrimg=<%= list.get(i).getBookRimg() %>">
			<img id="여행의 이유" src="/sori/resources/book_upfiles/<%= list.get(i).getBookRimg() %>"></a><br><br>
			<div class="progress" style="width:230px;height:27px;border-radius:7px 7px 7px 7px;"> 
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:0.9rem; background: orange; width:<%= pwidth %>%;" 
  			aria-valuenow="<%= pwidth %>" aria-valuemin="0" aria-valuemax="<%= list.get(i).getBookPage() %>"><%= pwidth %>%</div>
			</div>
			<br>
			</div>
			<% } %>
			
		</div><!-- bookmaking -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- 페이징 -->
<div id="pagebox" align="center">
	<a href="/sori/bmlist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
<% if((beginPage - 10) < 1){ %>
	<a href="/sori/bmlist?page=1"><i class="angle grey left icon"></i></a>
<% }else{ %>
	<a href="/sori/bmlist?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
<% } %>&nbsp;
<% for(int p = beginPage; p <= endPage; p++){ 
	if(p == currentPage){
%>
	<a href="/sori/bmlist?page=<%= p %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
<% }else{ %>
	<a href="/sori/bmlist?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
<% }} %>&nbsp;
<% if((endPage + 10) < maxPage){ %>
	<a href="/sori/bmlist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
<% }else{ %>
	<a href="/sori/bmlist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/bmlist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
</div><!-- 페이징 -->

<!-- book count -->
<div class="ye-book-count" style="float:right;bottom:50px;left:500px;align:right;padding:50px;">
<div class="orange ui statistic" >
    <div class="value" style="font-family:'S-Core Dream 7';">
      <%= dcount %>
    </div>
    <div class="label" style="font-family:'S-Core Dream 6';margin-top:10px;">
      	우리가 함께 제작한 책
    </div>
</div>
  <img src="/sori/views/bookmaking/images/books.png" style="width: 25%;height: 25%;bottom: 10px;">
</div><!-- book count 끝 -->
<br><br><br><br><br><br>
	<!-- content 끝 -->
</body>
</html>