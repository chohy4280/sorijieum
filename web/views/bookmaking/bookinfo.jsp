<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress" %>
<%
	BookMakingProgress bmp = (BookMakingProgress)request.getAttribute("bmp");
	ArrayList<BookMakingProgress> list = (ArrayList<BookMakingProgress>)request.getAttribute("list");
	int dcount = ((Integer)request.getAttribute("dcount")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보</title>
<%@ include file="/../inc/top.jsp"%>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
$(function(){
	
});
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
<img id="보건교사 안은영" src="/sori/resources/book_upfiles/<%= bmp.getBookRimg() %>">
</div>
<div class="ui orange compact message" style="font-size:11pt;position:relative;bottom:-350px;left:-715px;text-align:center;width:18%;height:5.5%">
  제작은  10페이지씩입니다!
</div>
<!-- bookinfo 시작 -->
<div class="ui form" id="ye-bookinfo">
  <div class="fields">
    <div class="field">
      <label>도서명</label>
      <input type="text" readonly value="<%= bmp.getBookTitle() %>" style="font-family:'S-Core Dream 6';font-size:0.9rem;width:250px;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label>저자명</label>
      <input type="text" readonly value="<%= bmp.getAuthor() %>" style="font-family:'S-Core Dream 6';font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label>출판사</label>
      <input type="text" readonly value="<%= bmp.getPublisher() %>" style="font-family:'S-Core Dream 6';font-size:0.9rem;width:180px;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
    <label>책 소개</label>
    <textarea rows="3" cols="55" style="font-size:0.9rem;" readonly>
    <%= bmp.getBookInfo() %>
    </textarea>
  </div>
</div>
<!-- progress bar  -->
<%  int make = (bmp.getMakepage());
	int book = (bmp.getBookPage());
	int pwidth = (int)(((double)make / book) * 100);%>
  <div class="progress" align="left" style="width:429px;height:20px;margin-left:-5px;">
  	<div class="progress-bar" role="progressbar" 
  	style="font-size:8pt; background: orange; width:<%= pwidth %>%;" aria-valuenow="<%= pwidth %>" aria-valuemin="0" aria-valuemax="<%= bmp.getBookPage() %>"><%= pwidth %>%</div>
	</div><strong>제작상태 :</strong> <%= bmp.getMakepage() %>/<%= bmp.getBookPage() %>쪽 진행중
  </div> <!-- bookinfo 끝 -->
</div>  <!-- content 끝 -->

<!-- process donut -->
<% for(int i = 0; i < list.size(); i++){ 
	int makep = (list.get(i).getMakepage());
	int bookp = (list.get(i).getBookPage());
	int value = (int)(((double)makep / bookp) * 100);
	if(list.get(i).getMakepage() != 0 && list.get(i).getBookTitle().equals(bmp.getBookTitle())){
	%>
<div class="chart x-60" style="--value:<%= value %>%;">
  <p id="donut" style="color:#ffa500;"><%= value %>%</p>
</div>
<%  }else if(list.get(i).getMakepage() == 0 && list.get(i).getBookTitle().equals(bmp.getBookTitle())){ %>
<div class="chart x-60" style="--value:<%= value %>%;">
  <p id="donut" style="color:lightgrey;"><%= value %>%</p>
</div>
<%  } } %>
<!-- process donut 끝 -->
<div class="ye-make-button" align="right">
<button onclick="location.href='/sori/views/bookmaking/bookmakingmain.jsp'" class="big ui yellow button" style="font-family:'S-Core Dream 6'">제작하기</button>
</div><br><br><br><br><br>
<!-- book count -->
<div class="ye-book-count">
<div class="orange ui statistic">
    <div class="value" style="font-family:'S-Core Dream 7'">
      <%= dcount %>
    </div>
    <div class="label" style="font-family:'S-Core Dream 6'">
      	우리가 함께 제작한 책
    </div>
</div>
  <img src="/sori/views/bookmaking/images/books.png">
</div><!-- book count 끝 -->
</body>
<br><br><br><br>
</html>