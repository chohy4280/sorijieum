<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, mybook.model.vo.MyBookMYB"%>
<%
	ArrayList<MyBookMYB> myblist = (ArrayList<MyBookMYB>)request.getAttribute("myblist");
	int beginPage = (Integer)request.getAttribute("beginPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int maxPage = (Integer)request.getAttribute("maxPage");
	int listcount = (Integer)request.getAttribute("listCount");
	String keyword = (String)request.getAttribute("keyword");
	String type = (String)request.getAttribute("type");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 내서재</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/../inc/cdn.jsp"%>
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
		if($("input[name='delChk']:checked").length == <%= myblist.size() %>){
			$("#allChk").prop("checked", true);
		}else{
			$("#allChk").prop("checked", false);
		}	
	});
	
	$(".progress").each(function(){
		var perc = $(this).attr("id");
		if(perc == 100)
			$(this).attr('class','ui green large progress');
		$(this).progress({
			percent: perc
		});
	});
	
	<% if(myblist.size() == 0){ %>
		$("#pagebox").css("display","none");
	<% } %>
	
	$("#type").on("keyup",function(event){
		if (event.keyCode == 38) {
			$("#keyword").focus();
			audio.pause();
			audio = new Audio("/sori/resources/mp3/mybook/mybook_searchT.mp3");
			audio.play();
		}
		else if (event.keyCode == 40) {
			$("#keyword").focus();
			audio.pause();
			audio = new Audio("/sori/resources/mp3/mybook/mybook_searchA.mp3");
			audio.play();
		}
	});
});

var audio = new Audio("/sori/resources/mp3/mybook/mybook_main.mp3");
window.onload = function(){
	<% if(keyword == null && currentPage == 1){ %>
		audio.play();
		$("#type").focus();
	<% }else if(keyword == null && currentPage != 1){ %>
		speech(<%= currentPage %> + " 페이지 입니다.");
	<% } %>
}

window.onkeyup = function(){
	if(event.keyCode == 17 || event.keyCode == 25){
		audio.pause();
		audio = new Audio("/sori/resources/mp3/mybook/mybook_list.mp3");
		audio.play();
		audio.addEventListener("ended", function(e) {
			var focusImg = "";
			var text = "";
			for(var i=1; i<4; i++){
				$("#"+i+"tr").focus();
				text = document.getElementById(i+"info").value;
				if(i==1)
					speech("일번, "+text);
				else if(i==2)
					speech("이번, "+text);
				else if(i==3)
					speech("삼번, "+text);
			}
		});
	}
	else if(event.keyCode == 27){
		audio.pause();
		audio = null;
	}
	else if(event.keyCode == 37){
		<% if(keyword == null){ %>
			location.href="/sori/mybook.my?page=<%= currentPage-1  %>&userid=<%= loginMember.getUserId() %>";
		<% }else{ %>
			location.href="/sori/mybserach.my?page=<%= currentPage-1 %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>";
		<% } %>
	}
	else if(event.keyCode == 39){
		<% if(keyword == null){ %>
		location.href="/sori/mybook.my?page=<%= currentPage+1  %>&userid=<%= loginMember.getUserId() %>";
		<% }else{ %>
			location.href="/sori/mybserach.my?page=<%= currentPage+1 %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>";
		<% } %>
	}
}
</script>
<style type="text/css">
.wrap { position:relative; }
.over { 
	position:absolute;
	bottom:15%;
	left:40%;
}
</style>
</head>
<body>
<div class="hy-div">
<section class="hy-section2" >
<div style="display:flex;justify-content:space-between;">
<div>
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/mybook.my?userid=<%= loginMember.getUserId() %>">내 서재</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">내가 읽은 도서 목록</span>
</div>
<!-- 검색창 시작 -->
<div style="margin-top:20px;">
<form action="/sori/mybserach.my" method="post">
<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>">
<% if(type == null || type.equals("title")){ %>
	<select class="ui mini simple dropdown" name="type" id="type" style="border-radius:5px;">
		<option value="title" selected>도서명</option>
		<option value="author">저자명</option>
	</select>
<% }else{ %>
	<select class="ui mini simple dropdown" name="type" id="type" style="border-radius:5px;">
		<option value="title">도서명</option>
		<option value="author" selected>저자명</option>
	</select>
<% } %>
<% if(keyword != null) { %>
	<input type="text" name="keyword" id="keyword" value="<%= keyword %>" style="width:200px;">
<% }else{ %>
	<input type="text" name="keyword" id="keyword" placeholder="검색하실 내용을 입력하세요" style="width:200px;">
<% } %>		
	<input class="ui tiny basic black button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
</form>
</div>
</div>
<br><br>
<!-- 내 도서 목록 출력 -->
내가 읽은 책: <%= listcount %> 권
<form action="/sori/mybdel.my" method="post">
<table class="hy-listTable" align="center">
	<tr>
		<th width="5%"><input type="checkbox" class="chkbox" id="allChk"></th>
		<th width="25%"></th>
		<th width="70%"></th>
	</tr>
	<% if(myblist.size() > 0){ %>
	<% for(int i=0; i<myblist.size(); i++){  %>
	<%	MyBookMYB myb = myblist.get(i); %>
	<tr id="<%= i+1 %>tr">
		<input type="hidden" id="<%= i+1 %>info" value="책제목 <%= myb.getBooktitle() %>, 저자명 <%= myb.getAuthor() %>">
		<td><input type="checkbox" class="chkbox" name="delChk" value="<%= myb.getBookcode() %>"></td>
		<td class="bimg" id="<%= myb.getBookcode() %>">
		<a href="/sori/bsdetail?bookcode=<%= myb.getBookcode() %>&userid=<%= loginMember.getUserId() %>" style="color:#6d6d6d;">
			<div style="width:100%;height:300px;">
				<img src="/sori/resources/book_upfiles/<%= myb.getBookrimg() %>" alt="<%= myb.getBooktitle() %>" style="width:100%;height:100%;">
			</div>
		</a>
		</td>
		<td style="text-align:left;">
			<div class="content" style="margin-left:5%;">
				<div style="font-size:30pt;">
					<%= myb.getBooktitle() %>
				</div><br>
				<div class="meta" style="font-size:20pt;">
					<%= myb.getAuthor() %> 저 | <%= myb.getPublisher() %> | <%= myb.getPublishdate() %>
				</div><br><br>
				<% int per = (int)(((double)myb.getReadpage()/myb.getBookpage())*100); %>
				<div class="large ui yellow progress wrap" id="<%= per %>" style="height:40px;">
					<div class="bar"></div>
					<div class="over" style="color:black;">&emsp;<%= myb.getReadpage() %> / <%= myb.getBookpage() %> 쪽 </div>
				</div>
			</div>
		</td>
	</tr>
	<% }}else{ %>
	<tr>
	<td colspan="3">신청 내역이 존재하지 않습니다.</td>
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
		<a href="/sori/mybook.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/mybook.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/mybook.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/mybook.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/mybook.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/mybook.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/mybook.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/mybook.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<% }else{ %> <!-- 검색했을 때 페이징 -->
	<div id="pagebox" align="center" style="display:block;">
		<a href="/sori/mybserach.my?page=1&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/mybserach.my?page=1&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/mybserach.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/mybserach.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/mybserach.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/mybserach.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/mybserach.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/mybserach.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&type=<%=type%>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<% } %>	
<!-- 페이징 끝 -->

</section>
</div>
</body>
</html>