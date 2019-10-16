<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.model.vo.Member" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>
 
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리</title>
<script type="text/javascript">

$(function(){
	// 체크박스 전체선택 및 전체해제
	$("#allCheck").click(function(){
		if($(this).is(":checked")){
			$(".chk").prop("checked", true);
		} else {
			$(".chk").prop("checked", false);
		}
	});

	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
	$(".chk").click(function(){
		if($("input[name='RowCheck']:checked").length == <%= list.size() %>){
			$("#allCheck").prop("checked", true);
		}else{
			$("#allCheck").prop("checked", false);
		}	
	});

	}); // document.ready...
</script>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">
	<!--회원 목록 시작-->
            <i class="big users icon"></i></i><span style="font:black; font-size:17pt; padding:10px;">권한관리</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 85px;">
            <form action="/sori/adslist.ad" method="post">
				<div style="float:left">
				<a class="ui large teal label">관리자정보</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
						<option value="email">이메일</option>
						<option value="phone">전화번호</option>
					</select>
					<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
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
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
						<% } %>
						<th width="3%">No</th>
						<th width="10%">관리자구분</th>
						<th width="17%">아이디</th>
						<th width="14%">이름</th>
						<th width="20%">이메일</th>
						<th width="20%">전화번호</th>
						<th width="14%">등록일</th>
					</tr>
					<% for(int i = list.size()-1; i >= 0 ; i--) { 
						Member m = list.get(i);
					%>
					<tr>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<td><input type="checkbox" class="chk" name="RowCheck" value="<%= m.getUserId() %>e"></td>
						<% } %>
						<td><%= i+1 %></td>
						<td><% if(m.getTypeNumber() == Integer.parseInt("4")){ %>
							부관리자
							<% } else { %>
							대표관리자
							<% } %>
						</td>
						<td><a href="/sori/views/admin/adminUpdateForm.jsp"><%= m.getUserId() %></a></td>
						<td><a href="/sori/views/admin/adminUpdateForm.jsp"><%= m.getUserName() %></a></td>
						<td><%= m.getEmail() %></td>
						<td><%= m.getPhone() %></td>
						<td><%= m.getEnrollDate() %></td>
					</tr>
					<% } %>
				</table>
				
				<br>
				<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
				<div style="float:left"><button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddForm.jsp'">추가</button>
				<button class="mini ui black button" onclick="">삭제</button></div>
				<% } %>
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->


</section>
<!-- Content 끝! -->

</body>
</html>