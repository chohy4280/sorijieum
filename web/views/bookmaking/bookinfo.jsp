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
<style type="text/css">
.wrap { position:relative; }
.over { 
   position:absolute;
   bottom:-15%;
   left:50%;
}
</style>
<script type="text/javascript">
$(function(){
	$(".ye-make-buttons").on("click", function(){
		alert("제작자로 로그인하셔야 제작하실 수 있습니다.");
	});
	
	$(".progress").each(function(){
		var perc = $(this).attr("id");
		if(perc == 100)
			$(this).attr('class','ui yellow progress');
		$(this).progress({
			percent: perc
		});
	});
	
});

function winOpen(){
	<% if(bmp.getMakepage() == bmp.getBookPage()){ %>
		alert("제작하실 페이지가 없습니다. 다른 책을 선택해주세요");
	<% }else{ %>
	var style = "width=550, height=700, scrollbars=yes, resizable=no";
	window.open("/sori/bmpopup?bookcode=<%=bmp.getBookCode() %>", "도서제작시 안내사항", style );
	<% } %>
}
</script>
</head>
<br>
<!-- content 시작 -->
<div class="ye-bookstatus">
<div class="ye-bookstatus-title" style="float:left;">
<h2 style="font-family :'S-Core Dream 6';"><i class="yellow book icon"></i> 도서정보</h2></div><br>
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
<div class="ui basic floating compact message" 
style="font-size:1.1rem;position:relative;bottom:-420px;right:57%;text-align:center;width:20%;height:5%">
  제작은  10페이지씩입니다!
</div>
<!-- bookinfo 시작 -->
<div class="ui form" id="ye-bookinfo">
  <div class="fields">
    <div class="field">
      <label style="font-size:1.2rem;">도서명</label>
      <input type="text" readonly value="<%= bmp.getBookTitle() %>" style="font-family:'S-Core Dream 6';font-size:1rem;width:290px;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label style="font-size:1.2rem;">저자명</label>
      <input type="text" readonly value="<%= bmp.getAuthor() %>" style="font-family:'S-Core Dream 6';font-size:1rem;width:180px;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label style="font-size:1.2rem;">출판사</label>
      <input type="text" readonly value="<%= bmp.getPublisher() %>" style="font-family:'S-Core Dream 6';font-size:1rem;width:240px;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
    <label style="font-size:1.2rem;">책 소개</label>
    <textarea rows="10" cols="60" style="font-size:1rem;font-family:'S-Core Dream 6';" readonly>
    <%= bmp.getBookInfo() %>
    </textarea>
  </div>
</div>
<!-- progress bar  -->
<%  int per = (int)(((double)bmp.getMakepage() / bmp.getBookPage()) * 100);%>
  <div class="ui yellow progress wrap" id="<%=per%>" style="width:515px;height:30px;border-radius:7px 7px 7px 7px;">
  	<div class="bar" style="height:30px;"></div>
  	<div class="over" style="color:white;font-size:1.1rem;height:30px;font-weight:bolder;"><%= per %>%</div>
	</div>제작상태 : <%= bmp.getMakepage() %>/<%= bmp.getBookPage() %>쪽 진행중
	
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
  <p id="donut" style="color: #e0e0e0;"><%= value %>%</p>
</div>
<%  } } %>
<!-- process donut 끝 -->
<!-- 제작버튼 -->
<% if(loginMember != null && loginMember.getTypeNumber() >=3 && bmp.getMakepage() != bmp.getBookPage()){ %>
<div class="ye-make-button" align="right">
<button onclick="winOpen()" class="big ui yellow button" style="font-family:'S-Core Dream 6'">제작하기</button>
</div><br><br><br><br><br>
<% }else{ %>
<div class="ye-make-buttons" align="right">
<button class="big ui yellow button" style="font-family:'S-Core Dream 6'">제작하기</button>
</div><br><br><br><br><br>
<% } %>
<!-- 제작버튼 끝 -->
<!-- book count -->
<div class="ye-book-count">
<div class="orange ui statistic">
    <div class="value" style="font-family:'S-Core Dream 7';">
      <%= dcount %>
    </div>
    <div class="label" style="font-family:'S-Core Dream 6';margin-top:10px;">
      	우리가 함께 제작한 책
    </div>
</div>
  <img src="/sori/resources/bookmaking_images/books.png">
</div><!-- book count 끝 -->
</body>
<br><br><br><br>
</html>