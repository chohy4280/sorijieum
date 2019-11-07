<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice, java.util.ArrayList"%>
    <%
    Member mb = (Member)request.getAttribute("mb");
    Notice notice = (Notice)request.getAttribute("notice");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
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
		<a class="massive ui yellow label" style="font-size: 30px" href="/sori/nlist">공지사항</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 공지사항입니다</span>
		<br><br>
<center>
	<!-- 공지사항 수정 시작 -->
	<form action="/sori/nomidi" method="post" enctype="multipart/form-data"> <!-- 파일을 첨부할때는 무조건 post 방식 -->
	<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>"> <!-- 작성자 아이디 -->
	<input type= "hidden" name="noticeno" value="<%= notice.getNoticeNo() %>"> <!-- 값은 전송은 가지만 안보이게 한다. -->
	<input type="hidden" name="ofile" value="<%= notice.getNoticeOfile() %>">
	<input type="hidden" name="rfile" value="<%= notice.getNoticeRfile() %>"> 
	<input type="hidden" name="page" value="<%=currentPage%>">
	
	<table class="my-listTable5" style="width:45%;">
		<tr>
			<th width="30%">제목</th>
			<td width="70%">
				<div class="ui form">
				<div class="field">
				<textarea rows="1" name="title" id="title" autofocus="autofocus"  style="resize:none;" required>
					<%= notice.getNoticeTitle() %>
				</textarea>
				</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><div class="ui form">
			  <div class="field">
			    <textarea name="content" id="content" style="margin-top:0px;margin-bottom:0px;height:300px;resize:none;" onfocusin="write_content()" required>
			    	<%= notice.getNoticeContent() %>
			    </textarea>
			  </div>
			  </div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left"> 
			<% if(notice.getNoticeOfile() != null){ %>
				<%= notice.getNoticeOfile() %>
			<% }else{ %>
				첨부파일 없음
			<% } %>
			 -> <input type="file" name="upfile">
			</td>
		</tr>
	</table>
	<div align="center">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" style="width:100px" value="공지 수정"></button>
			<div class="or"></div>
			<input type="reset" class="ui button" style="width:100px" value="취소"></button>
		</div>
	</div>
</form>
     <!--공지사항 수정 끝-->
</center>	
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