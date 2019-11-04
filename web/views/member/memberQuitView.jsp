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
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript">
$(function(){
	$("#quitbtn").click(function(){
		if($("input:checkbox[id='qgaree']").is(":checked") == false){
			alert("동의하셔야 탈퇴가 가능합니다.");
			return false;
		}
		else{
			return true;
		}
	});
});
</script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<style type="text/css">
textarea{
	resize:none;
	width:90%;
	height:30%;
}

input[type=checkbox]
{
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari and Chrome */
  -o-transform: scale(1.5); /* Opera */
  padding: 5px;
}
</style>
</head>
<body>
<div class="hy-div">
<section class="hy-section">
<table border="0" cellspacing="0" cellpadding="10" align="center" width="800" height="60" style="text-align:center">
<tr><th bgcolor="#ECB93E"><h1>회원 탈퇴</h1></th></tr>
</table>
<br><br>
<form action="/sori/quit.my" method="post">
<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>">
<div class="quitdiv">
<center><h2>탈퇴 사유를 선택해주세요.</h4></center><br><br><br>
<h5><label><input type="radio" name="reason" value="1" checked>사이트 이용 빈도가 낮습니다.</label><br></h5>
<h5><label><input type="radio" name="reason" value="2">사이트 이용방법이 어렵습니다.</label><br></h5>
<h5><label><input type="radio" name="reason" value="3">개인정보 유출이 우려됩니다.</label><br></h5>
<h5><label><input type="radio" name="reason" value="4">기타 사유</label><br></h5>
<textarea name="etc"></textarea>
</div>
<br>
<center>
<input type="checkbox" id="qgaree">&nbsp;&nbsp;
사이트 탈퇴시 작성한 글은 자동으로 삭제되지 않으며, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
가입시 입력한 정보는 탈퇴 후 30일간 보관한 뒤에 삭제됩니다.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
재가입은 30일 이후 가능합니다. 동의하시면 체크해주세요.<br><br>
</center>
<table border="0" cellspacing="0" cellpadding="10" align="center" width="800" height="60">
<tr>
<td colspan="2" align="center">
	<button class="ui secondary button" id="quitbtn" type="submit">
  		탈퇴하기
	</button>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="ui yellow button" onclick="history.go(-1); return false;">
  		돌아가기
	</button>
</td>
</tr>
</table>
</form>
</section>
</div>
</body>
</html>