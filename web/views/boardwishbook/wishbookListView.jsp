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
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
$(function(){
		showDiv();
		
		$("input[name=item]").on("click", function(){
			showDiv();
		});
	});
	
	function showDiv(){
		if($("input[name=item]").eq(0).is(":checked")){
			$("#titlediv").css("display", "block");
			$("#authordiv").css("display", "none");
		}
		
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titlediv").css("display", "none");
			$("#authordiv").css("display", "block");
		}

	}
</script>
<!-- CUSTOM CSS -->
<link rel="stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	<!--도서신청 시작-->
	<div class="my-content">
	<a class="massive ui yellow label" style="font-size: 30px">도서신청</a>
	<span style="color:#fbbe09; font-weight:600">│</span>
	<span style="color:grey">도서신청 게시판입니다</span>
		<br><br>
	<!-- 도서신청 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th width="5%">No</th>
				<th width="45%">도서명</th>
				<th width="15%">저자명</th>
				<th width="15%">신청자ID</th>
				<th width="10%">신청일</th>
				<th width="10%">진행사항</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++){
				WishBook wb = list.get(i);
				%>
			<tr>
				<td><%= i + 1%></td>
				<td><a href="/sori/views/boardwishbook/wishbookDetailView.jsp"
				style="color: #ffbf00;">
				<%= wb.getWishBookTitle() %></a></td>
				<td><%= wb.getWishBookAuthor() %></td>
				<td><%= wb.getWishWriter() %></td>
				<td><%= wb.getWishDate() %></td>
				<td><%= wb.getWishStatus() %></td>
			</tr>
			<% } %>
		</table>
	<!--도서신청 목록 끝-->
		<br>
		<div class="ye-label" align="right">
			<a class="big ui basic label" href="/sori/views/boardwishbook/mywishbookDetailView.jsp">나의신청내역</a>&nbsp;&nbsp;
			<a class="big ui basic label" href="/sori/views/boardwishbook/wishbookAddForm.jsp">신청하기</a>
		</div>
		<br>
	<!-- 페이징 시작 -->
		<div id="pagebox" align="center">
		<a href="/sori/wblist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
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
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/wblist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/wblist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/wblist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
	<!-- 페이징 끝 -->
<br><hr><br>
	<!-- 검색창 시작 -->
		<center>
		<div class="ui checkbox">
			  <input type="checkbox" name="item" value="title" checked><label>도서명</label>
			</div> &nbsp;&nbsp;&nbsp;
			<div class="ui checkbox">
			 <input type="checkbox" name="item" value="author"><label>저자명</label>
			</div>	
		<br><br>
		<div id="titlediv">
			<form action="" method="post">
			<div class="ui small input">
				<input type="hidden" name="search" value="title">
				<input type="search" name="keyword" placeholder="검색하실 도서명을 입력하세요" style="font-family:'S-Core Dream 5';width:250px;">
			</div>
			<input class="ui tiny basic button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
			</form>
		</div>
		<div id="authordiv">
			<form action="" method="post">
			<div class="ui small input">
				<input type="hidden" name="search" value="author">
				<input type="search" name="keyword" placeholder="검색하실 저자명을 입력하세요" style="font-family:'S-Core Dream 5';width:250px;">
			</div>
			<input class="ui tiny basic button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
			</form>
		</div>
		</center>
	<!-- 검색창 끝 -->
	</div>
	<!--도서신청 끝-->
	</section>
	<!-- Content 끝! -->
</body>
</html>