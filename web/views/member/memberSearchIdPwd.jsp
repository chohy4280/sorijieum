<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#idbtn").click(function(){
		if($("#username").val() == "" || $("#phone").val() == "" 
			|| $("#username").val().length == 0 || $("#phone").val().length == 0){
			alert("이름과 전화번호를 모두 입력하셔야 아이디 찾기가 가능합니다.");
			return false;
		}
		else{
			return true;
		}	
		return false;
	});
	
	$("#pwdbtn").click(function(){
		if($("#userid").val() == "" || $("#email").val() == "" 
			|| $("#userid").val().length == 0 || $("#email").val().length == 0){
			alert("아이디와 이메일을 모두 입력하셔야 비밀번호 찾기가 가능합니다.");
			return false;
		}
		else{
			return true;
		}	
		return false;
	});
});
</script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<style type="text/css">
#idbtn {
	color:black;
	width:200px;
	height:50px;
	font-size:15pt;
}

#pwdbtn {
	color:black;
	width:200px;
	height:50px;
	font-size:15pt;
}
</style>
</head>
<body>
<section class="my-section">

<center>
<div class="ui placeholder segment" style="width:800px;height:350px;">
  <div class="ui two column very relaxed stackable grid">
    <div class="column">
    <h2>아이디 찾기</h2><br>
    <form action="/sori/searchid" method="post">
      <div class="ui form" style="margin-right:100px;">
         <div class="inline field">
		    <label style="font-size:12pt;">이 름</label><br>
		    <input type="text" name="username" id="username" placeholder="이름 입력" style="width:300px;height:50px;">
		  </div>
         <div class="inline field">
		    <p style="font-size:12pt;">전화번호</p><br>
		    <input type="tel" name="phone" id="phone" placeholder="전화번호 입력" style="width:300px;height:50px;">
		  </div>
        <div style="margin-left:80px;">
		<button type="submit" class="ui yellow button" id="idbtn">아이디 찾기</button>
		</div>
      </div>
    </form>
    </div>
    <div class="middle aligned column">
    <h2>비밀번호 찾기</h2><br>
    <form action="/sori/searchpwd" method="post">
      <div class="ui form" style="margin-right:100px;">
         <div class="inline field">
		    <label style="font-size:12pt;">아 이 디</label><br>
		    <input type="text" name="userid" id="userid" placeholder="아이디 입력" style="width:300px;height:50px;">
		  </div>
         <div class="inline field">
		    <label style="font-size:12pt;">이 메 일</label><br>
		    <input type="email" name="email" id="email" placeholder="이메일 입력" style="width:300px;height:50px;">
		  </div>
        <div style="margin-left:80px;">
        <a href="/sori/views/member/memberSearchPwdComplete.jsp">
		<button type="submit" class="ui yellow button" id="pwdbtn">비밀번호 찾기</button>
		</a>
		</div>
      </div>
    </form>
    </div>
  </div>
  <div class="ui vertical divider">
    Or
  </div>
</div>
</center>
</section>
</body>
</html>