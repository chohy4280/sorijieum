<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리</title>
</head>

<body>

<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 목록 시작-->
            <i class="big edit icon"></i><span style="font:black; font-size:17pt; padding:10px;">문의글 관리</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 80px;">
            <form action="" method="post">
				<div>
				<a class="ui large teal label">검색조건</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 130px;">
						<option value="title">제목</option>
						<option value="username">이름</option>
						<option value="userid">아이디</option>
					</select>
					<input type="text" class="search" name="searchtypetext" id="searchtypetext" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<a class="ui large teal label">답변여부</a>&nbsp;
					<input type="radio" name="replystate" value="all" checked> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="replystate" value="bookwait"> 답변전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="replystate" value="bookmake"> 답변완료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="검색">
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			
			<!-- 게시글 검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:90px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4">30</span> 건</div>
				<br>
				<table class="listTable">
				<tr>
				<th colspan="7" align="left">
				&nbsp;&nbsp;선택한 항목을
				<button class="mini ui grey button" onclick="">삭제</button></th>
				</tr>
					<tr>
						<th width="3%"><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
						<th width="5%">No</th>
						<th width="35%">제목</th>
						<th width="12%">답변여부</th>
						<th width="15%">작성자</th>
						<th width="10%">작성일</th>
						<th width="5%">조회수</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="RowCheck" value="getBookcode"></td>
						<td>1</td>
						<td align="left"><a href="">팩스 확인해주세요</a></td>
						<td>답변완료</td>
						<td>홍길동(user001)</td>
						<td>2019/06/01</td>
						<td>4</td>
					</tr>
				</table>
				
				<br>
				</div>
			</div>
				
			<!-- 게시물 결과 리스트 끝! -->
       <!-- 게시물 목록 끝! -->
       

</section>
<!-- Content 끝! -->

</body>
</html>