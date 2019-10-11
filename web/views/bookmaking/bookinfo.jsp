<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.model.vo.Book, bookmaking.model.vo.BookMaking" %>
<%
	Book book = (Book)request.getAttribute("book");
	BookMaking bm = (BookMaking)request.getAttribute("bm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보</title>
<%@ include file="/../inc/top.jsp"%>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">

</script>
</head>
<br>
<!-- content 시작 -->
<div class="ye-bookstatus">
<div class="ye-bookstatus-title" style="float:left;">
<h2 style="font-family :'S-Core Dream 6';"><i class="yellow book icon"></i> 도서정보</h2></div>
<!-- 가이드라인 버튼 -->
<div class="ye-guide" align="right">
<i class="yellow big info circle icon" style="margin-left:10px;"></i>
<button class="ui yellow button" onclick="location.href='/sori/views/bookmaking/guide.jsp'"
style="width:150px; height:10px;font-size:10pt;text-align:center;font-family:'S-Core Dream 5';
padding:10px 5px 23px; margin:0px 40px 0px 10px;">제작가이드라인 안내</button></div><br><br>
<!-- 도서 이미지 -->
<div class="ye-bookimg" style="float:left;">
<img id="보건교사 안은영" src="/sori/resources/book_images/201908191645.jpg">
</div>
<!-- bookinfo 시작 -->
<div class="ui form" id="ye-bookinfo">
  <div class="fields">
    <div class="field">
      <label>도서명</label>
      <input type="text" readonly value="<%= book.getBookTitle() %>" style="font-family:'S-Core Dream 6'; font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label>저자명</label>
      <input type="text" readonly value="<%= book.getAuthor() %>" style="font-family:'S-Core Dream 6'; font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label>출판사</label>
      <input type="text" readonly value="<%= book.getPublisher() %>" style="font-family:'S-Core Dream 6'; font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
    <label>책 소개</label>
    <textarea rows="2" cols="55" style="font-size:0.9rem;" readonly>
    <%= book.getBookInfo() %>
    </textarea>
  </div>
</div>
<!-- progress bar  -->
  <div class="progress" align="left" style="width:429px;height:20px;margin-left:-5px;">
  	<div class="progress-bar" role="progressbar" 
  	style="font-size:8pt; background: orange; width: 1%;" aria-valuenow="1" aria-valuemin="0" aria-valuemax="280">1%</div>
	</div><strong>제작상태 :</strong> 1/280 진행중
  </div> <!-- bookinfo 끝 -->
</div> <!-- content 끝 -->
&nbsp;&nbsp;&nbsp;
<!-- process donut -->
<div class="chart x-60">
  <p id="donut">1%</p>
</div>

<div class="ye-make-button" align="right">
<button onclick="location.href='/sori/views/bookmaking/bookmakingmain.jsp'" class="big ui yellow button" style="font-family:'S-Core Dream 6'">제작하기</button>
</div><br>
<!-- book count -->
<div class="ye-book-count">
<div class="orange ui statistic">
    <div class="value" style="font-family:'S-Core Dream 7'">
      2
    </div>
    <div class="label" style="font-family:'S-Core Dream 6'">
      	우리가 함께 제작한 책
    </div>
</div>
  <img src="/sori/views/bookmaking/images/books.png">
</div><!-- book count 끝 -->
</body>
<br><br><br><br><br><br><br><br>
</html>