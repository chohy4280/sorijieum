<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>
<%@include file="/../inc/top.jsp"%>
<%@include file="/../inc/sementic.jsp" %>
<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">

</head>
<body>
<section class="my-section">

<div class="yu-bookdetailimg"style="border: 1px solid gold; float: left; width: 25%; height: 400px;">
도서 이미지 불러오기
</div>
<div class="yu-bookdetailinfo" style="border: 1px solid red; float: left; width: 25%; height: 400px;">
<div class="yu-booktitle"style="border: 1px solid red; height: 60px;" >도서명</div>
<div class="yu-bookauthor"style="border: 1px solid red; height: 60px;" >저자명</div>
<div class="yu-bookpublish" style="border: 1px solid red; height: 60px;" >출판사</div>
<div class="yu-bookdate"style="border: 1px solid red; height: 60px;">출판일</div>

</div>
<div class="yu-bookdetailintro"style="border: 1px solid blue; float: left; width: 50%; height: 400px;">
도서소개 불러오기
</div> 

 <button class="yu-likebutton">
 <i class="heart icon"></i>
 </button>
 
 <button onclick= "location='bookSearchPlay.jsp'" class="yu-palybutton">
 <i class="paly icon"></i>
 </button>
 </section>
</body>
</html>