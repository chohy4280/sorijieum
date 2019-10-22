<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>    
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
	background-size: cover; 
	background-attachment: scroll;
	opacity: 1;
	}

.ui.cards {
	font-family: 'S-CoreDream-7ExtraBold';
}

.ui.cards .card:hover{
	background: #fbc21b; 
	background-opacity:0.4;
}
</style>
</head>
<body>
<div class="wrapper">
<header>
<br>
<% if(loginMember == null){ %>
<div align="right" style="margin-top:10px;">
   <button class="ui yellow button" onclick="location.href='/sori/views/member/memberLoginView.jsp'" style="font-family:'S-Core Dream 6';">로그인</button>
   <button class="ui yellow button" onclick="location.href='/sori/views/member/memberEnrollAgree.jsp'" style="font-family:'S-Core Dream 6';">회원가입</button> &nbsp;
</div>
<% }else { %>
<div align="right">
<h2 class="ui header">
	<img src="/sori/resources/images/error.png" class="ui circular image">
	<a href="/sori/views/member/memberMyPage.jsp" style="color:white;"><%= loginMember.getUserName() %>님</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
	<a href="/sori/memberLogout" style="font-size:10pt;color:white;text-decoration:underline;">로그아웃</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</h2>
</div>
<% } %>
</header>
<br>
<div class="ui four cards" style="margin:10px 5% 0 5%">
  <div class="card">
    <div class="image">
    	<img onclick="location.href='/sori/index.jsp'" src="/sori/resources/images/logo.png">
    </div>
  </div>
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/views/sorijieumIntro.jsp'" src="/sori/resources/images/사이트소개.png">
    </div>
  </div>
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/blist'" src="/sori/resources/images/도서검색.png">
    </div>
  </div>
  <div class="card">
   <div class="image">
      	<img onclick="location.href='/sori/bmkmain'" src="/sori/resources/images/도서제작.png">
    </div>
  </div>  
</div>
<div class="ui four cards" style="margin:0 5% 0 5%">
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/wblist'" src="/sori/resources/images/도서신청.png">
    </div>
  </div>
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/views/boardnotice/noticeListView.jsp'" src="/sori/resources/images/공지사항.png">
    </div>
  </div>
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/qlist'" src="/sori/resources/images/QNA.png">
    </div>
  </div>
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/views/boardfaq/faqListView.jsp'" src="/sori/resources/images/FAQ.png">
    </div>
  </div>  
</div>
<br><br>
</div>
</body>
</html>