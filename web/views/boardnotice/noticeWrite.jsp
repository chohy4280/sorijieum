<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Semantic UI CND -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<br><br><br><br><br><br>
<form action="" method="post" enctype="multipart/form-data"> <!-- 파일을 첨부할때는 무조건 post 방식 -->
<table class= "yu-noticeWrite" align="center" width="600" height="400" border="1" cellspacing= "0" cellpadding="5">
<tr><th>제목</th><td><input type="text" name="title" size="50"></td></tr>
<tr><th>작성자</th><td><input type="text" name="writer" readonly value=""></td></tr>
<tr><th>파일첨부</th><td><input type="file" name="upfile"></td></tr>
<tr><th>내용</th><td><textarea name="content" rows="5" cols="50"></textarea></td></tr>
<tr><th colspan="2">
      <input type="submit" value="등록하기"> &nbsp;
      <input type="reset" value="취소"> &nbsp;
      <input type="button" value="목록" onclick="location.href='noticeListView.jsp'">
</th></tr>
</table>
</form>
</body>
</html>