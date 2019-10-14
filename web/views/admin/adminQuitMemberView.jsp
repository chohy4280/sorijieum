<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, quit.model.vo.Quit" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>

<%
	ArrayList<Quit> list = (ArrayList<Quit>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴관리</title>
</head>
<body>


<!-- Content 시작! -->
<section class="contentsection">
	<!--회원 목록 시작-->
            <i class="big user times icon"></i><span style="font:black; font-size:17pt; padding:10px;">회원탈퇴관리</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 85px;">
            <form action="" method="post">
				<div style="float:left">
				<a class="ui large teal label">회원유형</a>&nbsp;
					<select class="search" name="usertype" id="usertype" style="border-radius: 10px; width: 160px;">
						<option value="user">이용자</option>
						<option value="maker">제작자</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<a class="ui large teal label">아이디</a>&nbsp;
					<input type="text" class="search" name="searchuserid" id="userid" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
					
				<a class="ui large teal label">탈퇴유형</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="G">일반탈퇴</option>
						<option value="F">강제탈퇴</option>
					</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="검색">
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:90px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= list.size() %></span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="15%">아이디</th>
						<th width="15%">탈퇴유형</th>
						<th width="55%">탈퇴사유</th>
						<th width="15%">회원탈퇴일</th>
					</tr>
					<% for(int i = 0 ; i < list.size() ; i++){
						Quit q = list.get(i);
						%>
					<tr>
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
					<% } %>
				</table>
				
				<br>
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->


</section>
<!-- Content 끝! -->

</body>
</html>