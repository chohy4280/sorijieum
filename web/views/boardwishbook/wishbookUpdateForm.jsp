<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%
	WishBook wb = (WishBook)request.getAttribute("wb");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 도서 수정</title>
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
$(function(){
	$("#wishup1").keyup(function(){	
		var keyV = $(this).val();
		if(keyV == '1'){		// 도서명 수정
			audio.pause();
			audio = new Audio("/sori/resources/mp3/wishupbooktitle.mp3");
			audio.play();
			$("#wishbooktitle").select();
		}else if (keyV == '2'){	// 저자명 수정
			audio.pause();
			audio = new Audio("/sori/resources/mp3/wishupauthor.mp3");
			audio.play();
			$("#wishbookauthor").select();
		}else if (keyV == '3'){	// 출판사 수정
			audio.pause();
			audio = new Audio("/sori/resources/mp3/wishuppublisher.mp3");
			audio.play();
			$("#wishpublisher").select();
		}else if (keyV == '4'){	// 출판일 수정
			audio.pause();
			audio = new Audio("/sori/resources/mp3/wishuppublishdate.mp3");
			audio.play();
			$("#wishpublishdate").select();
		}else if (keyV == '9'){	// 이전페이지로 이동
			location.href="/sori/wblist";
		}else if (keyV == '0'){	// 다시듣기
			audio.play();
		}else {	// 없음(값 지우기)
			$("#wishup1").val("");
		}
	});
	
	$("#wishbookauthor").focus(function(){
		audio.pause();
		var audio = new Audio("/sori/resources/mp3/wishupauthor.mp3");
		audio.play();
	});
	
	$("#wishpublisher").focus(function(){
		audio.pause();
		var audio = new Audio("/sori/resources/mp3/wishuppublisher.mp3");
		audio.play();
	});
	
	$("#wishpublishdate").focus(function(){
		audio.pause();
		var audio = new Audio("/sori/resources/mp3/wishuppublishdate.mp3");
		audio.play();
	});
	
	$("#submit").focus(function(){
		var audio = new Audio("/sori/resources/mp3/wishupsubmit.mp3");
		audio.play();
		window.onkeyup = function(){
			if(event.keyCode == 57){ 
				location.href="/sori/wblist";
			}
		}
	});
	
});


if(<%= loginMember.getTypeNumber() < 3 %>){
	var audio = new Audio("/sori/resources/mp3/wishupmain.mp3");
	window.onload = function(){
	   audio.play();
	} 

	window.onkeyup = function(){
		if(event.keyCode == 27){ //음성멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
	}
	
}
</script>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	<!--도서신청 시작-->
	<div class="my-content">
		<div class="massive ui yellow label" style="font-size: 30px">도서 수정</div>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">신청 도서 수정 페이지입니다</span>
		<br><br>
	<!-- 도서신청 상세 내역 시작 -->
	<center>
	<form action="/sori/wbup" method="post">
		<table class="my-listTable4" style="width:52%;">
			<tr>
				<th width="20%">제목</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishbooktitle" id="wishbooktitle" placeholder="도서명 입력" value="<%= wb.getWishBookTitle() %>" required  style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>저자</th>
				<td width="80%"><div class="ui input"><input type="text" name="wishbookauthor" id="wishbookauthor" placeholder="저자명 입력" value="<%= wb.getWishBookAuthor() %>" required style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			</tr>
			<tr>
				<th>출판사</th>
				<% if(wb.getWishPublisher() != null){ %>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublisher" id="wishpublisher" placeholder="출판사 입력" value="<%= wb.getWishPublisher() %>" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
				<% }else{ %>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublisher" id="wishpublisher" placeholder="출판사 입력" value="" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
				<% } %>
			</tr>
			<tr>
				<th>출판일</th>
				<% if(wb.getWishPublishDate() != null){ %>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublishdate" id="wishpublishdate" placeholder="YYYYMMDD" value="<%= wb.getWishPublishDate() %>" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
				<% }else{ %>
				<td width="80%"><div class="ui input"><input type="text" name="wishpublishdate" id="wishpublishdate" placeholder="YYYYMMDD" value="" style="width:450px;text-align:center;font-family:'S-Core Dream 5';"></div></td>
			<% } %>
			</tr>
			<tr>
				<th>신청자</th>
				<td width="80%"><%= wb.getWishWriter() %></td>
			</tr>
			<tr>
				<th>신청일</th>
				<td width="80%"><%= wb.getWishDate() %></td>
			</tr>
		</table>
		<input type="hidden" name="userid" value="<%= wb.getWishWriter() %>">	<!-- 신청자 아이디 -->
		<input type="hidden" name="wishno" value="<%= wb.getWishNo() %>">	<!-- 글 번호 -->
		<!-- 관리자/작성자 수정삭제 버튼 -->
		<div align="right">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" id="submit" value="수정" style="width:80px"></button>
				<div class="or"></div>
			<input type="reset" class="ui button" value="취소" style="width:80px">
		</div>
		</div>
	</form>
	<!-- 공통 페이지 이동 버튼 -->
		<div class="ui buttons">
		  <button class="ui button" onclick="javascript:history.go(-1);return false">이전 페이지</button>
		</div>
	</center>
	<!-- 도서신청 상세 내역 끝-->
	
	<br><br>

	</div>
	<!--도서신청 끝-->
	<% if(loginMember.getTypeNumber() < 3){ %>
	<input type="text" id="wishup1" autofocus="autofocus">
	<% } %>
	</section>
	<!-- Content 끝! -->
	
</body>
</html>