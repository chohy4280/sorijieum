<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, book.model.vo.Book" %>
 <%@ include file="/../inc/adminTemplate.jsp" %>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
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
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="bookcode">도서코드</option>
						<option value="booktitle">도서명</option>
						<option value="author">저자</option>
						<option value="publisher">출판사</option>
					</select>
					<input type="text" class="search" name="keyword" id="keyword" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					
					<br><br>

				<a class="ui large teal label">도서상태</a>&nbsp;
					<input type="radio" name="makestatus" value="ALL" checked> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="makestatus" value="WAIT"> 제작대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="makestatus" value="MAKE"> 제작중 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="makestatus" value="DONE"> 제작완료
					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			
			<!-- 도서검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:200px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600; font-size: 13pt; color:#4ecdc4"><%= list.size() %></span> 권</div>
				<br>
				<table class="listTable">
					<tr>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<th width="2%"><input type="checkbox" class="chk" id="allCheck"/></th>
						<% } %>
						<th width="5%">No</th>
						<th width="10%">도서코드</th>
						<th width="25%">도서명</th>
						<th width="12%">저자명</th>
						<th width="13%">출판사명</th>
						<th width="8%">도서상태</th>
						<th width="10%">도서등록일</th>
					</tr>
					<% for(int i = list.size()-1; i >= 0 ; i--) {
						Book b = list.get(i);
					%>
					<tr>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
						<td><input type="checkbox" class="chk" name="RowCheck" value="<%= b.getBookCode() %>"></td>
						<%} %>
						<td><%= i+1 %> </td>
						<td><a href="/sori/bdetail.ad?bookcode=<%=b.getBookCode() %>"><%= b.getBookCode() %></a></td>
						<td><a href="/sori/bdetail.ad?bookcode=<%=b.getBookCode() %>"><%= b.getBookTitle() %></a></td>
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
					<% } %>
				</table>
				
				<br>
				<div><button class="mini ui black button" onclick="location.href='/sori/views/admin/adminAddBookForm.jsp'">추가</button>&nbsp;
				<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
					<button class="mini ui black button" onclick="fn_bookDelete();">삭제</button></div>
					<% } %>
				</div>
			</div>
				
			<!-- 도서검색 결과 리스트 끝! -->
       <!-- 도서 목록 끝! -->
       

</section>
<!-- Content 끝! -->


</body>
</html>