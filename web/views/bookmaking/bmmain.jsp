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
.swiper-slide {
  /* Center slide text vertically */
    text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
	overflow: hidden;
  	transform-origin: center center;
  }
  
.swiper-inner {
	position: absolute;
	left:0;
	right:0;
	width: 100%;
  	height: 100%;
}  
  
.swiper-inner img {
	width:320px;
	height:450px;
	border:1px solid lightgrey;
	overflow:hidden;
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
				<br><br><br><br>
			<!-- Swiper -->
			  <div class="swiper-container" style="margin:30px;">
			    <div class="swiper-wrapper">
			    <% for(int i = 0; i < 5; i++){ %>
			      <div class="swiper-slide">
			      <div class="slide-inner" >
			      <img src="/sori/resources/book_upfiles/<%= waitlist.get(i).getBookRimg() %>">
			      </div>
			      </div>
			    <% } %>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next swiper-button-gray"></div>
			    <div class="swiper-button-prev swiper-button-gray"></div>
			  </div>
			  <!-- Swiper JS -->
			<script type="text/javascript" src="/sori/resources/js/swiper.min.js"></script>
			  <script type="text/javascript">
				 var interleaveOffset = 0.5;
				 var swiperOptions = {
				   loop: true,
				   spaceBetween: 30,
				   speed:1100,
				 	pagination: {
				     el: '.swiper-pagination',
				     clickable: true,
					},
				   watchSlidesProgress: true,
				   mousewheelControl: true,
				   keyboardControl: true,
				   navigation: {
				     nextEl: ".swiper-button-next",
				     prevEl: ".swiper-button-prev"
				   },
				   on: {
				     progress: function() {
				       var swiper = this;
				       for (var i = 0; i < swiper.slides.length; i++) {
				         var slideProgress = swiper.slides[i].progress;
				         var innerOffset = swiper.width * interleaveOffset;
				         var innerTranslate = slideProgress * innerOffset;
				         swiper.slides[i].querySelector(".slide-inner").style.transform =
				           "translate3d(" + innerTranslate + "px, 0, 0)";
				       }      
				     },
				     touchStart: function() {
				       var swiper = this;
				       for (var i = 0; i < swiper.slides.length; i++) {
				         swiper.slides[i].style.transition = "";
				       }
				     },
				     setTransition: function(speed) {
				       var swiper = this;
				       for (var i = 0; i < swiper.slides.length; i++) {
				         swiper.slides[i].style.transition = speed + "ms";
				         swiper.slides[i].querySelector(".slide-inner").style.transition =
				           speed + "ms";
				       }
				     }
				   }
				 };

				 var swiper = new Swiper(".swiper-container", swiperOptions);
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
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<div class="ye-bookmaking">
			<a style="font-weight: bold;margin-left: 15px;">제작중인 도서</a>&nbsp;&nbsp;
			<button class="mini ui icon button" id="mbutton" 
				onclick="location.href='/sori/bmlist'"
				style="font-family:'S-Core Dream 6';margin-top: 3px;">
  				더보기 <i class="angle right icon" style="width:10%;height:10%"></i>
				</button>
			<br><br>
			<% for(int i = 0; i < 3; i++){ 
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
  <img src="/sori/resources/bookmaking_images/books.png" style="width: 25%;height: 25%;bottom: 10px;">
</div><!-- book count 끝 -->
<br><br><br><br><br><br>
	<!-- content 끝 -->
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
</html>