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
		</div>

<form action="/sori/nwrite" method="post" enctype="multipart/form-data"> <!-- 파일을 첨부할때는 무조건 post 방식 -->
<table class="my-listTable" align="center">
			<tr>
			
				<th colspan="4" style="height:60px; font-size: 25px;"><input type="text" name = "noticetitle" placeholder="공지사항 제목" 
				style="width:700px;"></th>
			</tr>
			<tr style="height:32px; font-size: 17px;">
				<td><input type= "text" name = "noticewriter" placeholder="공지사항 작성자"></td>
				<td><input type="date" name="noticedate" placeholder= "YYYY/MM/DD" ></td>
				<td> <input type="file" name="upfile" placeholder= 파일첨부></td></tr>	
		</table>	
			<div class="my-boardcontent">
		<textarea name="content" cols="150" rows="14"></textarea></div>
      <input type="submit" value="등록하기"> &nbsp;
     <input type="button" value="목록" onclick="location.href='noticeListView.jsp'">
</form>
</section>
</body>
</html>