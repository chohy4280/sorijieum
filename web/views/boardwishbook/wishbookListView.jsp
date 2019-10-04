<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서신청</title>
<script type="text/javascript" src="/first/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
		showDiv();
		
		$("input[name=item]").on("change", function(){
			showDiv();
		});
	});
	
	function showDiv(){
		if($("input[name=item]").eq(0).is(":checked")){
			$("#titlediv").css("display", "block");
			$("#authordiv").css("display", "none");
		}
		
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titlediv").css("display", "none");
			$("#authordiv").css("display", "block");
		}

	}
</script>

  <!-- Semantic UI CND -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--도서신청 시작-->
	<div class="my-content">
	<a class="massive ui yellow label" style="font-size: 30px">도서신청</a>
	<span style="color:#fbbe09; font-weight:600">│</span>
	<span style="color:grey">도서신청 게시판입니다</span>
		<br><br>
	<!-- 도서신청 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th width="5%">No</th>
				<th width="40%">도서명</th>
				<th width="15%">저자명</th>
				<th width="15%">신청자ID</th>
				<th width="10%">신청일</th>
				<th width="10%">진행사항</th>
				<th width="5%">좋아요</th>
			</tr>
			<tr>
				<td>1</td>
				<td style="text-align:left;"><a href="/sori/views/boardwishbook/wishbookDetailView.jsp">아몬드</a></td>
				<td>손원평</td>
				<td>user003</td>
				<td>2019/01/12</td>
				<td>승인</td>
				<td>7</td>
			</tr>
		</table>
	<!--도서신청 목록 끝-->
		<br>
		<div align="right"><a class="big ui black label" href="">나의신청내역</a>
			&nbsp;&nbsp;<a class="big ui black label" href="/sori/views/boardwishbook/wishbookAddForm.jsp">글쓰기</a>
		</div>
		
		
	<!-- 페이징 시작 -->
		<div align="center">페이징 버튼 부분(추후 코딩 예정)</div>
	<!-- 페이징 끝 -->
	
	<br><hr><br>
	<!-- 검색창 시작 -->
		<center>
		<div>
			<input type="radio" name="item" value="title" checked> 도서명 &nbsp; &nbsp; &nbsp; 
			<input type="radio" name="item" value="author"> 저자명&nbsp; &nbsp; &nbsp; 
		</div>
		<div id="titlediv">
			<form action="" method="post">
				<input type="hidden" name="search" value="title">
				<label>
				<input type="search" name="keyword"></label>
				<input type="submit" value="검색">
			</form>
		</div>
		<div id="authordiv">
			<form action="" method="post">
				<input type="hidden" name="search" value="author">
				<label>
				<input type="search" name="keyword"></label>
				<input type="submit" value="검색">
			</form>
		</div>
		</center>
	<!-- 검색창 끝 -->
	
	</div>
	<!--도서신청 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>