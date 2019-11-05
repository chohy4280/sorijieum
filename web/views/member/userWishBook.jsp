<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%
	ArrayList<WishBook> alarmlist = (ArrayList<WishBook>)request.getAttribute("alarmlist");
	ArrayList<WishBook> mywblist = (ArrayList<WishBook>)request.getAttribute("mywblist");
	int beginPage = (Integer)request.getAttribute("beginPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int maxPage = (Integer)request.getAttribute("maxPage");
	int listcount = (Integer)request.getAttribute("listcount");
	String keyword = (String)request.getAttribute("keyword");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 신청도서</title>
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript" src="/sori/resources/js/sorijieum_tts.js"></script>
<script type="text/javascript">
$(function(){
	//체크박스 전체 선택
	$("#allChk").click(function(){
		if($(this).is(":checked")){
			$(".chkbox").prop("checked", true);
		} else {
			$(".chkbox").prop("checked", false);
		}
	});
	
	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
	$(".chkbox").click(function(){
		if($("input[name='delChk']:checked").length == <%= mywblist.size() %>){
			$("#allChk").prop("checked", true);
		}else{
			$("#allChk").prop("checked", false);
		}	
	});
	
	//처리상태 버튼 클릭시 사유 출력
	$(".reasonbtn").click(function(){
		var id = $(this).attr("id");
		alert(id);
		if($("#"+id+"reason").css("display") == "none")
			$("#"+id+"reason").css("display","table-row");
		else
			$("#"+id+"reason").css("display","none");
	});
	
	//상단 알림 삭제
	$(".close.icon").click(function(){
		$.ajax({
			url:"wsarmdel.my",
			data:{wishno: $(this).attr("id")},
			type:"post",
			success:function(result){
				$("#"+result).css("display","none");
			}
		});
	});
	
	//받아온 리스트 없으면 페이징부분 없앰
	<% if(mywblist.size() == 0){ %>
		$("#pagebox").css("display","none");
	<% } %>
	
	//검색창이 아닌 곳에서 키 눌렀을 때 이벤트 발생
	$("body:not('#keyword')").on("keyup",function(event){
		if(event.keyCode == 32){	//알림 목록 듣기(스페이스바)
			<% if(alarmlist != null){ %>
				$("#alarmNum").focus();
				var aCnt = <%= alarmlist.size() %>;
				audio.pause();
				audio.currentTime=0;
				speech("알림은 최근 5개까지 표시되며, 알림을 듣는 도중, 듣고싶은 내역의 번호를 누르면, 신청 내역 상세페이지로 이동합니다.");
				var alarmT ="";
				for(var i=1; i<=5; i++){
					if(document.getElementById(i+"stat") == null)
						break;
					alarmT = document.getElementById(i+"stat").innerText;
					speech(i + ",번, "+alarmT);
				}
				speech("검색하시려면 위쪽 방향키를, 전체 목록을 들으시려면 아래쪽 방향키를 눌러주세요.");
			<% }else{ %>
				speech("처리 상태가 업데이트 된 목록이 없습니다. 신청하신 목록을 들으려면 아래쪽 방향키를 눌러주세요.");
			<% } %>
		}
		else if(event.keyCode == 57 || event.keyCode == 105){	//9번 누르면 마이페이지로
			location.href  = "/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}
	});
	
	$("#listNum").keyup(function(event){
		var keyL = $(this).val();
		var wishno = "";
		if(keyL == '1'){	//1번(숫자,키패드)
			wishno = document.getElementById("1code").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyL == '2'){	//2번(숫자,키패드)
			wishno = document.getElementById("2code").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyL == '3'){	//3번(숫자,키패드)
			wishno = document.getElementById("3code").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyL == '4'){	//4번(숫자,키패드)
			wishno = document.getElementById("4code").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyL == '5'){	//5번(숫자,키패드)
			wishno = document.getElementById("5code").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
	});
	
	$("#alarmNum").keyup(function(event){
		var keyA = $(this).val();
		var wishno = "";
		if(keyA == '1'){	//1번(숫자,키패드)
			wishno = document.getElementById("1alarm").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyA == '2'){	//2번(숫자,키패드)
			wishno = document.getElementById("2alarm").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyA == '3'){	//3번(숫자,키패드)
			wishno = document.getElementById("3alarm").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyA == '4'){	//4번(숫자,키패드)
			wishno = document.getElementById("4alarm").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
		else if(keyA == '5'){	//5번(숫자,키패드)
			wishno = document.getElementById("5alarm").value;
			location.href  = "/sori/wbdview?wishno="+wishno;
		}
	});

});

//처음 페이지 로딩되면 자동으로 출력 할 음성을 audio 변수에 담기
var audio = new Audio("/sori/resources/mp3/mywish/wishbook_main.mp3");
window.onload = function(){
	<% if(mywblist.size() == 0){ %>
		audio = new Audio("/sori/resources/mp3/mypage/mypage_nolist.mp3");
		audio.play();
		audio.addEventListener("ended", function(e) {
			location.href  = "/sori/mypage?userid=<%= loginMember.getUserId() %>";
		});
	<% }else if(keyword == null && currentPage == 1){ %>
		audio.play();								//처음 페이지 로딩시 안내멘트 음성 출력
	<% }else if(currentPage != 1){ %>
		speech(<%= currentPage %> + " 페이지 입니다.");		//1페이지가 아닌 페이지 로딩시 자동으로 목록을 음성으로 출력
		var text = "";
		for(var i=1; i<6; i++){
			$("#"+i+"tr").focus();
			text = document.getElementById(i+"info").value;
			if(i==1)
				speech("일번, "+text);
			else if(i==2)
				speech("이번, "+text);
			else if(i==3)
				speech("삼번, "+text);
			else if(i==4)
				speech("사번, "+text);
			else if(i==5)
				speech("오번, "+text);
		}
	<% }else if(keyword != null && currentPage == 1){ %>	//검색결과 1페이지 들어올시 출력
		var keyV = document.getElementById("keyword").value;
		$("#listNum").focus();
		speech("검색하신, "+keyV+", 가 포함된 목록입니다. 검색된 신청목록은 총 "+ <%= listcount %> + " 개 입니다. 번호를 누르시면 해당 신청 상세페이지로 이동합니다.");
		var focusImg = "";
		var text = "";
		for(var i=1; i<6; i++){
			$("#"+i+"tr").focus();
			text = document.getElementById(i+"info").value;
			if(i==1)
				speech("일번, "+text);
			else if(i==2)
				speech("이번, "+text);
			else if(i==3)
				speech("삼번, "+text);
			else if(i==4)
				speech("사번, "+text);
			else if(i==5)
				speech("오번, "+text);
		}
	<% } %>
}

window.onkeyup = function(){
	if(event.keyCode == 38) {	//위쪽키보드 눌렀을 때 (검색창으로 포커스)
		$("#keyword").focus();
		audio.pause();
		audio = new Audio("/sori/resources/mp3/mywish/wishbook_search.mp3");
		audio.play();
	}
	else if(event.keyCode == 40){	//아래쪽 키보드 눌렀을 때(목록 책제목,저자명 읽어주기)
		audio.pause();
		audio = new Audio("/sori/resources/mp3/mywish/wishbook_list.mp3");
		$("#listNum").focus();
		audio.play();
		audio.addEventListener("ended", function(e) {
			var focusImg = "";
			var text = "";
			for(var i=1; i<6; i++){
				text = document.getElementById(i+"info").value;
				if(i==1)
					speech("일번, "+text);
				else if(i==2)
					speech("이번, "+text);
				else if(i==3)
					speech("삼번, "+text);
				else if(i==4)
					speech("사번, "+text);
				else if(i==5)
					speech("오번, "+text);
			}
		});
	}
	else if(event.keyCode == 27){
		audio.pause();
		audio = null;
	}
	else if(event.keyCode == 37){
		<% if(currentPage != 1){ %>
			<% if(keyword == null){ %>
				location.href="/sori/wishbook.my?page=<%= currentPage-1  %>&userid=<%= loginMember.getUserId() %>";
			<% }else{ %>
				location.href="/sori/wbsearch.my?page=<%= currentPage-1 %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>";
		<% }}else{ %>
			audio.pause();
			audio.currentTime = 0;
			speech("목록의 첫 페이지 입니다.");
		<% } %>
	}
	else if(event.keyCode == 39){
		<% if(currentPage != maxPage){ %>
			<% if(keyword == null){ %>
				location.href="/sori/wishbook.my?page=<%= currentPage+1  %>&userid=<%= loginMember.getUserId() %>";
			<% }else{ %>
				location.href="/sori/wbsearch.my?page=<%= currentPage+1 %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>";
		<% }}else{ %>
			audio.pause();
			audio.currentTime = 0;
			speech("목록의 마지막 페이지 입니다.");
		<% } %>
	}
}
</script>
</head>
<body>
<input type="text" id="alarmNum">
<input type="text" id="listNum">
<div class="hy-div">
<section class="hy-section2" >
<div style="display:flex;justify-content:space-between;">
<div>
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/wishbook.my?userid=<%= loginMember.getUserId() %>">내 신청도서</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">내 신청도서 목록</span><br>
</div>
<!-- 검색창 시작 -->
<div style="margin-top:20px;">
<form action="/sori/wbsearch.my" method="post">
<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>">
<% if(keyword != null) { %>
	<input type="text" name="keyword" id="keyword" value="<%= keyword %>" style="width:200px;">
<% }else{ %>
	<input type="text" name="keyword" id="keyword" placeholder="검색하실 내용을 입력하세요" style="width:200px;">
<% } %>		
	<input class="ui tiny basic black button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
</form>
</div>
</div><br>
<!-- 내 신청도서 알림은 확인하기 전까지 띄움. 확인하고 나면 알림 삭제 -->
<% if(alarmlist != null){ %>
<% int i=0;
	for(WishBook wba : alarmlist){ 
 	i++; %>
<div class="ui yellow message hy-alarmdiv" id="div_<%= wba.getWishNo() %>" style="display:block;">
	<input type="hidden" id="<%= i %>alarm" value="<%= wba.getWishNo() %>">
	<a href="/sori/wbdview?wishno=<%= wba.getWishNo() %>" style="color:#AE7651;" id="<%= i %>stat" class="<%= i %>c">
	［<%= wba.getWishBookTitle() %>］     도서 신청이
	<% if(wba.getWishStatus().equals("RJCT")){ %>
	반려되었습니다. 반려사유: <%= wba.getRjctReason() %>
	<% }else if(wba.getWishStatus().equals("DONE")){ %>
	승인되었습니다.
	<% } %>
	</a>
	<i class="close icon" id="<%= wba.getWishNo() %>"></i>
</div>
<% }} %>
<br>
<!-- 내 신청 목록 출력 -->
내 신청도서: <%= listcount %> 개
<form action="/sori/wbdel.my" method="post">
<table class="hy-listTable" align="center">
	<tr>
		<th width="5%"><input type="checkbox" class="chkbox" id="allChk"></th>
		<th width="35%">책 제목</th>
		<th width="10%">저자명</th>
		<th width="10%">출판사</th>
		<th width="15%">출판일</th>
		<th width="15%">신청날짜</th>
		<th width="10%">처리상태</th>
	</tr>
	<% if(mywblist.size() > 0){ %>
	<% for(int i=0; i<mywblist.size(); i++){  %>
	<%	WishBook wb = mywblist.get(i); %>
	<tr>
		<input type="hidden" id="<%= i+1 %>info" value="신청도서명 <%= wb.getWishBookTitle() %>, 저자명 <%= wb.getWishBookAuthor() %>">
		<input type="hidden" id="<%= i+1 %>code" value="<%= wb.getWishNo() %>">
		<input type="hidden" id="<%= i+1 %>title" value="신청도서명 <%= wb.getWishBookTitle() %>">
		<td><input type="checkbox" class="chkbox" name="delChk" value="<%= wb.getWishNo() %>"></td>
		<td class="wbTitle" id="<%= wb.getWishBookTitle() %>">
		<a href="/sori/wbdview?wishno=<%= wb.getWishNo() %>" style="color:#6d6d6d;"><%= wb.getWishBookTitle() %></a>
		</td>
		<td><%= wb.getWishBookAuthor() %></td>
		<td>
		<% if(wb.getWishPublisher() == null){ %>
		-
		<% } else{ %>
		<%= wb.getWishPublisher() %>
		<% } %>
		</td>
		<td>
		<% if(wb.getWishPublishDate() == null){ %>
		-
		<% } else{ %>
		<%= wb.getWishPublishDate() %>
		<% } %>
		</td>
		<td><%= wb.getWishDate() %></td>
		<td>
		<% if(wb.getWishStatus().equals("RJCT")){ %>
		<div class="some-wrapping-div">
			<div class="mini ui red button reasonbtn" id="<%= wb.getWishNo() %>">반려</div>
		</div>
		<% } else if(wb.getWishStatus().equals("WAIT")){ %>
		대기
		<% } else { %>
		<div class="some-wrapping-div">
			<div class="mini ui green button reasonbtn" id="<%= wb.getWishNo() %>">승인</div>
		</div>
		<% } %>
		</td>
	</tr>
	<tr id="<%= wb.getWishNo() %>reason" style="display:none;" border="0">
	<td colspan="7" style="text-align:right;">
		<% if(wb.getWishStatus().equals("RJCT")){ %>
			<div class="ui secondary inverted red segment">
				<p>반려사유: <%= wb.getRjctReason() %></p>
				<p>처리날짜: <%= wb.getWishStatusDate() %></p>
			</div>
		<% }else if(wb.getWishStatus().equals("DONE")){ %>
			<div class="ui secondary inverted green segment">
				<p>승인사유: <%= wb.getRjctReason() %></p>
				<p>처리날짜: <%= wb.getWishStatusDate() %></p>
			</div>
		<% } %>
	</td>
	</tr>
	<% }}else{ %>
	<tr>
	<td>신청 내역이 존재하지 않습니다.</td>
	</tr>
	<% } %>	
</table>
<!-- 내 신청 출력 끝 -->
<br>
<!-- 선택한 신청내역 삭제 버튼 -->
<input type="hidden" name="userid"	value="<%= loginMember.getUserId() %>">
<input type="hidden" name="currentPage" value="<%= currentPage %>">
<div align="left">
<button class="mini ui black button" style="font-size:9pt;" onclick="chkDel()">삭제</button></div>
</form>
<!-- 페이징 시작 -->
<% if(keyword == null){ %>
	<div id="pagebox" align="center" style="display:block;">
		<a href="/sori/wishbook.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/wishbook.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/wishbook.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/wishbook.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/wishbook.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/wishbook.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/wishbook.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/wishbook.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<% }else{ %> <!-- 검색시 페이징 -->
	<div id="pagebox" align="center" style="display:block;">
		<a href="/sori/wbsearch.my?page=1&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/wbsearch.my?page=1&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/wbsearch.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/wbsearch.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/wbsearch.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/wbsearch.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/wbsearch.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/wbsearch.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<% } %>	
<!-- 페이징 끝 -->
</section>

</div>
</body>
</html>