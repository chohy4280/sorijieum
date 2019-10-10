<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제작해야할 도서</title>
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
			<div class="ye-bookwait">
			<a style="font-weight: bold;">제작중인 도서</a><br><br>
			<div class="ye-bw">
			<a href="/sori/views/bookmaking/bookinfo.jsp"> 
			<img id="연금술사" src="/sori/resources/book_images/201909261556.jpg"></a>
			</div>
			<div class="ye-bw">
			<a href="/sori/views/bookmaking/bookinfo.jsp"> 
			<img id="보건교사 안은영" src="/sori/resources/book_images/201908191645.jpg"></a>
			</div>
				</div>
				
		</div><!-- bookwait -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
	<!-- book count -->
<div class="ye-book-count" style="float:right;bottom:-200px;left: 500px;align:right;padding:50px;">
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
<br><br><br><br><br><br><br><br><br><br>
	<!-- content 끝 -->
</body>
</html>