<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, makebook.model.vo.adminMakeBook" %>
    
<%
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int istCount = ((Integer)request.getAttribute("listCount")).intValue();
	ArrayList<adminMakeBook> list = (ArrayList<adminMakeBook>)request.getAttribute("list");    
	String userid = (String)request.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 시맨틱 UI -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
 <!-- Custom CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/Admin.css">
	  <script src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<!-- 폰트변경 -->
	<style>
		@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
					 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
					 font-weight: normal; 
					 font-style: normal; }
		
		* { font-family: 'S-CoreDream-7ExtraBold';}
	</style>
<title>제작자 제작 참여 도서</title>
</head>
<body>

<!-- 제작도서 테이블 -->
					<br>
					<a class="big ui red tag label"><i class="mini book icon"></i><%= userid %>님 제작 도서</a>
					<div style="width:90%; height:auto; margin-left: 40px; margin-top: 20px">
					<table class="listTable">
					<tr>
						<th width="10%">No</th>
						<th width="30">도서명</th>
						<th width="30%">저자명</th>
						<th width="30%">출판사명</th>
					</tr>
					
					<%	if(list.size()!=0){
						for(int i = 0 ; i < list.size() ; i++){
							adminMakeBook mbbk = list.get(i);
					%>
					<tr>
						<td><%= currentPage * 10 - 9 + i %></td>
						<td><a href="/sori/bdetail.ad?bookcode=<%=mbbk.getBookCode() %>&page=1"><%= mbbk.getBookTitle() %></a></td>
						<td><%= mbbk.getAuthor() %></td>
						<td><%= mbbk.getPublisher() %></td>
					</tr>
					<%} %>
					</table>
					<br><br>
				        <!-- 페이징처리 시작 -->
							<div id="pagebox" align="center">
								<a href="/sori/mmblist.ad?page=1&userid=<%= userid %>"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/mmblist.ad?page=1&userid=<%= userid %>"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/mmblist.ad?userid=<%= userid %>&page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/mmblist.ad?userid=<%= userid %>&page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/mmblist.ad?userid=<%= userid %>&page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/mmblist.ad?userid=<%= userid %>&page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/mmblist.ad?userid=<%= userid %>&page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/mmblist.ad?userid=<%= userid %>&page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							<!-- 페이징 끝-->
					<%}else { %>
					<tr>
						<td colspan="4">제작한 도서가 없습니다.</td>
					</tr>
					</table>
					<%} %>
					</div>
</body>
</html>