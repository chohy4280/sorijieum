<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--QNA 시작-->
	<!--QNA 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px" href="/sori/qlist">Q&A</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 문의사항 게시판입니다</span>
		<br><br>
	<!-- QNA 신청 폼 시작 -->	
	<center>
	<form action="/sori/qinsert" method="post">
		<table class="my-listTable5" style="width:45%;">
			<tr>
				<th width="30%">제목</th>
				<td width="70%">
					<div class="ui form">
					<div class="field">
					<textarea rows="1" name="title" placeholder="문의 제목 입력" style="resize:none;" required></textarea>
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div class="ui form">
					  <div class="field">
					    <textarea name="content" style="margin-top:0px;margin-bottom:0px;height:300px;resize:none;" placeholder="문의 내용 입력" required></textarea>
					  </div>
					  </div>
				</td>
			</tr>
			<% if(loginMember.getTypeNumber()==4 || loginMember.getTypeNumber()==5){ %>
			<tr>
				<td colspan="2" align="left"> 
				<div class="ui toggle checkbox" align="left">
					<input type="checkbox" name="top" value="Y">
					<label>고정글로 등록</label>
				</div>
				</td>
			</tr>
			<% } %>
		</table>
		<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>"> <!-- 작성자 아이디 -->
	</center>
	<!--QNA 신청 폼 끝-->
	
	
	<!-- 작성자 제출,리셋 버튼 -->
	<div align="center">
		<div class="ui buttons">
			<input type="submit" class="ui positive button" style="width:100px"></button>
				<div class="or"></div>
			<input type="reset" class="ui button" style="width:100px"></button>
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