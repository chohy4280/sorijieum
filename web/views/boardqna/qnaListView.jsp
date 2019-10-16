<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
<%@ include file="/../inc/top.jsp" %>
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
			$("#writerdiv").css("display", "none");
		}
		
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titlediv").css("display", "none");
			$("#writerdiv").css("display", "block");
		}

	}
</script>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--QNA 시작-->
	<div class="my-content">
	<a class="massive ui yellow label" style="font-size: 30px">Q&A</a>
	<span style="color:#fbbe09; font-weight:600">│</span>
	<span style="color:grey">소리지음 문의사항 게시판입니다</span>
		
		<br><br>
	<!-- QNA 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th width="10%">No</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<tr>
				<td style="color:red;">공지</td>
				<td style="text-align:left;"><a href="">Q&A작성 전 필독해주세요.</a></td>
				<td>admin01</td>
				<td>2019/09/20</td>
				<td>17</td>
			</tr>
			<tr>
				<td>2</td>
				<td style="text-align:left;"><a href="/sori/views/boardqna/qnaDetailView.jsp">한자 작성은 어떻게 하면되나요</a></td>
				<td>user002</td>
				<td>2019/09/23</td>
				<td>6</td>
			</tr>
			<tr>
				<td>1</td>
				<td style="text-align:left;"><a href="">Q&A작성 전 필독해주세요.</a></td>
				<td>admin01</td>
				<td>2019/09/20</td>
				<td>17</td>
			</tr>
		</table>
	<!--QNA 목록 끝-->
		<br>
		<div align="right"><a class="big ui black label" href="">글쓰기</a></div>
		
		
	<!-- 페이징 시작 -->
		<div align="center">페이징 버튼 부분(추후 코딩 예정)</div>
	<!-- 페이징 끝 -->
	
	<br><hr><br>
	<!-- 검색창 시작 -->
		<center>
		<div>
			<input type="radio" name="item" value="title" checked> 제목 &nbsp; &nbsp; &nbsp; 
			<input type="radio" name="item" value="writer"> 작성자 &nbsp; &nbsp; &nbsp; 
		</div>
		<div id="titlediv">
			<form action="" method="post">
				<input type="hidden" name="search" value="title">
				<label>
				<input type="search" name="keyword"></label>
				<input type="submit" value="검색">
			</form>
		</div>
		<div id="writerdiv">
			<form action="" method="post">
				<input type="hidden" name="search" value="writer">
				<label>
				<input type="search" name="keyword"></label>
				<input type="submit" value="검색">
			</form>
		</div>
		</center>
	<!-- 검색창 끝 -->
	
	</div>
	<!--QNA 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>