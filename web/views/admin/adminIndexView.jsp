<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%@ page import="java.util.ArrayList, java.util.Date, java.text.SimpleDateFormat, wishbook.model.vo.WishBook, book.model.vo.Book, qna.model.vo.Qna,
				member.model.vo.Member, quit.model.vo.Quit "%>

<%
	Date sysdate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
	ArrayList<WishBook> wishbList = (ArrayList<WishBook>)request.getAttribute("wishbList");
	ArrayList<Book> wbList = (ArrayList<Book>)request.getAttribute("wbList");
	ArrayList<Book> mbList = (ArrayList<Book>)request.getAttribute("mbList");
	ArrayList<Book> dbList = (ArrayList<Book>)request.getAttribute("dbList");
	ArrayList<Qna> newQList = (ArrayList<Qna>)request.getAttribute("newQList");
	ArrayList<Qna> uaQList = (ArrayList<Qna>)request.getAttribute("uaQList");
	ArrayList<Member> newUList = (ArrayList<Member>)request.getAttribute("newUList");
	ArrayList<Member> totalUList = (ArrayList<Member>)request.getAttribute("totalUList");
	ArrayList<Member> newMList = (ArrayList<Member>)request.getAttribute("newMList");
	ArrayList<Member> totalMList = (ArrayList<Member>)request.getAttribute("totalMList");
	ArrayList<Quit> quitUList = (ArrayList<Quit>)request.getAttribute("quitUList");
	ArrayList<Quit> quitMList = (ArrayList<Quit>)request.getAttribute("quitMList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음 관리자 시스템</title>
<script type="text/javascript">

	function emptyAlert(){
		alert("해당 내역이 없습니다.");
	}
	
</script>
</head>

<body>
<!-- Content 시작! -->
<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<section class="contentsection">
	<!--오늘의 차트 시작-->
            <div class="base">
	            <img src="/sori/resources/images/refresh.png" style="width:25px; height:25px;" onclick="window.location.reload()">
	            <span class="sysdate"><%= sdf.format(sysdate) %></span>
	            
	            <div class="data">
	            
	            <!-- 도서 섹션-->          
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge book icon" style="color: #f2c61f;"></i>
	            		<div class="data-title" style="color: #f2c61f">도서</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신청도서</div>
	            		<div>제작대기도서</div>
	            		<div>제작중도서</div>
	            		<div>완료도서</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todaybook"><%if(wishbList.size() == 0) {%><a href="#" onclick="emptyAlert();">
								            		<%}else{ %><a href="/sori/wbslist.ad?page=1&searchtype=wishbooktitle&keyword=&wishstatus=WAIT">
								            		<%} %><%= wishbList.size() %></span></a> 권</div>
								            		
	            		<div><span class="todaybook"><%if(wbList.size() == 0) {%><a href="#" onclick="emptyAlert();">
	            									<%}else{ %><a href="/sori/bslist.ad?page=1&searchtype=bookcode&keyword=&makestatus=WAIT">
	            									<%} %><%= wbList.size() %></span></a> 권</div>
	            									
	            		<div><span class="todaybook"><%if(mbList.size() == 0) {%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/bslist.ad?page=1&searchtype=bookcode&keyword=&makestatus=MAKE">
	            									<%} %><%= mbList.size() %></span></a> 권</div>
	            									
	            		<div><span class="todaybook"><%if(dbList.size() == 0) {%><a href="#" onclick="emptyAlert();">
	            									<%}else{ %><a href="/sori/bslist.ad?page=1&searchtype=bookcode&keyword=&makestatus=DONE">
	            									<%} %><%= dbList.size() %></span></a> 권</div>
	            	</div>
	            </div>
	            
	            
	            <!-- 게시글 섹션-->
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge red clipboard list icon"></i>
	            		<div class="data-title" style="color: #d95c5c">게시글</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>새 문의글</div>
	            		<div>미답변 문의</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todayboard"><% if(newQList.size() == 0) {%><a href="#" onclick="emptyAlert();">
	            									<%}else{ %><a href="/sori/bodslist.ad?page=1&searchtype=qnatitle&keyword=&qnastatus=ALL&qnadate=sysdate">
	            									<%} %><%= newQList.size() %></span></a> 건</div>
	            									
	            		<div><span class="todayboard"><% if(uaQList.size() == 0) {%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/bodslist.ad?page=1&searchtype=qnatitle&keyword=&qnastatus=N&qnadate=null">
	            									<%} %> <%= uaQList.size() %></span></a> 건</div>
	            	</div>
	            </div>
	            
	            
	            
	            <!-- 이용자 섹션-->
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge green user icon"></i>
	            		<div class="data-title" style="color: #5bbd72">이용자</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신규회원</div>
	            		<div>탈퇴회원</div>
	            		<div>TOTAL</div>
	            	</div>
	            	<div class="data-section3">					
	            		<div><span class="todayuser1"><%if(newUList.size() == 0){%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/mslist.ad?page=1&searchtype=userid&keyword=&gender=ALL&typenumber=6">
	            									<%}%><%= newUList.size() %></span></a> 명</div>
	            									
	            		<div><span class="todayuser1"><%if(quitUList.size() == 0){%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/qmslist.ad?page=1&typenumber=12&userid=&quittype=ALL">
	            									<%}%><%= quitUList.size() %></span></a> 명</div>
	            									
	            		<div><span class="todayuser1"><%if(totalUList.size() == 0){%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/mslist.ad?page=1&searchtype=userid&keyword=&gender=ALL&typenumber=7">
	            									<%}%><%= totalUList.size() %></span></a> 명</div>
	            	</div>
	            </div>
	            
	
				<!-- 제작자 섹션-->
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge blue user icon"></i>
	            		<div class="data-title" style="color: #3b83c0">제작자</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신규회원</div>
	            		<div>탈퇴회원</div>
	            		<div>TOTAL</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todayuser2"><%if(newMList.size() == 0){%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/mslist.ad?page=1&searchtype=userid&keyword=&gender=ALL&typenumber=8">
	            									<%}%><%= newMList.size() %></span></a> 명</div>
	            									
	            		<div><span class="todayuser2"><%if(quitMList.size() == 0){%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/qmslist.ad?&page=1&typenumber=33&userid=&quittype=ALL">
	            									<%}%><%= quitMList.size() %></span></a> 명</div>
	            		<div><span class="todayuser2"><%if(totalMList.size() == 0){%><a href="#" onclick="emptyAlert();">
	            									<%}else{%><a href="/sori/mslist.ad?page=1&searchtype=userid&keyword=&gender=ALL&typenumber=3">
	            									<%}%><%= totalMList.size() %></span></a> 명</div>
	            	</div>
	            </div>
	            
	            	            
	            </div>	            
            </div>
       <!-- 오늘의 차트 끝! -->
       
       
       
</section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>


</body>
</html>