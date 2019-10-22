<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.model.vo.BookDV" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	BookDV book = (BookDV)request.getAttribute("book");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function delBtn(){
		var result = confirm("'<%= book.getBookTitle() %>' 도서를 삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.");
		if(result){
			location.href='/sori/bdel.ad?bookcode=<%= book.getBookCode() %>';
			alert("도서 삭제가 완료되었습니다.");
			location.href="/sori/blist.ad?page=<%= currentPage %>";
		}
			return false;
		}
</script>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 추가 시작-->
            <i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">《<%= book.getBookTitle() %>》 상세 내역</span>
            <br><br>
            <div class="lightgreyBox" style="height: 800px; align: center;">
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
					<button class="small ui teal button" href="/sori/bup.ad?bookcode=<%=book.getBookCode() %>&page="<%= currentPage %>">수정</button> &nbsp; 
					<button class="small ui teal button" onclick="javascript:history.back();">◀BACK</button><br><br><br>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
					<button class="small ui red button" onclick="return delBtn();">도서삭제</button>
					<% } %>
				</center>
            </div>
    <!-- 도서 추가 끝! -->
    
    
            </section>
<!-- Content 끝! -->
</body>
</html>