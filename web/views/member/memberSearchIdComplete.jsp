<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("member");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<section class="my-section">
<div class="ui raised very padded text container segment" style="width:450px;height:150px;margin-left:40%;display:table;">
	<div style="display:table-cell;vertical-align:middle;text-align:center;font-size:15pt;">
	<% if(member != null){ %>
	<%= member.getUserName() %> 님의 아이디는<br>
	<%= member.getUserId() %> <br>
	입니다.
	<% } %>
	</div>
</div>
<center>
<button class="massive ui button ui yellow button" style="margin-left:10px;" onclick="location.href='/sori/views/member/memberLoginView.jsp'">
	로그인하기
</button>
<button class="massive ui button" style="margin-left:10px;">
	<a href="javascript:history.go(-1);" style="color:black">이전페이지로</a>
</button>
</center>
</section>
</body>
</html>