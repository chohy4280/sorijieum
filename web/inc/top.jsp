<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
 <!-- favicon 위치 -->
<link rel="shortcut icon" href="/sori/resources/images/favicon.ico">
<link rel="icon" href="/sori/resources/images/favicon.ico">
<!-- 시맨틱유아이 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
  <!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/sori/resources/css/bookmaking.css">
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<style>
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
			 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
			 font-weight: normal; 
			 font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}
			 
 ul{width:650px;height:20px;list-style:none;padding-left:150px;} /*position fixed는 스크롤이 내려가도 상단고정  */
ul li{float:left;/* margin-right:8px; *//* padding-left:30px; */}
ul li a{font-size:20px;color:black;font-weight:bold;text-decoration:none}
ul li a:hover{background:#ccc;color#fff;}

footer{
     position:fixed;
     left:0;
     bottom : 0;
     width: 100%;
     height: 50px;
     background-color: #fbbe09;
}



</style>
</head>

<div class="ui top fixed menu" style="height:100px;overflow:hidden;">
  <div class="item">
	<a href="/sori/index.jsp"><img src="/sori/resources/images/logo.png" width="100px" height="100px" align="left"></a>
  </div>
  <a class="item" href="/sori/views/sorijieumIntro.jsp">사이트 소개</a>
  <a class="item">도서 검색</a>
  <a class="item" href="/sori/views/bookmaking/bmmain.jsp">도서 제작</a>
  <a class="item" href="/sori/views/boardwishbook/wishbookListView.jsp">도서 신청</a>
  <a class="item" href="/sori/views/boardnotice/noticeListView.jsp">공지사항</a>
  <a class="item" href="/sori/views/boardfaq/faqListView.jsp">FAQ</a>
  <a class="item" href="/sori/views/boardqna/qnaListView.jsp">Q&A</a>
</div>
<br><br><br>
<body>

<footer style="text-align: center;">
		<p>
          &copy; Copyrights <strong>sorijieum</strong>.<br>
          All Rights Reserved Created with sorijieum</a>
        </p>
</footer>
</body>