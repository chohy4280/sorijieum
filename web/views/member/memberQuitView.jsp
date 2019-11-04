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
	
	
	$("#quit_main1").keyup(function(){	
		var keyV = $(this).val();
		if(keyV == '1'){		// 탈퇴사유 선택
			audio.pause();
			audio = new Audio("/sori/resources/mp3/mypage/quit_2info.mp3");
			audio.play();
			$("#quit_main2").focus();
		}else if (keyV == '2'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '3'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '4'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '5'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '6'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '7'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '8'){	// 없음(값 지우기)
			$("#quit_main1").val("");
		}else if (keyV == '9'){	// 마이페이지로 이동
			location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}else if (keyV == '0'){	// 다시듣기
			audio.play();
		}else if (event.keyCode == 27){ //음성 멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
	});
	
	$("#quit_main2").keyup(function(){
		var keyV2 = $(this).val();
		if(keyV2 == '1'){		// 탈퇴사유 1번
			$("input:radio[name='reason']:input[value='1']").attr("checked", true);
			quitinfochk();
			$("#quit_main3").focus();
			quitcheck();
			$("#qgaree").focus();
		}else if (keyV2 == '2'){	// 탈퇴사유 2번
			$("input:radio[name='reason']:input[value='2']").attr("checked", true);
			quitinfochk();
			$("#quit_main3").focus();
			quitcheck();
		}else if (keyV2 == '3'){	// 탈퇴사유 3번
			$("input:radio[name='reason']:input[value='3']").attr("checked", true);
			quitinfochk();
			$("#quit_main3").focus();
			quitcheck();
		}else if (keyV2 == '4'){	// 탈퇴사유 기타사유입력
			$("textarea[name='etc']").focus();
			quitinfosuc();
			$("#quit_main3").focus();
			quitcheck();
		}else if (keyV2 == '5'){	// 없음(값 지우기)
			$("#quit_main2").val("");
		}else if (keyV2 == '6'){	// 없음(값 지우기)
			$("#quit_main2").val("");
		}else if (keyV2 == '7'){	// 없음(값 지우기)
			$("#quit_main2").val("");
		}else if (keyV2 == '8'){	// 없음(값 지우기)
			$("#quit_main2").val("");
		}else if (keyV2 == '9'){	// 마이페이지로 이동
			location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}else if (keyV2 == '0'){	// 다시듣기
			audio.play();
		}else if (event.keyCode == 27){ //음성 멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
	});
	
	$("#quit_main3").keyup(function(){
		var keyV3 = $(this).val();
		if(keyV3 == '1'){		// 탈퇴동의
			$("#qgaree").attr("checked", true);
			submit_quit();
			$("#quitbtn").focus();
		}else if (keyV3 == '2'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '3'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '4'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '5'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '6'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '7'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '8'){	// 없음(값 지우기)
			$("#quit_main3").val("");
		}else if (keyV3 == '9'){	// 마이페이지로 이동
			location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}else if (keyV3 == '0'){	// 다시듣기
			audio.play();
		}else if (event.keyCode == 27){ //음성 멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
	});
	
});

if(<%= loginMember.getTypeNumber() < 3 %>){
var audio = new Audio("/sori/resources/mp3/mypage/quit_1main.mp3");
window.onload = function(){
   audio.play();
}   

function quitinfochk(){
	audio.pause();
	audio = new Audio("/sori/resources/mp3/mypage/quit_2infocheck.mp3");
	audio.play();
}

function quitinfosuc(){
	audoi.pause();
	audio = new Audio("/sori/resources/mp3/mypage/quit_2infosuc.mp3");
	audio.play();
}

function quitcheck(){   //탈퇴 동의
 audio.pause();
 audio = new Audio("/sori/resources/mp3/mypage/quit_3check.mp3");
 audio.play();
}

function submit_quit(){ //탈퇴하기 버튼
 audio.pause();
 audio = new Audio("/sori/resources/mp3/mypage/quit_4submit.mp3");
 audio.play();
}
}
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
<% if(loginMember.getTypeNumber() < 3){ %>
<input type="text" id="quit_main1" autofocus="autofocus">
<input type="text" id="quit_main2" autofocus="autofocus">
<input type="text" id="quit_main3" autofocus="autofocus">
<% } %>
</body>
</html>