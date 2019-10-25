<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wishbook.model.vo.WishBook" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	ArrayList<WishBook> list = (ArrayList<WishBook>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	String searchtype = (String)request.getAttribute("searchtype");
	String keyword = (String)request.getAttribute("keyword");
	String wishstatus = (String)request.getAttribute("wishstatus");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서신청내역</title>
</head>
<body>
<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">

	<!--신청도서 목록 시작-->
		<i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서신청내역</span>
        <br><br>
        
        <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 180px;">
            <form action="/sori/wbslist.ad" method="post">
				<div>
				<a class="ui large teal label">상세검색</a>&nbsp;
				<% if(searchtype != null) {
					String[] select = new String[2];
					for(int i = 0 ; i < select.length; i++){
						switch(searchtype){
						case "wishbooktitle" : select[0] = "selected"; break;
						case "wishwriter" : select[1] = "selected"; break;
						}}
				%>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 150px;">
						<option value="wishbooktitle" <%= select[0] %>>도서명</option>
						<option value="wishwriter" <%= select[1] %>>신청자ID</option>
					</select>
				<% }else { %>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 150px;">
						<option value="wishbooktitle">도서명</option>
						<option value="wishwriter">신청자ID</option>
					</select>
				<%} %>
				
				<%if(keyword != null) {%>
					<input type="text" class="search" name="keyword" id="keyword" value="<%= keyword %>" style="border-radius: 10px; width: 400px;">
				<%}else{ %>
				<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
				<%} %>
					<br><br>
					
					<a class="ui large teal label">처리상태</a>&nbsp;
					<% if(wishstatus != null) {
					String[] check = new String[4];
					for(int i = 0 ; i < check.length; i++){
						switch(wishstatus){
						case "ALL" : check[0] = "checked"; break;
						case "WAIT" : check[1] = "checked"; break;
						case "DONE" : check[2] = "checked"; break;
						case "RJCT" : check[3] = "checked"; break;
						}
					}
				%>
					<input type="radio" name="wishstatus" value="ALL" <%=check[0] %>> 전체 &emsp;&emsp;
					<input type="radio" name="wishstatus" value="WAIT" <%=check[1] %>> 승인대기&emsp;&emsp;
					<input type="radio" name="wishstatus" value="DONE" <%=check[2] %>> 승인완료 &emsp;&emsp;
					<input type="radio" name="wishstatus" value="RJCT" <%=check[3] %>> 반려
				<%}else{ %>
					<input type="radio" name="wishstatus" value="ALL" checked> 전체 &emsp;&emsp;
					<input type="radio" name="wishstatus" value="WAIT"> 승인대기&emsp;&emsp;
					<input type="radio" name="wishstatus" value="DONE"> 승인완료 &emsp;&emsp;
					<input type="radio" name="wishstatus" value="RJCT"> 반려
				<%} %>

					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 500px; margin-top:180px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= listCount %></span> 건</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="5%">No.</th>
						<th width="10%">신청자ID</th>
						<th width="45%">도서명</th>
						<th width="10%">신청일</th>
						<th width="10%">처리상태</th>
						<th width="10%">처리자</th>
						<th width="10%">처리일시</th>
					</tr>
					
						<% if(list.size() != 0){
							for(int i = 0; i < list.size() ; i++) {
							WishBook wb = list.get(i);
						%>
					<tr>
						<td><%= currentPage * 10 - 9 + i%></td>
						<td><%= wb.getWishWriter() %></td>
						<td style="text-align: left"><a href="/sori/wbdetail.ad?wishno=<%= wb.getWishNo() %>&page=<%=currentPage%>"><%= wb.getWishBookTitle() %></a></td>
						<td><%= wb.getWishDate() %></td>
						<td><% if(wb.getWishStatus().equals("WAIT")) {%>
							승인대기
							<% } else if(wb.getWishStatus().equals("DONE")) {%>
							승인완료
							<% } else { %>
							반려
							<% } %>
						</td>
						<td><% if(wb.getWishbookAdmin() == null) { %>
							-
							<% } else { %>
							<%= wb.getWishbookAdmin() %>
							<% } %>
						</td>
						<td><% if(wb.getWishStatusDate() == null) { %>
							-
							<% } else { %>
							<%= wb.getWishStatusDate() %>
							<% } %>
						</td>
					</tr>
					<%} %>
					</table>
					<br>
				       <!-- 페이징처리 시작 -->
				       <%if(searchtype != null || keyword != null || wishstatus != null) {%>
							<div id="pagebox" align="center">
								<a href="/sori/wbslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/wbslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/wbslist.ad?page=<%= beginPage - 10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><i class="angle grey left icon"></i></a>
							<% } %>&emsp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/wbslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/wbslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&emsp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/wbslist.ad?page=<%= endPage +  10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><i class="angle grey right icon"></i></a>
							<% }else{ %>
								<a href="/sori/wbslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><i class="angle grey right icon"></i></a>
							<% } %>&emsp;
							<a href="/sori/wbslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&wishstatus=<%=wishstatus%>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
						<%} else { %>
							<div id="pagebox" align="center">
								<a href="/sori/wblist.ad?page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/wblist.ad?page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/wblist.ad?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&emsp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/wblist.ad?page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/wblist.ad?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&emsp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/wblist.ad?page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else{ %>
								<a href="/sori/wblist.ad?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&emsp;
							<a href="/sori/wblist.ad?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
						<%} %>
							<!-- 페이징 끝-->
					<% }else{ %>
					<tr><td colspan="7" style="color:#aaa">해당하는 신청내역이 없습니다.</td></tr>
					</table>
					<%} %>
				
				</div>
		
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->

</section>
<%}else{ %>
<%} %>

</body>
</html>