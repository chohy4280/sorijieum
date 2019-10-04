<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 신청하기</title>
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
	
	<!--도서신청 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">도서 신청</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">도서신청 게시판입니다</span>
		<br><br>
	<!-- 도서신청 상세 내역 시작 -->
	<center>
	<form>
		<table class="my-listTable4" style="width:45%;">
			<tr>
				<th width="30%">제목</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookname" placeholder="도서명 입력" required></div></td>
			</tr>
			<tr>
				<th>저자</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookauthor" placeholder="저자명 입력" required></div></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookpublisher" placeholder="출판사 입력"></div></td>
			</tr>
			<tr>
				<th>출판일</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookpublisher" placeholder="YYYY/MM/DD"></div></td>
			</tr>
		</table>
		<input type="hidden" name="userid" value="">	<!-- 신청자 아이디 -->
	</form>
	</center>
	<!-- 도서신청 상세 내역 끝-->
	
	<!-- 관리자/작성자 수정삭제 버튼 -->
	<div align="center">
		<div class="ui buttons">
			<input type="submit" button class="ui positive button"  style="width:100px"></button>
				<div class="or"></div>
			<input type="reset" class="ui button" style="width:100px"></button>
		</div>
	</div>
	
	<br><br>
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui button" onclick="javascript:history.go(-1);return false">
		    이전 페이지
		  </button>
		</div>
		</center>


	</div>
	<!--도서신청 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>