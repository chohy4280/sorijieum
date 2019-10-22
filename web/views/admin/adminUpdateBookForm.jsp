<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서수정</title>
<script type="text/javascript">
$(function(){
	
	 //책소개 글자수 세기
	 $("#bookinfo").keyup(function(e){
		 var content = $(this).val();
		 $("#counter").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 1000자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 1000){
			 alert("최대 1000자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,1000));
			 $("#counter").html("( <span style='color:red;'>1000 </span>/ 최대 1000자)");
		 } 
		 
	 });
	
})//document ready...
</script>
</head>
<body>

<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 추가 시작-->
            <i class="big eraser icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서 수정</span>
            <br><br>
            <div class="lightgreyBox" style="height: 700px; align: center;">
            <form action="" method="post" enctype="">
            	<table class="addform">
					<tr>
						<th width="30%">도서명</th>
						<td><div class="ui input"><input type="text" name="bookcode" id="bookcode" placeholder="책 제목 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">저자명</th>
						<td><div class="ui input"><input type="text" name="author" id="author" placeholder="저자명 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">출판사명</th>
						<td><div class="ui input"><input type="text" name="publisher" id="publisher" placeholder="출판사 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">출간일</th>
						<td><div class="ui input"><input type="date" name="pubdate" id="pubdate" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">쪽수</th>
						<td><div class="ui input"><input type="text" name="bookpage" id="bookpage"placeholder="숫자만 입력" required></div></td>
					</tr>

					<tr>
						<th width="30%">도서코드</th>
						<td><div class="ui input"><input type="text" name="bookcode" id="bookcode"placeholder="숫자만 입력" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">책 소개</th>
						<td><div class="ui input"><textarea name="bookintro" id="bookintro" placeholder="내용을 입력해주세요" cols="50" rows="10" required></textarea></div>
						<br><span id="counter" style="color:#aaa;">( <span style="color:#4ecdc4">0</span> / 최대 1000자 )</span></td>
					</tr>
					
					<tr>
						<th width="30%">도서이미지</th>
						<td><input type="file" name="bookimg" id="bookimg" required></td>
					</tr>
					
					<tr>
						<th width="30%">도서원본파일</th>
						<td><input type="file" name="bookopdf" id="bookopdf" required></td>
					</tr>
					
					<tr>
						<th width="30%">제작완료파일</th>
						<td><input type="file" name="bookotxt" id="bookotxt"></td>
					</tr>
					
					<br>
				</table>
				<br><br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button" style="width:100px" value="수정"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
			</form>	
            </div>
    <!-- 도서 추가 끝! -->
    
    
            </section>
<!-- Content 끝! -->
</body>
</html>