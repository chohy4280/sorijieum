<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.model.vo.BookDV" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	BookDV book = (BookDV)request.getAttribute("book");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 추가 시작-->
            <i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">《<%= book.getBookTitle() %>》 상세 내역</span>
            <br><br>
            <div class="lightgreyBox" style="height: 700px; align: center;">
            	<table class="detailform">
					<tr>
						<th width="30%">도서명</th>
						<td><%= book.getBookTitle() %></td>
					</tr>
					
					<tr>
						<th width="30%">저자명</th>
						<td><%= book.getAuthor() %></td>
					</tr>
					
					<tr>
						<th width="30%">출판사명</th>
						<td><%= book.getPublisher() %></td>
					</tr>
					
					<tr>
						<th width="30%">출간일</th>
						<td><%= book.getPublishDate() %></td>
					</tr>
					
					<tr>
						<th width="30%">쪽수</th>
						<td><%= book.getBookPage() %> 쪽</td>
					</tr>

					<tr>
						<th width="30%">도서코드</th>
						<td><%= book.getBookCode() %></td>
					</tr>
					
					<tr>
						<th width="30%">책 소개</th>
						<td><%= book.getBookInfo() %></div></td>
					</tr>
					
					<tr>
						<th width="30%">도서이미지</th>
						<td><a href="/sori/bfdown.ad?bookoimg=<%= book.getBookOimg() %>&bookrimg<%= book.getBookRimg() %>"><%= book.getBookOimg() %></a></td>
					</tr>
					
					<tr>
						<th width="30%">도서원본파일</th>
						<td><a href="/sori/bfdown.ad?bookopdf=<%= book.getBookOpdf() %>&bookrpdf<%= book.getBookRpdf() %>"><%= book.getBookOpdf() %></a></td>
					</tr>
					
					<tr>
						<th width="30%">제작완료파일</th>
						<td><%if(book.getBookotxt() == null){ %>
							현재 제작중
							<%} else { %>
							<a href="/sori/bfdown.ad?bookotxt=<%= book.getBookotxt() %>&bookrtxt<%= book.getBookrtxt() %>"><%= book.getBookotxt() %></a>
							<% } %>
						</td>
					</tr>
					
					<br>
				</table>
				<br><br>
				<center>
					<button class="small ui teal button" href="">수정</button> &nbsp; <button class="small ui teal button" href="javascript:go(-1)">◀BACK</button><br><br><br>
					<button class="small ui red button" href="">도서삭제</button>
				</center>
            </div>
    <!-- 도서 추가 끝! -->
    
    
            </section>
<!-- Content 끝! -->
</body>
</html>