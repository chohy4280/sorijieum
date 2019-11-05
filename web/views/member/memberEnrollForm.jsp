<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼 페이지</title>
<!-- 시맨틱 UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
   var idTF = "F";
   var pwTF = "F";
   var pwEq = "F";
   $("#checkid").click(function(){
      $.ajax({
         url:"/sori/idcheck",
         type:"post",
         data:{userid:$("#userid").val()},
         success: function(result){  // 만약 성공적으로 수행되었다면 result로 값반환
            if(result == "ok"){
               var idReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/;       //아이디 유효성 - 영어소문자숫자
               var idAdmin = /^((?!admin).)*$/;                  //아이디 유효성 - admin 미포함
               if(!idAdmin.test($("#userid").val())){
                  $("#idspan").html("아이디에 'admin'단어를 포함할 수 없습니다.");
                  $("#userid").select();
                  idTF = "F";
                  idchk2();
               }
               else if(!idReg.test($("#userid").val())){
                  $("#idspan").html("영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.");
                  $("#userid").select();
                  idTF = "F";
                  idchk1();
               }
               else{
                  $("#idspan").html("사용 가능한 아이디입니다.");
                  $("#userpwd").focus();
                  idTF = "T";
                  idcomp_userpwd();
               }
            }
            else{
               $("#idspan").html("이미 사용중인 아이디입니다.\n다른 아이디를 입력해주세요.");
               $("#userid").select();
               idTF = "F";
               idchk3();
            }
         } 
      });   
      return false;
   });

   $("#userpwd2").focusin(function(){
      var pwdReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/;    //비밀번호 유효성 - 영어소문자숫자
      if(!pwdReg.test($("#userpwd").val())){
         $("#pwdspan").html("암호는 영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.");
         $("#userpwd").select();
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
			$("#userpwd2").keyup(function(){	//비밀번호부터 다시 입력하려고 위쪽 방향키 누르면
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
   
   $("input[name='gender']").focusin(function(){
	   genderin();
	   $(this).keyup(function(){
		   if(event.keyCode == 49){
			   $("#man").prop("checked", true);
		   }
		   else if(event.keyCode == 50){
			   $("#woman").prop("checked", true);
		   }
	   });
   });
   
   $("#birth").focusin(function(){
	   birthin();
   });
   
   $("input[name='typenumber']").change(function(){	//제작자 체크시 소리 끄기
	   if($(':radio[name="typenumber"]:checked').val() == 3)
		   audio_off();
   });
	
   $("#btnsub").click(function(){
      if(idTF=="T" && pwTF=="T" && pwEq=="T")
         return true;
      else{
         alert("입력한 내용을 다시 확인해주세요.");
         return false;
      }
   });
   
   $("#btnsub").focusin(function(){	//이용자 모든 정보 입력 후, 가입하기 버튼으로 포커스 왔을 때
	   submit_comp();
   	   $(this).keyup(function(){
   		   if(event.keyCode == 57){
   			   location.href="/sori/index.jsp";
   		   }
   	   });
   });
}); 


var audio = new Audio("/sori/resources/mp3/enroll/enroll_form_1main.mp3");
window.onload = function(){
	audio.play();
	$("#username").focus();
}	

window.onkeyup = function(){
	if(event.keyCode == 27){
		audio.pause();
		audio.currentTime = 0;
	}
}

function audio_off(){	//제작자로 선택했을 때, 오디오 끄기
	audio.pause();
	audio = null;
}

function focus_userid(){	//아이디 입력 안내
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_2userid.mp3");
	audio.play();
}

function idchk2(){	//아이디 조건 불충족
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_2idchk2.mp3");
	audio.play();
}

function idchk1(){	//아이디에 admin 포함
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_2idchk1.mp3");
	audio.play();
}

function idchk3(){	//이미 사용중인 아이디
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_2idchk3.mp3");
	audio.play();
}

function idcomp_userpwd(){	//아이디 체크 성공, 비밀번호 입력
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_3userpwd.mp3");
	audio.play();
}

function pwdchk1(){	//비밀번호 조건 체크 불충족 , 다시 입력
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_3pwdchk1.mp3");
	audio.play();
}

function focus_userpwd2(){	//비밀번호 체크 성공, 비밀번호 확인 입력
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_4userpwd2.mp3");
	audio.play();
}

function pwd2chk1(){	//비밀번호 확인 불일치
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_4pwdchk1.mp3");
	audio.play();
}

function back_userpwd(){	//비밀번호 확인 틀린 후, 비밀번호로 다시 이동시
	$("#userpwd").select();
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_4pwdback.mp3");
	audio.play();
}

function phonein(){	//비밀번호 확인 후 전화번호 입력으로 넘어오면
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_5phone.mp3");
	audio.play();
}

function emailin(){	//전화번호 입력 후 이메일 입력칸으로 넘어오면
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_6email.mp3");
	audio.play();
}

function genderin(){	//이메일 입력 후 성별 선택
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_7gender.mp3");
	audio.play();
}

function birthin(){
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_8birth.mp3");
	audio.play();
}

function submit_comp(){
	audio.pause();
	audio = new Audio("/sori/resources/mp3/enroll/enroll_form_9submit.mp3");
	audio.play();
}
</script>
<style type="text/css">
* th{
	text-align:center;
}
* td{
	padding-left:10px;
}

#userid { 
	-webkit-ime-mode:disabled; 
	-moz-ime-mode:disabled; 
	-ms-ime-mode:disabled; 
	ime-mode:disabled; 
} 
</style>
</head>
<body>
<section class="my-section">
<table border="0" cellspacing="0" cellpadding="10" align="center" width="800" height="60">
<tr><th width="50%" bgcolor="#F5DEB3"><h1>1.약관동의</h1></th><th bgcolor="#ECB93E"><h1>2.가입정보입력</h1></th></tr>
</table>
<br>

<form action="/sori/enroll" method="post" id="enform">
<table align="center" width="800" height="500" cellspacing="0" cellpadding="30px" border="1">
<tr>
   <th width="150">회원구분</th>
   <td><label>&nbsp;&nbsp;<input type="radio" name="typenumber" value="1" checked> 이용자</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <label><input type="radio" name="typenumber" value="3" required> 제작자</label></td>
</tr>

<tr><th>이 름</th><td>&nbsp;&nbsp;<input type="text" name="username" id="username" required></td></tr>   <!-- required : 필수 입력항목 -->

<tr><th>아이디</th>
            <td>&nbsp;&nbsp;<input type="text" name="userid" id="userid" onfocusin="focus_userid()" required> &nbsp;
              <button id="checkid" onsubmit="return false;">중복체크</button>&emsp;
            <span id="idspan"></span></td></tr>
               
<tr><th>암 호</th><td>&nbsp;&nbsp;<input type="password" name="userpwd" id="userpwd" required>&emsp;<span id="pwdspan"></span></td></tr>

<tr><th>암호확인</th><td>&nbsp;&nbsp;<input type="password" id="userpwd2" required>&emsp;<span id="pwdspan2"></span></td></tr>

<tr><th>전화번호</th><td>&nbsp;&nbsp;<input type="tel" name="phone" id="phone" maxlength="11" placeholder="ex)01012345678" required></td></tr>

<tr><th>이메일</th><td>&nbsp;&nbsp;<input type="email" name="email" id="email" placeholder="ex)abc@example.com" required></td></tr>

<tr><th>성 별</th>
<td>&nbsp;&nbsp;<label><input type="radio" name="gender" id="man" value="M" required> 남자</label> &nbsp;
            <label><input type="radio" name="gender" id="woman" value="F" required> 여자</label></td></tr>
            
<tr><th>생년월일</th><td>&nbsp;&nbsp;<input type="text" name="birth" id="birth" maxlength="8" placeholder="ex)19930428" required></td></tr>

<tr><th colspan="2">
<input type="submit" value="가입하기" id="btnsub"></a> &nbsp;
<input type="reset" value="다시작성"> &nbsp;
</th></tr>
</table>
</form>
<br>
<center><a href="/sori/views/member/memberEnrollAgree.jsp">약관동의 페이지로 이동</a></center>
</section>
</body>
</html>