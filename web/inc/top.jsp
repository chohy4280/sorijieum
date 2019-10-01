<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
  
<style>
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
			 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
			 font-weight: normal; 
			 font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}
			 
 ul{width:650px;height:20px;list-style:none;position:fixed;padding-left:150px;} /*position fixed는 스크롤이 내려가도 상단고정  */
ul li{float:left;/* margin-right:8px; *//* padding-left:30px; */}
ul li a{font-size:16px;color:black;font-weight:bold;text-decoration:none}
ul li a:hover{background:#ccc;color#fff;}

footer{
     position: fixed;
     left:0;
     bottom : 0;
     width: 100%;
     height: 50px;
     background-color: #ECB93E;
}

div a {font-size:100pt;}
</style>
</head>

<div class="ui top fixed menu" style="height:100px">
  <div class="item">
	<a href="/sorip/index.jsp"><img src="/sori/resources/images/logo.png" width="100px" height="100px" align="left"></a>
  </div>
  <a class="item">사이트 소개</a>
  <a class="item">도서 검색</a>
  <a class="item">도서 제작</a>
  <a class="item">도서 신청</a>
  <a class="item">게시판</a>
</div>

<footer>
THis is a footer
</footer>
