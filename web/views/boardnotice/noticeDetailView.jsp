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
			
				<th colspan="4" style="height:60px; font-size: 25px;"><a href="/sori/ndlist?no=<%= notice.getNoticeNo() %>"><%= notice.getNoticeTitle() %></a></td>
			</tr>
			<tr style="height:32px; font-size: 17px;">
				<td><%= notice.getNoticeWriter() %></td>
				<td><%= notice.getNoticeDate() %></td>
				<td><%= notice.getNoticeViews() %></td>
				<td>  <% if(notice.getNoticeRfile() !=null && !notice.getNoticeOfile().equals("null")){ %>
           <a href="/sori/nfdown?ofile=<%= notice.getNoticeOfile() %>
           &rfile=<%= notice.getNoticeRfile()  %>">
           <%= notice.getNoticeOfile() %></a>
           <% }else{ %>
                 첨부파일 없음
                  <% } %></td>
			</tr>	
			
		</table>
		<div class="my-boardcontent">
		<%= notice.getNoticeContent() %>
		</div>
	<!--공지사항 목록 끝-->
	
	<!-- 관리자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="location.href='/sori/nomtm?noticeno=<%= notice.getNoticeNo() %>'">수정</button>
		  	<div class="or"></div>
			<button class="ui button" onclick="location.href='/sori/ndelete?noticeno=<%= notice.getNoticeNo() %>&rfile=<%= notice.getNoticeRfile() %> '">삭제</button>
		</div>
	</div>
	<!--관리자 수정삭제 버튼 끝  -->
	
	<!-- 공통 페이지 이동 버튼 -->
	
		<center><br>
			<div class="ui buttons">
		  <button class="ui labeled icon button" onclick="location.href='/sori/ndlist?noticeno=<%= notice.getNoticeNo()-1 %>'">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button" onclick="location.href='/sori/nlist'">
		    목록
		  </button>
		  <button class="ui right labeled icon button" onclick="location.href='/sori/ndlist?noticeno=<%= notice.getNoticeNo()+1 %>'">
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