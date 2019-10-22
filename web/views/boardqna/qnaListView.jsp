<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.Qna, java.util.ArrayList" %>
<%
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	ArrayList<Qna> topList = (ArrayList<Qna>)request.getAttribute("toplist");
	String type = (String)request.getAttribute("type");
	String keyword = (String)request.getAttribute("keyword");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
<%@ include file="/../inc/top.jsp" %>
<script type="text/javascript">
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
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>
<!-- Content 시작! -->
<section class="my-section">

<!--QNA 시작-->
<div class="my-content">
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/qlist">Q&A</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">소리지음 문의사항 게시판입니다</span>
	
	<br><br>
	<label><input type="checkbox" id="topchk">&nbsp;공지숨기기</label>
<!-- QNA 목록 시작 -->
	<table class="my-listTable" align="center">
		<tr>
			<th width="10%">No</th>
			<th width="50%">제목</th>
			<th width="10%">작성자</th>
			<th width="10%">작성일</th>
			<th width="10%">상태</th>
			<th width="10%">조회수</th>
		</tr>
		<% if(topList.size()!=0){ %>
		<% 	for(Qna q: topList){ %>
		<tr class="toplist" style="display:table-row;">
			<td style="color:red;">공지</td>
			<td style="text-align:left;">
			<a href="/sori/qdetail?qnano=<%= q.getQnaNo() %>"><%= q.getQnaTitle() %></a></td>
			<td><%= q.getQnaWriter() %></td>
			<td><%= q.getQnaDate() %></td>
			<td></td>
			<td><%= q.getQnaViews() %></td>
		</tr>
		<% } } %>
		<% for(Qna q : list){ %>
		<% if(q.getQnaTop().equals("N")){ %>
		<tr>
			<td style="color:black;"><%= q.getQnaNo() %></td>
			<td style="text-align:left;">
			<a href="/sori/qdetail?qnano=<%= q.getQnaNo() %>"><%= q.getQnaTitle() %></a></td>
			<td><%= q.getQnaWriter() %></td>
			<td><%= q.getQnaDate() %></td>
			<td>
			<% if(q.getQnaStatus().equals("Y")){ %>
			답변완료
			<% } else{ %>
			미답변
			<% } %>
			</td>
			<td><%= q.getQnaViews() %></td>
		</tr>
		<% } } %>
	</table>
<!--QNA 목록 끝-->
	<br>
	<div align="right"><a class="big ui black label" href="/sori/views/boardqna/qnaInsertView.jsp">글쓰기</a></div>
	<br>
	
<!-- 페이징 시작 -->
	<div id="pagebox" align="center">
		<a href="/sori/qlist?page=1"><i class="angle grey double left icon"></i></a>&nbsp;
	<% if((beginPage - 10) < 1){ %>
		<a href="/sori/qlist?page=1"><i class="angle grey left icon"></i></a>
	<% }else{ %>
		<a href="/sori/qlist?page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
	<% } %>&nbsp;
	<% for(int p = beginPage; p <= endPage; p++){ 
			if(p == currentPage){
	%>
		<a href="/sori/qlist?page=<%= p %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
	<% }else{ %>
		<a href="/sori/qlist?page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
	<% }} %>&nbsp;
	<% if((endPage +  10) < maxPage){ %>
		<a href="/sori/qlist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
	<% }else{ %>
		<a href="/sori/qlist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
	<% } %>&nbsp;
	<a href="/sori/qlist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
	</div>
<!-- 페이징 끝 -->

<br><hr><br>
<!-- 검색창 시작 -->

<form action="/sori/qsearch" method="post">
<div align="center">
	<% if(type == null || type.equals("title")){ %>
	<input type="radio" name="type" value="title" checked> 제목 &nbsp; &nbsp; &nbsp; 
	<input type="radio" name="type" value="writer"> 작성자 <br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	<% }else{ %>
	<input type="radio" name="type" value="title"> 제목 &nbsp; &nbsp; &nbsp; 
	<input type="radio" name="type" value="writer" checked> 작성자 <br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	<% } %>
	<% if(keyword != null) { %>
	<label><input type="search" name="keyword" value="<%= keyword %>"></label>
	<% }else{ %>
	<label><input type="search" name="keyword"></label>
	<% } %>
	<input type="submit" value="검색">
</div>
</form>

<!-- 검색창 끝 -->

</div>
<!--QNA 끝-->

</section>
<!-- Content 끝! -->
</body>
</html>