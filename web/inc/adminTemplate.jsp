<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 시맨틱 UI -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
 <!-- Custom CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/Admin.css">
	  <script src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<!-- 폰트변경 -->
	<style>
		@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
					 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
					 font-weight: normal; 
					 font-style: normal; }
		
		* { font-family: 'S-CoreDream-7ExtraBold';}
	</style>
</head>
<body>

<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- 상단 바 시작! -->
	<header>
		<div class="topbar" style="overflow:hidden;">
			<span class="topname"><a href="/sori/index.jsp" target="_blank"><i class="home icon"></i></a>SORIJIEUM <span style="color:#4ecdc4">ADMIN</span></span>
			<div id="adminname"><a href=""><%= loginMember.getUserName() %></a> 님!&nbsp;&nbsp;&nbsp;<button class="ui mini teal button" onclick="location.href='/sori/memberLogout'">Logout</button></div>
		</div>
	</header>
<!-- 상단 바 끝! -->


<!-- 사이드 메뉴 바 시작!-->
<aside>
<div class="menubar" style="overflow:hidden;">

<nav>
	<ul class="vertical-menu">
		<li style="font-weight: 600; font-size:12pt"><a href="/sori/admain.ad"><i class="home icon"></i>MAIN</a></li>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="book icon"></i>도서</a></li>
			<ul>
				<li><a href="/sori/blist.ad">　도서목록</a></li>
				<li><a href="/sori/views/admin/adminAddBookForm.jsp">　도서추가</a></li>
				<li><a href="/sori/wblist.ad">　도서신청내역</a></li>
			</ul>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="user icon"></i>사용자</a></li>
			<ul>
				<li><a href="/sori/mlist.ad">　회원정보조회</a></li>
				<li><a href="/sori/qmlist.ad">　회원탈퇴관리</a></li>
				<li><a href="/sori/adlist.ad">　권한관리</a></li>
			</ul>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="clipboard list icon"></i>게시판</a></li>
			<ul>
				<li><a href="/sori/bodlist.ad">　문의글관리</a></li>
			</ul>
	</ul>
</nav>
</div>
</aside>
<!-- 사이드 메뉴 끝! -->
<%} else { %>
<!-- 상단 바 시작! -->
	<header>
		<div class="topbar" style="overflow:hidden;">
			<span class="topname"><a href="/sori/index.jsp" target="_blank"><i class="home icon"></i></a>SORIJIEUM <span style="color:#4ecdc4">ADMIN</span></span>
		</div>
	</header>
<!-- 상단 바 끝! -->


<!-- 사이드 메뉴 바 시작!-->
<aside>
<div class="menubar" style="overflow:hidden;">

<nav>
	<ul class="vertical-menu">
		<li style="font-weight: 600; font-size:12pt"><a href="/sori/admain.ad"><i class="home icon"></i>MAIN</a></li>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="book icon"></i>도서</a></li>
			<ul>
				<li><a href="">　도서목록</a></li>
				<li><a href="">　도서추가</a></li>
				<li><a href="">　도서신청내역</a></li>
			</ul>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="user icon"></i>사용자</a></li>
			<ul>
				<li><a href="">　회원정보조회</a></li>
				<li><a href="">　회원탈퇴관리</a></li>
				<li><a href="">　권한관리</a></li>
			</ul>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="clipboard list icon"></i>게시판</a></li>
			<ul>
				<li><a href="">　문의글관리</a></li>
			</ul>
	</ul>
</nav>
</div>
</aside>
<!-- 사이드 메뉴 끝! -->

<section class="contentsection">
<br><br><br><br><br><br><br><br>
<center>
<i class="massive red lock icon"></i><br><br>
<p style="font-size: 33pt;">관리자 로그인이 필요합니다.</p>
<button class="large ui red button" onclick="location.href='/sori/views/member/memberLoginView.jsp'">Login</button>

</center>
</section>
<% } %>



 <footer class="site-footer" style="overflow:hidden;">
        <p>
          &copy; Copyrightⓒ 2019 <strong>sorijieum @minyoung.</strong> All Rights Reserved.<br>
        </p>
    </footer>
</body>
</html>