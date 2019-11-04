<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.model.vo.Member" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>
 
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	
	String searchtype = (String)request.getAttribute("searchtype");
	String keyword = (String)request.getAttribute("keyword");
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
	
	// 검색어 없을 때
	function valuechk(){
		var searchCheck = 0;
		if ($("#keyword").val() == "") {
			alert("검색어를 입력해 주세요.")

			$("#keyword").focus();//커서입력
			return false;
		}
	}
	
	// 체크박스 다중삭제
	function delBtn(){
		var str = '정말로 해당 관리자들을 삭제하시겠습니까?\n강제탈퇴 사유를 입력해주세요.\n(삭제후 동일 아이디로 30일 간 관리자 추가 불가)';
		var anwser = prompt(str, "");
		if(anwser != null && anwser != ""){
			var lists = [];
			$("input[name='RowCheck']:checked").each(function(i){
				lists.push($(this).val());
			});
			var list = lists.join(",");
			$.ajax({
				url:"/sori/mdel.ad",
				type:"post",
				data:{ lists : list, anwser : anwser },
				success : function(data){
					alert(data);
					location.href="/sori/adlist.ad";
				}
			})
			return false;
		}else {
			alert("강제탈퇴 사유를 입력하셔야 합니다.");
			return;
		}
		}
</script>
</head>
<body>

<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
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
				<% if(searchtype != null) {
					String[] select = new String[4];
					for(int i = 0 ; i < select.length; i++){
						switch(searchtype){
						case "userid" : select[0] = "selected"; break;
						case "username" : select[1] = "selected"; break;
						case "email" : select[2] = "selected"; break;
						case "phone" : select[3] = "selected"; break;
						}}
				%>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid" <%=select[0] %>>아이디</option>
						<option value="username" <%=select[1] %>>이름</option>
						<option value="email" <%=select[2] %>>이메일</option>
						<option value="phone" <%=select[3] %>>전화번호</option>
					</select>
				<%}else{ %>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
						<option value="email">이메일</option>
						<option value="phone">전화번호</option>
					</select>
				<%} %>
				
				
				<%if(keyword!=null) {%>
					<input type="text" class="search" name="keyword" id="keyword" value="<%= keyword %>" style="border-radius: 10px; width: 200px;">
				<%}else{ %>
					<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
				<%} %>
					
					<input type="submit" value="검색" onclick="valuechk();">
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
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
						<% } %>
						<th width="3%">No.</th>
						<th width="10%">관리자구분</th>
						<th width="17%">아이디</th>
						<th width="14%">이름</th>
						<th width="20%">이메일</th>
						<th width="20%">전화번호</th>
						<th width="14%">등록일</th>
					</tr>
					<% if(list.size() != 0){
						for(int i = list.size()-1; i >= 0 ; i--) { 
						Member m = list.get(i);
					%>
					<tr>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<td><input type="checkbox" class="chk" name="RowCheck" value="<%= m.getUserId() %>"></td>
						<% } %>
						<td><%= currentPage * 10 - 9 + i %></td>
						<td><% if(m.getTypeNumber() == Integer.parseInt("4")){ %>
							부관리자
							<% } else { %>
							대표관리자
							<% } %>
						</td>
						<td><a href="/sori/addetail.ad?userid=<%= m.getUserId() %>&page=<%=currentPage%>"><%= m.getUserId() %></a></td>
						<td><a href="/sori/addetail.ad?userid=<%= m.getUserId() %>&page=<%=currentPage%>"><%= m.getUserName() %></a></td>
						<td><a href="mailto:<%= m.getEmail() %>" title="메일보내기"><%= m.getEmail() %></a></td>
						<td><%= m.getPhone() %></td>
						<td><%= m.getEnrollDate() %></td>
					</tr>
					<%} %>
					</table>
					<br>
				 <!-- 페이징처리 시작 -->
				 <%if(searchtype != null || keyword != null){ %>
							<div id="pagebox" align="center">
								<a href="/sori/adslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/adslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/adslist.ad?page=<%= beginPage - 10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/adslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/adslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/adslist.ad?page=<%= endPage +  10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/adslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/adslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
					<%}else{ %>
					<div id="pagebox" align="center">
								<a href="/sori/adlist.ad?page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/adlist.ad?page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/adlist.ad?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/adlist.ad?page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/adlist.ad?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/adlist.ad?page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/adlist.ad?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/adlist.ad?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							<!-- 페이징 끝-->
					<% } if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
					<div style="float:left"><button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddForm.jsp'">추가</button>
					<button class="mini ui black button" onclick="return delBtn();">삭제</button></div>
					<% }} else { %>
					<tr><td colspan="8" style="color:#aaa">해당하는 관리자가 없습니다.</td></tr>
					</table>
					<br>
					<div style="float:left"><button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddForm.jsp'">추가</button>
					<%} %>
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