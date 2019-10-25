<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, qna.model.vo.Qna, qnacomment.model.vo.QnaComment"  %>    
<%
	ArrayList<Qna> alarmlist = (ArrayList<Qna>)request.getAttribute("alarmlist");
	ArrayList<Qna> myqlist = (ArrayList<Qna>)request.getAttribute("myqlist");
	ArrayList<QnaComment> myqclist = (ArrayList<QnaComment>)request.getAttribute("myqclist");
	int beginPage = (Integer)request.getAttribute("beginPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int maxPage = (Integer)request.getAttribute("maxPage");
	int listcount = (Integer)request.getAttribute("listcount");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의 내역</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript">
$(function(){
	//체크박스 전체 선택
	$("#allChk").click(function(){
		if($(this).is(":checked")){
			$(".chkbox").prop("checked", true);
		} else {
			$(".chkbox").prop("checked", false);
		}
	});
	
	// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
	$(".chkbox").click(function(){
		if($("input[name='delChk']:checked").length == <%= myqlist.size() %>){
			$("#allChk").prop("checked", true);
		}else{
			$("#allChk").prop("checked", false);
		}	
	});
	
	//제목 클릭하면 밑에 내용,답변 보이게 하기
	var title = $(".qnaTitle");
	title.click(function() {
		var cname = $(this).attr("id");		

		$("."+cname).slideToggle("normal");
		$(".qComm").not($("."+cname)).slideUp("normal");
	});

});
</script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<style type="text/css">
.icon {
	margin-right:50px;
}
</style>
</head>
<body>
<div class="hy-div">
<section class="hy-section2" >
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/qlist">내 Q&A</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">내 문의 내역</span><br>
<!-- 내 문의 알림은 답변 날짜로부터 일주일까지 표시 -->
<% if(alarmlist != null){ %>
<% for(Qna q: alarmlist){ %>
<br>
<a href="/sori/qdetail?qnano=<%= q.getQnaNo() %>">
	<div class="ui yellow message hy-alarmdiv">"<%= q.getQnaTitle() %>" 문의글에 답변이 완료되었습니다.</div>
</a>
<% }} %>
<br>
<!-- 내 문의 목록 출력 -->
내 문의: <%= listcount %> 개
<form action="/sori/qdelete.my" method="post">
<table class="hy-listTable" align="center">
	<tr>
		<th width="10%"><input type="checkbox" class="chkbox" id="allChk"></th>
		<th width="10%">문의번호</th>
		<th width="50%">제목</th>
		<th width="15%">작성일</th>
		<th width="15%">상태</th>
	</tr>
	<% if(myqlist.size() > 0){ %>
	<% for(int i=0; i<myqlist.size(); i++){ 
		Qna q = myqlist.get(i);
		QnaComment qc = myqclist.get(i); %>
	<tr>
		<td><input type="checkbox" class="chkbox" name="delChk" value="<%= q.getQnaNo() %>"></td>
		<td><%= q.getQnaNo() %></td>
		<td class="qnaTitle" id="<%= q.getQnaNo() %>"><%= q.getQnaTitle() %></td>
		<td><%= q.getQnaDate() %></td>
		<td>
		<% if(q.getQnaStatus().equals("Y")){ %>
		답변완료
		<% } else{ %>
		미답변
		<% } %>
		</td>
	</tr>
	<!-- 내 문의 제목영역 클릭시 내용과 답변 출력 -->
	<tr class="<%= q.getQnaNo() %> qComm" height="100" style="display:none;">
	<td colspan="5">
		<div style="float:left;margin-left:13%;"><i class="big question circle icon"></i>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<%= q.getQnaContent() %></div>
		<div style="float:right;">
		<form action="/sori/qdetail" method="post"> 
		<input type="hidden" name="qnano" value="<%= q.getQnaNo() %>">
		<button class="mini ui yellow button" style="color:black;">상세페이지로</button>
		</form>
		</div>
	</td>
	</tr>
	<tr class="<%= q.getQnaNo() %> qComm" height="100" style="display:none;">
	<% if(q.getQnaStatus().equals("Y")){ %>
	<td colspan="5">
		<div style="float:left;margin-left:13%;"><i class="big exclamation circle icon"></i>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<%= qc.getQnaComments() %></div>
	</td>
	<% }else{ %>
	<td colspan="5">
		<div style="float:left;margin-left:13%;"><i class="big exclamation circle icon"></i>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		아직 등록된 답변이 없습니다.</div>
	</td>
	<% } %>
	</tr>
	<% }}else{%>
		<tr><td colspan="5">문의 내역이 존재하지 않습니다.</td></tr>
	<% } %>
	
</table>
<!-- 내 문의 목록 출력 끝 -->
<br>
<!-- 선택한 문의내역 삭제 버튼 -->
<!-- <div align="left"><button class="mini ui black button" style="font-size:9pt;"onclick="return delBtn();">삭제</button></div> -->
<input type="hidden" name="userid"	value="<%= loginMember.getUserId() %>">
<input type="hidden" name="currentPage" value="<%= currentPage %>">
<div align="left">
<button class="mini ui black button" style="font-size:9pt;" onclick="chkDel()">삭제</button></div>
</form>
<!-- 페이징 시작 -->
<div id="pagebox" align="center">
	<a href="/sori/qlist.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey double left icon"></i></a>&nbsp;
<% if((beginPage - 10) < 1){ %>
	<a href="/sori/qlist.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
<% }else{ %>
	<a href="/sori/qlist.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
<% } %>&nbsp;
<% for(int p = beginPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<a href="/sori/qlist.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
<% }else{ %>
	<a href="/sori/qlist.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
<% }} %>&nbsp;
<% if((endPage +  10) < maxPage){ %>
	<a href="/sori/qlist.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
<% }else{ %>
	<a href="/sori/qlist.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
<% } %>&nbsp;
<a href="/sori/qlist.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey double right icon"></i></a>&nbsp;
</div>
</section>
</div>
</body>
</html>