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
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<%@ include file="/../inc/top.jsp"%>
 <%@ include file="/../inc/cdn.jsp"%>
  <!-- Link Swiper's CSS -->
 <link rel="stylesheet" href="/sori/resources/css/swiper.min.css">
 <style>
 <!-- Link Swiper's styles -->
 .swiper-container {
      width: 100%;
      height: 100%;
      margin-left: auto;
      margin-right: auto;
      overflow:hidden;
    }
 
.swiper-slide {
  /* Center slide text vertically */
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
  	transform-origin: center center;
  	overflow:hidden;
  
  }

.swiper-slide img {
	width:240px;
	height:350px;
	border:1px solid lightgrey;
	overflow:hidden;
	align:center;
} 
.swiper-button-prev {
  background-image: url("/sori/resources/bookmaking_images/leftarrow.png") !important;
  background-size:cover;
  margin:0;
  align:center;
}

.swiper-button-next {
  background-image: url("/sori/resources/bookmaking_images/rightarrow.png") !important;
  background-size:cover;
  margin:0;
  align:center;
}

.swiper-pagination-bullet {
   width: 10px;
   height: 10px;
   line-height: 15px;
   color:#000;
   opacity: 0.7;
   background: rgba(0,0,0,0.2);
   top: 3%;  
   margin-top:40px;
}
.swiper-pagination-bullet-active {
  color:#f5c53a;
  background: #f5c53a;
  top: 3%; 
  margin-top:40px; 
}

.swiper-pagination {
	margin-top:40px;
}
 </style>
<script type="text/javascript">
$(function(){

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
			<a style="font-weight: bold;margin-left: 15px;">제작해야할 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/bwlist'"
				style="font-family:'S-Core Dream 6';margin-top: 3px;">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
				<br>
			<!-- Swiper -->
			  <div class="swiper-container" style="width:1400px;height:470px;padding:10px;">
			  <div class="swiper-wrapper">
			    <% for(int i = 0; i < waitlist.size(); i++){ %>
			      <div class="swiper-slide">
			      <img src="/sori/resources/book_upfiles/<%= waitlist.get(i).getBookRimg() %>">
			      </div>
			      <% } %>
			      </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			  </div>
			  <!-- Swiper JS -->
			<script type="text/javascript" src="/sori/resources/js/swiper.min.js"></script>
			  <script type="text/javascript">
			  var swiper = new Swiper('.swiper-container', {
			      slidesPerView: 4,
			      spaceBetween: 30,
			      loop: true,
			      pagination: {
			        el: '.swiper-pagination',
			        clickable: true,
			        
			      },
			      navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			      },
			    });
			  </script>
			<%-- <% for(int i = 0; i < 3; i++){ %>
			<div class="ye-bw">
			<% if(waitlist.get(i).getBookTitle().length() < 16){ %>
			<div class="ui large basic label" align="center" style="width: 230px;">
			<p style="text-align:center;font-size:1rem;">
			<%= waitlist.get(i).getBookTitle() %></p>
			</div><br>
			<% }else { %>
			<div class="ui large basic label" align="center" style="width: 230px;">
			<p style="text-align:center;font-size:1rem;">
			<%= waitlist.get(i).getBookTitle().substring(0, 16) %>..</p>
			</div><br>
			<% } %>
			<div class="ye-scale"><a href="/sori/bminfo?bookrimg=<%= waitlist.get(i).getBookRimg() %>">
			<img src="/sori/resources/book_upfiles/<%= waitlist.get(i).getBookRimg() %>"></a></div>
			</div>
			<% } %> --%>
			</div><!-- bookwait -->
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="ye-bookmaking">
			<a style="font-weight: bold;margin-left: 15px;">제작중인 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/bmlist'"
				style="font-family:'S-Core Dream 6';margin-top: 3px;">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
			<br>
			<!-- Swiper -->
			  <div class="swiper-container" style="margin-left:0px;width:1400px;height:470px;padding:10px;">
			  <div class="swiper-wrapper">
			    <% for(int i = 0; i < makelist.size(); i++){ %>
			      <div class="swiper-slide" style="width:20px;">
			      <img src="/sori/resources/book_upfiles/<%= makelist.get(i).getBookRimg() %>">
			      </div>
			      <% } %>
			      </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			  </div>
			  <!-- Swiper JS -->
			<script type="text/javascript" src="/sori/resources/js/swiper.min.js"></script>
			  <script type="text/javascript">
			  var swiper = new Swiper('.swiper-container', {
			      slidesPerView: 4,
			      spaceBetween: 20,
			      loop: true,
			      pagination: {
			        el: '.swiper-pagination',
			        clickable: true,
			        
			      },
			      navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			      },
			    });
			  </script>
			<%-- <% for(int i = 0; i < 3; i++){ 
				int makep = (makelist.get(i).getMakepage());
				int bookp = (makelist.get(i).getBookPage());
				int pwidth = (int)(((double)makep / bookp) * 100);
			%>
			<div class="ye-bm">
			<% if(makelist.get(i).getBookTitle().length() < 16){ %>
			<div class="ui large basic label" align="center" style="width: 230px;">
			<p style="text-align:center;font-size:1rem;">
			<%= makelist.get(i).getBookTitle() %></p>
			</div><br>
			<% }else { %>
			<div class="ui large basic label" align="center" style="width: 230px;">
			<p style="text-align:center;font-size:1rem;">
			<%= makelist.get(i).getBookTitle().substring(0, 16) %>..</p>
			</div><br>
			<% } %>
			<div class="ye-scale"><a href="/sori/bminfo?bookrimg=<%= makelist.get(i).getBookRimg() %>">
			<img src="/sori/resources/book_upfiles/<%= makelist.get(i).getBookRimg() %>"></a></div>
			<br><br>
			<div class="progress" style="width:230px;height:25px;border-radius:7px 7px 7px 7px;"> 
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:0.9rem;font-align:center;background:orange;width:<%= pwidth %>%;"
  			aria-valuenow="<%= pwidth %>" 
  			aria-valuemin="0" aria-valuemax="<%= makelist.get(i).getBookPage() %>">
  			<%= pwidth %>%</div>
			</div>
			<br>
			</div>
			<% } %> --%>
				
		</div><!-- bookmaking -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
	<!-- book count -->
<div class="ye-book-count" style="float:right;bottom:60px;left:500px;align:right;padding:50px;">
<div class="orange ui statistic" >
    <div class="value" style="font-family:'S-Core Dream 7'">
      <%= dcount %>
    </div>
    <div class="label" style="font-family:'S-Core Dream 6';margin-top:10px;">
      	우리가 함께 제작한 책
    </div>
</div>
  <img src="/sori/resources/bookmaking_images/books.png" style="width: 25%;height: 25%;bottom: 10px;">
</div><!-- book count 끝 -->
<br><br><br><br><br><br>
	<!-- content 끝 -->
</body>
<br><br><br><br><br><br>
</html>