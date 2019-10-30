<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 사이드바 </title>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<%@ include file="/inc/top.jsp"%>
<%-- <%@ include file="/../inc/cdn.jsp"%> --%>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<style>
@font-face { 
	font-family: 'S-CoreDream-7ExtraBold'; 
	 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
	 font-weight: normal; 
	 font-style: normal; 
}

* { 
	font-family: 'S-CoreDream-7ExtraBold';
}

nav { 
	float:left; 
	height:100%;
}

</style>
</head>
<body>
<nav>
<div class="ui vertical menu" style="margin:9% 0 0 0;height:100%;width:225px;">
 <div style="position:fixed">
  <div class="item">
  <i class="brown fitted big home icon" style="float:left;margin-left:0;"></i>
  <a href="/sori/mypage?userid=<%= loginMember.getUserId() %>" style="font-size:20pt; text-decoration:none;color:black">마이페이지</a>
  </div>
  <div class="item">
    <i class="brown fitted big home icon" style="float:left;margin-left:0;"></i>
    <a style="font-size:20pt">도서</a>
    <div class="menu">
    <% if(loginMember.getTypeNumber()==3){ %>
    	<a class="item" href="/sori/makebook.my?userid=<%= loginMember.getUserId() %>" style="font-size:13pt">참여도서</a>
    <% }else { %>
    	<a class="item" href="/sori/mybook.my?userid=<%= loginMember.getUserId() %>" style="font-size:13pt">내서재</a>
    	<a class="item" href="/sori/likebook.my?userid=<%= loginMember.getUserId() %>" style="font-size:13pt">관심도서</a>
    	<a class="item" href="/sori/wishbook.my?userid=<%= loginMember.getUserId() %>" style="font-size:13pt">신청도서</a>
    <% } %>
    </div>
  </div>
  <div class="item">
    <i class="brown fitted big home icon" style="float:left;margin-left:0;"></i>
    <a style="font-size:20pt">개인</a>
    <div class="menu">
      <a class="item" href="/sori/qlist.my?userid=<%= loginMember.getUserId() %>" style="font-size:13pt">내 문의</a>
      <a class="item" href="/sori/myinfo?userid=<%= loginMember.getUserId() %>" style="font-size:13pt">내 정보수정</a>
    </div>
  </div>
  </div>
 </div>
</nav>
</body>
</html>