<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, quit.model.vo.Quit" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>

<%
	ArrayList<Quit> list = (ArrayList<Quit>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	String typenumber = (String)request.getAttribute("typenumber");
	String userid = (String)request.getAttribute("userid");
	String quittype = (String)request.getAttribute("quittype");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴관리</title>
</head>
<body>

<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">
	<!--회원 목록 시작-->
            <i class="big user times icon"></i><span style="font:black; font-size:17pt; padding:10px;">회원탈퇴관리</span>
            <span style="color:#aaa; font-size: 9pt;">개인정보 파기 의무에 따라 탈퇴회원의 상세정보 조회가 불가합니다. 탈퇴일로부터 30일 경과 후 자동 삭제됩니다.</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 85px;">
            <form action="/sori/qmslist.ad" method="post">
				<div style="float:left">
				<a class="ui large teal label">아이디</a>&nbsp;
				<% if(userid != null) {%>
					<input type="text" class="search" name="userid" id="userid" value="<%=userid %>" style="border-radius: 10px; width: 200px;">
				<%}else{ %>
					<input type="text" class="search" name="userid" id="userid" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
				<%} %>
				&emsp;&emsp;&emsp;&emsp;&emsp;
				
				<a class="ui large teal label">회원유형</a>&nbsp;
				<% if(typenumber != null) {
					String[] select = new String[5];
					for(int i = 0 ; i < select.length; i++){
						switch(typenumber){
						case "ALL" : select[0] = "selected"; break;
						case "1" : select[1] = "selected"; break;
						case "2" : select[2] = "selected"; break;
						case "3" : select[3] = "selected"; break;
						case "4" : select[4] = "selected"; break;
						}}
				%>
					<select class="search" name="typenumber" id="typenumber" style="border-radius: 10px; width: 160px;">
						<option value="ALL" <%= select[0] %>>전체</option>
						<option value="1" <%= select[1] %>>이용대기자</option>
						<option value="2" <%= select[2] %>>이용자</option>
						<option value="3" <%= select[3] %>>제작자</option>
						<option value="4" <%= select[4] %>>부관리자</option>
					</select>
				<%}else{ %>
					<select class="search" name="typenumber" id="typenumber" style="border-radius: 10px; width: 160px;">
						<option value="ALL">전체</option>
						<option value="1">이용대기자</option>
						<option value="2">이용자</option>
						<option value="3">제작자</option>
						<option value="4">부관리자</option>
					</select>
				<%} %>
					&emsp;&emsp;&emsp;&emsp;&emsp;
	
					
				<a class="ui large teal label">탈퇴유형</a>&nbsp;
				<% if(quittype != null) {
					String[] select = new String[3];
					for(int i = 0 ; i < select.length; i++){
						switch(quittype){
						case "ALL" : select[0] = "selected"; break;
						case "G" : select[1] = "selected"; break;
						case "F" : select[2] = "selected"; break;
						}}
				%>
					<select class="search" name="quittype" id="quittype" style="border-radius: 10px; width: 160px;">
						<option value="ALL" <%= select[0] %>>전체</option>
						<option value="G" <%= select[1] %>>일반탈퇴</option>
						<option value="F" <%= select[2] %>>강제탈퇴</option>
					</select>
				<%}else{ %>
				<select class="search" name="quittype" id="quittype" style="border-radius: 10px; width: 160px;">
						<option value="ALL">전체</option>
						<option value="G">일반탈퇴</option>
						<option value="F">강제탈퇴</option>
					</select>
				<%} %>
				&emsp;&emsp;
					<input type="submit" value="검색">
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 500px; margin-top:90px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= listCount %></span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="5%">No.</th>
						<th width="15%">아이디</th>
						<th width="15%">탈퇴유형</th>
						<th width="50%">탈퇴사유</th>
						<th width="15%">회원탈퇴일</th>
					</tr>
					<% if(list.size() != 0){
						for(int i = 0 ; i < list.size() ; i++){
						Quit q = list.get(i);
						%>
					<tr>
						<td><%= currentPage * 10 - 9 + i %></td>
						<td><%= q.getUserId() %></td>
						<td><% if(q.getQuitType().equals("F")) { %>
							강제탈퇴
							<% } else { %>
							일반탈퇴
							<% } %>
						</td>
						<td><%= q.getQuitReason() %></td>
						<td><%= q.getQuitDate() %></td>
					</tr>
					<%} %>
					</table>
					<br>
				 <!-- 페이징처리 시작 -->
				 	<%if(typenumber != null || userid != null || quittype != null) {%>
							<div id="pagebox" align="center">
								<a href="/sori/amslist.ad?page=1&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/qmslist.ad?page=1&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/qmslist.ad?page=<%= beginPage - 10 %>&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/qmslist.ad?page=<%= p %>&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/qmslist.ad?page=<%= p %>&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/qmslist.ad?page=<%= endPage +  10 %>&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/qmslist.ad?page=<%= maxPage %>&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/qmslist.ad?page=<%= maxPage %>&typenumber=<%=typenumber%>&userid=<%=userid%>&quittype=<%=quittype%>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							
							<%}else{ %>
							<div id="pagebox" align="center">
								<a href="/sori/adlist.ad?page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/qmlist.ad?page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/qmlist.ad?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/qmlist.ad?page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/qmlist.ad?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/qmlist.ad?page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/qmlist.ad?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/qmlist.ad?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							<%} %>
							<!-- 페이징 끝-->
					<% }else{ %>
					<tr><td colspan="5" style="color:#aaa">해당하는 회원이 없습니다.</td></tr>
					</table>
					<%} %>
				
				
				<br>
				</div>
	
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->


</section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>
</body>
</html>