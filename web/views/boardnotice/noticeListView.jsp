<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
  <!-- Semantic UI CND -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--공지사항 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">공지사항</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 공지사항입니다</span>
		<br><br>
	<!-- 공지사항 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th width="10%">No</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<tr>
				<td style="color:red;">공지</td>
				<td style="text-align:left;"><a href="/sori/views/boardnotice/noticeDetailView.jsp">홈페이지 서버 오류에 대한 안내</a></td>
				<td>admin02</td>
				<td>2019/06/13</td>
				<td>321</td>
			</tr>	
			<tr>
				<td>1</td>
				<td style="text-align:left;"><a href="">홈페이지 서버 오류에 대한 안내</a></td>
				<td>admin02</td>
				<td>2019/06/13</td>
				<td>321</td>
			</tr>	
		</table>
	<!--공지사항 목록 끝-->
		<br>
		<div align="right"><a class="big ui black label" href="">글쓰기</a></div>
		
		
	<!-- 페이징 시작 -->
		<div align="center">페이징 버튼 부분(추후 코딩 예정)</div>
	<!-- 페이징 끝 -->
	
	<br><hr><br>
	<!-- 검색창 시작 -->
		<center>
		<div>
			<input type="radio" name="item" value="title" checked> 제목 &nbsp; &nbsp; &nbsp; 
		</div>
		<div id="titlediv">
			<form action="" method="post">
				<input type="hidden" name="search" value="title">
				<label>
				<input type="search" name="keyword"></label>
				<input type="submit" value="검색">
			</form>
		</div>
		</center>
	<!-- 검색창 끝 -->
	
	</div>
	<!--공지사항 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>