<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, qna.model.vo.Qna" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>
<% 
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();

	String searchtype = (String)request.getAttribute("searchtype");
	String keyword = (String)request.getAttribute("keyword");
	String qnastatus = (String)request.getAttribute("qnastatus");
	String qnadate = (String)request.getAttribute("qnadate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리</title>
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
		var result = confirm('정말로 해당 문의글들을 삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.');
		if(result){
			var lists = [];
			$("input[name='RowCheck']:checked").each(function(i){
				lists.push($(this).val());
			});
			var list = lists.join(",");
			$.ajax({
				url:"/sori/boddel.ad",
				type:"post",
				data:{ lists : list },
				success : function(data){
					alert(data);
					location.href="/sori/bodlist.ad?page="+<%=currentPage%>;
				}
			})
			return false;
		}}
</script>
</head>

<body>
<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 목록 시작-->
            <i class="big edit icon"></i><span style="font:black; font-size:17pt; padding:10px;">문의글 관리</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 80px;">
            <form action="/sori/bodslist.ad" method="post">
				<div>
				<a class="ui large teal label">검색조건</a>&nbsp;
				<% if(searchtype != null) {
					String[] select = new String[2];
					for(int i = 0 ; i < select.length; i++){
						switch(searchtype){
						case "qnatitle" : select[0] = "selected"; break;
						case "qnawriter" : select[1] = "selected"; break;
						}}
				%>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 130px;">
						<option value="qnatitle" <%=select[0] %>>제목</option>
						<option value="qnawriter" <%=select[1] %>>아이디</option>
					</select>
					<%}else{ %>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 130px;">
						<option value="qnatitle">제목</option>
						<option value="qnawriter">아이디</option>
					</select>
					<%} %>
					
					<%if(keyword!=null) {%>
					<input type="text" class="search" name="keyword" id="keyword" value="<%= keyword %>" style="border-radius: 10px; width: 200px;">
					<%}else{ %>
					<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 200px;">
					<%} %>
					
					&emsp;&emsp;&emsp;&nbsp;
					
				<a class="ui large teal label">답변여부</a>&nbsp;
				<%if(qnastatus != null) {
					String[] check = new String[3];
					for(int i = 0 ; i < check.length; i++){
						switch(qnastatus){
						case "ALL" : check[0] = "checked"; break;
						case "N" : check[1] = "checked"; break;
						case "Y" : check[2] = "checked"; break;
						}
					}
				%>
					<input type="radio" name="qnastatus" value="ALL" <%=check[0] %>> 전체 &emsp;&ensp;
					<input type="radio" name="qnastatus" value="N" <%=check[1] %>> 답변전&emsp;&ensp;
					<input type="radio" name="qnastatus" value="Y" <%=check[2] %>> 답변완료 &emsp;&emsp;&emsp;&nbsp;
				<%}else{ %>
					<input type="radio" name="qnastatus" value="ALL" checked> 전체 &emsp;&ensp;
					<input type="radio" name="qnastatus" value="N"> 답변전&emsp;&ensp;
					<input type="radio" name="qnastatus" value="Y"> 답변완료 &emsp;&emsp;&emsp;&nbsp;
				<%} %>
					<input type="submit" value="검색">
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			
			<!-- 게시글 검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 500px; margin-top:90px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= listCount %></span> 건</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="3%"><input type="checkbox" class="chk" id="allCheck"/></th>
						<th width="3%">No.</th>
						<th width="9%">답변여부</th>
						<th width="50%" style="text-align:left">제목</th>
						<th width="10%">작성자ID</th>
						<th width="10%">작성일</th>
						<th width="5%">조회수</th>
					</tr>
					<%	if(list.size() != 0){
						for(int i = 0 ; i < list.size() ; i++) {
						Qna q = list.get(i);	
					%>
					<tr>
						<td><input type="checkbox" class="chk" name="RowCheck" value="<%= q.getQnaNo() %>"></td>
						<td><%= currentPage * 10 - 9 + i %></td>
						<td><% if(q.getQnaStatus().equals("Y")) { %>
							답변완료
							<%} else { %>
							답변전
							<% } %>
						</td>
						<td style="text-align:left"><a href="/sori/qdetail?qnano=<%=q.getQnaNo() %>" target="_blank"><%= q.getQnaTitle() %></a></td>
						<td><%= q.getQnaWriter() %></td>
						<td><%= q.getQnaDate() %></td>
						<td><%= q.getQnaViews() %></td>
					</tr>
					<%} %>
					</table>
					<br>
				 <!-- 페이징처리 시작 -->
				 <%if(searchtype != null || keyword != null || qnastatus != null || qnadate != null) {%>
							<div id="pagebox" align="center">
								<a href="/sori/bodslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/bodslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/bodslist.ad?page=<%= beginPage - 10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/bodslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/bodslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/bodslist.ad?page=<%= endPage +  10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/bodslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/bodslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&qnastatus=<%=qnastatus%>&qnadate=<%=qnadate%>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
					<%} else { %>
							<div id="pagebox" align="center">
								<a href="/sori/bodlist.ad?page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/bodlist.ad?page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/bodlist.ad?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/bodlist.ad?page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/bodlist.ad?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/bodlist.ad?page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/bodlist.ad?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/bodlist.ad?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>	
					<%} %>
							<!-- 페이징 끝-->
							<button class="mini ui black button" onclick="return delBtn();">삭제</button>
					<% } else { %>
					<tr><td colspan="7" style="color:#aaa">해당하는 게시글이 없습니다.</td></tr>
					</table>
					<%} %>
				

				</div>
			</div>
				
			<!-- 게시물 결과 리스트 끝! -->
       <!-- 게시물 목록 끝! -->

</section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>

</body>
</html>