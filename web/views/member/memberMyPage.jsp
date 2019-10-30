<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%-- <%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>   --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음-마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
@font-face {
	font-family: 'S-CoreDream-6Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
	}

body {
	font-family: 'S-CoreDream-6Bold';
}

.my-section{
   padding-top: 5%;
   padding-bottom: 70px;
   padding-left: 30px;
   padding-right: 30px;
}
</style>
</head>
<body>
<section class="my-section" style="margin: 0 5% 0 5%; border: 0;">
<div class="ui basic segment" style="background-color:white;overflow:hidden;">
	<div class="ui two column very relaxed grid" style="overflow:hidden;">
		<div class="column" style="overflow:hidden;">
			<i class="big book icon brown"></i><br><br>
			<% if(loginMember.getTypeNumber()==1 || loginMember.getTypeNumber()==2) { %>
			<center>
				<button class="massive ui inverted brown button" style="width:600px;height:180px;margin-bottom:1%;font-size:30pt;" 
				onclick="location.href='/sori/mybook.my?userid=<%= loginMember.getUserId() %>'">
					내 서재</button>
			</center>
			<center><button class="massive ui inverted brown button" style="width:600px;height:180px;margin-bottom:1%;font-size:30pt;" 
				onclick="location.href='/sori/likebook.my?userid=<%= loginMember.getUserId() %>'">
					관심도서</button></center>
			<center><button class="massive ui inverted brown button" style="width:600px;height:180px;margin-bottom:1%;font-size:30pt;" 
				onclick="location.href='/sori/wishbook.my?userid=<%= loginMember.getUserId() %>'">
					내 신청도서</button>
			</center>
			<% }else { %>
			<center>
			<button class="massive ui inverted brown button" style="width:600px;height:180px;margin-bottom:1%;font-size:30pt;" 
			onclick="location.href='/sori/makebook.my?userid=<%= loginMember.getUserId() %>'">
				참여 도서</button>
			</center>
			<% } %>
		</div>
		<div class="column" style="overflow:hidden;">
			<i class="big user icon brown"></i><br><br>
			<center><button class="massive ui inverted brown button" style="width:600px;height:180px;margin-bottom:1%;font-size:30pt;" 
				onclick="location.href='/sori/qlist.my?userid=<%= loginMember.getUserId() %>'">
					내 문의</button></center>
			<center><button class="massive ui inverted brown button" style="width:600px;height:180px;margin-bottom:1%;font-size:30pt;" 
				onclick="location.href='/sori/myinfo?userid=<%= loginMember.getUserId() %>'">
					내 정보 수정</button></center>
		</div>
	</div>
</div>
</scetion>	
</body>
</html>