<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.Qna"%>
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 수정</title>
<%@ include file="/../inc/top.jsp" %>
<script type="text/javascript">
<%if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)){%>
$('.ui.checkbox').checkbox('attach events', '.toggle.button');
<%}%>

//음성안내 ************************************

<%if(loginMember != null && (loginMember.getTypeNumber() == 1 || loginMember.getTypeNumber() == 2)){%>
		var audio = new Audio("/sori/resources/mp3/qnaModifyTitle.mp3");
		window.onload = function(){
			$("#title").select();
			audio.play();
		}
		
		
		function focus_content(){
			$("#content").select();
				audio.pause();
			   audio = new Audio("/sori/resources/mp3/qnaModifyContent.mp3");
			   audio.play();

		}
<%}%>
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
	<!-- QNA 수정 폼 시작 -->	
	<center>
	<form action="/sori/qupdate" method="post">
		<table class="my-listTable5" style="width:45%;">
			<tr>
				<th width="30%">제목</th>
				<td width="70%">
					<div class="ui form">
					<div class="field">
					<textarea rows="1" name="title" id="title" style="resize:none;" required><%= qna.getQnaTitle() %></textarea>
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div class="ui form">
					  <div class="field">
					    <textarea name="content" id="content" onfocusin="focus_content()"style="margin-top:0px;margin-bottom:0px;height:300px;resize:none;" required><%= qna.getQnaContent() %></textarea>
					  </div>
					  </div>
				</td>
			</tr>
			<tr>
			<% if(loginMember.getTypeNumber()==4 || loginMember.getTypeNumber()==5){ %>
			<div class="ui form">
				<div class="inline field">
					<div class="ui toggle checkbox">
						<input type="checkbox" tabindex="0" class="hidden" name="top" value="Y">
						<label>고정글</label>
					</div>
				</div>
			</div>
			<% } %>
			</tr>
		</table>
		<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>"> <!-- 작성자 아이디 -->
		<input type="hidden" name="qnano" value="<%= qna.getQnaNo() %>"> <!-- 글번호 -->
	</center>
	<!--QNA 목록 끝-->
	
	<!-- 작성자 제출,리셋 버튼 -->
	<div align="center">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" style="width:100px" value="수정완료">
				<div class="or"></div>
			<input type="reset" class="ui button" style="width:100px" value="되돌리기">
		</div>
	</div>
	</form>
	
	<br><br>
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui button" onclick="javascript:history.go(-1);return false">
		    이전 페이지
		  </button>
		</div>
		</center>


	</div>
	<!--Q&A 작성 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>