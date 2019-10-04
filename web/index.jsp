<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sorijieum</title>

  <!-- 시맨틱유아이 cdn -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
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



