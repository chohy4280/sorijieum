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
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript">
$(function(){
	var pwTF = "F";
	var pwEq = "F";
	$("#userpwd2").focusin(function(){
		var pwdReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/; 	//비밀번호 유효성 - 영어소문자숫자
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
		if(pwTF=="T" && pwEq=="T")
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
				
					
<tr><th>암 호</th><td>&nbsp;&nbsp;<input type="password" name="userpwd" id="userpwd" ><span id="pwdspan"></span></td></tr>

<tr><th>암호확인</th><td>&nbsp;&nbsp;<input type="password" id="userpwd2" ><span id="pwdspan2"></span></td></tr>

<tr><th>전화번호</th><td>&nbsp;&nbsp;<input type="tel" name="phone" id="phone" maxlength="11" value="<%= loginMember.getPhone() %>" ></td></tr>

<tr><th>이메일</th><td>&nbsp;&nbsp;<input type="email" name="email" value="<%= loginMember.getEmail() %>" ></td></tr>

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
</body>
</html>