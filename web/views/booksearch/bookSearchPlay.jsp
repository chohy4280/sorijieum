<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.util.ArrayList, book.model.vo.Book,book.model.vo.BookPlay,
         mybook.model.vo.MyBook" %>
    <% 
       int rpage = ((Integer)request.getAttribute("rpage")).intValue();
       BookPlay bp = (BookPlay)request.getAttribute("bp");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 재생 </title>
<%@include file="/../inc/top.jsp"%>
<!-- CUSTOM CSS -->
<link rel="stylesheet" type="text/css" href="/sori/resources/css/BookSearch.css">
<script type="text/javascript">
$(function(){
	
});

<% if (bp != null) {%>
function nextpage(bookcode,userid,rpage){
	$.ajax({
		type: "POST",
		url : "bplay",
		data : {"bookcode": bookcode, "userid" : userid, "rpage": rpage},
		success : function(response){
			var url = "/sori/bplaypage?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>&rpage=<%= rpage+1 %>&tpage=<%= bp.getBookPage() %>";
			$(location).attr('href', url);
			
		},
		error : function(request, status, error){
			if(request.status != '0'){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}
	});
};
<% } %>
</script>
</head>
<body>
<section class="my-section">

<center>


<div id ="readbook" style=" width: 900px; height: 450px;"> 
<textarea class="ui textarea" id="textbook" font-size= "40" rows="20" cols="100"> 
<%=bp.getBookmaketxt()%>
</textarea>
</div>

<!-- 도서 넘기기  -->
<button class ="ui huge inverted orange button" 
onclick="location.href='/sori/bplaypage?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>&rpage=<%= rpage=1 %>&tpage=<%= bp.getBookPage() %>'">
<div class="yu-bookplay">
		    처음부터 읽기
	</div>	
	</button>
<button class ="ui inverted orange button"  id="leftpage"
onclick="location.href='/sori/bplaypage?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>&rpage=<%= rpage-1 %>&tpage=<%= bp.getBookPage() %>'">
<div class="yu-bookplay">
		    <i class="huge left chevron icon"></i>
	</div>	
	</button>

<button class ="ui inverted orange button"  id="nextpage"
onclick="javascript:nextpage('<%= bp.getBookCode()%>','<%= loginMember.getUserId() %>',<%= rpage+1 %>)">
<div class="yu-bookplay">
		    <i class="huge right chevron icon"></i>
	</div>	
	</button>
</center>

<!-- 도서 넘기기  -->
<button onclick="location.href='/sori/bsdetail?bookcode=<%= bp.getBookCode()%>&userId=<%= loginMember.getUserId() %>'">나가기</button>

</section>
</body>
</html>