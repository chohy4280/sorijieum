<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음-회원탈퇴</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/memberSide.jsp"%>
</head>
<body>
<div class="hy-div">
<section class="hy-section">
<table border="0" cellspacing="0" cellpadding="10" align="center" width="800" height="60" style="text-align:center">
<tr><th bgcolor="#ECB93E"><h1>회원 탈퇴</h1></th></tr>
</table>
<br><br>
<div class="quitdiv">
<center><h2>탈퇴 사유를 선택해주세요.</h4></center><br><br><br><br>
<label><input type="radio" checked>사이트 이용 빈도가 낮습니다.</label><br>
<label><input type="radio" checked>사이트 이용방법이 어렵습니다.</label><br>
<label><input type="radio" checked>개인정보 유출이 우려됩니다.</label><br>
<label><input type="radio" checked>기타 사유</label><br>
<textarea></textarea>
</div>
</section>
</div>
</body>
</html>