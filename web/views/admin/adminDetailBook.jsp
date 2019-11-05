<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.model.vo.BookDV, java.io.File" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	BookDV book = (BookDV)request.getAttribute("book");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	String searchtype = (String)request.getAttribute("searchtype");
	String keyword = (String)request.getAttribute("keyword");
	String makestatus = (String)request.getAttribute("makestatus");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
<script type="text/javascript">
	// 도서삭제
		function delBtn(){
		var bookcode = "<%=book.getBookCode() %>";
		var result = confirm("'<%= book.getBookTitle() %>' 도서를 삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.");
		if(result){
			$.ajax({
				url: "/sori/bdel.ad",
				type: "post",
				data: { bookcode : bookcode },
				success : function(data){
					alert(data);
					location.href="/sori/blist.ad?page="+<%= currentPage %>;
				}
			})
		return false;
	}}

	//이미지추출 버튼 클릭시 pdf이미지 추출
	function bpimg(code){
		$.ajax({
			type : "POST",
	        url : "bpimg",
	        data : {"bookcode": code},
			success : function(response) {
				var url = "/sori/blist.ad";
				$(location).attr('href', url);
				alert("이미지 추출을 완료하였습니다!");
				location.href="/sori/bdetail.ad?bookcode="+<%=book.getBookCode() %>+"&page="+<%= currentPage %>;
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}
		});
	 }

</script>
</head>
<body>

<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">


	<!--도서 추가 시작-->
            <i class="big book icon"></i><span style="font:black; font-size:17pt; padding:10px;">《<%= book.getBookTitle() %>》 상세 내역</span>
            <br><br>
            <!-- 이미지 미리보기 부분 -->
            <div style="float: left; margin-right: 0px; margin-left: 20px; margin-top:90px; margin-right:20px;">
            <img src="/sori/resources/book_upfiles/<%=book.getBookRimg() %>" style="width:250px; height:350px;"/>
            <p align="center" style="color: #fff; height:40px; background: #4ecdc4; line-height: 40px; font-size: 12pt;"><i class="mini camera icon"></i>도서 이미지 미리보기</p>
            </div>
            <!-- 이미지 미리보기 부분 끝-->
            <div class="lightgreyBox2" style="height: 1100px; align: center;">
            	<table class="detailform">
            	
					<tr>
						<th width="30%">도서코드</th>
						<td><%= book.getBookCode() %></td>
					</tr>
					
					<tr>
						<th width="30%">도서명</th>
						<td><%= book.getBookTitle() %></td>
					</tr>
					
					<tr>
						<th width="30%">저자명</th>
						<td><%= book.getAuthor() %></td>
					</tr>
					
					<tr>
						<th width="30%">출판사명</th>
						<td><%= book.getPublisher() %></td>
					</tr>
					
					<tr>
						<th width="30%">출간일</th>
						<td><%= book.getPublishDate() %></td>
					</tr>
					
					<tr>
						<th width="30%">쪽수</th>
						<td><%= book.getBookPage() %> 쪽</td>
					</tr>

					<tr>
						<th width="30%">책 소개</th>
						<td><%= book.getBookInfo() %></div></td>
					</tr>
					
					<tr>
						<th width="30%">도서이미지</th>
						<td><a href="/sori/bimgfdown.ad?ofile=<%= book.getBookOimg() %>&rfile=<%= book.getBookRimg() %>"><%= book.getBookOimg() %></a></td>
					</tr>
					
					<tr>
						<th width="30%">도서원본파일</th>
						<td><a href="/sori/bfdown.ad?ofile=<%= book.getBookOpdf() %>&rfile=<%= book.getBookRpdf() %>"><%= book.getBookOpdf() %></a></td>
					</tr>
					
					<tr>
						<th width="30%">제작완료파일</th>
						<td><%if(book.getBookotxt() == null){ %>
							현재 제작중
							<%} else { %>
							<a href="/sori/btxtfdown.ad?ofile=<%= book.getBookotxt() %>&rfile=<%= book.getBookrtxt() %>"><%= book.getBookotxt() %></a>
							<% } %>
						</td>
					</tr>
					
					<br>
				</table>
				<br><br>
				<center>
				<%if(searchtype!=null || keyword != null || makestatus != null) {%>
					<button class="small ui teal button" onclick="location.href='/sori/bslist.ad?page=<%= currentPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>'">목록이동</button>&nbsp;
					<button class="small ui teal button" onclick="location.href='/sori/bupview.ad?bookcode=<%=book.getBookCode() %>&page=<%= currentPage %>&searchtype=<%=searchtype%>&keyword=<%=keyword%>&makestatus=<%=makestatus%>'">수정</button>&nbsp;  
					<%}else{ %>
					<button class="small ui teal button" onclick="location.href='/sori/blist.ad?page=<%= currentPage %>'">목록이동</button>&nbsp; 
					<button class="small ui teal button" onclick="location.href='/sori/bupview.ad?bookcode=<%=book.getBookCode() %>&page=<%= currentPage %>'">수정</button>&nbsp; 
					<%}
						
						String rootPathss = this.getClass().getResource("/").getPath();
		                String srcs = "/resources/book_pdf_images/" + book.getBookCode();
		                String pluss = rootPathss+srcs;
		                String[] splts = pluss.split("/WEB-INF/classes/");
		                String finSrcs = "";
		                for(int i=0; i<splts.length; i++){
		                   finSrcs += splts[i];
		                }
		                String destinationDir = finSrcs; //폴더 경로
		                File destinationFile = new File(destinationDir);
		                File Folder = new File(destinationDir);
		                if(!Folder.exists()){
					%>
					<button id="bpimg" class="small ui yellow button" onclick="javascript:bpimg(<%=book.getBookCode() %>)">이미지추출</button>
					<a class="ui yellow tag label">※도서 등록 후 클릭 필수!!※</a>
					<% }else{ %>
					&nbsp;
					<% } %>
					<% if(loginMember != null && loginMember.getTypeNumber() == 5 ) { %>
					<br><br><br><button class="small ui red button" onclick="return delBtn();">도서삭제</button>
					<% } %>
				</center>
            </div>
    <!-- 도서 추가 끝! -->
    
    
            </section>
<!-- Content 끝! -->
<%}else{ %>
<%} %>
</body>
</html>