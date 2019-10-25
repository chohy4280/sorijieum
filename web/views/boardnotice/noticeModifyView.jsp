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
		<br><br>
	<!-- 공지사항 목록 시작 -->
	<form action = "/sori/nomidi" method = "post" enctype= "multipart/form-data">
	<input type= "hidden" name="noticeno" value="<%= notice.getNoticeNo() %>"> <!-- 값은 전송은 가지만 안보이게 한다. -->
<input type="hidden" name="ofile" value="<%= notice.getNoticeOfile() %>">
<input type="hidden" name="rfile" value="<%= notice.getNoticeRfile() %>"> 
		<table class="my-listTable" align="center">
			<tr>
			
				<th colspan="4" style="height:60px; font-size: 25px;"><input type="text" name = "noticetitle" placeholder="공지사항 제목" 
				value="<%= notice.getNoticeTitle() %>" style="width:700px;"></th>
			</tr>
			<tr style="height:20px; font-size: 12px;">
				<td><input type= "text" name = "noticewriter" placeholder="공지사항 작성자" value="<%= notice.getNoticeWriter() %>"></td>
				<td><input type="date" name="noticedate" placeholder= "YYYY/MM/DD" value="<%= notice.getNoticeDate() %>"></td>
				<td><%= notice.getNoticeViews() %></td>
				<td><% if(notice.getNoticeRfile() !=null && !notice.getNoticeOfile().equals("null")){ %>
           <a href="/sori/nfdown?ofile=<%= notice.getNoticeOfile() %>
           &rfile=<%= notice.getNoticeRfile() %>">
           <%= notice.getNoticeOfile() %></a>
           <% }else{ %>
                 첨부파일 없음
                  <% } %><br>
                  
                  </td>
			</tr>	
			
		</table>
		
		<div class="my-boardcontent">
		<textarea name="content" cols="150" rows="14"><%= notice.getNoticeContent() %>
		</textarea></div>
		
		<div align="right">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" value="수정" style="width:80px"></button>
			</div>
			</div>
			
		</form>
	
	<!--공지사항 목록 끝-->
	
	
	
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui button" onclick = "javascript:history.go(-1);return false">
		    이전
		  </button>
		</div>
		</center>


	</div>
	<!--공지사항 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>