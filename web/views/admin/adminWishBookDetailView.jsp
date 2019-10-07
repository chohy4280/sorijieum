<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청도서 상세 내역</title>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">

	<!--신청도서 목록 시작-->
		<i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">신청도서 상세내역</span>
        <br><br>
        
       <!-- 신청도서 상세내역 시작! -->
			<div class="listBoxBG" style="height: 1000px; margin-top:0px;">
				<div class="listBox" >
				<a class="ui large teal label">상세내용</a>
				<br><br>
				<table class="listTable">
					<tr>
						<th width="15%">신청일</th><td width="35%">2019/10/03</td>
						<th width="15%">신청자(ID)</th><td width="35%">박공주(user003)</td>
					</tr>
					<tr>
						<th>도서명</th><td>보건교사 안은영</td>
						<th>처리상태</th><td>승인</td>
					</tr>
					<tr>
						<th>저자명</th><td>정세랑</td>
						<th>처리일시</th><td>2019/10/04</td>
					</tr>
					<tr>
						<th>출판사명</th><td>민음사</td>
						<th>처리자</th><td>최민영(admin01)</td>
					</tr>
				</table>
				<br><hr><br>
				<a class="ui large teal label">관리자 처리</a><br><br>
				<form action="" method="post">
					<table class="listTable">
					<tr>
						<th width="15%">처리상태</th>
						<td width="85%"><div align="left">　<input type="radio" name="state" value="done">　승인 &nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="state" value="rjct">　반려</div></td>
					</tr>
					<tr>
						<th width="15%">코멘트</th><td width="85%"><textarea name="rjctreason" cols="140" rows="5"></textarea></td>
					</tr>
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
			</div>
				
			<!-- 신청도서 상세내역 끝! -->
       <!-- 회원 목록 끝! -->




</section>

</body>
</html>

</body>
</html>