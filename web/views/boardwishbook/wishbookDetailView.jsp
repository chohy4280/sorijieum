<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청도서 상세 보기</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--도서신청 내용 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">도서 신청</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">도서신청 게시판입니다</span>
		<br><br>
	<!-- 도서신청 상세 내역 시작 -->
	<center>
		<table class="my-listTable4" style="width:50%;">
			<tr>
				<th width="30%">제목</th><td width="70%">아몬드</td>
			</tr>
			<tr>
				<th>저자</th><td>손원평</td>
			</tr>
			<tr>
				<th>출판사</th><td>창비</td>
			</tr>
			<tr>
				<th>출판일</th><td>2017/03/31</td>
			</tr>
			<tr>
				<th>신청자</th><td>user003</td>
			</tr>
			<tr>
				<th>신청일</th><td>2019/01/15</td>
			</tr>
		</table>
	</center>
	<!-- 도서신청 상세 내역 끝-->
	
	<!-- 관리자/작성자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="location.href='/sori/views/boardwishbook/wishbookUpdateForm.jsp'">수정</button>
		  	<div class="or"></div>
			<button class="ui button" onclick="">삭제</button>
		</div>
	</div>
	
	
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui labeled icon button">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button">
		    목록
		  </button>
		  <button class="ui right labeled icon button">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center>


	</div>
	<!--도서신청 내용 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>