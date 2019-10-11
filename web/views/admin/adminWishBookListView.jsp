<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	ArrayList<WishBook> list = (ArrayList<WishBook>)request.getAttribute("list");
%>
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
						<option value="bookname">도서명</option>
						<option value="username">신청자명</option>
						<option value="userid">신청자ID</option>
					</select>
					<input type="text" class="search" name="searchtypetext" id="searchtypetext" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					<br><br>
					
					<a class="ui large teal label">처리상태</a>&nbsp;
					<input type="radio" name="bookstate" value="all" checked> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="bookstate" value="wait"> 승인대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="bookstate" value="done"> 승인완료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="bookstate" value="rjct"> 반려
				

					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:200px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= list.size() %></span> 건</div>
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
						<% for(int i = list.size()-1; i >= 0 ; i--) {
							WishBook wb = list.get(i);
						%>
						<td><%= i+1 %></td>
						<td><%= wb.getWishDate() %></td>
						<td><a href="/sori/views/admin/adminWishBookDetailView.jsp"><%= wb.getWishBookTitle() %></a></td>
						<td><%= wb.getWishWriter() %></td>
						<td><%= wb.getWishStatus() %></td>
						<td><%= wb.getWishStatusDate() %></td>
						<td><%= wb.getWishbookAdmin() %></td>
					</tr>
					<% } %>
				</table>
				
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->




</section>

</body>
</html>