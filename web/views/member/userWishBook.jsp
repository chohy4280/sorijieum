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
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 신청도서</title>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script> -->
<%@ include file="/inc/memberSide.jsp"%>
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
	
	//반려 버튼 클릭시 반려사유 출력
	$(".rjctbtn").click(function(){
		var id = $(this).attr("id");
		if($("#"+id+"rjct").css("display") == "none")
			$("#"+id+"rjct").css("display","table-row");
		else
			$("#"+id+"rjct").css("display","none");
	});
	
	//승인 버튼 클릭시 승인사유 출력
	$(".donebtn").click(function(){
		var id = $(this).attr("id");
		if($("#"+id+"done").css("display") == "none")
			$("#"+id+"done").css("display","table-row");
		else
			$("#"+id+"done").css("display","none");
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
});
</script>
</head>
<body>
<div class="hy-div">
<section class="hy-section2" >
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/wishbook.my?userid=<%= loginMember.getUserId() %>">내 신청도서</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">내 신청도서 목록</span><br>
<!-- 내 신청도서 알림은 답변 날짜로부터 일주일까지 표시 -->
<% if(alarmlist != null){ %>
<% for(WishBook wb: alarmlist){ %>
<div class="ui yellow message hy-alarmdiv" id="div_<%= wb.getWishNo() %>" style="display:block;">
	<a href="/sori/wbdview?wishno=<%= wb.getWishNo() %>" style="color:#AE7651;">
	신청한 "<%= wb.getWishBookTitle() %>" 도서에 대해 처리 상태가 업데이트됐습니다.</a>
	<i class="close icon" id="<%= wb.getWishNo() %>"></i>
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
			<div class="mini ui red button rjctbtn" id="<%= wb.getWishNo() %>">반려</div>
		</div>
		<% } else if(wb.getWishStatus().equals("WAIT")){ %>
		대기
		<% } else { %>
		<div class="some-wrapping-div">
			<div class="mini ui green button donebtn" id="<%= wb.getWishNo() %>">승인</div>
		</div>
		<% } %>
		</td>
	</tr>
	<tr id="<%= wb.getWishNo() %>rjct" style="display:none;" border="0">
	<td colspan="7" style="text-align:right;">
		<div class="ui secondary inverted red segment">
			<p>반려사유: <%= wb.getRjctReason() %></p>
			<p>처리날짜: <%= wb.getWishStatusDate() %></p>
		</div>
	</td>
	</tr>
	<tr id="<%= wb.getWishNo() %>done" style="display:none;" border="0">
	<td colspan="7" style="text-align:right;">
		<div class="ui secondary inverted green segment">
			<p>승인사유: <%= wb.getRjctReason() %></p>
			<p>처리날짜: <%= wb.getWishStatusDate() %></p>
		</div>
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
<div id="pagebox" align="center">
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
<!-- 페이징 끝 -->
</section>
</div>
</body>
</html>