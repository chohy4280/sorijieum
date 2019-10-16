<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시글 보기</title>
<%@ include file="/../inc/top.jsp" %>
  <!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	
	<!--QNA 시작-->
	<div class="my-content">
		<a class="massive ui yellow label" style="font-size: 30px">QNA</a>
		<span style="color:#fbbe09; font-weight:600">│</span>
		<span style="color:grey">소리지음 문의사항 게시판입니다</span>
		<br><br>
	<!-- QNA 목록 시작 -->
		<table class="my-listTable" align="center">
			<tr>
				<th colspan="3" style="height:60px; font-size: 25px;">한자 작성은 어떻게 하면되나요</th>
			</tr>
			<tr style="height:20px; font-size: 12px;">
				<td>작성자 : user002</td>
				<td>작성일 : 2019/09/23</td>
				<td>조회수 : 21</td>
			</tr>	
		</table>
		<div class="my-boardcontent">
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?
		</div>
	<!--QNA 목록 끝-->
	
	<!-- 관리자 수정삭제 버튼 -->
	<div align="right">
		<div class="ui buttons">
			<button class="ui positive button" onclick="">수정</button>
		  	<div class="or"></div>
			<button class="ui button" onclick="">삭제</button>
		</div>
	</div>
	
	<br>
	
	<!-- 유저&관리자 공통 댓글 출력 영역 시작 -->
	<h3>COMMENT</h3>
<!-- ★만약 댓글 여러 개 달기 가능하면 여기서부터 -->
	<table class="my-listTable2" width="100%">
	<tr>
		<th width="5%"><input type="checkbox" name="comment" id="comment"></th>
		<th width="15%">관리자(admin02)</th>
		<th width="65%" style="text-align:left;">2019/09/24</th>
		<!-- 관리자일때만 ↓보임 -->
		<th width="20%" style="text-align:right"><button class="mini ui grey button">수정</button><button class="mini ui grey button">삭제</button></th>
	</tr>
	<tr>
		<td colspan="4">네이버 사전에 한자를 그려서 확인할수 있습니다.<br>
						네이버 사전에 한자를 그려서 확인할수 있습니다.<br>
						네이버 사전에 한자를 그려서 확인할수 있습니다.<br></td>
	</tr>
	</table>
	<br>
<!-- ★여기까지 for loop 돌리면 될듯..? 근데 복수댓글이면 삭제할 때 답변(고유)번호가 없어서 체크했을 때 전달할 답변번호 없음. 컬럼 생성해야 함.-->

	<!-- 유저&관리자 공통 댓글 출력 영역 끝 -->
	
	
	
	<!-- 관리자 댓글작성 영역 시작 -->
	<form action="" method="post">
		<input type="hidden" name="qnano" value="">
		<input type="hidden" name="comwriter" value="">
  		<textarea name="qnacomments" placeholder="답변 내용 작성" cols="100" rows="5" style="width:1200px; height:100px;"></textarea>
		<br><input type="submit" button class="mini ui yellow button"></button>
	</form>
	<!-- 관리자 댓글작성 영역 끝 -->
	
	<br><br><br>
	<!-- 공통 페이지 이동 버튼 -->
		<center>
			<div class="ui buttons">
		  <button class="ui labeled icon button">
		    <i class="left chevron icon"></i>
		    이전글
		  </button>
		  <button class="ui button">
		    목록
		  </button>
		  <button class="ui right labeled icon button">
		    다음글
		    <i class="right chevron icon"></i>
		  </button>
		</div>
		</center>


	</div>
	<!--QNA 끝-->
	
	</section>
	<!-- Content 끝! -->
</body>
</html>