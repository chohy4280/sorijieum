<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <style>
ul{width:650px;height:20px;list-style:none;position:absolute;} /*position fixed는 스크롤이 내려가도 상단고정  */
ul li{float:left;margin-right:2px;padding-left:50px;}
ul li a{font-size:16px;color:black;font-weight:bold;text-decoration:none}
ul li a:hover{background:#ccc;color#fff;}

footer{
    
     position:fixed;
     left:0;
     bottom : 0;
     width: 100%;
     height: 80px;
     background-color:#ECB93E;
}
</style>
</head>

<div style="float:left;position:absolute;"><a href="/sori/index.jsp"><img src="/sori/resources/images/logo.png" width="100px" height="100px"></a></div>
<div style="width:100;">
<ul>
<li><a href="#">사이트 소개</a></li>
<li><a href="/sori/views/book/booklist.jsp">도서검색</a></li>
<li><a href="/sori/views/bookmaking/bmmain.jsp">도서제작</a></li>
<li><a href="#">도서신청</a></li>
<li><a href="#">게시판</a></li>
</ul>
</div>
<footer>
THis is a footer
</footer>
