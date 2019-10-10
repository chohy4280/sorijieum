<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 완료</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<section class="my-section" style="margin-top:15%">
<div class="ui raised very padded text container segment" style="width:500px;height:150px;margin-left:35%;display:table;">
	<div style="display:table-cell;vertical-align:middle;text-align:center;font-size:15pt;">
	탈퇴가 완료되었습니다.<br><br>그동안 소리지음을 이용해주셔서 감사합니다.
	</div>
</div>
<center>
<button class="massive ui button ui yellow button" style="margin-left:50px;" onclick="location.href='/sori/index.jsp'">
	메인페이지로
</button>

</center>
</section>
</body>
</html>