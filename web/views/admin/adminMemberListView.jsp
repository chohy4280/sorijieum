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
	
	// 체크박스 다중삭제
	function delBtn(){
		var result = confirm('정말로 해당 회원들을 삭제하시겠습니까?\n삭제후 동일 아이디로 30일 간 재가입이 불가능합니다.');
		if(result){
			var lists = [];
			$("input[name='RowCheck']:checked").each(function(i){
				lists.push($(this).val());
			});
			var list = lists.join(",");
			$.ajax({
				url:"/sori/mdel.ad",
				type:"post",
				data:{ lists : list },
				success : function(data){
					alert(data);
					location.href="/sori/mlist.ad?page="+<%=currentPage%>;
				}
			})
			return false;
		}}

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
            <form action="/sori/mslist.ad" method="post">
				<div>
				<a class="ui large teal label">개인정보</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
						<option value="phone">전화번호</option>
					</select>
					<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					<br><br>


				<a class="ui large teal label">성　　별</a>&nbsp;
					<input type="radio" name="gender" value="ALL" checked> 전체 &emsp;
					<input type="radio" name="gender" value="F"> 여성&emsp;
					<input type="radio" name="gender" value="M"> 남성
					 &emsp;&emsp;&emsp;&nbsp;
					
				<a class="ui large teal label">회원유형</a>&nbsp;
					<input type="radio" name="typenumber" value="ALL" checked> 전체&emsp;&ensp;
					<input type="radio" name="typenumber" value="1"> 이용대기자&emsp;&ensp;
					<input type="radio" name="typenumber" value="2"> 이용자 &emsp;&ensp;
					<input type="radio" name="typenumber" value="3"> 제작자
					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			<!-- 회원검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 500px; margin-top:180px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= listCount %></span> 명</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="5%"><input type="checkbox" class="chk" id="allCheck"/></th>
						<th width="10%">회원유형</th>
						<th width="13%">이름</th>
						<th width="17%">아이디</th>
						<th width="5%">성별</th>
						<th width="20%">이메일</th>
						<th width="20%">전화번호</th>
						<th width="10%">가입일</th>
					</tr>
					<% if(list.size() != 0){
						for(int i = 0 ; i < list.size() ; i++){
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
						<td><a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%=currentPage%>"><%= m.getUserName() %></a></td>
						<td><a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%=currentPage%>"><%= m.getUserId() %></a></td>
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
					<% }}else{ %>
					<tr><td colspan="8" style="color:#aaa">해당되는 회원이 없습니다.</td></tr>
					<%} %>
				</table>
				
				<br>
				<div><button class="mini ui black button" onclick="return delBtn();">삭제</button></div>
				</div>
				<br><br>
				 <!-- 페이징처리 시작 -->
							<div id="pagebox" align="center">
								<a href="/sori/mlist.ad?page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/mlist.ad?page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/mlist.ad?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/mlist.ad?page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/mlist.ad?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/mlist.ad?page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/mlist.ad?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/mlist.ad?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							<!-- 페이징 끝-->
			</div>
				
			<!-- 회원검색 결과 리스트 끝! -->
       <!-- 회원 목록 끝! -->




</section>

</body>
</html>