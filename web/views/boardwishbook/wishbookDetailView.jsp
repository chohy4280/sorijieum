<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%
   WishBook wb = (WishBook)request.getAttribute("wb");
   WishBook lastwishbook = (WishBook)request.getAttribute("lastwishbook");
   WishBook nextwishbook = (WishBook)request.getAttribute("nextwishbook");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청도서 상세 보기</title>
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript" src="/sori/resources/js/sorijieum_tts.js"></script>
<script type="text/javascript">
var title = "";
var author = "";
var publisher = "";
var publishdate = "";
var wishwriter = "";
var wishdate = "";
var wishstatus = "";

if(<%= loginMember.getTypeNumber() < 3 && wb.getWishWriter().equals(loginMember.getUserId()) %>){ //신청자일 때
	var audio = new Audio("/sori/resources/mp3/wishdetail_main.mp3");
	window.onload = function(){
	   audio.play();
	} 
	window.onkeyup = function(){
		if(event.keyCode == 27){ //음성멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
		else if(event.keyCode == 49 || event.keyCode == 97){ //상세보기 듣기
			title = document.getElementById('wishbooktitle').innerText;
			author = document.getElementById("wishbookauthor").innerText;
			publisher = document.getElementById("wishpublisher").innerText;
			publishdate = document.getElementById("wishpublishdate").innerText;
			wishdate = document.getElementById("wishdate").innerText;
			wishstatus = document.getElementById("wishstatus").innerText;
			audio.pause();
			speech("신청 도서명은 "+ title );
			speech("신청도서 저자명은 "+ author);		
			speech("신청도서 출판사는 "+ publisher );
			speech("신청도서 출판일은 "+ publishdate );
			speech("도서 신청일은 "+ wishdate );
			speech("해당 도서의 처리상태는 "+ wishstatus +" 입니다.");
			speech("다시 들으시려면, 0번, 수정하시려면, 2번, 삭제하시려면, 3번, 마이페이지로 돌아가시려면, 9번을, 눌러주세요.");
		}
		else if(event.keyCode == 50 || event.keyCode == 98){ //수정페이지로 이동
			<% if(wb.getWishStatus().equals("WAIT")){ %>
			audio.pause();
			location.href="/sori/wbuview?wishno=<%= wb.getWishNo() %>";
			<% }else { %>
			audio.pause();
			speech("처리가 완료된 신청글은 수정하실 수 없습니다.");
			<% } %>
		}
		else if(event.keyCode == 51 || event.keyCode == 99){ //신청글 삭제
			audio.pause();
			$("#delbutton").click();
		}
		else if(event.keyCode == 57 || event.keyCode == 105){ //마이페이지로
			audio.pause();
			location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}
		else if(event.keyCode == 48 || event.keyCode == 96){ //다시듣기
			speech("신청 도서명은 "+ title );
			speech("신청도서 저자명은 "+ author);		
			speech("신청도서 출판사는 "+ publisher );
			speech("신청도서 출판일은 "+ publishdate );
			speech("도서 신청일은 "+ wishdate );
			speech("해당 도서의 처리상태는, "+ wishstatus +" 입니다.");
			speech("다시 들으시려면, 0번, 수정하시려면, 2번, 삭제하시려면, 3번,  마이페이지로 돌아가시려면, 9번을, 눌러주세요.");
		}
	}
}else if(<%= loginMember.getTypeNumber() < 3 && !wb.getWishWriter().equals(loginMember.getUserId()) %>){
	var audio = new Audio("/sori/resources/mp3/wishdetailmain2.mp3");
	window.onload = function(){
	   audio.play();
	} 

	window.onkeyup = function(){
		if(event.keyCode == 27){ //음성멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
		else if(event.keyCode == 49 || event.keyCode == 97){ //상세보기 듣기
			audio.pause();
			title = document.getElementById('wishbooktitle').innerText;
			author = document.getElementById("wishbookauthor").innerText;
			publisher = document.getElementById("wishpublisher").innerText;
			publishdate = document.getElementById("wishpublishdate").innerText;
			wishwriter = document.getElementById("wishwriter").innerText;
			wishdate = document.getElementById("wishdate").innerText;
			wishstatus = document.getElementById("wishstatus").innerText;
			speech("도서명은, "+ title );
			speech("저자명은, "+ author);		
			speech("출판사는, "+ publisher);
			speech("출판일은, "+ publishdate);
			speech("신청자는, " +wishwriter );
			speech("신청일은, " +wishdate );
			speech("해당도서의 처리상태는, " +wishstatus +" 입니다.");
			speech("다시 들으시려면, 0번을,, 마이페이지로 돌아가시려면,, 9번을, 눌러주세요.");
		}
		else if(event.keyCode == 57 || event.keyCode == 105){ //마이페이지로
			audio.pause();
			location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}
		else if(event.keyCode == 48 || event.keyCode == 96){ //다시듣기
			speech("도서명은, "+ title );
			speech("저자명은, "+ author);		
			speech("출판사는, "+ publisher);
			speech("출판일은, "+ publishdate);
			speech("신청자는, " +wishwriter );
			speech("신청일은, " +wishdate );
			speech("해당도서의 처리상태는, " +wishstatus +" 입니다.");
			speech("다시 들으시려면, 0번을,, 마이페이지로 돌아가시려면,, 9번을, 눌러주세요.");
		}
	}
}

function delchk(){
	 audio.pause();
     audio = new Audio("/sori/resources/mp3/wishContentDel.mp3");
     audio.play();
     audio.addEventListener("ended", function(e) {
     location.href="/sori/wbdel?wishno=<%= wb.getWishNo() %>&userid=<%= loginMember.getUserId() %>";
     });
};

</script>
<!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	<!--도서신청 내용 시작-->
	<div class="my-content">
		<div class="massive ui yellow label" style="font-size: 30px">도서 신청</div>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">도서신청 게시판입니다</span>
		<br><br>
	<!-- 도서신청 상세 내역 시작 -->
	<center>
		<table class="my-listTable4" style="width:50%;">
			<tr>
				<th width="20%">제목</th><td width="80%" id="wishbooktitle" value="<%= wb.getWishBookTitle() %>"><%= wb.getWishBookTitle() %></td>
			</tr>
			<tr>
				<th>저자</th><td id="wishbookauthor" value="<%= wb.getWishBookAuthor() %>"><%= wb.getWishBookAuthor() %></td>
			</tr>
			<tr>
			<% if(wb.getWishPublisher() != null){ %>
				<th>출판사</th><td id="wishpublisher" value="<%= wb.getWishPublisher() %>"><%= wb.getWishPublisher() %></td>
			<% }else{ %>
				<th>출판사</th><td id="wishpublisher" value="미작성">미작성</td>
			<% } %>
			</tr>
			<tr>
			<% if(wb.getWishPublishDate() != null){ %>
				<th>출판일</th><td id="wishpublishdate" value="<%= wb.getWishPublishDate() %>"><%= wb.getWishPublishDate() %></td>
			<% }else{ %>
				<th>출판일</th><td id="wishpublishdate" value="미작성">미작성</td>
			<% } %>
			</tr>
			<tr>
				<th>신청자</th><td id="wishwriter" value="<%= wb.getWishWriter() %>"><%= wb.getWishWriter() %></td>
			</tr>
			<tr>
				<th>신청일</th><td id="wishdate" value="<%= wb.getWishDate() %>"><%= wb.getWishDate() %></td>
			</tr>
			<tr>
				<th>처리상태</th>
				<% if(wb.getWishStatus().equals("WAIT")){ %>
				<td id="wishstatus" value="승인대기">승인대기</td>
				<% }else if(wb.getWishStatus().equals("RJCT")){ %>
				<td id="wishstatus" value="반려">반려</td>
				<% }else if(wb.getWishStatus().equals("DONE")){ %>
				<td id="wishstatus" value="승인">승인</td>
				<% } %>
			</tr>
		</table>
	</center>
	<!-- 도서신청 상세 내역 끝-->
	<% if(loginMember != null && loginMember.getUserId().equals(wb.getWishWriter())){ %>
	<!-- 작성자 수정삭제 버튼 -->
	<div align="right">
			<% if(wb.getWishStatus().equals("WAIT")){ %>
			<button class="ui positive button" onclick="location.href='/sori/wbuview?wishno=<%= wb.getWishNo() %>'">수정</button>
			<% } %>
			<button id="delbutton" class="ui button" onclick="delchk();">삭제</button>
	</div>
	<% }else if(loginMember != null && loginMember.getUserId().substring(0, 5).equals("admin")){ %>
	<!-- 관리자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="location.href='/sori/wbuview?wishno=<%= wb.getWishNo() %>'">수정</button>
		  	<div class="or"></div>
			<button id="delbutton" class="ui button" onclick="location.href='/sori/wbdel?wishno=<%= wb.getWishNo() %>'">삭제</button>
		</div>
	</div>
	<% } %>
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
			<% if(lastwishbook == null){ %>
			<button class="ui labeled icon button" onclick="last()">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
			<% }else{ %>
		  <button class="ui labeled icon button" onclick="location.href='/sori/wbdview?wishno=<%= lastwishbook.getWishNo() %>'">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <% } %>
		  <button class="ui button" onclick="location.href='/sori/wblist'">
		    목록
		  </button>
		  <% if(nextwishbook == null){ %>
		  <button class="ui right labeled icon button" onclick="next()">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		  <% }else{ %>
		  <button class="ui right labeled icon button" onclick="location.href='/sori/wbdview?wishno=<%= nextwishbook.getWishNo() %>'">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		  <% } %>
		</div>
		</center>
	</div>
	<!--도서신청 내용 끝-->
	</section>
	<!-- Content 끝! -->
</body>
</html>