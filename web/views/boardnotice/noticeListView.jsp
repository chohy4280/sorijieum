<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "notice.model.vo.Notice,java.util.ArrayList" %>
<% 
  
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
   ArrayList<Notice> topList = (ArrayList<Notice>)request.getAttribute("toplist");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	String search = (String)request.getAttribute("search");
	String keyword = (String)request.getAttribute("keyword");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function callFunction(){
	   //자바스크립트로 서블릿 요청할 경우
	   window.location.href = "/sori/views/boardnotice/noticeWrite.jsp";
	   return false;  //다른 버튼으로 클릭 이벤트 전달 막기
	}
	
$(function(){
	$("input:checkbox[id='topchk']").on("change",function(){
		if($("input:checkbox[id='topchk']").is(":checked") == true){
			$(".toplist").css("display","none");
		}
		if($("input:checkbox[id='topchk']").is(":checked") == false){
			$(".toplist").css("display","");
		}

	});	
});
	

</script>

</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">

	<!--공지사항 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">공지사항</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 공지사항입니다</span>
		<br><br><br>
		<label><input type="checkbox" id="topchk">&nbsp; 공지숨기기</label>
		
	<!-- 공지사항 목록 시작 -->
		<table class="my-listTable" align="center">
	
			<tr>
			
				<th width="10%">No</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
				
		<% for(Notice n : topList){
			%>
			
			<tr class="toplist" style="display:table-row;">
			   
				<td style="color:red;">공지</td>
				<td style="text-align:left;">
				<a href="/sori/ndlist?noticeno=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a></td>
				<td ><%= n.getNoticeWriter() %></td>
				<td ><%= n.getNoticeDate() %></td>
				<td  ><%= n.getNoticeViews() %></td>
			</tr>	
			<% } %>
			
		<% for(Notice n : list){ %>
			<% if(n.getNoticeTop().equals("N")){ %>
		
			<tr>
				<td><%= n.getNoticeNo()-1 %></td>
				<td style="text-align:left;"><a href="/sori/ndlist?noticeno=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a></td>
				<td><%= n.getNoticeWriter() %></td>
				<td><%= n.getNoticeDate() %></td>
				<td><%= n.getNoticeViews() %></td>
				
			</tr>
			<% }} %>
		</table>
	<!--공지사항 목록 끝-->
		<br>
		<!--공지사항 글쓰기 버튼 관리자만 보인다.  -->
	<%-- <% if(loginMember !=null && loginMember.getTypeNumber() == 4 && loginMember.getTypeNumber() == 5){ %> --%>
		<div align="right"><button onclick="callFunction();">글쓰기</button></div>
	<%-- 	<% }else{ %> 
		<div align="right"></div>
		<% } %> --%>
		
	<!-- 페이징 시작 -->
		<div id="pagebox1" align="center">
<%if(keyword ==null){ %>
   <a href="/sori/nlist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
<% if((beginPage - 10) < 1){ %>
   <a href="/sori/nlist?page=1"><i class="angle grey left icon"></i></a>
<% }else{ %>
   <a href="/sori/nlist?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
<% } %>&nbsp;
<% for(int p = beginPage; p <= endPage; p++){ 
      if(p == currentPage){
%>
   <a href="/sori/nlist?page=<%= p %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
<% }else{ %>
   <a href="/sori/nlist?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
<% }} %>&nbsp;
<% if((endPage +  10) > maxPage){ %>
   <a href="/sori/nlist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
<% }else{ %>
   <a href="/sori/nlist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/nlist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
</div><!-- 도서 전체 목록 페이징 끝 -->
<% }else{ %>

<div id="pagebox1" align="center">
   <a href="/sori/nosearch?page=1&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&nbsp;
<% if((beginPage - 10) < 1){ %>
   <a href="/sori/nosearch?page=1&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
<% }else{ %>
   <a href="/sori/nosearch?page=<%= beginPage - 10 %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
<% } %>&nbsp;
<% for(int p = beginPage; p <= endPage; p++){ 
      if(p == currentPage){
%>
   <a href="/sori/nosearch?page=<%= p %>&search=<%=search%>&keyword=<%=keyword%>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
<% }else{ %>
   <a href="/sori/nosearch?page=<%= p %>&search=<%=search%>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&nbsp;
<% }} %>&nbsp;
<% if((endPage +  10) > maxPage){ %>
   <a href="/sori/nosearch?page=<%= endPage + 10 %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
<% }else{ %>
   <a href="/sori/nosearch?page=<%= maxPage %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/nosearch?page=<%= maxPage %>&search=<%=search%>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&nbsp;
<% } %>
</div>
	<!-- 페이징 끝 -->
	
	<br><hr><br>
	<!-- 검색창 시작 -->
		<center>
		<div class="NoticeSearchBox">
<form action="/sori/nosearch" method="post">
<select name="search"  style="border-radius:5px; width:100px; height:40px">
<option  value="noticetitle">제목명</option>
<option value="noticewriter">글쓴이</option>
</select>
<input type="search" name="keyword"  placeholder="내용입력" style="border-radius:5px; width:200px; height:40px;" >
<input type="submit" value="검색" style="border-radius:5px; width:100px; height:40px;">

</form>
</div>
		</center>
	<!-- 검색창 끝 -->
	
	</div>
	<!--공지사항 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>