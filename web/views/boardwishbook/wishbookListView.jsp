<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%
	ArrayList<WishBook> list = (ArrayList<WishBook>)request.getAttribute("list");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서신청</title>
<!-- CUSTOM CSS -->
<link rel="stylesheet" type="text/css" href="/sori/resources/css/board.css">
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
$(function(){
		$(".ui.tiny").hover(function(){
			$(this).addClass("yellow");
		},function(){
			$(this).removeClass("yellow");
		});
		
		$(".ye-label .big.ui").hover(function(){
			$(this).removeClass("black");
			$(this).addClass("yellow");
		},function(){
			$(this).removeClass("yellow");
			$(this).addClass("black");
		});
		
	});
</script>

</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	<!--도서신청 시작-->
	<div class="my-content">
	<div style="display:flex;justify-content:space-between;">
	<div>
	<div class="massive ui yellow label" style="font-size: 30px">도서신청</div>
	<span style="color:#fbbe09; font-weight:600">│</span>
	<span style="color:grey">도서신청 게시판입니다</span>
	</div>
	<!-- 검색창 시작 -->
		<div style="margin-top:20px;">
		<form action="/sori/wbsearch" method="post">
		<select class="ui mini simple dropdown" name="search" id="search" style="border-radius:5px;">
			<option value="wishbooktitle">도서명</option>
			<option value="wishbookauthor">저자명</option>
		</select>
		<div class="ui small input">
			<input type="text" class="search" name="keyword" id="keyword" placeholder="검색하실 내용을 입력하세요" style="font-family:'S-Core Dream 5';width:250px;">
		</div>
			<input class="ui tiny basic black button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
		</form>
		</div>
		</div>
	<!-- 검색창 끝 -->
	<br>
	<!-- 도서신청 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th width="5%">No</th>
				<th width="40%">도서명</th>
				<th width="15%">저자명</th>
				<th width="15%">신청자ID</th>
				<th width="10%">신청일</th>
				<th width="10%">진행사항</th>
				<th width="5%">조회수</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++){
				WishBook wb = list.get(i);
				%>
			<tr>
				<td><%= i + 1%></td>
				<td><a href="/sori/wbdview?wishno=<%= wb.getWishNo() %>" style="color: #ffbf00;">
				<%= wb.getWishBookTitle() %></a></td>
				<td><%= wb.getWishBookAuthor() %></td>
				<td><%= wb.getWishWriter() %></td>
				<td><%= wb.getWishDate() %></td>
				<% if(wb.getWishStatus().equals("WAIT")){ %>
				<td>승인대기</td>
				<% }else if(wb.getWishStatus().equals("RJCT")){ %>
				<td>반려</td>
				<% }else if(wb.getWishStatus().equals("DONE")){ %>
				<td>승인</td>
				<% } %>
				<td><%= wb.getWishViews() %></td>
			</tr>
			<% } %>
		</table>
	<!--도서신청 목록 끝-->
		<br>
		<div class="ye-label" align="right">
			<a class="big ui basic black label" href="/sori/views/member/userWishBook.jsp">나의신청내역</a>&nbsp;&nbsp;
			<a class="big ui basic black label" href="/sori/views/boardwishbook/wishbookAddForm.jsp">신청하기</a>
		</div>
		<br>
		
	<!-- 페이징 시작 -->
<%-- 	<% if() %> --%>
		<div id="pagebox" align="center">
		<a href="/sori/wblist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 1) < 1){ %>
		<a href="/sori/wblist?page=1"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/wblist?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/wblist?page=<%= p %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/wblist?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage + 1) < maxPage){ %>
		<a href="/sori/wblist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/wblist?page=<%= endPage %>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/wblist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
	<%-- <% }else{ %>
	
	<% } %> --%>
	<!-- 페이징 끝 -->
<br>
	</div>
	<!--도서신청 끝-->
	</section>
	<!-- Content 끝! -->
</body>
</html>