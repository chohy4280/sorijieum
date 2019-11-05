<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice, java.util.ArrayList"%>
    <%
    Member mb = (Member)request.getAttribute("mb");
    Notice notice = (Notice)request.getAttribute("notice");
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시글 보기</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
  <script type="text/javascript">

</script>
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
		<br>
	<!-- 공지사항 수정 시작 -->
	<form action = "/sori/nomidi" method = "post" enctype= "multipart/form-data">
<input type= "hidden" name="noticeno" value="<%= notice.getNoticeNo() %>"> <!-- 값은 전송은 가지만 안보이게 한다. -->
<input type="hidden" name="ofile" value="<%= notice.getNoticeOfile() %>">
<input type="hidden" name="rfile" value="<%= notice.getNoticeRfile() %>"> 
		<!-- 공지사항 수정 테이블 -->
		<table class="my-listTable" align="center">
			<tr><th colspan="4" style="height:60px; font-size: 25px;"><input type="text" name = "noticetitle" placeholder="공지사항 제목" 
				value="<%= notice.getNoticeTitle() %>" style="width:700px;"></th></tr>
			<tr style="height:32px; font-size: 17px;">
				<td><%= loginMember.getUserId() %></td>
				<td><input type="date" name="noticedate" placeholder= "YYYY/MM/DD" value="<%= notice.getNoticeDate() %>"></td>
				<td><%= notice.getNoticeViews() %></td>
				<td><% if(notice.getNoticeRfile() !=null && !notice.getNoticeOfile().equals("null")){ %>
           <a href="/sori/nfdown?ofile=<%= notice.getNoticeOfile() %>
           &rfile=<%= notice.getNoticeRfile() %>">
           <%= notice.getNoticeOfile() %></a>
           <td> <input type="file" name="upfile" placeholder= "파일첨부"></td></tr>	
                  <% } %>			
		</table>
		<div class="my-boardcontent">
		<textarea name="content" cols="150" rows="14"><%= notice.getNoticeContent() %>
		</textarea></div>
		<!-- 공지사항 수정 테이블 끝-->
		<!-- 공지사항 수정 버튼 -->
		<div align="right">
		<div class="ui buttons">
		<input type="submit" class="ui positive button" value="수정" style="width:80px">
			</div>
			</div>
			<!-- 공지사항 수정 버튼 -->
		</form>
     <!--공지사항 수정 끝-->
	
	<!-- 페이지 이동 버튼 시작 -->
		<center>
			<div class="ui buttons">
		  <button class="ui button" onclick = "javascript:history.go(-1);return false">
		    이전
		  </button>
		</div>
		</center>
    <!-- 페이지 이동 버튼  끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>