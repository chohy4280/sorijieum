<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, makebook.model.vo.MakeBook" %>
<%
	ArrayList<MakeBook> mblist = (ArrayList<MakeBook>)request.getAttribute("mblist");
	/* int beginPage = (Integer)request.getAttribute("beginPage");
	int endPage = (Integer)request.getAttribute("endPage");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int maxPage = (Integer)request.getAttribute("maxPage");
	int listcount = (Integer)request.getAttribute("listcount"); */
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제작자 참여도서</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script type="text/javascript" src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<%@ include file="/inc/memberSide.jsp"%>
</head>
<body>
<div class="hy-div">
<section class="hy-section2" >
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/qlist">참여도서</a>
<span style="color:#fbbe09; font-weight:600">│</span>
<span style="color:grey">제작에 참여한 도서 목록입니다.</span><br>

<!-- 참여도서 목록 출력 시작 -->
참여도서: 0 권
<form action="" method="post">

제작에 참여한 도서가 없습니다.
<div class="ui items">
  <div class="item">
    <div class="image">
      <img src="/images/wireframe/image.png">
    </div>
    <div class="content">
      <a class="header">Header</a>
      <div class="meta">
        <span>Description</span>
      </div>
      <div class="description">
        <p></p>
      </div>
      <div class="extra">
        Additional Details
      </div>
    </div>
  </div>
  <div class="item">
    <div class="image">
      <img src="/images/wireframe/image.png">
    </div>
    <div class="content">
      <a class="header">Header</a>
      <div class="meta">
        <span>Description</span>
      </div>
      <div class="description">
        <p></p>
      </div>
      <div class="extra">
        Additional Details
      </div>
    </div>
  </div>
</div>

<!-- 참여도서 목록 출력 끝 -->
</section>
</div>
</body>
</html>