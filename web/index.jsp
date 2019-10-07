<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="/sori/resources/images/favicon.ico">
<link rel="icon" href="/sori/resources/images/favicon.ico">
<meta charset="UTF-8">
<title>소리지음 메인페이지</title>
<style>
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
			 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
			 font-weight: normal; 
			 font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}
</style>
  <!-- 시맨틱유아이 cdn -->

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/main.css">
<style type="text/css">
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
			 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
			 font-weight: normal; 
			 font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}

.wrapper {
	z-index:1;
	position:relative;
	width:100%;
	height:100%;
	}
	.wrapper:after{
	width:100%;
	height:100%;
	z-index:-1;
	position:absolute;
	top:0;
	left:0;
	content:"";
	background-image: url('/sori/resources/images/mainbook.jpg') ;
	background-repeat:no-repeat;
	background-position:center;
	background-origin:content-box;
	background-size: 100%;
	 
	opacity: 0.5;
	}

.ui.button {
	font-family: 'S-CoreDream-7ExtraBold'
}

</style>
</head>
<body>
<div class="wrapper">
<header>
<br>
<div align="right">
   <button class="ui brown button" onclick="location.href='/sori/views/member/memberLoginView.jsp'">로그인</button>
   <button class="ui brown button" onclick="location.href='/sori/views/member/memberEnrollAgree.jsp'">회원가입</button> &nbsp;
</div>
</header>

<div align="center">
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;font-family: 'S-Core Dream 6';">홈</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;font-family: 'S-Core Dream 6';">사이트소개</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;font-family: 'S-Core Dream 6';">도서검색</button><br>
<button class="ui yellow button" onclick="location.href='/sori/views/bookmaking/bmmain.jsp'" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;font-family: 'S-Core Dream 6';">도서제작</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;font-family: 'S-Core Dream 6';">도서신청</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;font-family: 'S-Core Dream 6';">게시판</button>


<div class="ui four doubling cards" style="margin:5% 5% 0 5%">
  <div class="card">
    <div class="image">
      <img src="/sori/resources/images/logo.png">
    </div>
  </div>
  <div class="card">
    <div>
      	사이트소개
    </div>
  </div>
  <div class="card">
    <div>
      도서검색
    </div>
  </div>
  <div class="card">
    <div>
      도서제작
    </div>
  </div>  
</div>
<div class="ui four doubling cards" style="margin:0 5% 0 5%">
  <div class="card">
    <div>
     도서신청
    </div>
  </div>
  <div class="card">
    <div>
      	공지사항
    </div>
  </div>
  <div class="card">
    <div>
      Q & A
    </div>
  </div>
  <div class="card">
    <div>
      도서제작
    </div>
  </div>  
</div>

</div>

</body>
</html>