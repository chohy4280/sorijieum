<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("message");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디|비밀번호 찾기 실패</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript">

	var audio = new Audio("/sori/resources/mp3/searchFail.mp3");	// 화면 접속 시 음성안내 자동재생
	window.onload = function(){
   	audio.play();
	}  
	
	 $(function(){
	    	window.onkeyup = function(){
	   		   if(event.keyCode == 49 || event.keyCode == 97){		// 1번:다시찾기
	   			location.href="/sori/views/member/memberSearchIdPwd.jsp";
	   		   }else if(event.keyCode == 50 || event.keyCode == 98){		// 2번:회원가입
	   			location.href="/sori/views/member/memberEnrollAgree.jsp";
	   		   }else if(event.keyCode == 51 || event.keyCode == 99){		// 3번:로그인페이지
	   			location.href="/sori/views/member/memberLoginView.jsp";
	   		   }else if(event.keyCode == 52 || event.keyCode == 100){		// 4번:메인페이지
	   			location.href="/sori/index.jsp";
	   		   }else{														// 잘못누른경우
	   			   audio.pause();
	   			   audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
	   			   audio.play();
	   		   }
	    	}
	 })
	    

	
</script>
</head>
<body>
<section class="my-section" style="margin-top:10%">
<div class="ui raised very padded text container segment" style="width:450px;height:150px;margin-left:40%;display:table;">
	<div style="display:table-cell;vertical-align:middle;text-align:center;font-size:15pt;">
	<%= message %>
	</div>
</div>
<center>
<button class="massive ui button ui yellow button" style="margin-left:10px;" onclick="location.href='/sori/views/member/memberLoginView.jsp'">
	로그인하기
</button>
<button class="massive ui button" style="margin-left:10px;">
	<a href="javascript:history.go(-1);" style="color:black">이전페이지로</a>
</button>
</center>
</section>
</body>
</html>