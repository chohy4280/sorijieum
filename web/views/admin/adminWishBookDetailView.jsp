<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wishbook.model.vo.WishBook" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	WishBook wb = (WishBook)request.getAttribute("wb");
	int currentPage = ((int)request.getAttribute("currentPage"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청도서 상세 내역</title>
</head>
<body>
<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">

	<!--신청도서 목록 시작-->
		<i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">《<%= wb.getWishBookTitle() %>》&nbsp;상세 내역</span>
        <br><br>
        
       <!-- 신청도서 상세내역 시작! -->
			<div class="listBoxBG" style="height: 500px; margin-top:0px;">
				<div class="listBox" >
				<a class="ui large teal label">상세내용</a>
				<br><br>
				<table class="listTable">
					<tr>
						<th width="15%">신청일</th><td width="35%"><%= wb.getWishDate() %></td>
						<th width="15%">신청자ID</th><td width="35%"><%= wb.getWishWriter() %></td>
					</tr>
					<tr>
						<th>도서명</th><td><%= wb.getWishBookTitle() %></td>
						<th>처리상태</th><td><% if(wb.getWishStatus().equals("WAIT")) { %>
											승인대기
											<% } else if(wb.getWishStatus().equals("DONE")) { %>
											승인완료
											<% } else { %>
											반려
											<% } %>
										</td>
					</tr>
					<tr>
						<th>저자명</th><td><%= wb.getWishBookAuthor() %></td>
						<th>처리일시</th><td><% if(wb.getWishStatusDate() == null) { %>
												&nbsp;
											<%} else { %>
												<%= wb.getWishStatusDate() %>
											<%} %>
										</td>
					</tr>
					<tr>
						<th>출판사명</th><td><% if(wb.getWishPublisher() == null) { %>
												&nbsp;
											<%} else { %>
												<%= wb.getWishPublisher() %>
											<%} %></td>
						<th>처리자</th><td><% if(wb.getWishbookAdmin() == null) { %>
												&nbsp;
											<%} else { %>
												<%= wb.getWishbookAdmin() %>
											<%} %></td>
					</tr>
				</table>
				<br><hr><br>
				<a class="ui large teal label">관리자 처리</a><br><br>
				<form action="/sori/wbresult.ad" method="post">
					<input type="hidden" name="wishno" value="<%= wb.getWishNo() %>">
					<input type="hidden" name="wishbookadmin" value="<%= loginMember.getUserId() %>">
					<input type="hidden" name="page" value=<%=currentPage %>>
					<table class="listTable">
					<tr>
						<th width="15%">처리상태</th>
						<td width="85%"><div align="left">　
						<% if(wb.getWishStatus().equals("DONE")) { %>
							<input type="radio" name="wishstatus" value="DONE" checked>　승인&emsp;&nbsp;
							<input type="radio" name="wishstatus" value="RJCT">　반려
						<% } else if(wb.getWishStatus().equals("RJCT")) { %>
							<input type="radio" name="wishstatus" value="DONE">　승인 &emsp;&nbsp;
							<input type="radio" name="wishstatus" value="RJCT" checked>　반려
						<% } else {%>
							<input type="radio" name="wishstatus" value="DONE">　승인 &emsp;&nbsp;
							<input type="radio" name="wishstatus" value="RJCT">　반려
						<% } %>
						</div></td>
					</tr>
					<tr>
						<th width="15%">코멘트</th><td width="85%"><textarea name="rjctreason" cols="130" rows="5"><% if(wb.getRjctReason() != null) { %><%= wb.getRjctReason() %><% } %></textarea>
						</td>
					</tr>
					</table>
					<br><br>
					<center>
						<div class="ui buttons">
							<input type="submit" button class="ui positive button"  style="width:100px" value="저장"></button>
						 	<div class="or"></div>
						  	<input type="reset" class="ui button" style="width:100px" value="초기화"></button>
						</div>
					</center>
				</form>
				<br>
				<div align="center"><button class="small ui teal button" onclick="javascript:history.back();">◀BACK</button></div>
				</div>
			</div>
				
			<!-- 신청도서 상세내역 끝! -->
       <!-- 회원 목록 끝! -->

</section>
<%}else{ %>
<%} %>

</body>
</html>

</body>
</html>