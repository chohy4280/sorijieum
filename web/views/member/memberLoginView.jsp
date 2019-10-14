<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginMember =(Member)session.getAttribute("loginMember");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>

</head>
<body>
<section class="my-section">
<center>

<form action="/sori/memberLogin">

<div class="ui form" style="margin-top:10px;">
  <div class="inline field">
    <label>아 이 디</label>&nbsp;&nbsp;&nbsp;
    <input type="text" placeholder="아이디" name="userid" style="width:300px;height:50px;">
  </div>
  <div class="inline field">
    <label>비밀번호</label>&nbsp;&nbsp;
    <input type="password" placeholder="비밀번호" name="userpwd" style="width:300px;height:50px;">
  </div>
</div>
<br>
<input type="checkbox" name="autoLogin" checked>&nbsp;자동로그인
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/sori/views/member/memberSearchIdPwd.jsp">아이디|비밀번호 찾기</a>
<br><br>

<div>
	<input type="submit" value="로그인" class="ui yellow button" style="color:black;width:200px;height:50px;font-size:20pt;">
</div>
</form>

</center>
</section>
</body>

</html>