<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%-- <% 
	Member loginMember =(Member)session.getAttribute("loginMember");
%>  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript">
$(function(){
	if(localStorage.getItem("userid") != null && localStorage.getItem("userpwd") != null){
		/* $.ajax({
			url:"autoLogin",
			type:"post",
			dataType:"json",
			data:{
					userid: localStorage.getItem("userid"),
					userpwd: localStorage.getItem("userpwd")
			},
			success:function(data){
				$("#p2").html($("#p2").text()+ "<br>"+ data);
			}
		});	//$.ajax() */
		$("#userid").val(localStorage.getItem("userid"));
		$("#userpwd").val(localStorage.getItem("userpwd"));
	}
});


function autoChk(){
	if($("input:checkbox[name='autoLogin']").is(":checked") == true){
		localStorage.setItem("userid",$("#userid").val());
		localStorage.setItem("userpwd",$("#userpwd").val());
	}
	else{
		if(localStorage.getItem("userid") != null && localStorage.getItem("userpwd") != null){
			localStorage.removeItem("userid");
			localStorage.removeItem("userpwd");
		}
	}
	return true;
}

// 음성안내 **************************************************************

	var audio = new Audio("/sori/resources/mp3/login.mp3");	// 화면 접속 시 음성안내 자동재생
	window.onload = function(){
	   audio.play();
	   $("#idpwFindPage").focus();
	}   
	
	$(function(){
		$("#userid").keyup(function(){	// 9번 누르면 메인으로 이동
			var keyV1 = $(this).val();
			if(keyV1 == '9'){
				location.href="/sori/index.jsp";
			}
		})
	});
	  
	function input_userpwd(){	//비밀번호창 포커스
		audio.pause();
	   audio = new Audio("/sori/resources/mp3/password.mp3");
	   audio.play();
	}

  	function keyUP(){
		$("#userid").keyup(function(e){	// 아이디 비밀번호 찾기를 위한 스페이스바 입력
			if(e.keyCode == 32){				// 아이디창에 스페이스바 입력 시
				location.href="/sori/views/member/memberSearchIdPwd.jsp";
		}
	})
	}
  	
  	function keyUP2(){
		$("#userpwd").keyup(function(e){	// 아이디 비밀번호 찾기를 위한 스페이스바 입력
			if(e.keyCode == 32){				// 비밀번호 창에 스페이스바 입력 시
				location.href="/sori/views/member/memberSearchIdPwd.jsp";
		}
	})
	}
</script>
</head>
<body>
<section class="my-section">
<center>

<form action="/sori/memberLogin">

<div class="ui form" style="margin-top:10px;">
  <div class="inline field">
    <label>아 이 디</label>&nbsp;&nbsp;&nbsp;
    <input type="text" placeholder="아이디" name="userid" id="userid" autofocus="autofocus" onkeyup="keyUP();" style="width:300px;height:50px;font-family:'S-Core Dream 5';">
  </div>
  <div class="inline field">
    <label>비밀번호</label>&nbsp;&nbsp;
    <input type="password" placeholder="비밀번호" name="userpwd" id="userpwd" onkeyup="keyUP2();" onfocusin="input_userpwd()" style="width:300px;height:50px;font-family:'S-Core Dream 5';">
  </div>
</div>
<br>
<label><input type="checkbox" name="autoLogin" value="1">&nbsp;로그인정보저장</label>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/sori/views/member/memberSearchIdPwd.jsp">아이디|비밀번호 찾기</a>
<br><br>

<div>
	<button class="ui huge yellow button" onclick="autoChk()" style="color:black;font-size:20pt;font-family:'S-Core Dream 6';">로그인</button>
</div>
</form>

</center>
</section>

</body>

</html>