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
<title>신청도서 상세 보기</title>
<%@ include file="/../inc/top.jsp" %>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
$(function(){
		$("#delbutton").on("click", function(){
			alert("정말 삭제하시겠습니까?");
		});
	});
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
				<th width="20%">제목</th><td width="80%"><%= wb.getWishBookTitle() %></td>
			</tr>
			<tr>
				<th>저자</th><td><%= wb.getWishBookAuthor() %></td>
			</tr>
			<tr>
			<% if(wb.getWishPublisher() != null){ %>
				<th>출판사</th><td><%= wb.getWishPublisher() %></td>
			<% }else{ %>
				<th>출판사</th><td>미작성</td>
			<% } %>
			</tr>
			<tr>
			<% if(wb.getWishPublishDate() != null){ %>
				<th>출판일</th><td><%= wb.getWishPublishDate() %></td>
			<% }else{ %>
				<th>출판일</th><td>미작성</td>
			<% } %>
			</tr>
			<tr>
				<th>신청자</th><td><%= wb.getWishWriter() %></td>
			</tr>
			<tr>
				<th>신청일</th><td><%= wb.getWishDate() %></td>
			</tr>
		</table>
	</center>
	<!-- 도서신청 상세 내역 끝-->
	<% if(loginMember != null && loginMember.getUserId().equals(wb.getWishWriter())){ %>
	<!-- 관리자/작성자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="location.href='/sori/wbuview?wishno=<%= wb.getWishNo() %>'">수정</button>
		  	<div class="or"></div>
			<button id="delbutton" class="ui button" onclick="location.href='/sori/wbdel?wishno=<%= wb.getWishNo() %>'">삭제</button>
		</div>
	</div>
	<% }else if(loginMember != null && loginMember.getUserId().substring(0, 5).equals("admin")){ %>
	<!-- 관리자/작성자 수정삭제 버튼 -->
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
		  <button class="ui labeled icon button">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button" onclick="location.href='/sori/wblist'">
		    목록
		  </button>
		  <button class="ui right labeled icon button">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center>


	</div>
	<!--도서신청 내용 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>