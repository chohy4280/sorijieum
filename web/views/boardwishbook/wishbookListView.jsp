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
		
		$("input[name=item]").on("click", function(){
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
				<th width="45%">도서명</th>
				<th width="15%">저자명</th>
				<th width="15%">신청자ID</th>
				<th width="10%">신청일</th>
				<th width="10%">진행사항</th>
			</tr>
			<tr>
				<td>1</td>
				<td style="text-align:left;"><a href="/sori/views/boardwishbook/wishbookDetailView.jsp">아몬드</a></td>
				<td>손원평</td>
				<td>user003</td>
				<td>2019/01/12</td>
				<td>승인</td>
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
		<div class="ui checkbox">
			  <input type="checkbox" name="item" value="title" checked><label>도서명</label>
			</div> &nbsp;&nbsp;&nbsp;
			<div class="ui checkbox">
			 <input type="checkbox" name="item" value="author"><label>저자명</label>
			</div>	
		<br><br>
		<div id="titlediv">
			<form action="" method="post">
			<div class="ui small input">
				<input type="hidden" name="search" value="title">
				<label><input type="search" name="keyword" placeholder="검색하실 도서명을 입력하세요" style="font-family:'S-Core Dream 5';width:250px;"></label>
			</div>
			<input class="ui tiny basic button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
			</form>
		</div>
		<div id="authordiv">
			<form action="" method="post">
			<div class="ui small input">
				<input type="hidden" name="search" value="author">
				<label><input type="search" name="keyword" placeholder="검색하실 저자명을 입력하세요" style="font-family:'S-Core Dream 5';width:250px;"></label>
			</div>
			<input class="ui tiny basic button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
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