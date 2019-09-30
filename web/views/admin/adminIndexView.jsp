<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음 관리자 시스템</title>
  <!-- Semantic UI CND -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
  <!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/Admin.css">
</head>

<body>
<!-- 상단 바 시작! -->
	<header>
		<div class="topbar">
			<span class="topname"><a href="/sori/index.jsp" target="_blank"><i class="home icon"></i></a>SORIJIEUM <span style="color:#4ecdc4">ADMIN</span></span>
			<div id="adminname"><a href="">최민영</a> 님!&nbsp;&nbsp;&nbsp;<button class="ui mini teal button">Logout</button></div>
		</div>
	</header>
<!-- 상단 바 끝! -->


<!-- 사이드 메뉴 바 시작!-->
<aside>
<div class="menubar">
<nav>
	<ul class="vertical-menu">
		<li style="font-weight: 600; font-size:12pt"><a href="/sori/views/admin/adminIndexView.jsp"><i class="home icon"></i>HOME</a></li>
		<li style="font-weight: 600; font-size:12pt"><a href="javascript:;"><i class="book icon"></i>도서</a></li>
			<ul>
				<li><a href="/sori/views/admin/adminBookList.jsp">　도서목록</a></li>
				<li><a href="">　도서추가</a></li>
				<li><a href="">　도서신청내역</a></li>
			</ul>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="user icon"></i>사용자</a></li>
			<ul>
				<li><a href="/sori/views/admin/adminUserListView.jsp">　회원정보조회</a></li>
				<li><a href="/sori/views/admin/adminQuitUserView.jsp">　회원탈퇴관리</a></li>
				<li><a href="/sori/views/admin/adminListView.jsp">　권한관리</a></li>
			</ul>
		<li style="font-weight: 600; font-size:12pt"><a href=""><i class="clipboard list icon"></i>게시판</a></li>
			<ul>
				<li><a href="">　게시물관리</a></li>
			</ul>
	</ul>
</nav>
</div>
</aside>
<!-- 사이드 메뉴 끝! -->



<!-- Content 시작! -->
<section class="contentsection">



	<!--오늘의 차트 시작-->
            <div class="base">
	            <i class="large blue check circle icon"></i>
	            <span class="sysdate">9월 20일 수요일</span>
	            
	            <div class="data">
	            
	            <!-- 도서 섹션-->          
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge yellow book icon"></i>
	            		<div class="data-title" style="color: #f2c61f">도서</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신청도서</div>
	            		<div>제작중도서</div>
	            		<div>완료도서</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todaybook">8</span> 권</div>
	            		<div><span class="todaybook">8</span> 권</div>
	            		<div><span class="todaybook">333</span> 권</div>
	            	</div>
	            </div>
	            
	            
	            <!-- 게시글 섹션-->
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge red clipboard list icon"></i>
	            		<div class="data-title" style="color: #d95c5c">게시글</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>새 문의글</div>
	            		<div>미답변 문의</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todayboard">10</span> 건</div>
	            		<div><span class="todayboard">6</span> 건</div>
	            	</div>
	            </div>
	            
	            
	            
	            <!-- 이용자 섹션-->
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge green user icon"></i>
	            		<div class="data-title" style="color: #5bbd72">이용자</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신규회원</div>
	            		<div>탈퇴회원</div>
	            		<div>TOTAL</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todayuser1">50</span> 명</div>
	            		<div><span class="todayuser1">4</span> 명</div>
	            		<div><span class="todayuser1">254</span> 명</div>
	            	</div>
	            </div>
	            
	
				<!-- 제작자 섹션-->
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge blue user icon"></i>
	            		<div class="data-title" style="color: #3b83c0">제작자</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신규회원</div>
	            		<div>탈퇴회원</div>
	            		<div>TOTAL</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todayuser2">50</span> 명</div>
	            		<div><span class="todayuser2">4</span> 명</div>
	            		<div><span class="todayuser2">254</span> 명</div>
	            	</div>
	            </div>
	            
	            	            
	            </div>	            
            </div>
       <!-- 오늘의 차트 끝! -->
       
       
       
</section>
<!-- Content 끝! -->

 <footer class="site-footer">
        <p>
          &copy; Copyrights <strong>sorijieum</strong>. All Rights Reserved<br>
          Created with sorijieum by @minyoung</a>
        </p>
        
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
    </footer>

<script src="lib/jquery/jquery.min.js"></script>

</body>
</html>