<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리</title>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">
	<!--회원 목록 시작-->
            <i class="big users icon"></i></i><span style="font:black; font-size:17pt; padding:10px;">권한관리</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 85px;">
            <form action="" method="post">
				<div style="float:left">
				<a class="ui large teal label">관리자정보</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
					</select>
					<input type="text" class="search" name="searchuserid" id="userid" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
					<input type="submit" value="검색">
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:90px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4">5</span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="2%"><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
						<th width="10%">아이디</th>
						<th width="13%">이름</th>
						<th width="15%">이메일</th>
						<th width="10%">전화번호</th>
						<th width="10%">관리자구분</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="RowCheck" value="getBookcode"></td>
						<td><a href="/sori/views/admin/adminUpdateForm.jsp">admin01</a></td>
						<td><a href="/sori/views/admin/adminUpdateForm.jsp">최민영</a></td>
						<td>my_choe@naver.com</td>
						<td>010-3330-3358</td>
						<td>대표관리자</td>

					</tr>
				</table>
				
				<br>
				<div style="float:left"><button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddForm.jsp'">추가</button>
				<button class="mini ui black button" onclick="">삭제</button></div>
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->


</section>
<!-- Content 끝! -->

</body>
</html>