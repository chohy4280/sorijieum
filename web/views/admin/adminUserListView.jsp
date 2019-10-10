<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">

	<!--회원 목록 시작-->
		<i class="big user icon"></i><span style="font:black; font-size:17pt; padding:10px;">회원정보조회</span>
        <br><br>
        
        <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 180px; overflow: hidden;">
            <form action="" method="post">
				<div>
				<a class="ui large teal label">개인정보</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
						<option value="phone">전화번호</option>
					</select>
					<input type="text" class="search" name="searchtypetext" id="searchtypetext" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					<br><br>


				<a class="ui large teal label">성　　별</a>&nbsp;
					<input type="radio" name="gender" value="A" checked> 전체 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="F"> 여성&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="M"> 남성
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<a class="ui large teal label">회원유형</a>&nbsp;
					<input type="radio" name="usertype" value="all" checked> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="usertype" value="wait"> 이용대기자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="usertype" value="hear"> 이용자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="usertype" value="make"> 제작자
					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:200px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4">30</span> 명</div>
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
						<td><a href="/sori/views/admin/adminUserDetailView.jsp">홍길동</a></td>
						<td><a href="/sori/views/admin/adminUserDetailView.jsp">user01</a></td>
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