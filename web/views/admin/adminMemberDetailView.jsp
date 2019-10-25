<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.model.vo.Member, adminmemo.model.vo.AdminMemo, mybook.model.vo.adminMyBook, likebook.model.vo.adminLikeBook, makebook.model.vo.adminMakeBook" %>
<%@ include file="/../inc/adminTemplate.jsp" %>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<AdminMemo> memolist = (ArrayList<AdminMemo>)request.getAttribute("memolist");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	//Object>Integer로 형변환 후 int로 한번 더 형변환!
	int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	int mybklistCount = ((Integer)request.getAttribute("mybklistCount")).intValue();
	int likebklistCount = ((Integer)request.getAttribute("likebklistCount")).intValue();
	int makebklistCount = ((Integer)request.getAttribute("makebklistCount")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<script type="text/javascript">
$(function(){
	var pwTF = "T";
	var pwEq = "T";
	
	// 첫번째 비밀번호 유효성 검사
	$("#userpwd2").focusin(function(){
		var pwdReg = /^(?=.*[a-z])(?=.*\d)[a-z0-9]{4,20}$/;	// 비밀번호 유효성검사 : 영문자, 숫자 무조건 1개 이상, 4~20자 제한
		if(!pwdReg.test($("#userpwd").val())){
			$("#pwddiv").html("암호는 영어소문자와 숫자로만 가능하며 4~20자리로 입력해야 합니다.");
			pwTF = "F";
		} else {
			$("#pwddiv").html("사용 가능한 암호입니다.");
			pwTF = "T";
		}
		return false;
	});
	
	// 두번째 비밀번호 = 첫번째 비밀번호 동일한지 확인
	 $("#userpwd2").keyup(function(){
	      if($("#userpwd").val() != $("#userpwd2").val()){
	         $("#pwddiv2").html("암호가 일치하지 않습니다. 다시 입력하십시오.");
	         pwEq = "F";
	      }else{
	         $("#pwddiv2").html("암호가 일치합니다.");
	         pwEq = "T";
	      }
	      return false;
		});
	
	 $("#btnsub").click(function(){
	      if(pwTF=="T" && pwEq=="T"){
	         return true;
	      }else{
	         alert("입력한 내용을 다시 확인해주세요.");
	         return false;
				}
			});
	 
	 // 메모 글자수 세기
	 $("#adminmemo").keyup(function(e){
		 var content = $(this).val();
		 $("#counter").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 100자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 100){
			 alert("최대 100자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,100));
			 $("#counter").html("( <span style='color:red;'>100 </span>/ 최대 100자)");
		 } 
		 
	 });
	 
	 
	}); // document.ready...
	
	// 정보수정 확인용
	function upmemberBtn(){
		var rtn;
		rtn = confirm("해당 정보로 수정하시겠습니까?");
		if(rtn == true){
			document.upmemberForm.submit();
		}else{
			return false;
		}
	}	// upmemberBtn() 끝...
	
	
	// 회원 삭제
	function delBtn(){
		var userid = "<%=m.getUserId() %>";
		var result = confirm('<%= m.getUserName() %>(<%= m.getUserId() %>)님을 강제탈퇴 처리하시겠습니까?\n강제탈퇴 처리 후 동일 아이디로 30일동안 재가입이 불가능합니다.');
		if(result){
			$.ajax({
				url: "/sori/mdel.ad",
				type: "post",
				data: { userid : userid },
				success : function(data){
					alert(data);
					location.href="/sori/mlist.ad?page="+<%=currentPage%>;
				}
			})
		return false;
	}}
	

	// 메모 내용 없이 저장 클릭하면
	function valuechk(){
		var searchCheck = 0;
		if ($("#adminmemo").val() == "") {
			alert("메모 내용을 입력해 주세요.")

			$("#adminmemo").focus();//커서입력
			return false;
		}
	}
	
	// 이용자 읽은 도서 클릭시
	function winOpen1(){
		var style = "width=900, height=500%, scrollbars=no, resizable=no";
		window.open("/sori/urblist.ad?page=1&userid=<%=m.getUserId() %>", "이용자 읽은도서", style);
	}
	
	// 이용자 관심 도서 클릭시
	function winOpen2(){
		var style = "width=900, height=500%, scrollbars=no, resizable=no";
		window.open("/sori/ulblist.ad?page=1&userid=<%=m.getUserId() %>", "이용자 관심도서", style);
	}
	
	
	// 제작자 도서 클릭시
	function winOpen3(){
		var style = "width=900, height=500%, scrollbars=no, resizable=no";
		window.open("/sori/mmblist.ad?page=1&userid=<%=m.getUserId() %>", "제작자 제작도서", style);
	}
	

	// 0권 도서 클릭시
	function emptyPop(){
		alert("해당 도서가 존재하지 않습니다.");
		return false;
	}
</script>
</head>
<body>

<% if(loginMember != null && (loginMember.getTypeNumber() == 4 || loginMember.getTypeNumber() == 5)) { %>
<!-- Content 시작! -->
<section class="contentsection">

	<!--회원상세 조회 목록 시작-->
		<i class="big user icon"></i><span style="font:black; font-size:17pt; padding:10px;">회원상세정보</span>
		<br>
       <!-- 회원상세조회 내용 시작! -->
			<div class="listBoxBG" style="height: 1500px; margin-top:0px;">
				<div class="listBox" >
			<!-- 기본정보 섹션 시작 -->
				<a class="ui large blue label">기본정보</a>
				<br><br>
				<form action="/sori/mup.ad" method="post" enctype="multipart/form-data" name="upmemberForm">
				<table class="listTable">
					<tr>
						<th width="15%">이름(아이디)</th><td width="35%"><%=m.getUserName() %>(<%=m.getUserId() %>)</td>
						<input type="hidden" name="userid" id="userid" value="<%= m.getUserId() %>" />
																						
						<th width="15%">회원유형</th><td width="35%">
						<% if(m.getTypeNumber() == 1) { %>
						<input type="radio" name="typenumber" id="typenumber" value="1" checked>　이용대기자&nbsp;
						<input type="radio" name="typenumber" id="typenumber" value="2">　이용자&nbsp;
						<input type="radio" name="typenumber" id="typenumber" value="3">　제작자&nbsp;
						<% }else if(m.getTypeNumber() == 2) { %>
						<input type="radio" name="typenumber" id="typenumber" value="1">　이용대기자&nbsp;
						<input type="radio" name="typenumber" id="typenumber" value="2" checked>　이용자&nbsp;
						<input type="radio" name="typenumber" id="typenumber" value="3">　제작자&nbsp;
						<% }else {%>
						<input type="radio" name="typenumber" id="typenumber" value="1">　이용대기자&nbsp;
						<input type="radio" name="typenumber" id="typenumber" value="2">　이용자&nbsp;
						<input type="radio" name="typenumber" id="typenumber" value="3" checked>　제작자&nbsp;
						<%} %>
						</td>
					</tr>
					<tr>
						<th>성별</th><td><% if(m.getGender().equals("F")){%>
										여성<%}else{ %>
										남성<%} %>
										</td>
						<th>인증내역</th><td>&ensp;
										<% if(m.getUserOfile() != null) {%>
										<a href="/sori/mfdown.ad?ofile=<%= m.getUserOfile() %>&rfile=<%= m.getUserRfile() %>"><%= m.getUserOfile() %></a>
										<%}else{ %>
										첨부파일 없음
										<%} %>
										
									<input type="file" name="mupfile" id="mupfile"></td>
									<input type="hidden" name="ofile" id="ofile" value="<%= m.getUserOfile() %>">
									<input type="hidden" name="rfile" id="rfile" value="<%= m.getUserRfile() %>" />
					</tr>
					<tr>
						<th>비밀번호</th><td><div class="ui input"><input type="password" name="userpwd" id="userpwd" value="<%= m.getUserPwd() %>" style="text-align: center" required></div><div id="pwddiv"></div></td>
						<th>생년월일</th><td><%= m.getBirth() %></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th><td><div class="ui input"><input type="password" id="userpwd2" value="<%= m.getUserPwd() %>" style="text-align: center" required></div><div id="pwddiv2"></div></td>
						<th>가입일</th><td><%= m.getEnrollDate() %></td>
					</tr>
					<tr>
						<th>전화번호</th><td><div class="ui input"><input type="text" name="phone" id="phone" value="<%= m.getPhone() %>" placeholder="숫자만 입력(-제외)" style="text-align: center" required></div></td>
						<th>이메일</th><td><div class="ui input"><input type="email" name="email" id="email" value="<%= m.getEmail() %>" placeholder="ex) sorijieum@gmail.com" style="text-align: center" required></div></td>
					</tr>
				</table>
				<br>
				<center>
					<div class="ui buttons">
						<input type="submit" button class="ui positive button"  style="width:100px" id="btnsub" onclick="return upmemberBtn();" value="수정"></button>
					 	<div class="or"></div>
					  	<input type="reset" class="ui button" style="width:100px"></button>
					</div>
				</center>
				</form>
			<!-- 기본정보 섹션 끝 -->
			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<br><br><br><hr><br><br><br>
			<!-- 도서정보 섹션 시작 -->
				<a class="ui large blue label">도서정보</a>&ensp;<span style="color:#aaa">상세내역을 보려면 해당 도서의 숫자를 클릭하세요.</span><br><br>
				<table class="listTable2">

					<% if(m.getTypeNumber() == 1 || m.getTypeNumber() == 2) {%>
					<tr>
						<th width="33%">읽은 도서</th>
						<th width="33%">관심 도서</th>
					</tr>
					<tr>
						<%if(mybklistCount != 0) { %>
						<td><a id="mybk" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="winOpen1();"><%= mybklistCount %></a> 권</td>
						<%}else{ %>
						<td><a id="mybk" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="return emptyPop();"><%= mybklistCount %></a> 권</td>
						<%} %>
						
						<%if(likebklistCount != 0) {%>
						<td><a id="likebk" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="winOpen2();"><%= likebklistCount %></a> 권</td>
						<%}else{ %>
						<td><a id="likebk" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="return emptyPop();"><%= likebklistCount %></a> 권</td>
						<%} %>
					</tr>
						<%} else if (m.getTypeNumber() == 3) {%>
					<tr>
						<th width="33%">제작 도서</th>
					</tr>
					<tr>
						<%if(makebklistCount != 0) {%>
						<td><a id="makebk" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="winOpen3();"><%= makebklistCount %></a>권</td>
						<%}else{ %>
						<td><a id="makebk" style="font-weight: 600; font-size: 15pt; text-decoration: underline;" onclick="return emptyPop();"><%= makebklistCount %></a>권</td>
						<%} %>
					</tr>
						<%} %>
				</table>
					<br>
					
			<!-- 도서정보 섹션 끝 -->
				<br><br><br><hr><br><br><br>		
			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- 관리자메모 섹션 시작 -->
			<a class="ui large blue label">관리자메모</a>&ensp;<span style="color:#aaa">고객에게 노출되지 않는 관리자 전용 메모입니다.</span><br><br>
					<table class="listTable2">
					<tr>
						<th width="5%">No</th>
						<th width="55%">메모 내용</th>
						<th width="15%">작성자(ID)</th>
						<th width="15%">작성일</th>
						<th width="10%">관리</th>
					</tr>
					<% if(memolist.size() != 0) {
						for(int i = 0 ; i < memolist.size() ; i++){
						AdminMemo memo = memolist.get(i);
					%>
					<tr>
						<td><%= currentPage * 5 - 4 + i %></td>
						<td><%= memo.getAdminMemo() %></td>
						<td><%= memo.getAdminId() %></td>
						<td><%= memo.getMemoDate() %></td>
						<td><button class="mini ui grey button" onclick="location.href='/sori/mmdel.ad?userid=<%= m.getUserId() %>&memono=<%=memo.getMemoNo() %>'">삭제</button></td>
					</tr>
					<%} %>
					</table><br>
					 <!-- 페이징처리 시작 -->
							<div id="pagebox" align="center">
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=1"><i class="angle grey double left icon"></i></a>&emsp;
							<% if((beginPage - 10) < 1){ %>
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=1"><i class="angle grey left icon"></i></a>
							<% }else{ %>
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%= beginPage - 10 %>"><i class="angle grey left icon"></i></a>
							<% } %>&ensp;
							<% for(int p = beginPage; p <= endPage; p++){ 
									if(p == currentPage){
							%>
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%= p %>"><b class="ui small teal circular label"><%= p %></b></a>&emsp;
							<% }else{ %>
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%= p %>"><font color="black"><b><%= p %></b></font></a>&emsp;
							<% }} %>&ensp;
							<% if((endPage +  10) < maxPage){ %>
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%= endPage +  10 %>"><i class="angle grey right icon"></i></a>
							<% }else {%>
								<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%= maxPage %>"><i class="angle grey right icon"></i></a>
							<% } %>&ensp;
							<a href="/sori/mdetail.ad?userid=<%= m.getUserId() %>&page=<%= maxPage %>"><i class="angle grey double right icon"></i></a>&emsp;
							</div>
							<!-- 페이징 끝-->
					<%}else{ %>
					<tr><td colspan="5" style="color:#aaa">현재 작성된 메모가 없습니다.</td></tr>
					</table>
					<%} %>
					<br><br>

					<p style="font-size: 15pt">메모 작성</p>
					<form action="/sori/mminsert.ad" method="post">
						<textarea name="adminmemo" id="adminmemo" cols="150" rows="3" placeholder="관리자 메모 내용을 입력하세요.(공백 포함 최대 100자)" style="border-radius: 10px"></textarea>
						<input type="hidden" name="userid" value="<%= m.getUserId() %>"/>
						<input type="hidden" name="adminid" value="<%= loginMember.getUserId() %>"/>
						<div align="right"><span style="color:#aaa;" id="counter">( <span style="color:#4ecdc4">0</span> / 최대 100자 )</span>
						<input type="submit" button class="mini ui green button" onclick="return valuechk();" value="저장"></div>
					</form>
					
			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- 관리자메모 섹션 끝 -->
				</div>
				<br><br><br><hr><br><br><br>
				<center>
				<button class="tiny ui teal button" onclick="javascript:history.back();">◀BACK</button>
				<button class="tiny ui red button" onclick="return delBtn();">강제탈퇴</button>
				</center>
			</div>
       
        <!-- 회원 상세조회 내용 끝! -->

    <!-- 회원 상세조회 목록 끝! -->
</section>


<%}else{ %>
<%} %>
</body>
</html>