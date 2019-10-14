<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress" %>
<%
	BookMakingProgress bmp = (BookMakingProgress)request.getAttribute("bmp");
	ArrayList<BookMakingProgress> makelist = (ArrayList<BookMakingProgress>)request.getAttribute("makelist");
	ArrayList<BookMakingProgress> waitlist = (ArrayList<BookMakingProgress>)request.getAttribute("waitlist");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
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
		<div class="ye-book">
			<div class="ye-bookmaking">
			<a style="font-weight: bold;">제작중인 도서</a><br><br>
			<% for(int i = 0; i < makelist.size(); i++){ %>
			<div class="ye-bm">
			<a href="/sori/views/bookmaking/bookinfo.jsp">
			<img id="여행의 이유" src="/sori/resources/book_images/<%= makelist.get(i).getBookRimg() %>"></a><br><br>
			<div class="progress" style="width:170px;height:25px;"> 
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:8pt; background: orange; width: 20%;" 
  			aria-valuenow="20" aria-valuemin="0" aria-valuemax="216">20%</div>
			</div>
				</div>
				<% } %>
				
		</div><!-- bookmaking -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
	<!-- book count -->
<div class="ye-book-count" style="float:right;bottom:-160px;left: 500px;align:right;padding:50px;">
<div class="orange ui statistic" >
    <div class="value" style="font-family:'S-Core Dream 7'">
      <%= makelist.size() %>
    </div>
    <div class="label" style="font-family:'S-Core Dream 6'">
      	우리가 함께 제작한 책
    </div>
</div>
  <img src="/sori/views/bookmaking/images/books.png" style="width: 25%;height: 25%;bottom: 10px;">
</div><!-- book count 끝 -->
<br><br><br><br><br><br><br><br><br><br>
	<!-- content 끝 -->
</body>
</html>