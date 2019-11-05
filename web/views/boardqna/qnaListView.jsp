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

	
	//공지 숨기기
	$("input:checkbox[id='topchk']").on("change",function(){
		if($("input:checkbox[id='topchk']").is(":checked") == true){
			$(".toplist").css("display","none");
		}
		else if($("input:checkbox[id='topchk']").is(":checked") == false){
			$(".toplist").css("display","");
		}
	});

	<% if(list.size() == 0){ %>
		$("#pagebox").css("display","none");
	<% } %>
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
<div style="display:flex;justify-content:space-between;">
<div>
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/qlist">Q&A</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">소리지음 문의사항 게시판입니다</span>
</div>
<!-- 검색창 시작 -->
<div style="margin-top:20px;">
<form action="/sori/qsearch" method="post">
<% if(type == null || type.equals("title")){ %>
	<select class="ui mini simple dropdown" name="type" id="type" style="border-radius:5px;">
		<option value="title" selected>제목</option>
		<option value="writer">작성자</option>
	</select>
<% }else{ %>
	<select class="ui mini simple dropdown" name="type" id="type" style="border-radius:5px;">
		<option value="title">제목</option>
		<option value="writer" selected>작성자</option>
	</select>
<% } %>
<% if(keyword != null) { %>
	<input type="text" name="keyword" id="keyword" value="<%= keyword %>" style="width:200px;">
<% }else{ %>
	<input type="text" name="keyword" id="keyword" placeholder="검색하실 내용을 입력하세요" style="width:200px;">
<% } %>		
	<input class="ui tiny basic black button" type="submit" value="검색">
</form>
</div>
</div>	
<br><br>
<label><input type="checkbox" name="topchk" id="topchk" onclick="topValSet()">&nbsp;공지숨기기</label>

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
			<a href="/sori/qdetail?qnano=<%= q.getQnaNo() %>" class="sTitle">
			<%= q.getQnaTitle() %>
			</a>
			</td>
			<td class="sWriter"><%= q.getQnaWriter() %></td>
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
	<% if(keyword == null){ %>
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
			<a href="/sori/qlist?page=<%= endPage + 10 %>"><i class="angle grey right icon"></i></a>
		<% }else{ %>
			<a href="/sori/qlist?page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
		<% } %>&nbsp;
		<a href="/sori/qlist?page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&nbsp;
		</div>
	<% }else { %>
		<div id="pagebox" align="center">
			<a href="/sori/qsearch?page=1&type=<%= type %>&keyword=<%= keyword %>"><i class="angle grey double left icon"></i></a>&nbsp;
		<% if((beginPage - 10) < 1){ %>
			<a href="/sori/qsearch?page=1&type=<%= type %>&keyword=<%= keyword %>"><i class="angle grey left icon"></i></a>
		<% }else{ %>
			<a href="/sori/qsearch?page=<%= beginPage - 10 %>&type=<%= type %>&keyword=<%= keyword %>"><i class="angle grey left icon"></i></a>
		<% } %>&nbsp;
		<% for(int p = beginPage; p <= endPage; p++){ 
				if(p == currentPage){
		%>
			<a href="/sori/qsearch?page=<%= p %>&type=<%= type %>&keyword=<%= keyword %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
		<% }else{ %>
			<a href="/sori/qsearch?page=<%= p %>&type=<%= type %>&keyword=<%= keyword %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
		<% }} %>&nbsp;
		<% if((endPage +  10) < maxPage){ %>
			<a href="/sori/qsearch?page=<%= endPage + 10 %>&type=<%= type %>&keyword=<%= keyword %>"><i class="angle grey right icon"></i></a>
		<% }else{ %>
			<a href="/sori/qsearch?page=<%= maxPage %>&type=<%= type %>&keyword=<%= keyword %>"><i class="angle grey right icon"></i></a>
		<% } %>&nbsp;
		<a href="/sori/qsearch?page=<%= maxPage %>&type=<%= type %>&keyword=<%= keyword %>"><i class="angle grey double right icon"></i></a>&nbsp;
		</div>
	<% } %>
	
<!-- 페이징 끝 -->

</div>
<!--QNA 끝-->

</section>
<!-- Content 끝! -->
</body>
</html>