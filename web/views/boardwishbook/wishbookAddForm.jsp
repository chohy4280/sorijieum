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

	var audio = new Audio("/sori/resources/mp3/wishbookTitle.mp3");	// 화면 접속 시 음성안내 자동재생
	window.onload = function(){
	   audio.play();
	   $("#wishbooktitle").focus();
	}  

	function input_author(){
		audio.pause();
		   audio = new Audio("/sori/resources/mp3/wishbookAuthor.mp3");
		   audio.play();
	}
	
	function input_pub(){
		audio.pause();
		   audio = new Audio("/sori/resources/mp3/wishbookPub.mp3");
		   audio.play();	   
	}
	
	function input_date(){
		audio.pause();
		   audio = new Audio("/sori/resources/mp3/wishbookDate.mp3");
		   audio.play();
	}
	
	
	$(function(){
		$("#wishbookauthor").focus(function(){
			audio.pause();
			var audio = new Audio("/sori/resources/mp3/wishbookAuthor.mp3");
			audio.play();
		});
		
		$("#wishpublisher").focus(function(){
			audio.pause();
			var audio = new Audio("/sori/resources/mp3/wishbookPub.mp3");
			audio.play();
		});
		
		$("#wishpublishdate").focus(function(){
			audio.pause();
			var audio = new Audio("/sori/resources/mp3/wishpublishdate.mp3");
			audio.play();
		});
		
		$("#submit").focus(function(){
			audio.pause();
			var audio = new Audio("/sori/resources/mp3/wishsubmit.mp3");
			audio.play();
			window.onkeyup = function(){
				if(event.keyCode == 57){ 
					location.href="/sori/wblist";
				}
			}
		});
		$("#wishbooktitle").keyup(function(){	// 처음 접속 후 1번 클릭한 뒤에
			var keyV1 = $(this).val();
			if(keyV1 == '9'){
				location.href="/sori/index.jsp";
			}
		})
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
				<td width="80%"><div class="ui input"><input type="text" name="wishbooktitle" id="wishbooktitle" placeholder="도서명 입력" autofocus="autofocus" required style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>저자</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishbookauthor" id="wishbookauthor" placeholder="저자명 입력" onfocusin="input_author()" required style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublisher" id="wishpublisher" placeholder="출판사 입력" onfocusin="input_pub()" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>출판일</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublishdate" placeholder="YYYYMMDD" onfocusin="input_date()" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
		</table>
		<input type="hidden" name="wishwriter" value="<%= loginMember.getUserId() %>">	<!-- 신청자 아이디 -->
	<!-- 관리자/작성자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" id="submit" value="신청" style="width:80px"></button>
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
</body>
</html>