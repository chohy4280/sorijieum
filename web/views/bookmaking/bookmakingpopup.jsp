<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress, member.model.vo.Member" %>
<%
	BookMakingProgress bmp = (BookMakingProgress)request.getAttribute("bmp");
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 제작 참여시 안내</title>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
function winOpen(){
	window.opener.location.href = "/sori/views/bookmaking/guide.jsp";
	window.self.close();
}

function winOpens(){
	window.opener.location.href = "/sori/bmmload?bookcode=<%=bmp.getBookCode() %>&userid=<%= loginMember.getUserId() %>";
	window.self.close();
}
</script>
<style>
@font-face {
	font-family: 'S-CoreDream-7ExtraBold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff')
		 format('woff');
	font-weight: normal;
	font-style: normal;
}

* { font-family: 'S-CoreDream-7ExtraBold'; }

.wrapper {
	z-index:1;
	position:relative;
	width:100%;
	height:100%;
}
	
.wrapper:after{
	width:100%;
	height:100%;
	z-index:-1;
	position:absolute;
	top:0;
	left:0;
	content:"";
	background-image: url('/sori/resources/images/mainbook.jpg') ;
	background-repeat:no-repeat;
	background-position:center;
	background-size: cover; 
	background-attachment: scroll;
	opacity: 0.05;
}
</style>
<!-- 시맨틱유아이 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
</head>
<body>
<div class="wrapper">
<div align="center" style="margin-top:-10px;">
<img src="/sori/resources/images/logo.png" style="width:170px;height:170px;" >
</div>
<div class="ui basic floating icon message" style="margin-top:-10px;">
  <i class="book icon"></i>
  <div class="content">
    <div class="header"><font style="vertical-align: inherit;font-size:14pt;">
      도서제작에 참여해주셔서 감사합니다.
    </font></div>
    <p><font style="vertical-align: inherit;">
    제작 가이드라인을 반드시 숙지해주신 후,<br>제작에 참여해주시기 바랍니다.<br>
    제작은 10페이지씩 참여하실 수 있으며,<br>가급적 주어진 제작 시간 안에 완료하여 주시기 바랍니다.<br>
    완료하지 못하시면 추후 제작 참여에 패널티가 있을 수 있습니다.<br>
    감사합니다.</font></p>
  </div>
</div>
 <div class="ye-make-button" align="right" style="margin-top:-30px;margin-right:65px;">
 <button class="ui yellow button" onclick="winOpen()"
style="font-size:10pt;text-align:center;font-family:'S-Core Dream 5';">제작가이드라인 안내</button>
<button onclick="winOpens()" class="ui yellow button" style="font-family:'S-Core Dream 6'">제작하기</button>
<button onclick="window.self.close()" class="ui yellow button" style="font-family:'S-Core Dream 6'">돌아가기</button>
</div>
</div>
</body>
</html>