<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 도서 수정</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--도서신청 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">도서 수정</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">신청 도서 수정 페이지입니다</span>
		<br><br>
	<!-- 도서신청 상세 내역 시작 -->
	<center>
	<form>
		<table class="my-listTable4" style="width:45%;">
			<tr>
				<th width="30%">제목</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookname" placeholder="도서명 입력" value="" required></div></td>
			</tr>
			<tr>
				<th>저자</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookauthor" placeholder="저자명 입력" value="" required></div></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookpublisher" placeholder="출판사 입력" value=""></div></td>
			</tr>
			<tr>
				<th>출판일</th>
				<td width="70%"><div class="ui input"><input type="text" name="wishbookpublisher" placeholder="YYYY/MM/DD" value=""></div></td>
			</tr>
		</table>
		<input type="hidden" name="userid" value="">	<!-- 신청자 아이디 -->
		<input type="hidden" name="wishno" value="">	<!-- 글 번호 -->
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