<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, book.model.vo.BookMakingProgress, book.model.vo.Book"%>
<%
	ArrayList<BookMakingProgress> list = (ArrayList<BookMakingProgress>)request.getAttribute("list");
	int index = ((Integer)request.getAttribute("index")).intValue();
	BookMakingProgress bmp = list.get(index);
%>
<!DOCTYPE html>
<html>
<head>
<META http-equiv="Expires" content="-1">
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, shrink-to-fit=no">
<title>도서제작</title>
<%@ include file="/../inc/top.jsp"%>
<%@ include file="/../inc/cdn.jsp"%>
<!-- ckeditor cdn 링크 -->
<script type="text/javascript" src="/sori/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
var checkUnload = true;
window.onbeforeunload = confirmExit; 
function confirmExit() {
  if (checkUnload) {
  	var userid = '<%= loginMember.getUserId() %>';
  	var bookcode = '<%= bmp.getBookCode() %>';
  	var bookpage = '<%= bmp.getBookPage() %>';
  	$.ajax({
		type : "POST",
        url : "bmdel",
        async: false,
		data : {"userid": userid, "bookcode": bookcode, "index": <%=index%>, "bookpage": bookpage},
		success : function(response) {
			alert("제작에 실패했습니다.");
		},
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}
	});
  	return "페이지에서 나가시면 도서제작에 패널티가 있을 수 있습니다.";
  }
}; 

//F5 버튼으로 새로고침 방지
document.onkeydown = noEvent;
function noEvent() { 
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}

//타이머 설정
var timer=0;
$(function(){
	var qw = 0;
	var we = 10;
	var wr = 10;
	//초기값
	if(qw==wr){
		$("#completebtn").prop('disabled',false);
		$("#completebtn").css('background','#fbbd08');
		$("#completebtn").css('color','white');
	} 
	var hour = 5;
	var minute = 0;
	var second = 0;
		// 초기화
		$("#hour").val(hour);
		$("#min").val(minute);
		$("#second").val(second);
		timer = setInterval(function() {
			var check=0;
			$("#hour").html(hour);
			$("#min").html(minute);
			$("#second").html(second);
			if (second < 2 && minute == 0 && hour == 0) {
				clearInterval(timer);  /* 타이머 종료 */ 
				checkUnload = false;
				alert("제작자 님, 도서 제작시간이 종료되어 도서제작 메인페이지로 이동됩니다.");
					var userid = '<%= loginMember.getUserId() %>';
				  	var bookcode = '<%= bmp.getBookCode() %>';
				  	var bookpage = '<%= bmp.getBookPage() %>';
					$.ajax({
						type : "POST",
				        url : "bmdel",
				        async: false,
						data : {"userid": userid, "bookcode": bookcode, "index": <%=index%>, "bookpage": bookpage},
						success : function(response) {
							var url = "/sori/bmkmain";
							$(location).attr('href', url);
							alert("제작에 실패했습니다.");
						},
						error : function(request, status, error) {
							if (request.status != '0') {
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						}
					});
			}else {
				second--;
				// 분처리
				if (second < 1) {
					minute--;
					second = 59;
				}
				//시간처리
				if (minute < 1) {
					if (hour > 0) {
						hour--;
						minute = 59;
					}
				}
			}
		}, 1000); /* millisecond 단위의 인터벌 */
	});
	
	//이미지 사이즈 변경
	function changeImgSize(num,page) {
		var image = document.getElementById("inputimg_"+page+"");
		var currentWidth = image.width;
		var currentHeight = image.height;
		if (num == 1) {
			 if(image.width > 3000 || image.height > 4000)
			    {
			      return;
			    }
			var width = parseInt(currentWidth * 1.1); //10%씩 넓이 증가 
			var height = parseInt(currentHeight * 1.1); //10%씩 높이 증가 
		} else if (num == 2) {
			 if(image.width < 30 || image.height < 40)
			    {
			      return;
			    }
			var width = parseInt(currentWidth * 0.9); //10%씩 넓이 감소 
			var height = parseInt(currentHeight * 0.9); //10%씩 높이 감소 
		}
		image.width = width;
		image.height = height;
		}
	
	//페이지 번호 유무 체크
	function checkpage(page){
		var pagenum=$('#'+page+'_pagenum').val();
		/* var pageck=$('#'+page+'_pagenumcb').val(); */

		if(pagenum!="" /* && $('#'+page+'_pagenumcb').is(":checked")==false */){
			$("#txt_"+page).attr('disabled',false);
			$("#txt_"+page).css('background','#fbbd08');
			$("#txt_"+page).css('color','white');
			/* $("#"+page+"_pagenumcb").css('background','#c4c4c4'); */
		}else if(pagenum!="" /* && $('#'+page+'_pagenumcb').is(":checked")==true */){
			$("#txt_"+page).attr('disabled',true);
			$("#txt_"+page).css('background','#fbbd08');
			$("#"+page+"_pagenum").val("");
			$("#"+page+"_pagenum").attr('disabled',true);
			$("#"+page+"_pagenum").css('background','#c4c4c4');
		}else if(pagenum=="" /* && $('#'+page+'_pagenumcb').is(":checked")==false */){
			$("#txt_"+page).attr('disabled',true);
			$("#txt_"+page).css('background','#fbbd08');
			$("#txt_"+page).css('color','white');
			$("#"+page+"_pagenum").attr('disabled',false);
			$("#"+page+"_pagenum").css('background','white');
			/* $("#"+page+"_pagenumcb").attr('disabled',false);
			$("#"+page+"_pagenumcb").css('background','transparent'); */
		}else if(pagenum==""/* && $('#'+page+'_pagenumcb').is(":checked")==true */){
			$("#txt_"+page).attr('disabled',false);
			$("#txt_"+page).css('background','#fbbd08');
			$("#txt_"+page).css('color','white');
			$("#"+page+"_pagenum").attr('disabled',true);
			$("#"+page+"_pagenum").css('background','#c4c4c4');
		}
	}
	
	//저장
	function input(page,endpage,code){
		var userid = '<%= loginMember.getUserId() %>';
		var input=CKEDITOR.instances[''+code+'_'+page+''].getData();
		var title = '<%= bmp.getBookTitle() %>';
		var pagenum=$('#'+page+'_pagenum').val();
		var pageck=$('#'+page+'_pagenumcb').val();
		/*
		var pagenum=$('#'+page+'_pagenum').val();
		var pageck=$('#'+page+'_pagenumcb').val();
		var rdata={"content": input, "page": page, "bookcode": code, "userid": userid};
		console.log(rdata);
		var data=JSON.stringify(rdata);
 		var json = JSON.parse(data); 
		var checkcom;*/
 		if(pagenum != page){
 			alert("페이지 번호를 잘못 입력하셨습니다. 다시 입력해주세요.");
 		}else{
		$.ajax({
				type : "POST",
		        url : "inputinsert",
		        async: false,
				data : {"content": input, "title": title, "page": page, "bookcode": code, "userid": userid, "index": <%=index%>},
				success : function(response) {
					/* checkcom=response; */
					$("#txt_"+page).attr('disabled', true);
					$("#up_"+page).attr('disabled', false);
					 $("#"+page+"_pagenum").attr('disabled',true);
					$("#"+page+"_pagenum").css('background','#c4c4c4');
					if(pagenum==endpage){
						$("#completebtn_"+endpage).attr('disabled', false);
						$("#completebtn_"+endpage).css('background', '#fbbd08');
						$("#completebtn_"+endpage).css('color', 'white');
					 }
					if(response=="ok"){
					alert("저장이 완료되었습니다.");
					}
				},
				error : function(request, status, error) {
					if (request.status != '0') {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}
			});
 		}
	}
	
	//수정
	function update(page,endpage,code){
		var userid = '<%= loginMember.getUserId() %>';
		var input=CKEDITOR.instances[''+code+'_'+page+''].getData();
		var title = '<%= bmp.getBookTitle() %>';
		/* var checkcom; */
		$.ajax({
				type : "POST",
		        url : "bmup",
		        async: false,
				data : {"content": input, "title": title, "page": page, "bookcode": code, "userid": userid},
				success : function(response) {
				/* 	checkcom=response; */
					$("#txt_"+page).attr('disabled',true);
					$("#txt_"+page).css('color','white');
					if(response=="ok"){
					alert("수정이 완료되었습니다.");
					}
				},
				error : function(request, status, error) {
					if (request.status != '0') {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}
			});
	}
	
	//제출
	function complete(page,endpage,code){
		var result = confirm("제출을 완료하시겠습니까? 제출하시면 수정할 수 없습니다."); 
		if(result == true){ 
		var userid = '<%= loginMember.getUserId() %>';
		$.ajax({
			type : "POST",
	        url : "bmcomp",
	        async: false,
			data : {"page": page, "endpage": endpage, "userid": userid, "bookcode": code},
			success : function(response) {
				clearInterval(timer);
				checkUnload = false;
				if(result) { 
					alert("제출이 완료되었습니다. 제작에 참여해주셔서 감사합니다.");
					location.replace('/sori/bmkmain'); 
				}else { 
					alert("제출이 실패했습니다.");
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}
		});
		}else if(result == false){
			$.ajax({
				type : "POST",
		        url : "bmdel",
		        async: false,
				data : {"userid": userid, "bookcode": code},
				success : function(response) {
					clearInterval(timer);
					checkUnload = false;
					if(result) { 
						alert("제출이 실패했습니다.");
					}
				},
				error : function(request, status, error) {
					if (request.status != '0') {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}
			});
		}
	}
	
	$(function($){
	
		//Tab
	  $("#yetabs #item").on("click", function(){
		  $("#yetabs #item").removeClass('active');
		  $(this).addClass("active");
		  var tab = $(this).attr("data-tab");
		  $(".tab.segment").removeClass("active");
		  $(".tab.segment[data-tab=\"" + tab + "\"]").addClass("active");
	  });
		
	});
</script>
</head>
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0" marginwidth="0" marginheight="0" oncontextmenu="return true"
	onselectstart="return true" ondragstart="return true">
	<!-- bookmaking -->
	<div class="ye-bookstatus">
		<div class="ye-bookstatus-title">
			<h2 style="font-family: 'S-Core Dream 6';">
				<i class="keyboard icon"></i> 도서제작
			</h2>
		</div>
		<!-- bookstatus_title -->
	</div>
	<br><br><br>
	<!-- bookstatus끝 -->
	<!-- content 시작 -->
	<div id="yecontent">
		<!-- timer -->
		<div style="float:right;font-size:25px;">
			<div style="float: left; margin-top: 3px;">
				<i class="hourglass half icon"></i>&nbsp;
			</div>
			<div style="float: left; height: 35px; width: 190px">
				<font style="vertical-align: middle; font-family: 'S-Core Dream 6';">제작시간
					:</font> <font id="hour" style="vertical-align: middle;"></font><font
					style="vertical-align: middle; font-family: 'S-Core Dream 6';">시간&nbsp;</font>
			</div>
			<div style="float: left; width: 70px; height: 35px;">
				<font id="min" style="vertical-align: middle;"></font><font
					style="vertical-align: middle; font-family: 'S-Core Dream 6';">분</font>
			</div>
			<div style="float: left; width: 60px; height: 35px;margin-left:-6px;">
				<font id="second" style="vertical-align: middle;"></font><font
					style="vertical-align: middle; font-family: 'S-Core Dream 6';">초</font>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</div><!-- timer end -->
		<br><br><br>
		<!-- 쪽수 탭버튼 시작 -->
		<div id="yetabs" style="width:800px;position:absolute;left:0px;top:180px;">
			<div class="ui massive yellow ten item top attached tabular menu" >
				<%  int bookendpage = bmp.getBookPage();
					int endPage = (bmp.getBookmakepage() + 9);
					for(int i = bmp.getBookmakepage(); i <= endPage; i++) {
						if(i == bmp.getBookmakepage()){
				%>
				<a class="active yellow item" id="item" data-tab="yetabs-<%=i%>"><%=i%></a>
				<% } else { %>
				<a class="yellow item" id="item" data-tab="yetabs-<%=i%>"><%=i%></a>
				<% } } %>
			</div>
		</div>
		<%
			for (int i = bmp.getBookmakepage(); i <= endPage; i++) {
				if (i == bmp.getBookmakepage()) {
		%>
		<div class="table-responsive">
			<div class="ui bottom attached tab segment active" id="yetabs-<%=i%>"
				data-tab="yetabs-<%=i%>">
				<table class="table">
					<tr style="background-color: #f5f5f5">
						<td width="60%" align="center">
							<button name="ci1_<%=bmp.getBookCode()%>"
								class="ui yellow icon button"
								onclick="javascript:changeImgSize(1,<%=i%>)">
								<i class="large zoom-in icon"></i>
							</button>
							<button name="ci2_<%=bmp.getBookCode()%>"
								class="ui yellow icon button"
								onclick="javascript:changeImgSize(2,<%=i%>)">
								<i class="large zoom-out icon"></i>
							</button>
						</td>
						<td width="40%" align="center">
							<div class="ui icon button" id="guide-tooltip<%= i %>" style="background-color: transparent !important;">
								<i class="yellow large info circle icon"></i>
							</div>
							<div class="ui custom popup transition hidden" id="guide<%= i %>"
								style="padding: 18px; margin-left: 945px; margin-top: 22px; font-size: 10pt; text-align: left; font-family: 'S-Core Dream 5'; white-space: nowrap;">
								<strong>1. </strong>가이드라인을 반드시 숙지하신 후 꼼꼼히 제작해주시기 바랍니다.<br /> 
								<strong>2. </strong>페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.<br /> 
								<strong>3. </strong>모든 페이지를 저장하신 후 마지막 페이지의 제출 버튼을 누르셔야 작업이 제출됩니다.
							</div>
							<div class="ui yellow button" id="ui-tooltip-content<%= i %>">
								<div class="ui custom popup transition hidden" id="guide<%= i+1 %>"
									style="padding: 24px; max-width: 500px; margin-top: 25px; margin-left: 945px; text-align: left; font-size: 11pt; font-family: 'S-Core Dream 5'; white-space: nowrap;">
									<strong>1-1.</strong> 오탈자를 확인해 주세요.<br /> 
									<strong>1-2.</strong> 정확한 띄어쓰기를 해 주세요.<br /> 
									<strong>1-3.</strong> 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.<br /> 
									<strong>1-4.</strong> 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.<br /> 
									<strong>2-1.</strong> 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.<br /> 
									<strong>2-2.</strong> 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.<br /> 
									<strong>2-3.</strong> 특수문자 편집도구를 통해 특수기호를 입력해 주세요.<br /> 
									<strong>2-4.</strong> 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.<br /> 
									<strong>2-5.</strong> 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.<br />
									<strong>3-1.</strong> 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.<br />
									<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br />
									<strong>4-2.</strong> 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.<br />
									<strong>4-3.</strong> 문단 시작 시 들여쓰기를 하지 마세요.<br /> 
									<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br /> 
									<strong>5-1.</strong> 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. 예)(주1), (주*) <br /> 
									<strong>5-2.</strong> 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1:, 주 *: 형식으로 입력해 주세요.<br />
									<strong>6-1.</strong> 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. <br /> 
									<strong>6-2.</strong> 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.<br /> 
									<strong>6-3.</strong> 페이지 넘버 입력칸에는 '탭메뉴' 페이지의 번호를 입력해 주세요.<br />
								</div>
								제작가이드라인
							</div> 
								<button id="txt_<%=i%>" class="ui yellow button"
								onclick="javascript:input(<%=i%>,<%= endPage %>,<%=bmp.getBookCode()%>)"
								disabled="disabled">저장</button>
								<button id="up_<%=i%>" class="ui yellow button"
								onclick="javascript:update(<%=i%>,<%= endPage %>,<%=bmp.getBookCode()%>)"
								disabled="disabled">수정</button>
								<button id="completebtn_<%=i%>" class="ui yellow button"
								onclick="javascript:complete(<%=i%>,<%= endPage %>,<%=bmp.getBookCode()%>)" disabled="disabled">
								제출</button>
							<script type="text/javascript">
							var resizePopup = function(){$('#guide'+<%= i+1 %>).css('max-height', $(window).height());};
							$(window).resize(function(e){
							    resizePopup();
							});
							
							$(function($){
								 $("#guide-tooltip"+<%= i %>).popup({
									   popup : $("#guide"+<%= i %>),
								       on    : 'click',
								       position : "bottom center",
								       lastResort: "bottom center"
								    });
								  
								  $('#ui-tooltip-content'+<%= i %>).popup({
								    	popup : $("#guide"+<%= i+1 %>),
								        on: 'click',
								        position : "bottom center",
								        lastResort: "bottom center"
								    });
							});
							</script>
						</td>
					</tr>
					<tr style="background-color: #f5f5f5">
						<td width="50%" align="center">
						<div style="height: 570px; overflow: auto;" align="center">
							<img src="/sori/resources/book_pdf_images/<%=bmp.getBookCode()%>/<%=bmp.getBookCode()%>_<%=i%>.jpg"
								id="inputimg_<%=i%>" width="500px" style="padding: 0px;" />
						</div>
						</td>
						<td width="50%" align="center">
						<textarea id="<%=bmp.getBookCode()%>_<%= i %>" name="<%=bmp.getBookCode()%>_<%= i %>" cols="66" rows="6"
								  style="overflow:visible;width: 100%;height: 550px;font-size: 14px;">
						</textarea>
							<br> 
							페이지 번호 : <input type="number" required
							id="<%=i%>_pagenum" min="<%=i%>" max="<%= endPage %>" inputmode="numeric"
							pattern="[0-9]*" onkeyup="javascript:checkpage(<%=i%>)"> <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%-- <div class="ui checkbox" style="margin-top:10px;">
							<input type="checkbox" id="<%=i%>_pagenumcb"
							 onclick="javascript:checkpage(<%=i%>)">
							<label>페이지 번호 없음</label>
							</div> --%>
							</td>
					</tr>
				</table>
			</div>
			<script>
		CKEDITOR.replace('<%=bmp.getBookCode()%>_<%= i %>',
			{	height : 450,
				docType : '<!DOCTYPE HTML>'
			});
		
		 $(function($){
		//watermark
		  $('#inputimg_'+<%=i%>).watermark({
		  	text:'<%= loginMember.getUserName() %>' + '('+'<%= loginMember.getUserId() %>' + ')',
	 		textWidth: 600,
	 		textSize: 60,
	 		gravity:'w',
	 		textColor:'white',
	 		textBg:'rgba(0, 0, 0, 0.05)',
	 		opacity: 0.5
		});
		});
</script>
		</div>
		<%
			} else {
		%>
			<div class="table-responsive">
			<div class="ui bottom attached tab segment" id="yetabs-<%=i%>"
				data-tab="yetabs-<%=i%>">
				<table class="table">
					<tr style="background-color: #f5f5f5">
						<td width="60%" align="center">
							<button name="ci1_<%=bmp.getBookCode()%>"
								class="ui yellow icon button"
								onclick="javascript:changeImgSize(1,<%=i%>)">
								<i class="large zoom-in icon"></i>
							</button>
							<button name="ci2_<%=bmp.getBookCode()%>"
								class="ui yellow icon button"
								onclick="javascript:changeImgSize(2,<%=i%>)">
								<i class="large zoom-out icon"></i>
							</button>
						</td>
						<td width="40%" align="center">
							<div class="ui icon button" id="guide-tooltip<%= i %>" style="background-color: transparent !important;">
								<i class="yellow large info circle icon"></i>
							</div>
							<div class="ui custom popup transition hidden" id="guide<%= i %>"
								style="padding: 18px; margin-left: 945px; margin-top: 22px; font-size: 10pt; text-align: left; font-family: 'S-Core Dream 5'; white-space: nowrap;">
								<strong>1. </strong>가이드라인을 반드시 숙지하신 후 꼼꼼히 제작해주시기 바랍니다.<br /> 
								<strong>2. </strong>페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.<br /> 
								<strong>3. </strong>모든 페이지를 저장하신 후 마지막 페이지의 제출 버튼을 누르셔야 작업이 제출됩니다.
							</div>
							<div class="ui yellow button" id="ui-tooltip-content<%= i %>">
								<div class="ui custom popup transition hidden" id="guide<%= i+1 %>"
									style="padding: 24px; max-width: 500px; margin-top: 25px; margin-left: 945px;
									text-align: left; font-size: 11pt; font-family: 'S-Core Dream 5'; white-space: nowrap;">
									<strong>1-1.</strong> 오탈자를 확인해 주세요.<br /> 
									<strong>1-2.</strong> 정확한 띄어쓰기를 해 주세요.<br /> 
									<strong>1-3.</strong> 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.<br /> 
									<strong>1-4.</strong> 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.<br /> 
									<strong>2-1.</strong> 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.<br /> 
									<strong>2-2.</strong> 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.<br /> 
									<strong>2-3.</strong> 특수문자 편집도구를 통해 특수기호를 입력해 주세요.<br /> 
									<strong>2-4.</strong> 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.<br /> 
									<strong>2-5.</strong> 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.<br />
									<strong>3-1.</strong> 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.<br />
									<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br />
									<strong>4-2.</strong> 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.<br />
									<strong>4-3.</strong> 문단 시작 시 들여쓰기를 하지 마세요.<br /> 
									<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br /> 
									<strong>5-1.</strong> 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. 예)(주1), (주*) <br /> 
									<strong>5-2.</strong> 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1:, 주 *: 형식으로 입력해 주세요.<br />
									<strong>6-1.</strong> 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. <br /> 
									<strong>6-2.</strong> 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.<br /> 
									<strong>6-3.</strong> 페이지 넘버 입력칸에는 '탭메뉴' 페이지의 번호를 입력해 주세요.<br />
								</div>
								제작가이드라인
							</div> 
								<button id="txt_<%=i%>" class="ui yellow button"
								onclick="javascript:input(<%=i%>,<%= endPage %>,<%=bmp.getBookCode()%>)"
								disabled="disabled">저장</button>
								<button id="up_<%=i%>" class="ui yellow button"
								onclick="javascript:update(<%=i%>,<%= endPage %>,<%=bmp.getBookCode()%>)"
								disabled="disabled">수정</button>
								<button id="completebtn_<%=i%>" class="ui yellow button"
								onclick="javascript:complete(<%=i%>,<%= endPage %>,<%=bmp.getBookCode()%>)" disabled="disabled">
								제출</button>
							<script type="text/javascript">
							var resizePopup = function(){$('#guide'+<%= i+1 %>).css('max-height', $(window).height());};
							$(window).resize(function(e){
							    resizePopup();
							});
							
							$(function($){
								$("#guide-tooltip"+<%= i %>).popup({
									   popup : $("#guide"+<%= i %>),
								       on    : 'click',
								       position : "bottom center",
								       lastResort: "bottom center"
								    });
								  
								  $('#ui-tooltip-content'+<%= i %>).popup({
								    	popup : $("#guide"+<%= i+1 %>),
								        on: 'click',
								        position : "bottom center",
								        lastResort: "bottom center"
								    });
							});
							</script>
						</td>
					</tr>
					<tr style="background-color: #f5f5f5">
						<td width="50%" align="center">
						<div style="height: 570px; overflow: auto;" align="center">
							<img src="/sori/resources/book_pdf_images/<%=bmp.getBookCode()%>/<%=bmp.getBookCode()%>_<%=i%>.jpg"
								id="inputimg_<%=i%>" width="500px" style="padding: 0px;" />
						</div>
						</td>
						<td width="50%" align="center">
						<textarea id="<%=bmp.getBookCode()%>_<%= i %>" name="<%=bmp.getBookCode()%>_<%= i %>" cols="66" rows="6"
								  style="overflow:visible;width: 100%;height: 550px;font-size: 14px;">
						</textarea>
							<br> 
							페이지 번호 : <input type="number"
							id="<%=i%>_pagenum" min="<%=i%>" max="<%= endPage %>" inputmode="numeric"
							pattern="[0-9]*" onkeyup="javascript:checkpage(<%=i%>)"> <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%-- <div class="ui checkbox" style="margin-top:10px;">
							<input type="checkbox" id="<%=i%>_pagenumcb"
							 onclick="javascript:checkpage(<%=i%>)">
							<label>페이지 번호 없음</label>
							</div> --%>
							</td>
					</tr>
				</table>
			</div>
			<script>
		CKEDITOR.replace('<%=bmp.getBookCode()%>_<%= i %>',
			{	height : 450,
				docType : '<!DOCTYPE HTML>'
			});
		
		 $(function($){
		//watermark
	 $('#inputimg_'+<%=i%>).watermark({
		text:'<%= loginMember.getUserName() %>' + '('+'<%= loginMember.getUserId() %>' + ')',
 		textWidth: 600,
 		textSize: 60,
 		gravity:'w',
 		textColor:'white',
 		textBg:'rgba(0, 0, 0, 0.05)',
 		opacity: 0.5
		});
		});
</script>
	</div>
	<% } } %>
		<!-- <div class="makeclass-box" id="makeclass"
			style="display: none; z-index: 50000; position: absolute; height: 75%; width: 800px; top: 120px; right: 10px;">
			<iframe class="iframe-box" src="/fqa2"
				style="width: 100%; height: 100%;"></iframe>
		</div> -->
	</div>
	<!-- yecontent 끝 -->
	<!-- up -->
	<div id="up"
		style="margin-top: 10px; margin-right: 10px; font-size: 14px; font-weight: bold;"
		align="right">
		<a href="#" style="color: black;"><i
			class="big yellow chevron circle up icon"></i>위로가기</a>
	</div>
	<br><br><br>
</body>
</html>