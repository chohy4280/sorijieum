<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="book.model.vo.BookDV" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	BookDV book = (BookDV)request.getAttribute("book");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서수정</title>
<script type="text/javascript">
$(function(){
	
	 //책소개 글자수 세기
	 $("#bookinfo").keyup(function(e){
		 var content = $(this).val();
		 $("#counter").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 1000자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 1000){
			 alert("최대 1000자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,1000));
			 $("#counter").html("( <span style='color:red;'>1000 </span>/ 최대 1000자)");
		 } 
		 
	 });
	
})//document ready...
</script>
</head>
<body>
<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 추가 시작-->
            <i class="big eraser icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서 수정</span>
            <br><br>
            <div class="lightgreyBox" style="height: 700px; align: center;">
            <form action="/sori/bup.ad" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="page" id="page" value="<%=currentPage%>">
            	<table class="addform">
					<tr>
						<th width="30%">도서명</th>
						<td><div class="ui input"><input type="text" name="booktitle" id="booktitle" value="<%=book.getBookTitle() %>" placeholder="책 제목 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">저자명</th>
						<td><div class="ui input"><input type="text" name="author" id="author" value="<%=book.getAuthor() %>"placeholder="저자명 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">출판사명</th>
						<td><div class="ui input"><input type="text" name="publisher" id="publisher" value="<%=book.getPublisher() %>" placeholder="출판사 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">출간일</th>
						<td><div class="ui input"><input type="date" name="pubdate" id="pubdate" value="<%=book.getPublishDate() %>" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">쪽수</th>
						<td><div class="ui input"><input type="text" name="bookpage" id="bookpage" value="<%=book.getBookPage() %>" placeholder="숫자만 입력" required></div></td>
					</tr>

					<tr>
						<th width="30%">도서코드</th>
						<td><%=book.getBookCode() %><div class="ui input">
						<input type="hidden" name="bookcode" id="bookcode" value="<%=book.getBookCode() %>"></div></td>
					</tr>
					
					<tr>
						<th width="30%">책 소개</th>
						<td><div class="ui input"><textarea name="bookinfo" id="bookinfo" placeholder="내용을 입력해주세요" cols="50" rows="10" required><%=book.getBookInfo() %></textarea></div>
						<br><span id="counter" style="color:#aaa;">( <span style="color:#4ecdc4">0</span> / 최대 1000자 )</span></td>
					</tr>
					
					<tr>
						<th width="30%">도서이미지</th>
						<td><%=book.getBookOimg() %>
						<input type="file" name="upbookoimg"></td>
						<input type="hidden" name="bookoimg" id="bookoimg" value="<%=book.getBookOimg() %>">
						<input type="hidden" name="bookrimg" id="bookrimg" value="<%=book.getBookRimg() %>">
					</tr>
					
					<tr>
						<th width="30%">도서원본파일</th>
						<td><%=book.getBookOpdf() %>
						<input type="file" name="upbookopdf"></td>
						<input type="hidden" name="bookopdf" id="bookopdf" value="<%=book.getBookOpdf() %>">
						<input type="hidden" name="bookrpdf" id="bookrpdf" value="<%=book.getBookRpdf() %>">
					</tr>
					
					<tr>
						<th width="30%">제작완료파일</th>
						<td><% if(book.getBookotxt() != null) {%>
							<%= book.getBookotxt() %>
							<% } else { %>
							현재 제작중
							<% } %>
						<input type="file" name="upbookotxt"></td>
						<input type="hidden" name="upbookotxt" id="upbookotxt" value="<%=book.getBookotxt() %>">
						<input type="hidden" name="upbookrtxt" id="upbookrtxt" value="<%=book.getBookrtxt() %>">
					</tr>
					<br>
				</table>
				<br><br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button" style="width:100px" value="수정"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
			</form>	
            </div>
    <!-- 도서 추가 끝! -->
    
    
            </section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>
</body>
</html>