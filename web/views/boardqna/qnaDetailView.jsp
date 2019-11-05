<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.Qna, qnacomment.model.vo.QnaComment" %>
<% 
	Qna qna = (Qna)request.getAttribute("qna");
	Qna lastQna = (Qna)request.getAttribute("lastQna");
	Qna nextQna = (Qna)request.getAttribute("nextQna");
	QnaComment qComm = (QnaComment)request.getAttribute("qComm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시글 보기</title>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
<script type="text/javascript" src="/sori/resources/js/sorijieum_tts.js"></script>
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


// 음성안내 **********************************************
	<%if(loginMember != null && (loginMember.getTypeNumber() == 1 || loginMember.getTypeNumber() == 2)){%>
		var audio = new Audio("/sori/resources/mp3/qnaContentStart.mp3");
		window.onload = function(){
			audio.play();
			window.onkeyup = function(){
				   if(event.keyCode == 57 || event.keyCode == 105){		// 9번:입력시 뒤로 페이지 이동
						history.back();
				   }else if(event.keyCode == 49 || event.keyCode == 97){	// 1번 : 수정
					   $("#userupBtn").click();
				   }else if(event.keyCode == 50 || event.keyCode == 98){	// 2번 : 삭제
					   $("#qnaDel").click();
				   }else if(event.keyCode == 48 || event.keyCode == 96){ // 0번 : 다시듣기
					   location.reload();
				   }
			}
			audio.addEventListener("ended", function(e) {
				var qnaComm = document.getElementById('qnaComm').value;
				<%if(qComm != null){%>
					var comm = document.getElementById('adminComm').value;
					speech(qnaComm);
					speech("관리자답변입니다.　　" + comm);
				<%}else{%>
					speech(qnaComm);
					speech("현재 등록된 답변이 없습니다.");
				<%}%>
				speech("다시 들으시려면 0번, 수정하시려면 1번, 삭제하시려면 2번, 뒤로 이동하시려면 9번을 눌러주세요.");
			});

		}

	<%}%>
	
	function updateChk(){
		<% if(qComm != null){ 
			if(loginMember.getTypeNumber() == 3){
		%>
			alert("문의글 수정은 답변이 없을 경우에만 가능합니다.");
			return false;
			<%}else if(loginMember.getTypeNumber() == 1 || loginMember.getTypeNumber() == 2){%>
			audio.pause();
			audio = new Audio("/sori/resources/mp3/qnaNotModify.mp3");
			audio.play();
			<%}%>
			<% }else { %>
			location.href='/sori/qupview?qnano=<%= qna.getQnaNo() %>';
		<% } %>
	}
	
	function delChk(){
		<% if(loginMember.getTypeNumber() == 3){%>
			var result = confirm('정말로 해당 문의글을 삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.');
			if(result){
				location.href='/sori/qdelete?qnano=<%= qna.getQnaNo() %>&typenumber=<%=loginMember.getTypeNumber() %>&userid=<%= loginMember.getUserId() %>';
			}else{
				return;
			}

			<%}else if(loginMember.getTypeNumber() == 1 || loginMember.getTypeNumber() == 2){%>
			audio.pause();
			audio = new Audio("/sori/resources/mp3/qnaContentDel.mp3");
			audio.play();
			audio.addEventListener("ended", function(e) {
				location.href='/sori/qdelete?qnano=<%= qna.getQnaNo() %>&typenumber=<%=loginMember.getTypeNumber() %>&userid=<%= loginMember.getUserId() %>';
			});
			<%}%>		
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
		<input type="hidden" id="qnaComm" value="제목　　<%=qna.getQnaTitle() %>, 작성일<%=qna.getQnaDate() %>, 내용　　<%=qna.getQnaContent() %>">
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
		
		</div>

	<!--QNA 목록 끝-->
	
	<!-- 문의글 수정삭제 버튼 -->
	<% if(loginMember.getTypeNumber()==5 || loginMember.getUserId().equals(qna.getQnaWriter())){ %>
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="updateChk()" id="userupBtn">수정</button>
		  	<div class="or"></div>
			<!-- <button class="ui button" id="qnaDel" onclick="location.href='/sori/qdelete?qnano=<%= qna.getQnaNo() %>&typenumber=<%=loginMember.getTypeNumber() %>&userid=<%= loginMember.getUserId() %>'">삭제</button> -->
			<button class="ui button" id="qnaDel" onclick="delChk()">삭제</button>
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
	<input type="hidden" id="adminComm" value="<%=qComm.getQnaComments() %>">
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
		<div class="showComm" id="showCommContent" style="display:block;">
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
	
	<br>
	<!-- 공통 페이지 이동 버튼 -->
	<div align="right"><a class="big ui black label" href="/sori/qlist">목록으로</a></div>
	<br>
	<table class="my-listTable" align="center">
		<tr>
			<th width="10%">이전글</th>
			<% if(lastQna ==null){ %>
			<td width="90%">이전글이 없습니다.</td>
			<% }else{ %>
			<td width="90%"><a href="/sori/qdetail?qnano=<%= lastQna.getQnaNo() %>"><%= lastQna.getQnaTitle() %></a></td>
			<% } %>
		</tr><tr>
			<th width="10%">다음글</th>
			<% if(nextQna ==null){ %>
			<td width="90%">다음글이 없습니다.</td>
			<% }else{ %>
			<td width="90%"><a href="/sori/qdetail?qnano=<%= nextQna.getQnaNo() %>"><%= nextQna.getQnaTitle() %></a></td>
			<% } %>
		</tr>
	</table>
		<%-- <center>
			<div class="ui buttons">
		  <button class="ui labeled icon button" onclick="location.href='/sori/qdetail?qnano=<%= qna.getQnaNo()-1 %>'">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button" onclick="location.href='/sori/qlist'">
		    목록
		  </button>
		  <button class="ui right labeled icon button" onclick="location.href='/sori/qdetail?qnano=<%= qna.getQnaNo()+1 %>'">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center> --%>


	</div>
	<!--QNA 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>