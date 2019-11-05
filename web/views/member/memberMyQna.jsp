<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, qna.model.vo.Qna, qnacomment.model.vo.QnaComment"  %>    
<%
   ArrayList<Qna> alarmlist = (ArrayList<Qna>)request.getAttribute("alarmlist");
   ArrayList<Qna> myqlist = (ArrayList<Qna>)request.getAttribute("myqlist");
   ArrayList<QnaComment> myqclist = (ArrayList<QnaComment>)request.getAttribute("myqclist");
   int beginPage = (Integer)request.getAttribute("beginPage");
   int endPage = (Integer)request.getAttribute("endPage");
   int currentPage = (Integer)request.getAttribute("currentPage");
   int maxPage = (Integer)request.getAttribute("maxPage");
   int listcount = (Integer)request.getAttribute("listcount");
   String keyword = (String)request.getAttribute("keyword");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 문의 내역</title>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script> -->
<%@ include file="/inc/memberSide.jsp"%>
<script type="text/javascript" src="/sori/resources/js/sorijieum_tts.js"></script>
<script type="text/javascript">
$(function(){
   //체크박스 전체 선택
   $("#allChk").click(function(){
      if($(this).is(":checked")){
         $(".chkbox").prop("checked", true);
      } else {
         $(".chkbox").prop("checked", false);
      }
   });
   
   // 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제
   $(".chkbox").click(function(){
      if($("input[name='delChk']:checked").length == <%= myqlist.size() %>){
         $("#allChk").prop("checked", true);
      }else{
         $("#allChk").prop("checked", false);
      }   
   });
   
   //제목 클릭하면 밑에 내용,답변 보이게 하기
   var title = $(".qnaTitle");
   title.click(function() {
      var cname = $(this).attr("id");      

      $("."+cname).slideToggle("normal");
      $(".qComm").not($("."+cname)).slideUp("normal");
   });
   
   //상단 알림 삭제
   $(".close.icon").click(function(){
      $.ajax({
         url:"qarmdel.my",
         data:{qnano: $(this).attr("id")},
         type:"post",
         success:function(result){
            $("#"+result).css("display","none");
         }
      });
   });
   
   <% if(myqlist.size() == 0){ %>
      $("#pagebox").css("display","none");
   <% } %>
   
 	//검색창이 아닌 곳에서 키 눌렀을 때 이벤트 발생
	$("body:not('#keyword')").on("keyup",function(event){
		if(event.keyCode == 32){	//알림 목록 듣기(스페이스바)
			<% if(alarmlist != null && alarmlist.size() != 0){ %>
				$("#alarmNum").focus();
				var aCnt = <%= alarmlist.size() %>;
				audio.pause();
				audio.currentTime=0;
				speech("알림은 최근 5개까지 표시되며, 알림을 듣는 도중, 듣고싶은 문의글의 번호를 누르면, 문의글 상세페이지로 이동합니다.");
				var alarmT ="";
				for(var i=1; i<=5; i++){
					if(document.getElementById(i+"stat") == null)
						break;
					alarmT = document.getElementById(i+"stat").innerText;
					speech(i + ",번, "+alarmT);
				}
				speech("검색하시려면 위쪽 방향키를, 전체 목록을 들으시려면 아래쪽 방향키를 눌러주세요.");
			<% }else{ %>
				audio.pause();
				audio.currentTime=0;
				speech("답변이 업데이트 된 문의글이 없습니다. 모든 문의글 목록을 들으려면 아래쪽 방향키를, 문의글을 검색하려면 위쪽 방향키를 눌러주세요.");
			<% } %>
		}
		else if(event.keyCode == 57 || event.keyCode == 105){	//9번 누르면 마이페이지로
			location.href  = "/sori/mypage?userid=<%= loginMember.getUserId() %>";
		}
	});
 	
	//문의목록에서 상세페이지로
	$("#listNum").keyup(function(event){
		var keyL = $(this).val();
		var qnano = "";
		if(keyL == '1'){	//1번(숫자,키패드)
			qnano = document.getElementById("1code").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyL == '2'){	//2번(숫자,키패드)
			qnano = document.getElementById("2code").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyL == '3'){	//3번(숫자,키패드)
			qnano = document.getElementById("3code").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyL == '4'){	//4번(숫자,키패드)
			qnano = document.getElementById("4code").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyL == '5'){	//5번(숫자,키패드)
			qnano = document.getElementById("5code").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
	});
	
	//알림목록에서 상세페이지로
	$("#alarmNum").keyup(function(event){
		var keyA = $(this).val();
		var qnano = "";
		if(keyA == '1'){	//1번(숫자,키패드)
			qnano = document.getElementById("1alarm").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyA == '2'){	//2번(숫자,키패드)
			qnano = document.getElementById("2alarm").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyA == '3'){	//3번(숫자,키패드)
			qnano = document.getElementById("3alarm").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyA == '4'){	//4번(숫자,키패드)
			qnano = document.getElementById("4alarm").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
		else if(keyA == '5'){	//5번(숫자,키패드)
			qnano = document.getElementById("5alarm").value;
			location.href  = "/sori/qdetail?qnano="+qnano;
		}
	});

});

	//처음 페이지 로딩되면 자동으로 출력 할 음성을 audio 변수에 담기
	var audio = new Audio("/sori/resources/mp3/myqna/myqna_main.mp3");
	window.onload = function(){
		<% if(myqlist.size() == 0){ %>
		audio = new Audio("/sori/resources/mp3/mypage/mypage_nolist.mp3");
		audio.play();
		audio.addEventListener("ended", function(e) {
			location.href  = "/sori/mypage?userid=<%= loginMember.getUserId() %>";
		});
		<% }else if(keyword == null && currentPage == 1){ %>
			audio.play();								//처음 페이지 로딩시 안내멘트 음성 출력
		<% }else if(currentPage != 1){ %>
			speech(<%= currentPage %> + " 페이지 입니다.");		//1페이지가 아닌 페이지 로딩시 자동으로 목록을 음성으로 출력
			var text = "";
			for(var i=1; i<6; i++){
				$("#"+i+"tr").focus();
				text = document.getElementById(i+"info").value;
				if(i==1)
					speech("일번, "+text);
				else if(i==2)
					speech("이번, "+text);
				else if(i==3)
					speech("삼번, "+text);
				else if(i==4)
					speech("사번, "+text);
				else if(i==5)
					speech("오번, "+text);
			}
		<% }else if(keyword != null && currentPage == 1){ %>	//검색결과 1페이지 들어올시 출력
			var keyV = document.getElementById("keyword").value;
			$("#listNum").focus();
			speech("검색하신, "+keyV+", 가 포함된 목록입니다. 검색된 문의글은 총 "+ <%= listcount %> + " 개 입니다. 번호를 누르시면 해당 문의 상세페이지로 이동합니다.");
			var focusImg = "";
			var text = "";
			for(var i=1; i<6; i++){
				$("#"+i+"tr").focus();
				text = document.getElementById(i+"info").value;
				if(i==1)
					speech("일번, "+text);
				else if(i==2)
					speech("이번, "+text);
				else if(i==3)
					speech("삼번, "+text);
				else if(i==4)
					speech("사번, "+text);
				else if(i==5)
					speech("오번, "+text);
			}
		<% } %>
	}
	
	window.onkeyup = function(){
		if(event.keyCode == 38) {	//위쪽키보드 눌렀을 때 (검색창으로 포커스)
			$("#keyword").focus();
			audio.pause();
			audio = new Audio("/sori/resources/mp3/myqna/myqna_search.mp3");
			audio.play();
		}
		else if(event.keyCode == 40){	//아래쪽 키보드 눌렀을 때(목록 책제목,저자명 읽어주기)
			audio.pause();
			audio = new Audio("/sori/resources/mp3/myqna/myqna_list.mp3");
			$("#listNum").focus();
			audio.play();
			audio.addEventListener("ended", function(e) {
				var focusImg = "";
				var text = "";
				for(var i=1; i<6; i++){
					text = document.getElementById(i+"info").value;
					if(i==1)
						speech("일번, "+text);
					else if(i==2)
						speech("이번, "+text);
					else if(i==3)
						speech("삼번, "+text);
					else if(i==4)
						speech("사번, "+text);
					else if(i==5)
						speech("오번, "+text);
				}
			});
		}
		else if(event.keyCode == 27){
			audio.pause();
			audio = null;
		}
		else if(event.keyCode == 37){
			<% if(currentPage != 1){ %>
				<% if(keyword == null){ %>
					location.href="/sori/qlist.my?page=<%= currentPage-1  %>&userid=<%= loginMember.getUserId() %>";
				<% }else{ %>
					location.href="/sori/qsearch.my?page=<%= currentPage-1 %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>";
			<% }}else{ %>
				audio.pause();
				audio.currentTime = 0;
				speech("목록의 첫 페이지 입니다.");
			<% } %>
		}
		else if(event.keyCode == 39){
			<% if(currentPage != maxPage){ %>
				<% if(keyword == null){ %>
					location.href="/sori/qlist.my?page=<%= currentPage+1  %>&userid=<%= loginMember.getUserId() %>";
				<% }else{ %>
					location.href="/sori/qsearch.my?page=<%= currentPage+1 %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>";
			<% }}else{ %>
				audio.pause();
				audio.currentTime = 0;
				speech("목록의 마지막 페이지 입니다.");
			<% } %>
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<style type="text/css">
.icon {
   margin-right:50px;
}
</style>
</head>
<body>
<input type="text" id="alarmNum">
<input type="text" id="listNum">
<div class="hy-div">
<section class="hy-section2" >
<div style="display:flex;justify-content:space-between;">
<div>
<a class="massive ui yellow label" style="font-size: 30px" href="/sori/qlist.my?userid=<%= loginMember.getUserId() %>">내 Q&A</a>
<span style="color:#fbbe09; font-weight:600">│</span> 
<span style="color:grey">내 문의 내역</span><br>
</div>
<!-- 검색창 시작 -->
<div style="margin-top:20px;">
<form action="/sori/myqsearch.my" method="post">
<input type="hidden" name="userid" value="<%= loginMember.getUserId() %>">
<% if(keyword != null) { %>
   <input type="text" name="keyword" id="keyword" value="<%= keyword %>" style="width:200px;">
<% }else{ %>
   <input type="text" name="keyword" id="keyword" placeholder="검색하실 내용을 입력하세요" style="width:200px;">
<% } %>      
   <input class="ui tiny basic black button" type="submit" value="검색" style="font-family:'S-Core Dream 6';">
</form>
</div>
</div>
<!-- 내 문의 알림 -->
<% if(alarmlist != null || alarmlist.size() != 0){ %>
<% int i=0;
	for(Qna q : alarmlist){ 
	i++;
%>
<div class="ui yellow message hy-alarmdiv" id="div_<%= q.getQnaNo() %>" style="display:block;">
	<input type="hidden" id="<%= i %>alarm" value="<%= q.getQnaNo() %>">  
   <a href="/sori/qdetail?qnano=<%= q.getQnaNo() %>" style="color:#AE7651;" id="<%= i %>stat" class="<%= i %>c">
   ［<%= q.getQnaTitle() %>］    문의글에 답변이 완료되었습니다.</a>
   <i class="close icon" id="<%= q.getQnaNo() %>"></i>
</div>
<% }}%>
<!-- 내 문의 목록 출력 -->
<br>
내 문의: <%= listcount %> 개
<form action="/sori/qdelete.my" method="post">
<table class="hy-listTable" align="center">
   <tr>
      <th width="10%"><input type="checkbox" class="chkbox" id="allChk"></th>
      <th width="10%">문의번호</th>
      <th width="50%">제목</th>
      <th width="15%">작성일</th>
      <th width="15%">상태</th>
   </tr>
   <% if(myqlist.size() > 0){ %>
   <% for(int i=0; i<myqlist.size(); i++){ 
      Qna q = myqlist.get(i);
      QnaComment qc = myqclist.get(i); %>
   <tr>
		<input type="hidden" id="<%= i+1 %>info" value="문의제목, <%= q.getQnaTitle() %>">
		<input type="hidden" id="<%= i+1 %>code" value="<%= q.getQnaNo() %>">
		<% if(qc != null){ %>
		<input type="hidden" id="<%= i+1 %>comment" value="답변 내용, <%= qc.getQnaComments() %>">
		<% } %>
      <td><input type="checkbox" class="chkbox" name="delChk" value="<%= q.getQnaNo() %>"></td>
      <td><%= q.getQnaNo() %></td>
      <td class="qnaTitle" id="<%= q.getQnaNo() %>"><%= q.getQnaTitle() %></td>
      <td><%= q.getQnaDate() %></td>
      <td>
      <% if(q.getQnaStatus().equals("Y")){ %>
      답변완료
      <% } else{ %>
      미답변
      <% } %>
      </td>
   </tr>
   <!-- 내 문의 제목영역 클릭시 내용과 답변 출력 -->
   <tr class="<%= q.getQnaNo() %> qComm" height="100" style="display:none;">
   <td colspan="5">
      <div style="float:left;margin-left:13%;"><i class="big question circle icon"></i>
      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      <%= q.getQnaContent() %></div>
      <div style="float:right;">
      <form action="/sori/qdetail" method="post"> 
      <input type="hidden" name="qnano" value="<%= q.getQnaNo() %>">
      <button class="mini ui yellow button" style="color:black;">상세페이지로</button>
      </form>
      </div>
   </td>
   </tr>
   <tr class="<%= q.getQnaNo() %> qComm" height="100" style="display:none;">
   <% if(q.getQnaStatus().equals("Y")){ %>
   <td colspan="5">
      <div style="float:left;margin-left:13%;"><i class="big exclamation circle icon"></i>
      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      <%= qc.getQnaComments() %></div>
   </td>
   <% }else{ %>
   <td colspan="5">
      <div style="float:left;margin-left:13%;"><i class="big exclamation circle icon"></i>
      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
      아직 등록된 답변이 없습니다.</div>
   </td>
   <% } %>
   </tr>
   <% }}else{%>
      <tr><td colspan="5">문의 내역이 존재하지 않습니다.</td></tr>
   <% } %>
   
</table>
<!-- 내 문의 목록 출력 끝 -->
<br>
<!-- 선택한 문의내역 삭제 버튼 -->
<!-- <div align="left"><button class="mini ui black button" style="font-size:9pt;"onclick="return delBtn();">삭제</button></div> -->
<input type="hidden" name="userid"   value="<%= loginMember.getUserId() %>">
<input type="hidden" name="currentPage" value="<%= currentPage %>">
<div align="left">
<button class="mini ui black button" style="font-size:9pt;" onclick="chkDel()">삭제</button></div>
</form>
<!-- 페이징 시작 -->
<% if(keyword == null){ %>
   <div id="pagebox" align="center" style="display:block;">
      <a href="/sori/qlist.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey double left icon"></i></a>&nbsp;
   <% if((beginPage - 10) < 1){ %>
      <a href="/sori/qlist.my?page=1&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
   <% }else{ %>
      <a href="/sori/qlist.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey left icon"></i></a>
   <% } %>&nbsp;
   <% for(int p = beginPage; p <= endPage; p++){ 
         if(p == currentPage){
   %>
      <a href="/sori/qlist.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
   <% }else{ %>
      <a href="/sori/qlist.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>"><font color="black"><b><%= p %></b></font></a>&nbsp;
   <% }} %>&nbsp;
   <% if((endPage +  10) < maxPage){ %>
      <a href="/sori/qlist.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
   <% }else{ %>
      <a href="/sori/qlist.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey right icon"></i></a>
   <% } %>&nbsp;
   <a href="/sori/qlist.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>"><i class="angle grey double right icon"></i></a>&nbsp;
   </div>
<% }else{ %> <!-- 검색시 페이징 -->
   <div id="pagebox" align="center" style="display:block;">
      <a href="/sori/myqsearch.my?page=1&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey double left icon"></i></a>&nbsp;
   <% if((beginPage - 10) < 1){ %>
      <a href="/sori/myqsearch.my?page=1&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
   <% }else{ %>
      <a href="/sori/myqsearch.my?page=<%= beginPage - 10 %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey left icon"></i></a>
   <% } %>&nbsp;
   <% for(int p = beginPage; p <= endPage; p++){ 
         if(p == currentPage){
   %>
      <a href="/sori/myqsearch.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><b class="ui small yellow circular label"><%= p %></b></a>&nbsp;
   <% }else{ %>
      <a href="/sori/myqsearch.my?page=<%= p %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><font color="black"><b><%= p %></b></font></a>&nbsp;
   <% }} %>&nbsp;
   <% if((endPage +  10) < maxPage){ %>
      <a href="/sori/myqsearch.my?page=<%= endPage + 10  %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
   <% }else{ %>
      <a href="/sori/myqsearch.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey right icon"></i></a>
   <% } %>&nbsp;
   <a href="/sori/myqsearch.my?page=<%= maxPage %>&userid=<%= loginMember.getUserId() %>&keyword=<%=keyword%>"><i class="angle grey double right icon"></i></a>&nbsp;
   </div>
<% } %>   
</section>
</div>
</body>
</html>