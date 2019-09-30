<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <style>
 ul{width:650px;height:20px;list-style:none;position:fixed;padding-left:150px;} /*position fixed는 스크롤이 내려가도 상단고정  */
ul li{float:left;/* margin-right:8px; *//* padding-left:30px; */}
ul li a{font-size:16px;color:black;font-weight:bold;text-decoration:none}
ul li a:hover{background:#ccc;color#fff;}
.topmenu{ float:left;
		  width:100px;
		  height:50px;
		  border:3px solid yellow;
		  text-align:center;}

footer{
    
     position: fixed;
     left:0;
     bottom : 0;
     width: 100%;
     height: 80px;
     background-color:#ECB93E;
}
</style>
</head>

<div style="float:left;width:700px;"><a href="/sorip/index.jsp"><img src="/sori/resources/images/logo.png" width="100px" height="100px"></a></div>

<ul>
<li><a href="#"><div class="topmenu">사이트 소개</div></a></li>
<li><a href="/sorip/views/book/booklist.jsp"><div class="topmenu">도서검색</div></a></li>
<li><a href="#"><div class="topmenu">도서제작</div></a></li>
<li><a href="#"><div class="topmenu">도서신청</div></a></li>
<li><a href="#"><div class="topmenu">게시판</div></a></li>
</ul>
</div>

<footer>
THis is a footer
</footer>
