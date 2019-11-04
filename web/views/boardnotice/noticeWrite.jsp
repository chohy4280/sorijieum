<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<section class="my-section">

<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">공지사항</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 공지사항입니다</span>
		<br><br>
		</div>

<form action="/sori/nwrite" method="post" enctype="multipart/form-data"> <!-- 파일을 첨부할때는 무조건 post 방식 -->
<table class= "yu-noticeWrite" align="center" width="600" height="400" border="1" cellspacing= "0" cellpadding="5">
<tr><th>제목</th><td><input type="text" name="title" size="50"></td></tr>
<tr><th>작성자</th><td><input type="text" name="writer"></td></tr>
<tr><th>파일첨부</th><td><input type="file" name="upfile"></td></tr>
<tr><th>내용</th><td><textarea name="content" rows="5" cols="50"></textarea></td></tr>
<tr><th colspan="2">
      <input type="submit" value="등록하기"> &nbsp;
      <input type="reset" value="취소"> &nbsp;
      <input type="button" value="목록" onclick="location.href='noticeListView.jsp'">
</th></tr>
</table>
</form>
</section>
</body>
</html>