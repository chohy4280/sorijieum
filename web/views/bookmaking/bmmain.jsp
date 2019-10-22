<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress" %>
<%
	BookMakingProgress bmp = (BookMakingProgress)request.getAttribute("bmp");
	ArrayList<BookMakingProgress> makelist = (ArrayList<BookMakingProgress>)request.getAttribute("makelist");
	ArrayList<BookMakingProgress> waitlist = (ArrayList<BookMakingProgress>)request.getAttribute("waitlist");
	int dcount = ((Integer)request.getAttribute("dcount")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서제작</title>
<%@ include file="/../inc/top.jsp"%>
 <%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
$(function(){
	$(".ye-bw .label").hover( 
		function(){
		$(this).show();
	});
});

</script>
</head>
<body>
	<!-- content 시작 -->
	<br>
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
				padding: 10px 5px 23px; margin: 0px 40px 10px 10px;">제작가이드라인
				안내</button>
		</div><!-- guide -->
		<div class="ye-book">
			<div class="ye-bookwait">
			<a style="font-weight: bold;">제작해야할 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/bwlist'"
				style="font-family:'S-Core Dream 6'">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
				<br><br>
			<% for(int i = 0; i < 6; i++){ %>
			<div class="ye-bw">
			<% if(waitlist.get(i).getBookTitle().length() < 13){ %>
			<div class="ui large basic label" align="center" style="width: 170px;">
			<p style="text-align:center;font-size:10pt;">
			<%= waitlist.get(i).getBookTitle() %></p>
			</div><br>
			<% }else { %>
			<div class="ui large basic label" align="center" style="width: 170px;">
			<p style="text-align:center;font-size:10pt;">
			<%= waitlist.get(i).getBookTitle().substring(0, 12) %>..</p>
			</div><br>
			<% } %>
			<a href="/sori/bminfo?bookrimg=<%= waitlist.get(i).getBookRimg() %>">
			<img src="/sori/resources/book_upfiles/<%= waitlist.get(i).getBookRimg() %>"></a>
			</div>
			<% } %>
			</div><!-- bookwait -->
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="ye-bookmaking">
			<a style="font-weight: bold;">제작중인 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/bmlist'"
				style="font-family:'S-Core Dream 6'">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
			<br><br>
			<% for(int i = 0; i < 6; i++){ 
				int makep = (makelist.get(i).getMakepage());
				int bookp = (makelist.get(i).getBookPage());
				int pwidth = (int)(((double)makep / bookp) * 100);
			%>
			<div class="ye-bm">
			<% if(makelist.get(i).getBookTitle().length() < 13){ %>
			<div class="ui large basic label" align="center" style="width: 170px;">
			<p style="text-align:center;font-size:10pt;">
			<%= makelist.get(i).getBookTitle() %></p>
			</div><br>
			<% }else { %>
			<div class="ui large basic label" align="center" style="width: 170px;">
			<p style="text-align:center;font-size:10pt;">
			<%= makelist.get(i).getBookTitle().substring(0, 12) %>..</p>
			</div><br>
			<% } %>
			<a href="/sori/bminfo?bookrimg=<%= makelist.get(i).getBookRimg() %>">
			<img src="/sori/resources/book_upfiles/<%= makelist.get(i).getBookRimg() %>"></a>
			<br><br>
			<div class="progress" style="width:170px;height:25px;border-radius:7px 7px 7px 7px;"> 
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:0.8rem;font-align:center;background:orange;width:<%= pwidth %>%;"
  			aria-valuenow="<%= pwidth %>" 
  			aria-valuemin="0" aria-valuemax="<%= makelist.get(i).getBookPage() %>">
  			<%= pwidth %>%</div>
			</div>
			<br>
			</div>
			<% } %>
				
		</div><!-- bookmaking -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
	<!-- book count -->
<div class="ye-book-count" style="float:right;bottom:0px;left:500px;align:right;padding:50px;">
<div class="orange ui statistic" >
    <div class="value" style="font-family:'S-Core Dream 7'">
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
<br><br><br><br><br><br><br><br><br><br><br><br>
</html>