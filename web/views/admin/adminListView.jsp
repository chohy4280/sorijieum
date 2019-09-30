<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리</title>
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
	<!--회원 목록 시작-->
            <i class="big users icon"></i></i><span style="font:black; font-size:17pt; padding:10px;">권한관리</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 85px;">
            <form action="" method="post">
				<div style="float:left">
				<a class="ui large teal label">관리자정보</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
					</select>
					<input type="text" class="search" name="searchuserid" id="userid" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
					<input type="submit" value="검색">
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:90px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600">5</span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="2%"><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
						<th width="10%">아이디</th>
						<th width="13%">이름</th>
						<th width="15%">이메일</th>
						<th width="10%">전화번호</th>
						<th width="10%">관리자구분</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="RowCheck" value="getBookcode"></td>
						<td><a href="">admin01</a></td>
						<td><a href="">최민영</a></td>
						<td>my_choe@naver.com</td>
						<td>010-3330-3358</td>
						<td>대표관리자</td>

					</tr>
				</table>
				
				<br>
				<div style="float:left"><button class="mini ui black button" onclick="">추가</button>
				<button class="mini ui black button" onclick="">삭제</button></div>
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->


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