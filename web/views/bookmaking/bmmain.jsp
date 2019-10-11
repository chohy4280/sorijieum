<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.model.vo.Book" %>
<%
	Book book = (Book)request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서제작</title>
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
				padding: 10px 5px 23px; margin: 0px 40px 10px 10px;">제작가이드라인
				안내</button>
		</div><!-- guide -->
		<div class="ye-book">
			<div class="ye-bookwait">
			<a style="font-weight: bold;">제작해야할 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/views/bookmaking/bookwaitinglist.jsp'"
				style="font-family:'S-Core Dream 6'">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
				<br><br>
			<div class="ye-bw">
			<a href="/sori/views/bookmaking/bookinfo.jsp"> 
			<img id="연금술사" src="/sori/resources/book_images/201909261556.jpg"></a>
			</div>
			<div class="ye-bw">
			<a href="/sori/views/bookmaking/bookinfo.jsp"> 
			<img id="보건교사 안은영" src="/sori/resources/book_images/201908191645.jpg"></a>
			</div>
			</div><!-- bookwait -->
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="ye-bookmaking">
			<a style="font-weight: bold;">제작중인 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/views/bookmaking/bookmakinglist.jsp'"
				style="font-family:'S-Core Dream 6'">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
			<br><br>
			<div class="ye-bm">
			<a href="/sori/views/bookmaking/bookinfo.jsp">
			<img id="여행의 이유" src="/sori/resources/book_images/201902041944.jpg"></a><br><br>
			<div class="progress" style="width:150px;height:20px;"> 
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:8pt; background: orange; width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="216">20%</div>
			</div>
				</div>
			<div class="ye-bm">
			<a href="/sori/views/bookmaking/bookinfo.jsp">
			<img id="쇼코의 미소" src="/sori/resources/book_images/201811241328.jpg"></a><br><br>
			<div class="progress" style="width:150px;height:20px;">
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:8pt; background: orange; width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="296">25%</div>
			</div>
				</div>
		</div><!-- bookmaking -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
	<!-- book count -->
<div class="ye-book-count" style="float:right;bottom:-160px;left: 500px;align:right;padding:50px;">
<div class="orange ui statistic" >
    <div class="value" style="font-family:'S-Core Dream 7'">
      2
    </div>
    <div class="label" style="font-family:'S-Core Dream 6'">
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