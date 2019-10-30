<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress, member.model.vo.Member" %>
<%
	ArrayList<BookMakingProgress> list = (ArrayList<BookMakingProgress>)request.getAttribute("list");
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

function makeopen(){
	<% for(int i = 0; i < list.size(); i++){ 
		BookMakingProgress bmp = list.get(i); 
		 if(bmp.getBookmakestartstatus().equals("N") && bmp.getBookcompleteyn().equals("N")){ %>
			window.opener.location.href = "/sori/bmmload?bookcode=<%= bmp.getBookCode() %>&userid=<%= loginMember.getUserId() %>&page=<%= bmp.getBookmakepage() %>&index=<%=i%>";
			window.self.close();
		<% 
		  break; }if(i==list.size()-1){ %>
			alert("다른 제작자가 도서를 제작중입니다. 잠시후에 다시 제작버튼을 눌러주세요!");
			window.self.close();
		 <% 
		break; } }%>
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
	opacity: 0;
}
</style>
<!-- 시맨틱유아이 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
</head>
<body>
<br>
<div class="wrapper">
<div align="center" style="margin-top:-20px;">
<img src="/sori/resources/images/logo.png" style="width:190px;height:190px;" >
</div>
<div align="right" style="margin-right:20px;margin-top:-25px;">
<i class="yellow large info circle icon"></i>
 <button class="ui big yellow button" onclick="winOpen()"
style="font-size:10pt;text-align:center;font-family:'S-Core Dream 5';">제작가이드라인 안내</button>
</div>
<!-- <div class="ui basic floating icon message" style="margin-top:-15px;">
  <i class="book icon"></i>
  <div class="content">
    <div class="header"><font style="vertical-align: inherit;font-size:14pt;">
      도서제작에 참여해주셔서 감사합니다.
    </font></div>
    <p><font style="vertical-align: inherit;">
    제작 가이드라인을 반드시 숙지해주신 후,<br>제작에 참여해주시기 바랍니다.<br>
    제작은 10페이지씩 참여하실 수 있으며,<br>반드시 주어진 시간 내에 완료하여 주시기 바랍니다.<br>
    제작시간 내에 완료하지 못하시면 제작중이던 페이지는 사라지고, <br>메인페이지로 이동됩니다.<br>
    제작시간은 쪽수 대비 문장량으로 최대한 넉넉하게 주어집니다!<br>
    다시한번 도서제작에 참여해주신 제작자분의 노고에 깊은 감사를 드립니다.
  </font></p>
  </div>
</div> -->
<div class="ui column grid" style="margin-top:5px;margin-left:20px;width:95%;padding:5px;">
  <div class="column">
    <div class="ui raised segment">
      <div class="ui yellow ribbon label" style="font-size:1.2rem;font-align:center;font-family:'S-Core Dream 8'">
      <i class="large book icon"></i>제작 전 안내사항</div><br><br>
      <div class="header"><font style="vertical-align: inherit;font-size:1.5rem;font-family:'S-Core Dream 6'">
	      도서제작에 참여해주셔서 정말 감사드립니다.
	    </font></div><br>
      <p><font style="vertical-align: inherit;font-size:1rem;font-family:'S-Core Dream 5'">
	    제작 가이드라인을 반드시 숙지해주신 후,<br>제작에 참여해주시기 바랍니다.<br>
	    제작은 10페이지씩 참여하실 수 있으며,<br>반드시 주어진 시간 내에 완료하여 주시기 바랍니다.<br>
	    제작시간 내에 완료하지 못하시면 제작중이던 페이지는 사라지고, <br>메인페이지로 이동됩니다.<br>
	    제작시간은 쪽수 대비 문장량으로 최대한 넉넉하게 주어집니다!<br>
	    또한, 크롬 브라우저로 접속해서 제작해주시기 바랍니다.  <br>
	    다시한번 도서제작에 참여해주신 제작자분의 노고에 깊은 감사를 드립니다.
	  </font></p>
    </div>
  </div>
</div>
 <div class="ye-make-button" align="right" style="margin-top:-55px;margin-right:38px;">
<button id="ye-makeopen" onclick="makeopen()" class="ui big yellow button" style="font-family:'S-Core Dream 6'">제작하기</button>&nbsp;
<button onclick="window.self.close()" class="ui big yellow button" style="font-family:'S-Core Dream 6'">돌아가기</button>
</div>
</div>
</body>
</html>