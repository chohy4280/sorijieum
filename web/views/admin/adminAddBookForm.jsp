<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서추가</title>
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


//도서 이미지 미리보기
function preview(input, target) {
	if(input.files && input.files[0]){
	  	var fileName= input.files[0].name;
	  	var ext=fileName.substr(fileName.length-3, fileName.length);
	  	var isCheck=false; 
	  	if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
	  		isCheck=true;               
	  	}
	  	if(isCheck==false){
	  		alert("jpg, jpeg, png 형식의 이미지만 가능합니다.\n다시 등록하여 주십시오.");
	  		jQuery(input).val("");
	  		return;
	  	}
	  	var reader = new FileReader();
	  	reader.readAsDataURL(input.files[0]);          
	  	reader.onload = function(e) {
	  	  jQuery(target).attr('src', e.target.result);
	  	}
	}
}


// 도서 원본 pdf파일만 받기
function preview2(input) {
	if(input.files && input.files[0]){
	  	var fileName= input.files[0].name;
	  	var ext=fileName.substr(fileName.length-3, fileName.length);
	  	var isCheck=false; 
	  	if(ext.toLowerCase()=='pdf'){
	  		isCheck=true;               
	  	}
	  	if(isCheck==false){
	  		alert("pdf 형식의 파일만 등록 가능합니다.\n다시 등록하여 주십시오.");
	  		jQuery(input).val("");
	  		return;
	  	}
	  
	}
}
</script>
</head>
<body>

<!-- Content 시작! -->
<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<section class="contentsection">


	<!--도서 추가 시작-->
            <i class="big plus square outline icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서 추가</span>
            <br><br>
            <!-- 이미지 미리보기 부분 -->
            <div style="float: left; margin-right: 0px; margin-left: 20px; margin-top:90px; margin-right:20px;">
            <img src="/sori/resources/book_images/addImage.jpg" style="width:250px; height:350px" id='img01'/>
            <p align="center" style="color: #fff; height:40px; background: #4ecdc4; line-height: 40px; font-size: 12pt;"><i class="mini camera icon"></i>도서 이미지 미리보기</p>
            </div>
            <!-- 이미지 미리보기 부분 끝-->
            <div class="lightgreyBox2" style="height: 800px;">
             <form action="/sori/binsert.ad" method="post" enctype="multipart/form-data">
            	<table class="addform">
            		<tr>
						<th width="30%">도서코드</th>
						<td><div class="ui input"><input type="text" name="bookcode" id="bookcode"placeholder="숫자만 입력(추후 수정 불가)" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">도서명</th>
						<td><div class="ui input"><input type="text" name="booktitle" id="booktitle" placeholder="책 제목 입력" required></div></td>
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
						<td><div class="ui input"><input type="text" name="bookpage" id="bookpage"placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></div></td>
					</tr>
					
					<tr>
						<th width="30%">책 소개</th>
						<td><div class="ui input"><textarea name="bookinfo" id="bookinfo" placeholder="내용을 입력해주세요" cols="50" rows="10" required></textarea></div>
						<br><span id="counter" style="color:#aaa;">( <span style="color:#4ecdc4">0</span> / 최대 1000자 )</span>
						</td>
					</tr>
					
					<tr>
						<th width="30%">도서이미지</th>
						<td><input type="file" name="bookoimg" id="bookoimg" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#img01'));"
						 required>
						</td>
					</tr>
					
					<tr>
						<th width="30%">도서원본파일</th>
						<td><input type="file" name="bookopdf" id="bookopdf" accept=".pdf" onChange="preview2(this);" required></td>
					</tr>
					<br>
				</table>

				<br><br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button"  style="width:100px" value="등록"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
			</form>	
			<br>
			<center>
			<button class="small ui teal button" onclick="javascript:history.back();">◀BACK</button> 
			</center>
            </div>
    <!-- 도서 추가 끝! -->
    
    
            </section>
            <%}else{ %>
            <%} %>
<!-- Content 끝! -->
</body>
<script type="text/javascript">

</script>
</html>