<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <input type="text" readonly value="보건교사 안은영" style="font-family:'S-Core Dream 6'; font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label>저자명</label>
      <input type="text" readonly value="정세랑" style="font-family:'S-Core Dream 6'; font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
      <label>출판사</label>
      <input type="text" readonly value="민음사" style="font-family:'S-Core Dream 6'; font-size:0.9rem;">
    </div>
  </div>
  <div class="fields">
    <div class="field">
    <label>책 소개</label>
    <textarea rows="2" cols="55" style="font-size:0.9rem;" readonly>
    소설은 제목 그대로 사립 M고의 보건교사 '안은영'을 주인공으로 한다. 특별한 것 없는 직업과 평범한 이름이지만 안은영은 보통의 보건교사가 아니다. 복 중의 복, 일복 하나는 타고난 그녀는 직업으로 '보건교사' 역할에 열심히면서 동시에 자신만이 볼 수 있는 것들을 처치하고 쫓아내며, 또는 위로하는 '퇴마사'의 운명에도 충실히 복무한다. 
    여기에 사립 M고의 한문교사이자 학교 설립자의 후손인 홍인표에게 흐르는 거대한 에너지는 안은영의 활약을 돕는 필수적인 영양제 역할을 한다. 에너지(기)를 보충하기 위해, 학교의 평화를 지키기 위해 둘은 내 거 아닌 내 것 같은 사이가 되어 힘을 합한다. 
    둘 앞에 나타나는 기이한 괴물들, 학생들에게 보이는 미스터리한 현상들, 학교 곳곳에 숨은 괴상한 힘들…… 사립 M고에는 어떤 비밀이 있는 것일까. 무엇보다 안은영과 홍인표의 썸(some)은 어떻게 마무리될까?</textarea>
  </div>
</div>
<!-- progress bar  -->
  <div class="progress" align="left" style="width:429px;height:20px;margin-left:-5px;">
  	<div class="progress-bar" role="progressbar" 
  	style="font-size:8pt; background: orange; width: 1%;" aria-valuenow="1" aria-valuemin="0" aria-valuemax="280">1%</div>
	</div>
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