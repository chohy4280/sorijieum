<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, book.model.vo.Book" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	String searchtype = (String)request.getAttribute("searchtype");
	String keyword = (String)request.getAttribute("keyword");
	String makestatus = (String)request.getAttribute("makestatus");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
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
	var result = confirm('정말로 해당 도서들을 삭제하시겠습니까?');
	if(result){
		var lists = [];
		$("input[name='RowCheck']:checked").each(function(i){
			lists.push($(this).val());
		});
		var list = lists.join(",");
		$.ajax({
			url:"/sori/bdel.ad",
			type:"post",
			data:{ lists : list },
			success : function(data){
				alert(data);
				location.href="/sori/blist.ad?page="+<%=currentPage%>;
			}
		})
		return false;
	}}

</script>

<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 목록 시작-->
            <i class="big black book icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서 목록</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 180px;">
            <form action="/sori/bslist.ad" method="post">
				<div>
				<a class="ui large teal label">검색조건</a>&nbsp;
				<% if(searchtype != null) {
					String[] select = new String[4];
					for(int i = 0 ; i < select.length; i++){
						switch(searchtype){
						case "bookcode" : select[0] = "selected"; break;
						case "booktitle" : select[1] = "selected"; break;
						case "author" : select[2] = "selected"; break;
						case "publisher" : select[3] = "selected"; break;
						}}
				%>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="bookcode" <%= select[0] %>>도서코드</option>
						<option value="booktitle" <%= select[1] %>>도서명</option>
						<option value="author" <%= select[2] %>>저자</option>
						<option value="publisher" <%= select[3] %>>출판사</option>
					</select>
					<%}else{ %>
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="bookcode">도서코드</option>
						<option value="booktitle">도서명</option>
						<option value="author">저자</option>
						<option value="publisher">출판사</option>
					</select>
					<%} %>
					
					<%if(keyword != null) {%>
					<input type="text" class="search" name="keyword" id="keyword" value="<%= keyword %>" style="border-radius: 10px; width: 400px;">
					<%}else{ %>
					<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					<%} %>
					<br><br>

				<a class="ui large teal label">도서상태</a>&nbsp;
				<% if(makestatus != null) {
					String[] check = new String[4];
					for(int i = 0 ; i < check.length; i++){
						switch(makestatus){
						case "ALL" : check[0] = "checked"; break;
						case "WAIT" : check[1] = "checked"; break;
						case "MAKE" : check[2] = "checked"; break;
						case "DONE" : check[3] = "checked"; break;
						}
					}
				%>
					<input type="radio" name="makestatus" value="ALL" <%= check[0] %>> 전체 &emsp;&emsp;
					<input type="radio" name="makestatus" value="WAIT" <%= check[1] %>> 제작대기&emsp;&emsp;
					<input type="radio" name="makestatus" value="MAKE" <%= check[2] %>> 제작중 &emsp;&emsp;
					<input type="radio" name="makestatus" value="DONE" <%= check[3] %>> 제작완료
				<%}else{ %>
					<input type="radio" name="makestatus" value="ALL" checked> 전체 &emsp;&emsp;
					<input type="radio" name="makestatus" value="WAIT"> 제작대기&emsp;&emsp;
					<input type="radio" name="makestatus" value="MAKE"> 제작중 &emsp;&emsp;
					<input type="radio" name="makestatus" value="DONE"> 제작완료
				<%} %>
					
					<center><input type="submit" value="검색"></center>
					
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			
			<!-- 도서검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 500px; margin-top:180px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= listCount %></span> 권</div>
				<br>
				<table class="listTable">
					<tr>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
						<% } %>
						<th width="5%">No.</th>
						<th width="10%">도서코드</th>
						<th width="30%">도서명</th>
						<th width="12%">저자명</th>
						<th width="13%">출판사명</th>
						<th width="8%">도서상태</th>
						<th width="10%">도서등록일</th>
					</tr>
					<% 	if(list.size() != 0){
						for(int i = 0; i < list.size() ; i++) {
							Book b = list.get(i);
					%>
					<tr>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<td><input type="checkbox" class="chk" name="RowCheck" value="<%= b.getBookCode() %>"></td>
						<%} %>
						<td><%= currentPage * 10 - 9 + i %></td>
						<td><%if(searchtype!=null||keyword!=null||makestatus!=null){ %>
							<a href="/sori/bdetail.ad?bookcode=<%=b.getBookCode() %>&page=<%=currentPage%>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>">
							<%}else{ %>
							<a href="/sori/bdetail.ad?bookcode=<%=b.getBookCode() %>&page=<%=currentPage%>">
							<%} %>
							<%= b.getBookCode() %></a></td>
						<td style="text-align: left"><%if(searchtype!=null||keyword!=null||makestatus!=null){ %>
							<a href="/sori/bdetail.ad?bookcode=<%=b.getBookCode() %>&page=<%=currentPage%>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>">
							<%}else{ %>
							<a href="/sori/bdetail.ad?bookcode=<%=b.getBookCode() %>&page=<%=currentPage%>">
							<%} %>
							<%= b.getBookTitle() %></a></td>
						<td><%= b.getAuthor() %></td>
						<td><%= b.getPublisher() %></td>
						<td><% if(b.getMakeStatus().equals("WAIT")) {%>
							제작대기
							<% }else if(b.getMakeStatus().equals("MAKE")) {%>
							제작중
							<% }else{%>
							제작완료
							<% } %>
						</td>
						<td><%= b.getBookDate() %></td>
					</tr>
					<%} %>
					</table>
					<br>
				       <!-- 페이징처리 시작 -->
				       <%if(searchtype!=null || keyword != null || makestatus != null) {%>
							<div id="pagebox" align="center">
								<a href="/sori/bslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/bslist.ad?page=1&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/bslist.ad?page=<%= beginPage - 10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/bslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/bslist.ad?page=<%= p %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/bslist.ad?page=<%= endPage +  10 %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><i class="angle grey right icon"></i></a>
							<% }else{ %>
								<a href="/sori/bslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/bslist.ad?page=<%= maxPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
						<%} else {%>
						<div id="pagebox" align="center">
								<a href="/sori/blist.ad?page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/blist.ad?page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/blist.ad?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/blist.ad?page=<%= p %>>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/blist.ad?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/blist.ad?page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else{ %>
								<a href="/sori/blist.ad?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/blist.ad?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							<!-- 페이징 끝-->
							
							<% } %>
				       <div><button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddBookForm.jsp'">추가</button>&nbsp;
							<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
							<button class="mini ui black button" onclick="return delBtn();">삭제</button></div>
							<% } %>
				</div>
					<% } else { %>
					<tr><td colspan="8" style="color:#aaa">해당하는 도서가 없습니다.</td></tr>
					</table>
					<br>
					<button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddBookForm.jsp'">추가</button>
					<%} %>
				
				<br>
				
								</div>
			<!-- 도서검색 결과 리스트 끝! -->
       <!-- 도서 목록 끝! -->

</section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>


</body>
</html>