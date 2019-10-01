<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서제작</title>
<%@ include file="/../inc/top.jsp"%>
<!-- 시맨틱유아이 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/sori/resources/css/bookmaking.css">
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- content 시작 -->
	<div class="bookstatus">
		<div class="bookstatus_title">
			<h2 style="font-family: 'S-Core Dream 6';">
				<i class="yellow book icon"></i> &nbsp; 제작현황
			</h2>
		</div><!-- bookstatus_title -->
		<div class="guide" align="right">
			<i class="yellow big info circle icon" style="margin-left: 10px;"></i>
			<button class="ui yellow button"
				onclick="location.href='/sori/views/bookmaking/guide.jsp'"
				style="width: 150px; height: 10px; font-size: 10pt; 
				text-align: center; font-family: 'S-Core Dream 5'; 
				padding: 10px 5px 23px; margin: 25px 40px 10px 10px;">제작가이드라인
				안내</button>
		</div><!-- guide -->

		<div class="book">
			<div class="bookwait">
			<a style="font-weight: bold;">제작해야할 도서</a><br><br> 
			<div class="bw">
			<a href="/sori/views/bookmaking/bookinfo.jsp"> 
			<img id="연금술사" src="/sori/resources/book_images/201909261556.jpg"></a>
			</div>
			<div class="bw">
			<a href="/sori/views/bookmaking/bookinfo.jsp"> 
			<img id="보건교사 안은영" src="/sori/resources/book_images/201908191645.jpg"></a>
			</div>
			</div><!-- bookwait -->
			<br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="bookmaking">
			<a style="font-weight: bold;">제작중인 도서</a>&nbsp;&nbsp;	
			<br><br>
			<div class="bm">
			<a href="#">
			<img id="여행의 이유" src="/sori/resources/book_images/201902041944.jpg"></a><br>
			<div class="progress" style="width:145px;height:15px;"> 
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:8pt; background: yellow; width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="216">43/216쪽</div>
			</div>
				</div>
			<div class="bm">
			<a href="#">
			<img id="쇼코의 미소" src="/sori/resources/book_images/201811241328.jpg"></a>
			<div class="progress" style="width:145px;height:15px;">
  			<div class="progress-bar" role="progressbar" 
  			style="font-size:8pt; background: yellow; width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="296">56/296쪽</div>
			</div>
				</div>
		</div><!-- bookmaking -->
		</div> <!-- book끝 -->
	</div><!-- bookstatus끝 -->
	<!-- content 끝 -->
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
</html>