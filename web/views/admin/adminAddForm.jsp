<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가</title>
</head>
<body>


<!-- Content 시작! -->
<section class="contentsection">


	<!--관리자 추가 시작-->
            <i class="big user plus icon"></i><span style="font:black; font-size:17pt; padding:10px;">관리자 추가</span>
            <br><br>
            <div class="lightgreyBox" style="height: 700px; align: center;">
            <form action="/adinsert.ad" method="post">
            	<table class="addform">
					<tr>
						<th width="30%">아이디</th>
						<td><div class="ui input"><input type="text" name="userid" id="userid" placeholder="영문 숫자 조합만 가능" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">이름</th>
						<td><div class="ui input"><input type="text" name="username" id="username" placeholder="관리자 이름 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">비밀번호</th>
						<td><div class="ui input"><input type="password" name="userpwd" id="userpwd" placeholder="영문,숫자 조합만 가능" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">비밀번호 확인</th>
						<td><div class="ui input"><input type="password" id="userpwd2" placeholder="입력한 비밀번호와 동일하게 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">전화번호</th>
						<td><div class="ui input"><input type="text" name="phone" id="phone" placeholder="숫자만 입력(-제외)" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">이메일</th>
						<td><div class="ui input"><input type="email" name="email" id="email" placeholder="sample@iei.kr 형식"required></div></td>
					</tr>

					<tr>
						<th width="30%">성별</th>
						<td><input type="radio" name="gender" value="F" checked>여성 &nbsp;
							<input type="radio" name="gender" value="M">남성</td>
					</tr>
					
					<tr>
						<th width="30%">생년월일</th>
						<td><div class="ui input"><input type="date" name="birth" id="birth" required></div></td>
					</tr>
					
					<br>
				</table>
				<br><br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button"  style="width:100px"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
			</form>	
            </div>
    <!-- 관리자 추가 끝! -->
    
            </section>
<!-- Content 끝! -->

</body>
</html>