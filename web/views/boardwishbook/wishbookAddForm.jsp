<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 신청하기</title>
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
<script type="text/javascript">
	$(function(){
		$("#wishbookauthor").focus(function(){
			var audio = new Audio("/sori/resources/mp3/wishbookAuthor.mp3");
			audio.play();
		});
		
		$("#wishpublisher").focus(function(){
			var audio = new Audio("/sori/resources/mp3/wishbookPub.mp3");
			audio.play();
		});
	});
</script>
</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	<!--도서신청 시작-->
	<div class="my-content">
		<div class="massive ui yellow label" style="font-size: 30px">도서 신청</div>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">도서신청 게시판입니다</span>
		<br><br>
	<!-- 도서신청 상세 내역 시작 -->
	<center>
	<form action="/sori/wbins" method="post">
		<table class="my-listTable4" style="width:52%;font-family: 'S-Core Dream 6';">
			<tr>
				<th width="20%">제목</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishbooktitle" placeholder="도서명 입력" autofocus="autofocus" required style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>저자</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishbookauthor" id="wishbookauthor" placeholder="저자명 입력" required style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublisher" id="wishpublisher" placeholder="출판사 입력" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>출판일</th>
				<td width="80%"><div class="ui input"><input type="date" name="wishpublishdate" placeholder="YYYY-MM-DD" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
		</table>
		<input type="hidden" name="wishwriter" value="<%= loginMember.getUserId() %>">	<!-- 신청자 아이디 -->
	<!-- 관리자/작성자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" value="신청" style="width:80px"></button>
				<div class="or"></div>
			<input type="reset" class="ui button" value="취소" style="width:80px">
		</div>
	</div>
	</form>
	</center>
	<!-- 도서신청 상세 내역 끝-->
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
<audio src="/sori/resources/mp3/wishbookTitle.mp3" autoplay controls preload="auto"><embed src="/sori/resources/mp3/mainOpen.mp3"></embed>해당 브라우저에서는 음성이용이 불가능합니다.</audio>
</body>
</html>