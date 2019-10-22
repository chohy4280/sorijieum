<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, book.model.vo.BookMakingProgress, book.model.vo.Book"%>
<%
	BookMakingProgress bmp = (BookMakingProgress) request.getAttribute("bmp");
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
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
  if (checkUnload) 
    return "페이지에서 나간 후 재접속하지 않으면 도서제작에 패널티가 있을 수 있습니다.";
}; 

var timer=0;
$(function(){
	var qw = 0;
	var we = 10;
	var wr = 10;
	//초기값
	if(qw==wr){
		$("#completebtn").prop('disabled',false);
		$("#completebtn").css('background','#fbbd08');
		$("#completebtn").css('color','black');
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
				$.ajax({
			        url : "/checksession",
			        dataType : "text",
			        async: false,
					success : function(response) {
						if(response=="sout"){
							var url = "/login";
							$(location).attr('href',url);
						}
					},
					error : function(request, status, error) {
						if (request.status != '0') {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}
				}); 
				$.ajax({
					url : "/timelog",
					type : "POST",
					dataType : "text",
					async: false,
					success : function(response) {
					},
					error : function(request, status, error) {
						if (request.status != '0') {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}
				});
				$( "textarea" ).each(function() {
					var rdata={content: $( this ).val(), tpage: $(this).attr('id')};
					var data=JSON.stringify(rdata)
				    $.ajax({
						type : "POST",
				        url : "/timeout",
				        async: false,
				        dataType : "text",
						data : data,
						contentType: "application/json;charset=utf-8",
						success : function(response) {
						},
						error : function(request, status, error) {
							if (request.status != '0') {
								alert("시간이 다되어 메인페이지로 이동합니다.");
							}
						}
					});
				  });
				
				clearInterval(timer);  /* 타이머 종료 */ 
				checkUnload = false;
				alert("시간이 다되어 메인페이지로 이동합니다.")
					var url = "/";
					$(location).attr('href',url);
			} else {
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
	function changeImgSize(num,page) {
		var image = document.getElementById("inputimg_"+page+"")
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
	function changeImgTransform(num, page) {
		var angle=0;
		var el = document.getElementById("inputimg_"+page+"");
		  var st = window.getComputedStyle(el, null);
		  var tr = st.getPropertyValue("-webkit-transform") ||
		       st.getPropertyValue("-moz-transform") ||
		       st.getPropertyValue("-ms-transform") ||
		       st.getPropertyValue("-o-transform") ||
		       st.getPropertyValue("transform") ||
		       "fail...";

		  if( tr !== "none") {
		    var values = tr.split('(')[1];
		      	values = values.split(')')[0];
		      	values = values.split(',');
		    var a = values[0];
		    var b = values[1];
		    var c = values[2];
		    var d = values[3];
		    var scale = Math.sqrt(a*a + b*b);
		    var radians = Math.atan2(b, a);
		    var angle = Math.round( radians * (180/Math.PI));
		  } else {
		    angle = 0;
		  }
		if (num == 1) {
			angle=angle+90;
			if(angle==360){
				angle=0;
			}
			el.style.transform = "rotate("+angle+"deg)";
		} else if (num == 2) {
			angle=angle-90;
			if(angle==-360){
				angle=0;
			}
			el.style.transform = "rotate("+angle+"deg)";
		}else if ( num ==0){
			el.style.transform = "rotate(0deg)";
		}
	}

	function clickrepage(page){
		$.ajax({
			url : "/inputjason",
			type : "GET",
			data : 'reid=' + page + '',
			cache : false,
			async : false,
			dataType : "text",
			success : function(response) {
				 var redata = JSON.parse(response);
				if (!response) {
					alert("텍스트를 입력하고 저장을 눌러주세요 ");
				} 
				CKEDITOR.instances[''+page+''].setData(redata.inputContent);
				if(redata.pageText==null||redata.pageText==""){
					$("#"+page+"_pagenum").val("");
					$("#"+page+"_pagenumcb").prop( "checked", true );
					 $("#"+page+"_pagenum").css('background','#6c6c6c');
					 $("#"+page+"_pagenum").attr('disabled',true);
				}else{
					$("#"+page+"_pagenum").val(redata.pageText);
					$("#"+page+"_pagenumcb").attr('disabled',true);
					$("#"+page+"_pagenum").css('background','white');
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("텍스트를 먼저 저장해주세요 ");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}
		});
	}
	function checkpage(page){
		var pagenum=$('#'+page+'_pagenum').val();
		var pageck=$('#'+page+'_pagenumcb').val();

		if(pagenum!=""&& $('#'+page+'_pagenumcb').is(":checked")==false){
			$("#txt4_"+page).attr('disabled',false);
			$("#txt4_"+page).css('background','#fbbd08');
			$("#txt4_"+page).css('color','white');
			$("#"+page+"_pagenumcb").css('background','#6c6c6c');
		}else if(pagenum!=""&& $('#'+page+'_pagenumcb').is(":checked")==true){
			$("#txt4_"+page).attr('disabled',true);
			$("#txt4_"+page).css('background','#fbbd08');
			$("#"+page+"_pagenum").val("");
			$("#"+page+"_pagenum").attr('disabled',true);
			$("#"+page+"_pagenum").css('background','#6c6c6c');

		}else if(pagenum==""&& $('#'+page+'_pagenumcb').is(":checked")==false){
			$("#txt4_"+page).attr('disabled',true);
			$("#txt4_"+page).css('background','#fbbd08');
			$("#txt4_"+page).css('color','#c3c3c3');
			$("#"+page+"_pagenum").attr('disabled',false);
			$("#"+page+"_pagenum").css('background','white');
			$("#"+page+"_pagenumcb").attr('disabled',false);
			$("#"+page+"_pagenumcb").css('background','transparent');

		}else if(pagenum==""&& $('#'+page+'_pagenumcb').is(":checked")==true){
			$("#txt4_"+page).attr('disabled',false);
			$("#txt4_"+page).css('background','#fbbd08');
			$("#txt4_"+page).css('color','white');
			$("#"+page+"_pagenum").attr('disabled',true);
			$("#"+page+"_pagenum").css('background','#6c6c6c');
		}
	}
	function complete(num){
		var result = confirm("제출을 완료하시겠습니까? 제출하시면 수정할 수 없습니다."); 
		if(result == true){ 
		var rdata={unum: num};
		var data=JSON.stringify(rdata)
		$.ajax({
			type : "POST",
	        url : "/complete",
	        dataType : "text",
	        async: false,
			data : data,
			contentType: "application/json;charset=utf-8",
			success : function(response) {
				clearInterval(timer);
				checkUnload = false;
				if(result) { 
					location.replace('/user/actre'); 
				} else { 
					
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}
		});
		}
		else if(result == false){
		}
	}
	
	function input(page,allowpage,num){
		 $.ajax({
	        url : "/checksession",
	        dataType : "text",
	        async: false,

			success : function(response) {

				if(response=="sout"){
					var url = "/login";
					$(location).attr('href',url);
					alert(checkcom);
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}

		}); 
 
		var input=CKEDITOR.instances[''+page+''].getData();
		var pagenum=$('#'+page+'_pagenum').val();
		var pageck=$('#'+page+'_pagenumcb').val();
		var rdata={content: input, tpage: page,unum: num,pagenum: pagenum};
		var data=JSON.stringify(rdata)
		var checkcom;
		$.ajax({
				type : "POST",
		        url : "/inputinsert",
		        dataType : "text",
		        async: false,
				data : data,
				contentType: "application/json;charset=utf-8",
				success : function(response) {
					checkcom=response;
					//alert(checkcom);
					$("#txt3_"+page).attr('disabled',false);
					$("#txt3_"+page).css('color','black');
					$("#ui-icon-"+page+"").css('display','inline-block');
				},
				error : function(request, status, error) {
					if (request.status != '0') {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}
			});
		 if(checkcom==allowpage){
			$("#completebtn").attr('disabled',false);
			$("#completebtn").css('background','#e58011');
			$("#completebtn").css('color','black');
		 }
	}
	
	var resizePopup = function(){$('#guide2').css('max-height', $(window).height());};
	$(window).resize(function(e){
	    resizePopup();
	});
	
	$(function($){
	  $("#guide1").popup({
	       on    : 'hover',
	       position : "bottom center"
	    });
	  
	  $('#ui-tooltip-content').popup({
	    	popup : $("#guide2"),
	        on: 'click',
	        position : "bottom right",
	        lastResort: "bottom right"
	    });

	  $("#yetabs .item").on("click", function(){
		  $("#yetabs .item").removeClass('active');
		  $(this).addClass("active");
		  var tab = $(this).attr("data-tab");
		  $(".tab.segment").removeClass("active");
		  $(".tab.segment[data-tab=\"" + tab + "\"]").addClass("active");
	  });
	  
	});
</script>
</head>
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0"
	marginwidth="0" marginheight="0" oncontextmenu="return true"
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
		<div style="float: right; font-size: 24px; margin-right: 25px; margin-top: -10px;">
			<div style="float: left; margin-top: 3px;">
				<i class="hourglass half icon"></i>
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
			<div style="float: left; width: 60px; height: 35px;">
				<font id="second" style="vertical-align: middle;"></font><font
					style="vertical-align: middle; font-family: 'S-Core Dream 6';">초</font>
			</div>
			&nbsp;
			<button id="completebtn" class="ui yellow button"
				onclick="javascript:complete(12407)" disabled="disabled">
				제출</button>
		</div>
		<!-- timer end -->

		<!-- 쪽수 탭버튼 시작 -->
		<div id="yetabs">
			<div class="ui big tabular menu">
				<% int endPage = (bmp.getBookPage() / (bmp.getBookPage() / 10));
					for(int i = currentPage; i <= endPage; i++) {
						if (i == currentPage) {
				%>
				<a class="active yellow item" data-tab="yetabs-<%=i%>"><%=i%></a>
				<% } else { %>
				<a class="yellow item" data-tab="yetabs-<%=i%>"><%=i%></a>
				<% } } %>
			</div>
		</div>
		<%
			for (int i = currentPage; i <= endPage; i++) {
				if (i == currentPage) {
		%>
		<div class="table-responsive">
			<div class="ui bottom attached tab segment active" id="yetabs-<%=i%>"
				data-tab="yetabs-<%=i%>">
				<table class="table">
					<tr style="background-color: #f5f5f5">
						<td width="60%" align="center">
							<button name="if2_<%=bmp.getBookCode()%>"
								class="ui yellow icon button"
								onclick="javascript:changeImgSize(2,<%=bmp.getBookCode()%>)">
								<i class="large zoom-out icon"></i>
							</button>
							<button name="if1_<%=bmp.getBookCode()%>"
								class="ui yellow icon button"
								onclick="javascript:changeImgSize(1,<%=bmp.getBookCode()%>)">
								<i class="large zoom-in icon"></i>
							</button>
						</td>
						<td width="40%" align="center">
							<button id="txt3_<%=bmp.getBookCode()%>" class="ui yellow button"
								onclick="javascript:clickrepage(<%=bmp.getBookCode()%>)">
								되돌리기</button>

							<button id="txt4_<%=bmp.getBookCode()%>" class="ui yellow button"
								onclick="javascript:input(<%=bmp.getBookCode()%>,10,12407)"
								disabled="disabled">저장</button>
							<div class="ui icon button" id="guide1">
								<i class="yellow large info circle icon"></i>
							</div>
							<div class="ui custom popup transition hidden"
								style="padding: 18px; margin-left: 847px; margin-top: 22px; font-size: 10pt; text-align: left; font-family: 'S-Core Dream 5'; white-space: nowrap;">
								<strong>1.</strong> 가이드라인을 반드시 숙지하신 후 꼼꼼히 제작해주시기 바랍니다.<br /> <strong>2.</strong>
								페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.<br /> <strong>3.</strong> 모든
								페이지를 저장하신 후 제출 버튼을 누르셔야 작업이 완료됩니다.
							</div>
							<div class="ui yellow button" id="ui-tooltip-content">
								<div class="ui custom popup transition hidden" id="guide2"
									style="padding: 24px; max-width: 500px; margin-top: 25px; margin-right: -740px; text-align: left; font-size: 11pt; font-family: 'S-Core Dream 5'; white-space: nowrap;">
									<strong>1-1.</strong> 오탈자를 확인해 주세요.<br /> <strong>1-2.</strong>
									정확한 띄어쓰기를 해 주세요.<br /> <strong>1-3.</strong> 한자, 영어만 입력하고 나머지
									외국어는 생략해 주세요.<br /> <strong>1-4.</strong> 로마 숫자, 라틴 문자(불어, 독어
									등), 그리스 문자는 편집도구를 통해 입력해 주세요.<br /> <strong>2-1.</strong> 표
									편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.<br /> <strong>2-2.</strong> 이미지
									편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.<br /> <strong>2-3.</strong>
									특수문자 편집도구를 통해 특수기호를 입력해 주세요.<br /> <strong>2-4.</strong> 쉼표와
									소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.<br /> <strong>2-5.</strong>
									사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.<br />
									<strong>3-1.</strong> 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.<br />
									<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br />
									<strong>4-2.</strong> 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.<br />
									<strong>4-3.</strong> 문단 시작 시 들여쓰기를 하지 마세요.<br /> <strong>4-1.</strong>
									빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br /> <strong>5-1.</strong>
									주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. 예)(주1), (주*) <br /> <strong>5-2.</strong>
									주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1:, 주 *: 형식으로 입력해 주세요.<br />
									<strong>6-1.</strong> 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을
									삭제해 주세요. <br /> <strong>6-2.</strong> 페이지 번호가 2개 있는 경우에는, 뒤에
									있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.<br /> <strong>6-3.</strong>
									페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요.<br />
								</div>
								제작가이드라인
							</div> 
							<script>
							$('#makeclassid_' + <%=bmp.getBookCode()%>).click(function(e) {
								var x = document.getElementById("makeclass");
								if (x.style.display === "none") {
									x.style.display = "block";
								} else {
									x.style.display = "none";
								}});
							</script>
						</td>
					</tr>
					<tr style="background-color: #f5f5f5">
						<td width="50%" align="center">
						<div style="height: 550px; overflow: auto;" align="center">
							<img src="/sori/resources/book_pdf_images/<%=bmp.getBookCode()%>/<%=bmp.getBookCode()%>_<%=i%>.jpg"
								id="inputimg_<%=bmp.getBookCode()%>" width="500px" style="padding: 0px;" />
						</div>
						</td>
						<td width="50%" align="center">
						<textarea id="<%=bmp.getBookCode()%>" name="<%=bmp.getBookCode()%>" cols="55" rows="5"
								  style="overflow:visible;width: 100%;height: 500px;font-size: 14px;">
						</textarea>
							<div class="window">
								<ul class="image-list" id="image-list_<%=bmp.getBookCode()%>"
									style="margin-top: 0px; position: relative;">
								</ul>
							</div> 
							페이지 번호 : <input type="number"
							id="<%=bmp.getBookCode()%>_pagenum" min="0" inputmode="numeric"
							pattern="[0-9]*" onkeyup="javascript:checkpage(<%=bmp.getBookCode()%>)"> <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="ui checkbox" style="margin-top:10px;">
							<input type="checkbox" id="<%=bmp.getBookCode()%>_pagenumcb"
							 onclick="javascript:checkpage(<%=bmp.getBookCode()%>)">
							<label>페이지 번호 없음</label>
							</div>
							</td>
					</tr>
				</table>
			</div>
			<script>
			function noIdTagReset<%=bmp.getBookCode()%>() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + <%=bmp.getBookCode()%> + ''].getData();
			var Htag = tagmake.getElementsByClassName("search_idx");
			for (var i = 0; i < Htag.length; i++) {
				if (Htag[i].getAttribute("id") == null) {
					var e = Htag[i];
					var d = document.createElement('p');
					var htmldata = e.innerHTML;
					if (htmldata.value == '') {
						d.innerHTML = e.innerHTML + '&nbsp;';
					} else {
						d.innerHTML = e.innerHTML;
					}
					CKEDITOR.instances['' + <%=bmp.getBookCode()%> + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + <%=bmp.getBookCode()%> + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + <%=bmp.getBookCode()%> + '']
							.fire('unlockSnapshot');
				}
			}
		};
		
		CKEDITOR.replace('<%=bmp.getBookCode()%>',
			{	height : 450,
				docType : '<!DOCTYPE HTML>'
			});
							
</script>
		</div>
		<%
			} else {
		%>

		<% } } %>
		<div class="makeclass-box" id="makeclass"
			style="display: none; z-index: 50000; position: absolute; height: 75%; width: 800px; top: 120px; right: 10px;">
			<iframe class="iframe-box" src="/fqa2"
				style="width: 100%; height: 100%;"></iframe>
		</div>
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