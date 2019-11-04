<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음-회원정보수정</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/sori/resources/js/underscore.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.11/lodash.core.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript">
$(function(){
	var pwTF = "F";
	var pwEq = "F";
	$("#userpwd2").focusin(function(){
		var pwdReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/; 	//비밀번호 유효성 - 영어소문자숫자
		if(!pwdReg.test($("#userpwd").val())){
			$("#pwdspan").html("암호는 영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.");
			pwTF = "F";
			pwdchk1();
		}
		else{
			$("#pwdspan").html("사용 가능한 암호입니다.");
			focus_userpwd2();
			pwTF = "T";
		}
		return false;
	});
	
	$("#userpwd2").keyup(function(){
		if($("#userpwd").val() != $("#userpwd2").val()){
			$("#pwdspan2").html("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
			pwEq = "F";
		}
		else{
			$("#pwdspan2").html("암호와 암호확인이 일치합니다.");
			pwEq = "T";
		}
		return false;
	});
	
 $("#phone").focusin(function(){
      if($("#pwdspan2").html() == "암호와 암호확인이 일치하지 않습니다. 다시 입력하세요."){
         $("#userpwd2").select();
         pwd2chk1();
         $("#userpwd2").keyup(function(){   //비밀번호부터 다시 입력하려고 위쪽 방향키 누르면
            if (event.keyCode == '38') {
               $("#userpwd").select();
               back_userpwd();
            }
         });
      }
      else if($("#pwdspan2").html() == "암호와 암호확인이 일치합니다."){
         phonein();
      }
   });
	   
   $("#email").focusin(function(){
      emailin();
   });
	
	$("#btnsub").click(function(){
		if(pwTF=="T" && pwEq=="T")
			return true;
		else{
			alert("입력한 내용을 다시 확인해주세요.");
			return false;
		}
	});
	
	 $("#btnsub").focusin(function(){   //수정할 정보 입력 후, 수정하기 버튼으로 포커스 왔을 때
      	submit_comp();
         $(this).keyup(function(){
            if(event.keyCode == 57){
               location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
            }
         });
	  });
	
	$("#update_main1").keyup(function(){	
		var keyV = $(this).val();
		if(keyV == '1'){		// 비밀번호 수정
			idcomp_userpwd();
			$("#userpwd").select();
		}else if (keyV == '2'){	// 회원탈퇴 창 이동
			location.href="/sori/views/member/memberQuitView.jsp";
		}else if (keyV == '3'){	// 없음(값 지우기)
			$("#update_main1").val("");
		}else if (keyV == '4'){	// 없음(값 지우기)
			$("#update_main1").val("");
		}else if (keyV == '5'){	// 없음(값 지우기)
			$("#update_main1").val("");
		}else if (keyV == '6'){	// 없음(값 지우기)
			$("#update_main1").val("");
		}else if (keyV == '7'){	// 없음(값 지우기)
			$("#update_main1").val("");
		}else if (keyV == '8'){	// 없음(값 지우기)
			$("#update_main1").val("");
		}else if (keyV == '9'){	// 마이페이지로 이동
			location.href="/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}else if (keyV == '0'){	// 다시듣기
			audio.play();
		}else if (event.keyCode == 27){ //음성 멈춤
			audio.pause();
		    audio.currentTime = 0;
		}
	});
});

if(<%= loginMember.getTypeNumber() < 3 %>){
var audio = new Audio("/sori/resources/mp3/mypage/update_1main.mp3");
window.onload = function(){
   audio.play();
}  

function idcomp_userpwd(){   //비밀번호 입력
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_2userpwd.mp3");
   audio.play();
}

function pwdchk1(){   //비밀번호 조건 체크 불충족 , 다시 입력
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_3pwdchk1.mp3");
   audio.play();
}

function focus_userpwd2(){   //비밀번호 체크 성공, 비밀번호 확인 입력
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_4userpwd2.mp3");
   audio.play();
}

function pwd2chk1(){   //비밀번호 확인 불일치
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_4pwdchk1.mp3");
   audio.play();
}

function back_userpwd(){   //비밀번호 확인 틀린 후, 비밀번호로 다시 이동시
   $("#userpwd").select();
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_4pwdback.mp3");
   audio.play();
}

function phonein(){   //비밀번호 확인 후 전화번호 입력으로 넘어오면
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_5phone.mp3");
   audio.play();
}

function emailin(){   //전화번호 입력 후 이메일 입력칸으로 넘어오면
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_6email.mp3");
   audio.play();
}

function submit_comp(){ //수정하기 버튼
   audio.pause();
   audio = new Audio("/sori/resources/mp3/mypage/update_7submit.mp3");
   audio.play();
}
}
</script>
<style type="text/css">
* th{
	text-align:center;
}
</style>
</head>
<body>
<div class="hy-div">
<section class="hy-section" >

<table border="0" cellspacing="0" cellpadding="10" align="center" width="800" height="60">
<tr><th bgcolor="#ECB93E" height="50"><h1>회원 정보 수정</h1></th></tr>
<tr><td style="text-align:right;font-size:12pt;color:grey;"><a href="/sori/views/member/memberQuitView.jsp">회원탈퇴</a></td></tr>
</table>
<br>

<form action="/sori/mupdate" method="post">
<table align="center" width="800" height="500" cellspacing="0" cellpadding="10" border="1">
<tr>
	<th width="150">회원구분</th>
	<% if(loginMember.getTypeNumber()==1 || loginMember.getTypeNumber()==2){ %>
	<td><label>&nbsp;&nbsp;<input type="radio" name="typenumber" value="1" checked onclick="return(false);"> 이용자</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label><input type="radio" name="typenumber" value="3" onclick="return(false);"> 제작자</label></td>
	<% }else { %>
	<td><label>&nbsp;&nbsp;<input type="radio" name="typenumber" value="1" onclick="return(false);"> 이용자</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label><input type="radio" name="typenumber" value="3" checked onclick="return(false);"> 제작자</label></td>
	<% } %>
</tr>

<tr><th>이 름</th><td>&nbsp;&nbsp;<%= loginMember.getUserName() %></td></tr>	<!-- required : 필수 입력항목 -->

<tr><th>아이디</th>
								<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>">
				<td>&nbsp;&nbsp;<%= loginMember.getUserId() %></td></tr>
				
					
<tr><th>암 호</th><td>&nbsp;&nbsp;<input type="password" name="userpwd" id="userpwd" value="<%= loginMember.getUserPwd() %>"><span id="pwdspan"></span></td></tr>

<tr><th>암호확인</th><td>&nbsp;&nbsp;<input type="password" id="userpwd2" value="<%= loginMember.getUserPwd() %>"><span id="pwdspan2"></span></td></tr>

<tr><th>전화번호</th><td>&nbsp;&nbsp;<input type="tel" name="phone" id="phone" maxlength="11" value="<%= loginMember.getPhone() %>" ></td></tr>

<tr><th>이메일</th><td>&nbsp;&nbsp;<input type="email" name="email" id="email" value="<%= loginMember.getEmail() %>" ></td></tr>

<tr><th>성 별</th>
<% if(loginMember.getGender()=="M"){ %>
	<td>&nbsp;&nbsp;<label><input type="radio" name="gender" value="M" checked onclick="return false;"> 남자</label> &nbsp;
				<label><input type="radio" name="gender" value="F" onclick="return false;"> 여자</label></td></tr>
	<% }else { %>
	<td>&nbsp;&nbsp;<label><input type="radio" name="gender" value="M" onclick="return false;"> 남자</label> &nbsp;
				<label><input type="radio" name="gender" value="F" checked onclick="return false;"> 여자</label></td></tr>
	<% } %>

				
<tr><th>생년월일</th><td>&nbsp;&nbsp;<%= loginMember.getBirth() %></td></tr>

<tr><th colspan="2">
<a href="/sori/views/member/memberLoginView.jsp"><input type="submit" value="수정하기" id="btnsub"></a> &nbsp;
<input type="reset" value="수정취소"> &nbsp;
</th></tr>
</table>
</form>
<br>
<center><a href="/sori/views/member/memberMyPage.jsp">마이페이지로 이동</a></center>

</section>
</div>
<!-- 음성안내 관련 섹션 -->
<% if(loginMember.getTypeNumber() < 3){ %>
<input type="text" id="update_main1" autofocus="autofocus"> 
<% } %>
</body>
</html>