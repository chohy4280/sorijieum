<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
</head>
<body>
<!-- Content 시작! -->
<section class="contentsection">

	<!--회원상세 조회 목록 시작-->
		<i class="big user icon"></i><span style="font:black; font-size:17pt; padding:10px;">회원상세정보</span>
		<br>
       <!-- 회원상세조회 내용 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:0px;">
				<div class="listBox" >
			<!-- 기본정보 섹션 시작 -->
				<a class="ui large teal label">기본정보</a>
				<br><br>
				<form action="" method="post">
				<table class="listTable">
					<tr>
						<th width="15%">이름(아이디)</th><td width="35%">홍길동(user01)</td><input type="hidden" name="username" id="username" value="" />
																						<input type="hidden" name="userid" id="userid" value="" />
																						
						<th width="15%">회원유형</th><td width="35%"><input type="radio" name="usertype" id="usertype" value="1">　이용대기자&nbsp;
																  <input type="radio" name="usertype" id="usertype" value="2">　이용자&nbsp;
																  <input type="radio" name="usertype" id="usertype" value="3">　제작자&nbsp;</td>
					</tr>
					<tr>
						<th>성별</th><td>남</td><input type="hidden" name="gender" value="" />
						<th>인증내역</th><td><input type="file" name="" id="" value=""></td>
					</tr>
					<tr>
						<th>비밀번호</th><td><div class="ui input"><input type="password" name="userpwd" id="userpwd"></div></td>
						<th>생년월일</th><td>1982/10/04</td><input type="hidden" name="birth" id="birth" value="" />
					</tr>
					<tr>
						<th>비밀번호 확인</th><td><div class="ui input"><input type="password" id="userpwd2"></div></td>
						<th>가입일</th><td>2019/03/01</td><input type="hidden" name="enrolldate" id="enrolldate" value="" />
					</tr>
					<tr>
						<th>전화번호</th><td><div class="ui input"><input type="text" name="phone" id="phone" value=""></div></td>
						<th>이메일</th><td><div class="ui input"><input type="email" name="email" id="email" value=""></div></td>
					</tr>
				</table>
				<br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button"  style="width:100px"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
				</form>
			<!-- 기본정보 섹션 끝 -->
				<br><hr><br>
			<!-- 도서정보 섹션 시작 -->
				<a class="ui large teal label">도서정보</a><br><br>
				<table class="listTable">
					<tr>
						<th width="33%">읽은도서</th>
						<th width="33%">관심도서</th>
						<th width="33%">제작도서</th>
					</tr>
					<tr>
						<td><a href="" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="">2</a> 권</td>
						<td><a href="" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="">1</a> 권</td>
						<td>-</a></td>
					</tr>
				</table>
					<br>
					
					<table class="listTable">
					<tr>
						<th width="10%">No</th>
						<th width="30">도서명</th>
						<th width="30%">저자명</th>
						<th width="30%">출판사명</th>
					</tr>
					<tr>
						<td>1</td>
						<td>보건교사 안은영</td>
						<td>정세랑</td>
						<td>민음사</td>
					</tr>
				</table>
			<!-- 도서정보 섹션 끝 -->
				<br><br><hr><br><br>			
			
			<!-- 관리자메모 섹션 시작 -->
			<a class="ui large teal label">관리자메모</a><br><br>
					<table class="listTable">
					<tr>
						<th width="5%">No</th>
						<th width="55%">메모 내용</th>
						<th width="15%">작성자(ID)</th>
						<th width="15%">작성일</th>
						<th width="10%">관리</th>
					</tr>
					<tr>
						<td>1</td>
						<td>장애인 등록증 확인하여 이용자로 변경함</td>
						<td>최민영(admin01)</td>
						<td>2019/04/02</td>
						<td><button class="mini ui grey button">삭제</button></td>
					</tr>
					</table><br>
					<h4>메모 작성</h4>
					<form action="" method="post">
						<textarea name="adminmemo" cols="150" rows="5" placeholder="관리자 메모 내용을 입력하세요." style="border-radius: 10px"></textarea>
						<input type="submit" value="저장">
					</form>
			
			<!-- 관리자메모 섹션 끝 -->
				</div>
			</div>
       
        <!-- 회원 상세조회 내용 끝! -->
        
        
    <!-- 회원 상세조회 목록 끝! -->
</section>
</body>
</html>