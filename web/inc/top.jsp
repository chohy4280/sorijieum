<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>  
<head>
 <!-- favicon 위치 -->
<link rel="shortcut icon" href="/sori/resources/images/favicon.ico">
<link rel="icon" href="/sori/resources/images/favicon.ico">
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
  <!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<!-- css -->
<style>
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
			 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
			 font-weight: normal; 
			 font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}
			 
ul{list-style:none;} 
ul li{float:left;/* margin-right:8px; *//* padding-left:30px; */}
ul li a{font-size:22px;color:grey;font-weight:bold;text-decoration:none;width:50px;}
ul li a:hover{background:#ccc;color#fff;}
footer{
     position:fixed;
     left:0;
     bottom : 0;
     width: 100%;
     height: 45px;
     background-color: #fbbe09;
     overflow:hidden;
}

</style>
</head>

<div class="ui top fixed menu" style="height:80px;overflow:hidden;align:center;">
  <div class="item">
	<a href="/sori/index.jsp">
	<img src="/sori/resources/images/logo.png" width="100px" height="100px"></a>
  </div>
  <a class="item" href="/sori/views/sorijieumIntro.jsp">사이트 소개</a>
  <a class="item" href="/sori/views/booksearch/bookSearchList.jsp">도서 검색</a>
  <a class="item" href="/sori/bmkmain">도서 제작</a>
  <a class="item" href="/sori/wblist">도서 신청</a>
  <a class="item" href="/sori/views/boardnotice/noticeListView.jsp">공지사항</a>
  <a class="item" href="/sori/views/boardfaq/faqListView.jsp">FAQ</a>
  <a class="item" href="/sori/views/boardqna/qnaListView.jsp">Q&A</a>
  <div class="right menu">
  <% if(loginMember != null){ %>
  <div style="float:right;margin-right:0;margin-left:50%;display:inline-block;overflow:hidden;">
	<h2 class="ui header">
	<img src="/sori/resources/images/error.png" class="ui circular image">
	<a href="/sori/views/member/memberMyPage.jsp" style="color:black;"><%= loginMember.getUserName() %>님</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
	<a href="/sori/memberLogout" style="font-size:10pt;color:grey;text-decoration:underline;">로그아웃</a>
	</h2>
  </div>
  <% }else { %>
  <div style="margin-top:20px;">
   <button class="ui yellow button" onclick="location.href='/sori/views/member/memberLoginView.jsp'" style="font-family:'S-Core Dream 6';">로그인</button>
   <button class="ui yellow button" onclick="location.href='/sori/views/member/memberEnrollAgree.jsp'" style="font-family:'S-Core Dream 6';">회원가입</button> &nbsp;
</div>
  <% } %>
  </div>
</div>
<br><br><br>
<body>

<footer style="text-align:center;font-size:10pt;">
		<p style="margin-top:1%;">
          &copy; Copyrights <strong>sorijieum</strong>.
          All Rights Reserved Created with sorijieum
        </p>
</footer>
</body>