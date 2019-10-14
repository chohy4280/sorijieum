<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%@ page import="java.util.ArrayList, java.util.Date, java.text.SimpleDateFormat, wishbook.model.vo.WishBook, book.model.vo.Book, qna.model.vo.Qna,
				member.model.vo.Member, quit.model.vo.Quit "%>

<%
	Date sysdate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
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
</head>

<body>
<!-- Content 시작! -->
<section class="contentsection">



	<!--오늘의 차트 시작-->
            <div class="base">
	            <i class="large blue check circle icon"></i>
	            <span class="sysdate"><%= sdf.format(sysdate) %></span>
	            
	            <div class="data">
	            
	            <!-- 도서 섹션-->          
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge yellow book icon"></i>
	            		<div class="data-title" style="color: #f2c61f">도서</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신청도서</div>
	            		<div>제작대기도서</div>
	            		<div>제작중도서</div>
	            		<div>완료도서</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todaybook"><a href=""><%= wishbList.size() %></span></a> 권</div>
	            		<div><span class="todaybook"><a href=""><%= wbList.size() %></span></a> 권</div>
	            		<div><span class="todaybook"><a href=""><%= mbList.size() %></span></a> 권</div>
	            		<div><span class="todaybook"><a href=""><%= dbList.size() %></span></a> 권</div>
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
	            		<div><span class="todayboard"><a href=""><%= newQList.size() %></span></a> 건</div>
	            		<div><span class="todayboard"><a href=""><%= uaQList.size() %></span></a> 건</div>
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
	            		<div><span class="todayuser1"><a href=""><%= newUList.size() %></span></a> 명</div>
	            		<div><span class="todayuser1"><a href=""><%= quitUList.size() %></span></a> 명</div>
	            		<div><span class="todayuser1"><a href=""><%= totalUList.size() %></span></a> 명</div>
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
	            		<div><span class="todayuser2"><a href=""><%= newMList.size() %></span></a> 명</div>
	            		<div><span class="todayuser2"><a href=""><%= quitMList.size() %></span></a> 명</div>
	            		<div><span class="todayuser2"><a href=""><%= totalMList.size() %></span></a> 명</div>
	            	</div>
	            </div>
	            
	            	            
	            </div>	            
            </div>
       <!-- 오늘의 차트 끝! -->
       
       
       
</section>
<!-- Content 끝! -->


</body>
</html>