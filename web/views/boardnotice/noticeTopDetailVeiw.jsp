<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice, java.util.ArrayList"%>
    <%
    Notice notice = (Notice)request.getAttribute("notice");
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시글 보기</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	
	<!--공지사항 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">공지사항</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 공지사항입니다</span>
		<br><br>
	<!-- 공지사항 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
			
				<th colspan="3" style="height:60px; font-size: 25px;"><a href="/sori/ntopfix?no=<%= notice.getNoticeNo() %>"><%= notice.getNoticeTitle() %></a></td>
			</tr>
			<tr style="height:20px; font-size: 12px;">
				<td><%= notice.getNoticeWriter() %></td>
				<td><%= notice.getNoticeDate() %></td>
				<td><%= notice.getNoticeViews() %></td>
			</tr>	
			
		</table>
		<div class="my-boardcontent">
		<%= notice.getNoticeContent() %>
		</div>
		
		
	
	<!--공지사항 목록 끝-->
	
	<!-- 관리자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="">수정</button>
		  	<div class="or"></div>
			<button class="ui button" onclick="">삭제</button>
		</div>
	</div>
	
	
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui labeled icon button">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button">
		    목록
		  </button>
		  <button class="ui right labeled icon button">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center>


	</div>
	<!--공지사항 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>