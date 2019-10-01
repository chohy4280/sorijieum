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
            <div class="greyBox" style="height: 200px;">
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
				<a class="ui large teal label">신 청 일</a>&nbsp;
					<input type="date" name="searchdate" value="from"> ~ <input type="date" name="searchdate" value="to">
				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
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
				<div>총 <span style="font-weight: 600">1</span> 건</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="5%">No</th>
						<th width="15%">신청일</th>
						<th width="25%">도서명</th>
						<th width="15%">신청자(ID)</th>
						<th width="10%">처리상태</th>
						<th width="15%">처리일시</th>
						<th width="15%">처리자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>2019/10/03</td>
						<td><a href="">보건교사 안은영</a></td>
						<td>박공주(user003)</td>
						<td>승인</td>
						<td>2019/10/04</td>
						<td>최민영(admin01)</td>

					</tr>
				</table>
				
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->




</section>

</body>
</html>