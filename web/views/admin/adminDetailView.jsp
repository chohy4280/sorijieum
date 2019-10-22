<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, member.model.vo.Member" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>

<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상세보기</title>
<script type="text/javascript">

	// 관리자 삭제
	function delBtn(){
	var result = confirm('<%= m.getUserName() %>(<%= m.getUserId() %>)님을 관리자에서 삭제 처리하시겠습니까?\n삭제 후 동일 아이디로 30일동안 관리자 추가가 불가능합니다.');
	if(result){
		location.href='/sori/mdel.ad?userid=<%= m.getUserId() %>';
		alert("회원 삭제가 완료되었습니다.");
		location.href="/sori/adlist.ad";
	}
		return false;
	}
</script>
</head>
<body>


<!-- Content 시작! -->
<section class="contentsection">


	<!--관리자 추가 시작-->
            <i class="big eraser icon"></i><span style="font:black; font-size:17pt; padding:10px;">관리자 상세</span>
            <br><br>
            <div class="lightgreyBox" style="height: 500px; padding-top: 50px; align: center;">
            	<table class="detailform">
					<tr>
						<th width="30%">아이디</th>
						<td><%= m.getUserId() %></td>
					</tr>
					
					<tr>
						<th width="30%">이름</th>
						<td><%= m.getUserName() %></td>
					</tr>
					
					<tr>
						<th width="30%">전화번호</th>
						<td><%= m.getPhone() %></td>
					</tr>
					
					<tr>
						<th width="30%">이메일</th>
						<td><%= m.getEmail() %></td>
					</tr>

					<tr>
						<th width="30%">성별</th>
						<td><% if(m.getGender().equals("F")){ %>
							여성
							<% } else { %>
							남성
							<%} %>
						</td>
					</tr>
					
					<tr>
						<th width="30%">생년월일</th>
						<td><%= m.getBirth() %></td>
					</tr>
					
					<br>
				</table>
				<br><br>
				<center>
					<!-- 본인,대표관리자만 수정 가능하게 처리 -->
					<% if(loginMember.getUserId().equals(m.getUserId()) || loginMember.getUserId().equals("admin00")) { 
					if(loginMember.getUserId().equals("admin00")) {%>	<!-- 대표 관리자일때만 부관리자 삭제버튼 나타남 -->
					<button class="small ui teal button" onclick="javascript:history.back();">◀BACK</button>
					<button class="small ui teal button" onclick="location.href='/sori/adupview.ad?userid=<%= m.getUserId() %>'">수정하기</button><br><br>
					<button class="small ui red button" onclick="return delBtn();">관리자 삭제</button>
					<%-- <button class="small ui red button" onclick="location.href='/sori/addel.ad?userid=<%= m.getUserId() %>'">관리자 삭제</button> --%>
					<%} else { %>
					<button class="small ui teal button" onclick="javascript:history.back();">◀BACK</button>
					<button class="small ui teal button" onclick="location.href='/sori/adupview.ad?userid=<%= m.getUserId() %>'">수정하기</button>
					<%}} else{ %>
					<button class="small ui teal button" onclick="javascript:history.back();">◀BACK</button>
					<%} %>
				</center>
            </div>
    <!-- 관리자 추가 끝! -->
    
            </section>
<!-- Content 끝! -->

</body>
</html>