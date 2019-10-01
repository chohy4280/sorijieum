<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/../inc/adminTemplate.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
 

<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 목록 시작-->
            <i class="big black book icon"></i><span style="font:black; font-size:17pt; padding:10px;">도서 목록</span>
            <br><br>
            
            
            <!-- 검색창 시작!-->
            <div class="greyBox" style="height: 180px;">
            <form action="" method="post">
				<div>
				<a class="ui large teal label">검색조건</a>&nbsp;
					<select class="search" name="searchtype" id="searchtype" style="border-radius: 10px; width: 160px;">
						<option value="">==조건선택==</option>
						<option value="bookcode">도서코드</option>
						<option value="bookname">도서명</option>
						<option value="author">저자</option>
						<option value="publisher">출판사</option>
					</select>
					<input type="text" class="search" name="searchtypetext" id="searchtypetext" placeholder="내용입력" style="border-radius: 10px; width: 400px;">
					
					<br><br>

				<a class="ui large teal label">도서상태</a>&nbsp;
					<input type="checkbox" name="bookstate" value="all"> 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="bookstate" value="bookwait"> 제작대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="bookstate" value="bookmake"> 제작중 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="bookstate" value="bookdone"> 제작완료
					<center><input type="submit" value="검색"></center>
				</div>
				</form>
			</div>

			<!-- 검색창 끝! -->
			
			
			<!-- 도서검색 결과 리스트 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:200px;">
				<div class="listBox">
				<div>총 <span style="font-weight: 600">30</span> 권</div>
				<br>
				<table class="listTable">
					<tr>
						<th width="2%"><input type="checkbox" id="allCheck" onclick="allChk(this);"/></th>
						<th width="5%">No</th>
						<th width="13%">도서코드</th>
						<th width="20%">도서명</th>
						<th width="12%">저자명</th>
						<th width="15%">출판사명</th>
						<th width="8%">도서상태</th>
						<th width="10%">도서등록일</th>
						<th width="10%">최종수정일</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="RowCheck" value="getBookcode"></td>
						<td>1</td>
						<td><a href="">8982934052</a></td>
						<td><a href="">여행의 이유</a></td>
						<td>김영하</td>
						<td>문학동네</td>
						<td>제작완료</td>
						<td>2019/04/27</td>
						<td>2019/04/30</td>
					</tr>
				</table>
				
				<br>
				<div><button class="mini ui black button" onclick="">삭제</button></div>
				</div>
			</div>
				
			<!-- 도서검색 결과 리스트 끝! -->
       <!-- 도서 목록 끝! -->
       

</section>
<!-- Content 끝! -->

    <footer class="site-footer">
        <p>
          &copy; Copyrights <strong>sorijieum</strong>. All Rights Reserved<br>
          Created with sorijieum by @minyoung</a>
        </p>
        
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
    </footer>


</body>
</html>