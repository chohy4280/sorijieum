<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.Qna, qnacomment.model.vo.QnaComment" %>
<% 
	Qna qna = (Qna)request.getAttribute("qna");
	QnaComment qComm = (QnaComment)request.getAttribute("qComm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시글 보기</title>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
<%@ include file="/../inc/top.jsp" %>
<script type="text/javascript">
$(function(){
	<% if(qComm != null){ %>
		$("#upBtn").click(function(){
			$(".showComm").css("display","none");
			$(".upComm").css("display","block");
			return false;
		});
		
		$("#commReset").click(function(){
			$(".showComm").css("display","block");
			$(".upComm").css("display","none");
			return false
		});
		
		$("#commUpdate").click(function(){
			mappingAction("update");
		});
		
		$("#commDel").click(function(){
			mappingAction("delete");
		});
	<% } %>
});

function commentChk(){
	if(document.getElementById("commcontent").value==""){
		alert("답변 내용을 작성해주세요.");
		return false;
	}
}

function mappingAction(val){
    var form = document.commForm;
 	
    if (val == "update")
        form.action = "/sori/qcupdate";
    else if (val == "delete") 
        form.action = "/sori/qcdelete";
	
 /*    form.submit(); */
}

function updateChk(){
	<% if(qComm != null){ %>
		alert("문의글 수정은 답변이 없을 경우에만 가능합니다.");
		return false;
	<% }else { %>
		location.href='/sori/qupview?qnano=<%= qna.getQnaNo() %>';
	<% } %>
}
</script>

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
	<!-- QNA 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th colspan="3" style="height:60px; font-size: 25px;"><%= qna.getQnaTitle() %></th>
			</tr>
			<tr style="height:20px; font-size: 12px;">
				<td>작성자 : <%= qna.getQnaWriter() %></td>
				<td>작성일 : <%= qna.getQnaDate() %></td>
				<td>조회수 : <%= qna.getQnaViews() %></td>
			</tr>	
		</table>
		<div class="my-boardcontent">
		<%= qna.getQnaContent().replace("\r\n", "<br>") %><br><br><br>
		<hr>
		<% if(qna.getQnaOfile() != null){ %>
		<a href="/sori/qfdown?ofile=<%= qna.getQnaOfile() %>&rfile=<%= qna.getQnaRfile() %>"><%= qna.getQnaOfile() %></a>
		<% }else { %>
		첨부파일 없음
		<% } %>
		</div>

	<!--QNA 목록 끝-->
	
	<!-- 문의글 수정삭제 버튼 -->
	<% if(loginMember.getTypeNumber()==5 || loginMember.getUserId().equals(qna.getQnaWriter())){ %>
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="updateChk()">수정</button>
		  	<div class="or"></div>
			<button class="ui button" onclick="location.href='/sori/qdelete?qnano=<%= qna.getQnaNo() %>'">삭제</button>
		</div>
	</div>
	<% } %>
	<br>
	
	<!-- 유저&관리자 공통 댓글 출력 영역 시작 -->
	<h3>COMMENT</h3>
	<% if(qComm != null){ %> <!-- 답변이 있을때 -->
	<form name="commForm" method="post">
	<input type="hidden" name="qnano" value="<%= qComm.getQnaNo() %>">
	<input type="hidden" name="qcwriter" value="<%= loginMember.getUserId() %>">
	<table class="my-listTable2" width="100%">
	<tr>
		<th width="5%"></th>
		<th width="15%">관리자(<%= qComm.getQnaComWriter() %>)</th>
		<th width="65%" style="text-align:left;"><%= qComm.getQnaComDate() %></th>
		<!-- 답변 단 관리자&대표관리자 일때만 ↓보임 -->
		<% if(loginMember.getTypeNumber()==5 || loginMember.getUserId().equals(qComm.getQnaComWriter())){ %>
		<th width="20%" style="text-align:right" id="adBtn">
		<div class="showComm" style="display:block;">
		<button class="mini ui grey button" id="upBtn">수정</button>
		<button class="mini ui grey button" id="commDel">삭제</button>
		</div>
		<div class="upComm" style="display:none;">
		<button class="mini ui grey button" id="commUpdate">완료</button>
		<button class="mini ui grey button" id="commReset">취소</button>
		</div>
		</th>
		<% } %>
	</tr>
	<!-- 수정버튼 누르면 답변 내용 영역이 로 바뀌면서 수정 가능 -->
	<tr>
		<td colspan="4" id="commarea">
		<div class="showComm" style="display:block;">
		<%= qComm.getQnaComments().replace("\r\n", "<br>") %>
		</div>
		<div class="upComm" style="display:none;">
		<textarea name='commUpdateContent' class='qnaTextarea'><%= qComm.getQnaComments() %></textarea>
		</div>
		</td>
	</tr>
	</table>
	</form>
	<br><br>
	<% } else{ %>
	<div style="color:grey;">
	아직 답변이 없습니다.<br>
	</div>
	<% } %>
	<!-- 유저&관리자 공통 댓글 출력 영역 끝 -->
	
	
	
	<!-- 관리자 댓글작성 영역 시작 -->
	<% if(loginMember.getTypeNumber()==5 || loginMember.getTypeNumber()==4){ %>
	<form action="/sori/qcinsert" method="post" onsubmit="return commentChk();">
		<input type="hidden" name="qnano" value="<%= qna.getQnaNo() %>">
		<input type="hidden" name="commwriter" value="<%= loginMember.getUserId() %>">
  		<textarea name="commcontent" id="commcontent" class="qnaTextarea" placeholder="답변 내용 작성"></textarea>
		<br><input type="submit" class="mini ui yellow button" >
	</form>
	<% } %>
	<!-- 관리자 댓글작성 영역 끝 -->
	
	<br><br><br>
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui labeled icon button">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button">
		    목록
		  </button>
		  <button class="ui right labeled icon button">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center>


	</div>
	<!--QNA 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>