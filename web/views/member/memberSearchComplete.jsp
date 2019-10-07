<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<section class="my-section" style="margin-top:15%">
<div class="ui raised very padded text container segment" style="width:400px;height:150px;margin-left:40%;display:table;">
	<div style="display:table-cell;vertical-align:middle;text-align:center;font-size:15pt;">
	입력하신 정보와 일치하는<br><br>회원 정보가 존재하지 않습니다.
	</div>
</div>
<center>
<button class="massive ui button ui yellow button" style="margin-left:100px;" onclick="location.href='/sori/views/member/memberLoginView.jsp'">
	로그인하기
</button>
<button class="massive ui button" style="margin-left:10px;">
	<a href="javascript:history.go(-1);" style="color:black">이전페이지로</a>
</button>
</center>
</section>
</body>
</html>