<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error!</title>
<!-- 시맨틱 UI -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
			 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
			 font-weight: normal; 
			 font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}

body{
     background-color: #e0e0e0;
}



</style>


</head>
<body>
	<center>
		<div style="margin-top: 60px;">
			<img src="/sori/resources/images/error.png">
		</div>
		<div style="font-size:50pt; font-weight: 600; color:#d00000;">
		<i class="bomb icon"></i>ERROR<i class="bomb icon"></i>
		</div>
		<br>
		<div style="font-size:35px;"><%= message %></div>
		<br><br><br>
		<button class="ui black button" onclick="history.go(-1);"><i class="mini angle left icon"></i>BACK</button>&nbsp;
		<button class="ui black button" onclick="location.href='/sori/index.jsp'"><i class="mini home icon"></i>HOME</button>
	</center>
</body>
</html>