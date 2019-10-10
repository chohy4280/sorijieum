<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 마이페이지 메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css"> -->
<style type="text/css">
@font-face {
	font-family: 'S-CoreDream-6Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
	}

body {
	font-family: 'S-CoreDream-6Bold';
}

.my-section{
   padding-top: 10%;
   padding-bottom: 70px;
   padding-left: 30px;
   padding-right: 30px;
}
</style>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<section class="my-section" style="margin: 0 5% 0 5%; border: 0;">
		<div class="ui basic segment" style="background-color:white;">
			<div class="ui two column very relaxed grid">
				<div class="column">
					<i class="big book icon brown"></i><br><br>
					<center>
						<button class="massive ui inverted brown button" style="width:80%;height:180px;margin-bottom:1%;font-size:30pt;" 
						onclick="location.href='/sori/views/member/userMyBook.jsp'">
							내 서재</button>
					</center>
					<center><button class="massive ui inverted brown button" style="width:80%;height:180px;margin-bottom:1%;font-size:30pt;" 
						onclick="location.href='/sori/views/member/userLikeBook.jsp'">
							관심도서</button></center>
					<center><button class="massive ui inverted brown button" style="width:80%;height:180px;margin-bottom:1%;font-size:30pt;" 
						onclick="location.href='/sori/views/member/userWishBook.jsp'">
							내 신청도서</button></center>
				</div>
				<div class="column">
					<i class="big user icon brown"></i><br><br>
					<center><button class="massive ui inverted brown button" style="width:80%;height:180px;margin-bottom:1%;font-size:30pt;" 
						onclick="location.href='/sori/views/member/userMyQna.jsp'">
							내 문의</button></center>
					<center><button class="massive ui inverted brown button" style="width:80%;height:180px;margin-bottom:1%;font-size:30pt;" 
						onclick="location.href='/sori/views/member/userUpdate.jsp'">
							내 정보 수정</button></center>
				</div>
			</div>
		</div>
		</scetion>
</body>
</html>