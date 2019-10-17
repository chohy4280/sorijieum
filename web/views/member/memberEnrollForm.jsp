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
                  $("#idspan").html("&nbsp;&nbsp;아이디에 'admin'글자를 포함할 수 없습니다.");
                  $("#userid").select();
                  idTF = "F";
               }
               else if(!idReg.test($("#userid").val())){
                  $("#idspan").html("&nbsp;&nbsp;영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.");
                  $("#userid").select();
                  idTF = "F";
               }
               else{
                  $("#idspan").html("&nbsp;&nbsp;사용 가능한 아이디입니다.");
                  $("#userpwd").focus();
                  idTF = "T";
               }
            }
            else{
               $("#idspan").html("&nbsp;&nbsp;이미 사용중인 아이디입니다.\n다른 아이디를 입력해주세요.");
               $("#userid").select();
               idTF = "F";
            }
         } 
      });   
      return false;
   });

   $("#userpwd2").focusin(function(){
      var pwdReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/;    //비밀번호 유효성 - 영어소문자숫자
      if(!pwdReg.test($("#userpwd").val())){
         $("#pwdspan").html("&nbsp;&nbsp;암호는 영어소문자와 숫자만으로 4~20자리로 입력해야 합니다.");
         pwTF = "F";
      }
      else{
         $("#pwdspan").html("&nbsp;&nbsp;사용 가능한 암호입니다.");
         pwTF = "T";
      }
      return false;
   });
   
   $("#userpwd2").keyup(function(){
      if($("#userpwd").val() != $("#userpwd2").val()){
         $("#pwdspan2").html("&nbsp;&nbsp;암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
         pwEq = "F";
      }
      else{
         $("#pwdspan2").html("&nbsp;&nbsp;암호와 암호확인이 일치합니다.");
         pwEq = "T";
      }
      return false;
   });
   
   $("#btnsub").click(function(){
      if(idTF=="T" && pwTF=="T" && pwEq=="T")
         return true;
      else{
         alert("입력한 내용을 다시 확인해주세요.");
         return false;
      }
   });
});   
</script>
<style type="text/css">
* th{
	text-align:center;
}
* td{
	padding-left:10px;
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

<tr><th>이 름</th><td>&nbsp;&nbsp;<input type="text" name="username"></td></tr>   <!-- required : 필수 입력항목 -->

<tr><th>아이디</th>
            <td>&nbsp;&nbsp;<input type="text" name="userid" id="userid" > &nbsp;
              <button id="checkid" onsubmit="return false;">중복체크</button>
            <span id="idspan"></span></td></tr>
               
<tr><th>암 호</th><td>&nbsp;&nbsp;<input type="password" name="userpwd" id="userpwd" ><span id="pwdspan"></span></td></tr>

<tr><th>암호확인</th><td>&nbsp;&nbsp;<input type="password" id="userpwd2" ><span id="pwdspan2"></span></td></tr>

<tr><th>전화번호</th><td>&nbsp;&nbsp;<input type="tel" name="phone" id="phone" maxlength="11" placeholder="ex)01012345678" ></td></tr>

<tr><th>이메일</th><td>&nbsp;&nbsp;<input type="email" name="email" placeholder="ex)abc@example.com" ></td></tr>

<tr><th>성 별</th>
<td>&nbsp;&nbsp;<label><input type="radio" name="gender" value="M" > 남자</label> &nbsp;
            <label><input type="radio" name="gender" value="F" > 여자</label></td></tr>
            
<tr><th>생년월일</th><td>&nbsp;&nbsp;<input type="date" name="birth" ></td></tr>

<tr><th colspan="2">
<a href="/sori/views/member/memberLoginView.jsp"><input type="submit" value="가입하기" id="btnsub"></a> &nbsp;
<input type="reset" value="다시작성"> &nbsp;
</th></tr>
</table>
</form>
<br>
<center><a href="/sori/views/member/memberEnrollAgree.jsp">약관동의 페이지로 이동</a></center>
</body>
</html>