<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
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
	            <span class="sysdate">9월 20일 수요일</span>
	            
	            <div class="data">
	            
	            <!-- 도서 섹션-->          
	            <div class="data-box">
	            	<div class="data-section1">
	            		<i class="huge yellow book icon"></i>
	            		<div class="data-title" style="color: #f2c61f">도서</div>
	            	</div>
	            	<div class="data-section2">
	            		<div>신청도서</div>
	            		<div>제작중도서</div>
	            		<div>완료도서</div>
	            	</div>
	            	<div class="data-section3">
	            		<div><span class="todaybook">8</span> 권</div>
	            		<div><span class="todaybook">8</span> 권</div>
	            		<div><span class="todaybook">333</span> 권</div>
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
	            		<div><span class="todayboard">10</span> 건</div>
	            		<div><span class="todayboard">6</span> 건</div>
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
	            		<div><span class="todayuser1">50</span> 명</div>
	            		<div><span class="todayuser1">4</span> 명</div>
	            		<div><span class="todayuser1">254</span> 명</div>
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
	            		<div><span class="todayuser2">50</span> 명</div>
	            		<div><span class="todayuser2">4</span> 명</div>
	            		<div><span class="todayuser2">254</span> 명</div>
	            	</div>
	            </div>
	            
	            	            
	            </div>	            
            </div>
       <!-- 오늘의 차트 끝! -->
       
       
       
</section>
<!-- Content 끝! -->


</body>
</html>