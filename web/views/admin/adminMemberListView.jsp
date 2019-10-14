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
<title>회원정보조회</title>
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
		<i class="big user icon"></i><span style="font:black; font-size:17pt; padding:10px;">회원정보조회</span>
        <br><br>
        
        <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 180px; overflow: hidden;">
            <form action="" method="post">
				<div>
				<a class="ui large teal label">개인정보</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
						<option value="phone">전화번호</option>
					</select>
					<input type="text" class="search" name="searchtypetext" id="searchtypetext" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					<br><br>


				<a class="ui large teal label">성　　별</a>&nbsp;
					<input type="radio" name="gender" value="A" checked> 전체 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="F"> 여성&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="M"> 남성
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<a class="ui large teal label">회원유형</a>&nbsp;
					<input type="radio" name="usertype" value="all" checked> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="usertype" value="wait"> 이용대기자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="usertype" value="hear"> 이용자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="usertype" value="make"> 제작자
					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:180px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= list.size() %></span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="5%"><input type="checkbox" class="chk" id="allCheck" onclick="allChk();"/></th>
						<th width="10%">회원유형</th>
						<th width="13%">이름</th>
						<th width="17%">아이디</th>
						<th width="5%">성별</th>
						<th width="20%">이메일</th>
						<th width="20%">전화번호</th>
						<th width="10%">가입일</th>
					</tr>
					<% for(int i = 0 ; i < list.size() ; i++){
						Member m = list.get(i);
					%>
					<tr>
						<td><input type="checkbox" class="chk" name="RowCheck" value="<%= m.getUserId() %>"></td>
						<td><% if(m.getTypeNumber() == Integer.parseInt("1") ) { %>
						이용대기자
						<% } else if(m.getTypeNumber() == Integer.parseInt("2")) {%>
						이용자
						<%} else { %>
						제작자
						<% } %>
						</td>
						<td><a href="/sori/views/admin/adminMemberDetailView.jsp"><%= m.getUserName() %></a></td>
						<td><a href="/sori/views/admin/adminMemberDetailView.jsp"><%= m.getUserId() %></a></td>
						<td><% if(m.getGender().equals("F"))  {%>
						여
						<%} else { %>
						남
						<%} %>
						</td>
						<td><%= m.getEmail() %></td>
						<td><%= m.getPhone() %></td>
						<td><%= m.getEnrollDate() %></td>
					</tr>
					<% } %>
				</table>
				
				<br>
				<div><button class="mini ui black button" onclick="">삭제</button></div>
				</div>
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->




</section>

</body>
</html>