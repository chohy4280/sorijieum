<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서신청내역</title>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">

	<!--신청도서 목록 시작-->
		<i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서신청내역</span>
        <br><br>
        
        <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 180px;">
            <form action="" method="post">
				<div>
				<a class="ui large teal label">상세검색</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 150px;">
						<option value="">==조건선택==</option>
						<option value="bookname">도서명</option>
						<option value="username">신청자명</option>
						<option value="userid">신청자ID</option>
					</select>
					<input type="text" class="search" name="searchtypetext" id="searchtypetext" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					<br><br>
					
			<a class="ui large teal label">처리상태</a>&nbsp;
					<input type="checkbox" name="bookstate" value="all"> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="bookstate" value="wait"> 승인대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="bookstate" value="done"> 승인완료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="bookstate" value="rjct"> 반려

					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:200px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600">30</span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="2%"><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
						<th width="10%">회원유형</th>
						<th width="13%">이름</th>
						<th width="15%">아이디</th>
						<th width="10%">성별</th>
						<th width="20%">이메일</th>
						<th width="20%">전화번호</th>
						<th width="10%">가입일</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="RowCheck" value="getBookcode"></td>
						<td>이용자</td>
						<td><a href="">홍길동</a></td>
						<td><a href="">user01</a></td>
						<td>남</td>
						<td>hgildong@naver.com</td>
						<td>010-1234-5678</td>
						<td>2019/04/27</td>

					</tr>
				</table>
				
				<br>
				<div><button class="mini ui black button" onclick="">삭제</button></div>
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->




</section>

</body>
</html>