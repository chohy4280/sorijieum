<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<META http-equiv="Expires" content="-1">
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>도서제작</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="crossorigin="anonymous"></script>
<!-- 에디터 cdn 링크 -->
<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
<%@ include file="/../inc/top.jsp"%>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">
var checkUnload = true;
window.onbeforeunload = confirmExit; 
function confirmExit() {
  if (checkUnload) 
    return "페이지에서 나간 후 재접속하지 않으면 아이디는 정지상태로 변경됩니다.";
}; 

var timer=0;
$(document).ready(function(){
	var qw = 0;
	var we =10;
	var wr =10;
	//초기값
	if(qw==wr){
		$("#completebtn").prop('disabled',false);
		$("#completebtn").css('background','#e58011');
		$("#completebtn").css('color','black');
	}
	/* if( =='y'){
		$("#ui-icon").css('display','block');
	} */
	var hour = 4;
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
								/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
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
	function changeImgTransform(num,page) {
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

		  // works!
		  //console.log('Rotate: ' + angle + 'deg');
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
	function changeTextSize(num,page){
	     //본문 영역을 변수에 담기
	     var $contents = $('#'+page+''); //alert($contents);
	     //본문 영역의 폰트 사이즈 가져오기
	      var fontSize = $contents.css('fontSize'); //alert(fontSize);
	     //폰트사이즈의 숫자만 가져오기
	     var cnum = parseFloat(fontSize, 10); //alert(num);
	     //단위만 가져오기
	     var unit = fontSize.slice(-2); //alert(unit); // px 오른쪽에서 2자 가져옴

	      if(num == 1) {
	    	  if (cnum>50) {
		    		return; 
		    	  }
	       			cnum = parseInt(cnum * 1.5);
	      		
	      }
	      else if(num == 2) {
	    	  if (cnum<4) {
		    	return;	 
	    	  }  
	    	  cnum = parseInt(cnum * 0.5);
	      }

	     $contents.css('fontSize', cnum + unit);
	    }
	function ocrtext(page){
		//alert("접속");
		$.ajax({
			url : "/ocrinput",
			type : "GET",
			data : 'reid=' + page + '',
			cache : false,
			async : false,
			dataType : "text",
			success : function(response) {
				
				var inputVal = response;
				if (response == "") {
					alert("기본텍스트가 없습니다. ");
				} else if (response != null) {
					$("#"+page+"").val(inputVal);
				
					var text=document.getElementById(page).value;
					  var newText = "";
					
		              if (!text.match("<p>")) {   
			               var textArray = text.split('\n');

			               
			               for (var i=0; i<textArray.length; i++) {
			                textArray[i] = "<p>" + textArray[i] + "</p>";
			                newText += textArray[i];
			               }
			              }
			            
			              if(!newText==null||!newText==""){
			              CKEDITOR.instances[''+page+''].setData(newText);//에디터 내용 호출시 br태그 삽입 
			              }
					
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("텍스트를 저장 먼저 해주세요 ");
				}
			}

		});
	}
	function rplLine(value){
	    if (value != null && value != "") { 
	        return value.replace(/\n/g, "\\n");
	    }else{
	        return value;
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
				/* $("#"+page+"").val(redata.inputContent); */
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
					alert("텍스트를 저장 먼저 해주세요 ");
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
			$("#txt4_"+page).css('background','#e58011');
			$("#txt4_"+page).css('color','black');
			$("#"+page+"_pagenumcb").css('background','#6c6c6c');
		}else if(pagenum!=""&& $('#'+page+'_pagenumcb').is(":checked")==true){
			$("#txt4_"+page).attr('disabled',true);
			$("#txt4_"+page).css('background','#e58011');
			$("#"+page+"_pagenum").val("");
			$("#"+page+"_pagenum").attr('disabled',true);
			$("#"+page+"_pagenum").css('background','#6c6c6c');

		}else if(pagenum==""&& $('#'+page+'_pagenumcb').is(":checked")==false){
			$("#txt4_"+page).attr('disabled',true);
			$("#txt4_"+page).css('background','#e6e6e6');
			$("#txt4_"+page).css('color','#c3c3c3');
			$("#"+page+"_pagenum").attr('disabled',false);
			$("#"+page+"_pagenum").css('background','white');
			$("#"+page+"_pagenumcb").attr('disabled',false);
			$("#"+page+"_pagenumcb").css('background','transparent');

		}else if(pagenum==""&& $('#'+page+'_pagenumcb').is(":checked")==true){
			$("#txt4_"+page).attr('disabled',false);
			$("#txt4_"+page).css('background','#e58011');
			$("#txt4_"+page).css('color','black');
			$("#"+page+"_pagenum").attr('disabled',true);
			$("#"+page+"_pagenum").css('background','#6c6c6c');
		}
	}
	function complete(num){
		var result = confirm("제출을 완료 하시겠습니까? 제출하시면 수정할수 없습니다."); 
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

		  $('.item').on('click', function() {
		      $('.item').removeClass('active');
		      $(this).addClass('active');
		   });  
		  
	});
		

</script>
</head>
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0"
	marginwidth="0" marginheight="0" oncontextmenu="return true" onselectstart="return true" ondragstart="return true">

<!-- bookmaking -->
	<div class="ye-bookstatus">
		<div class="ye-bookstatus-title">
			<h2 style="font-family: 'S-Core Dream 6';">
				<i class="keyboard icon"></i> 도서제작
			</h2>
		</div><!-- bookstatus_title -->
	</div><br><br><br><!-- bookstatus끝 -->
	<!-- content 시작 -->
	<div id="yecontent">	
	<!-- timer -->
	<div style="float: right; font-size: 24px; margin-right:25px; margin-top:-10px;">
		<div style="float: left;margin-top:3px;">
		<i class="hourglass half icon"></i>
		</div>
		<div style="float: left; height: 35px; width: 190px">
			<font style="vertical-align: middle;font-family:'S-Core Dream 7';">제작시간 :</font> <font id="hour"
				style="vertical-align: middle;"></font><font
				style="vertical-align: middle;font-family:'S-Core Dream 5';">시간&nbsp;</font>
		</div>
		<div style="float: left; width: 70px; height: 35px;">
			<font id="min" style="vertical-align: middle;"></font><font
				style="vertical-align: middle;font-family:'S-Core Dream 5';">분</font>
		</div>
		<div style="float: left; width: 60px; height: 35px;">
			<font id="second" style="vertical-align: middle;"></font><font
				style="vertical-align: middle;font-family:'S-Core Dream 5';">초</font>
		</div>&nbsp;
		<button id="completebtn" class="ui yellow button"
			onclick="javascript:complete(12407)" disabled="disabled">
			제출
		</button>
	</div><!-- timer end -->
	<!-- 쪽수 탭버튼 시작 -->
	<div id="yetabs" >	
	<div class="ui big tabular menu">
	  <a class="active yellow item" data-tab="yetabs-1">1</a>
	  <a class="yellow item" data-tab="yetabs-2">2</a>
	  <a class="yellow item" data-tab="yetabs-3">3</a>
	  <a class="yellow item" data-tab="yetabs-4">4</a>
	  <a class="yellow item" data-tab="yetabs-5">5</a>
	  <a class="yellow item" data-tab="yetabs-6">6</a>
	  <a class="yellow item" data-tab="yetabs-7">7</a>
	  <a class="yellow item" data-tab="yetabs-8">8</a>
	  <a class="yellow item" data-tab="yetabs-9">9</a>
	  <a class="yellow item" data-tab="yetabs-10">10</a>
	</div>
</div>
<div class="table-responsive">
	<div class="ui bottom attached tab segment active" id="yetabs-1" data-tab="yetabs-1">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189710"
						class="ui yellow icon button"
						onclick="javascript:changeImgSize(2,1189710)">
						<i class="large zoom-out icon"></i>
					</button>
					<button name="if1_1189710"
						class="ui yellow icon button"
						onclick="javascript:changeImgSize(1,1189710)">
						<i class="large zoom-in icon"></i>
					</button>
				</td>
				<td width="40%" align="center">
					<button id="txt5_1189710" class="ui yellow button"
						onclick="javascript:ocrtext(1189710)">
						본문초기화
					</button>
					<button id="txt3_1189710" class="ui yellow button"
						onclick="javascript:clickrepage(1189710)">
						되돌리기
					</button>

					<button id="txt4_1189710" class="ui yellow button"
						onclick="javascript:input(1189710,10,12407)" disabled="disabled">
						저장
					</button>
			<div class="ui icon button" id="guide1">
				<i class="yellow large info circle icon"></i>
				</div>
				<div class="ui custom popup transition hidden"
				style="padding:18px;margin-left:739px;margin-top:22px;font-size:10pt;text-align:left;
				font-family:'S-Core Dream 5';white-space:nowrap;"> 
				<strong>1.</strong> 가이드라인을 반드시 숙지하신 후 꼼꼼히 제작해주시기 바랍니다.<br/>
				<strong>2.</strong> 페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.<br/>
				<strong>3.</strong> 모든 페이지를 저장하신 후 제출 버튼을 누르셔야 작업이 완료됩니다.
				</div>
			<div class="ui yellow button" id="ui-tooltip-content">
			<div class="ui custom popup transition hidden" id="guide2"
			style="padding:24px;max-width:500px;margin-top:25px;margin-right:-740px;
			text-align:left;font-size:11pt;font-family:'S-Core Dream 5';white-space:nowrap;">
				<strong>1-1.</strong> 오탈자를 확인해 주세요.<br/>
				<strong>1-2.</strong> 정확한 띄어쓰기를 해 주세요.<br/>
				<strong>1-3.</strong> 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.<br/>
				<strong>1-4.</strong> 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.<br/>
				<strong>2-1.</strong> 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.<br/>
				<strong>2-2.</strong> 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.<br/>
				<strong>2-3.</strong> 특수문자 편집도구를 통해 특수기호를 입력해 주세요.<br/>
				<strong>2-4.</strong> 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.<br/>
				<strong>2-5.</strong> 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.<br/>
				<strong>3-1.</strong> 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.<br/>
				<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br/>
				<strong>4-2.</strong> 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.<br/>
				<strong>4-3.</strong> 문단 시작 시 들여쓰기를 하지 마세요.<br/>
				<strong>4-1.</strong> 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.<br/>
				<strong>5-1.</strong> 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. 예)(주1), (주*) <br/>
				<strong>5-2.</strong> 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1:, 주 *: 형식으로 입력해 주세요.<br/>
				<strong>6-1.</strong> 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. <br/>
				<strong>6-2.</strong> 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.<br/>
				<strong>6-3.</strong> 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요.<br/></div>제작가이드라인</div> 
			<script>
				$('#makeclassid_' + 1189710).click(function(e) {
					var x = document.getElementById("makeclass");
					if (x.style.display === "none") {
						x.style.display = "block";
					} else {
						x.style.display = "none";
					}
					</script>
				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">
					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">
						<img src="/sori/views/bookmaking/images/보건교사안은영표지.jpg" id="inputimg_1189710"
							width=" 495px" style="padding: 0px;" alt="" />
					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189710"
						name="1189710" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						보건교사 안은영
						오늘의 젊은 작가
						정세랑 장편소설
						</textarea>
					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->
					<div class="window">
						<ul class="image-list" id="image-list_1189710"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189710_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189710)"> <br> <input
					type="checkbox" id="1189710_pagenumcb" value=""
					onclick="javascript:checkpage(1189710)"> 페이지 번호 없음</td>
			</tr>
		</table>
	</div>
	<script>
		function noIdTagReset1189710() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189710 + ''].getData();

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
					CKEDITOR.instances['' + 1189710 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189710 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189710 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		CKEDITOR.replace(
						'1189710',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189710',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189710").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189710 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189710")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189710 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189710();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189710")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189710")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189710 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189710();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189710&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>
	
	<div class="ui bottom attached tab segment" id="yetabs-2" data-tab="yetabs-2">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189711"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189711)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189711"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189711)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189711" class="ui yellow button"
						onclick="javascript:ocrtext(1189711)">
						본문초기화
					</button>
					<button id="txt3_1189711" class="ui yellow button"
						onclick="javascript:clickrepage(1189711)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189711" class="ui yellow button"
						onclick="javascript:input(1189711,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
			 <script>
						$('#makeclassid_' + 1189711).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영2.jpg" id="inputimg_1189711"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189711"
						name="1189711" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						표지 그림: 정수진
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189711"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189711_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189711)"> <br> <input
					type="checkbox" id="1189711_pagenumcb" value=""
					onclick="javascript:checkpage(1189711)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189711() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189711 + ''].getData();

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
					CKEDITOR.instances['' + 1189711 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189711 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189711 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189711',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189711',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189711").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189711 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189711")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189711 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189711();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189711")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189711")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189711 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189711();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189711&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" data-tab="yetabs-3" id="yetabs-3">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189712"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189712)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189712"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189712)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189712" class="ui yellow button"
						onclick="javascript:ocrtext(1189712)">
						본문초기화
					</button>
					<button id="txt3_1189712" class="ui yellow button"
						onclick="javascript:clickrepage(1189712)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189712" class="ui yellow button"
						onclick="javascript:input(1189712,10,12407)" disabled="disabled">
						저장
					</button>
			<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					<script>
						$('#makeclassid_' + 1189712).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영3.jpg" id="inputimg_1189712"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189712"
						name="1189712" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						보건교사 안은영
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189712"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189712_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189712)"> <br> <input
					type="checkbox" id="1189712_pagenumcb" value=""
					onclick="javascript:checkpage(1189712)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189712() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189712 + ''].getData();

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
					CKEDITOR.instances['' + 1189712 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189712 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189712 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189712',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189712',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189712").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189712 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189712")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189712 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189712();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189712")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189712")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189712 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189712();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189712&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" data-tab="yetabs-4" id="yetabs-4">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189713"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189713)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189713"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189713)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189713" class="ui yellow button"
						onclick="javascript:ocrtext(1189713)">
						본문초기화
					</button>
					<button id="txt3_1189713" class="ui yellow button"
						onclick="javascript:clickrepage(1189713)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189713" class="ui yellow button"
						onclick="javascript:input(1189713,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					<script>
						$('#makeclassid_' + 1189713).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영4.jpg" id="inputimg_1189713"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189713"
						name="1189713" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						보건교사 안은영
						오늘의 젊은작가 09
						정세랑 장편소설
						민음사
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189713"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189713_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189713)"> <br> <input
					type="checkbox" id="1189713_pagenumcb" value=""
					onclick="javascript:checkpage(1189713)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189713() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189713 + ''].getData();

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
					CKEDITOR.instances['' + 1189713 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189713 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189713 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189713',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189713',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189713").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189713 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189713")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189713 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189713();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189713")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189713")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189713 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189713();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189713&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" data-tab="yetabs-5" id="yetabs-5">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189714"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189714)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189714"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189714)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189714" class="ui yellow button"
						onclick="javascript:ocrtext(1189714)">
						본문초기화
					</button>
					<button id="txt3_1189714" class="ui yellow button"
						onclick="javascript:clickrepage(1189714)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189714" class="ui yellow button"
						onclick="javascript:input(1189714,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					<script>
						$('#makeclassid_' + 1189714).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영5.jpg" id="inputimg_1189714"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189714"
						name="1189714" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						사랑해 젤리피시
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189714"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189714_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189714)"> <br> <input
					type="checkbox" id="1189714_pagenumcb" value=""
					onclick="javascript:checkpage(1189714)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189714() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189714 + ''].getData();

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
					CKEDITOR.instances['' + 1189714 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189714 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189714 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189714',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189714',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189714").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189714 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189714")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189714 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189714();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189714")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189714")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189714 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189714();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189714&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" data-tab="yetabs-6" id="yetabs-6">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189715"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189715)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189715"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189715)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189715" class="ui yellow button"
						onclick="javascript:ocrtext(1189715)">
						본문초기화
					</button>
					<button id="txt3_1189715" class="ui yellow button"
						onclick="javascript:clickrepage(1189715)" disabled="disabled">
						되돌리기
					</button>
					<button id="txt4_1189715" class="ui yellow button"
						onclick="javascript:input(1189715,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					 <script>
						$('#makeclassid_' + 1189715).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영6.jpg" id="inputimg_1189715"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189715"
						name="1189715" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						장마철의 보충수업기간,학교에 들어서는 순간 신발장 냄새가 진했다. 짧은 방학은 무더위 속에 지나가버렸고 보충이 시작되자 모두 우울한 얼굴이었지만 사복이 허용되었으므로 옷 입는 재미로 버티고들 있었다. 그러나 승권은 그마저도 전혀 흥미가 없는 편이었다. 연하늘색 핀 스트라이프 반셔츠에 면바지가 승권의 최선이었고,승권이 관심을 가지는 대상은 오직 하나였다.
						 혜현. 
						초등학교, 중학교, 고등학교를 함께 진학해왔다. 무슨 생각을 하는지 머릿속이 투명하게 보인다고 해서 별명이 해파리인 여자애였다. 그나마 좀 귀여운 어감인 젤리피시
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189715"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189715_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189715)"> <br> <input
					type="checkbox" id="1189715_pagenumcb" value=""
					onclick="javascript:checkpage(1189715)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189715() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189715 + ''].getData();

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
					CKEDITOR.instances['' + 1189715 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189715 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189715 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189715',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189715',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189715").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189715 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189715")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189715 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189715();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189715")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189715")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189715 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189715();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189715&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" id="yetabs-7" data-tab="yetabs-7">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189716"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189716)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189716"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189716)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189716" class="ui yellow button"
						onclick="javascript:ocrtext(1189716)">
						본문초기화
					</button>
					<button id="txt3_1189716" class="ui yellow button"
						onclick="javascript:clickrepage(1189716)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189716" class="ui yellow button"
						onclick="javascript:input(1189716,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div>  
					<script>
						$('#makeclassid_' + 1189716).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영7.jpg" id="inputimg_1189716"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189716"
						name="1189716" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						로 불려서 다행이지, 해파리 같은 여자애를 좋아하는 나는 뭐가되는건가. 승권은 늘 머리가 아팠다. 이 단순하고 모난 데 없는 사랑스러운 생물은, 불행히도 다른 사람한테서도 가장 좋은 부분만을 발견하는 나머지 누가 고백만 해오면 족족 다 사귀어왔다. 승권은 언제나 생각을 너무 많이 하다가 타이밍을 놓쳤다. 벌써 2학년 1학기가 지나 버렸고 더 이상은 기다릴 수 없다고 마음먹자, 갑자기 웬 농구부 주장이 오늘 혜현에게 고백을 하겠다고 공공연히 떠들고 다녔다. 혜현이라면 그놈한테서도가장긍정적이고 빛나는 어떤 부분을 찾아낼게 뻔했다.
						너한테 필요한건 키만 크고 얼굴이 여드름 밭인 농구부 주장이 아니야. 매일 아침 눈빛만 봐도 네가 매점의 서른여섯가지 간식들 중 뭘 먹고 싶어하는지 아는 나라고. 승권은 농구부 주장보다 먼저 혜현을 찾아야했다. 농구부 애들이 저 질퍽한 운동장에 하트 모양으로 꽂을 초들을 가지고 왔다고 했다. 비나 와라. 비나 와버려라.
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189716"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189716_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189716)"> <br> <input
					type="checkbox" id="1189716_pagenumcb" value=""
					onclick="javascript:checkpage(1189716)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189716() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189716 + ''].getData();

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
					CKEDITOR.instances['' + 1189716 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189716 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189716 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189716',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189716',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189716").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189716 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189716")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189716 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189716();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189716")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189716")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189716 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189716();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189716&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" data-tab="yetabs-8" id="yetabs-8">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189717"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189717)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189717"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189717)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189717" class="ui yellow button"
						onclick="javascript:ocrtext(1189717)">
						본문초기화
					</button>
					<button id="txt3_1189717" class="ui yellow button"
						onclick="javascript:clickrepage(1189717)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189717" class="ui yellow button"
						onclick="javascript:input(1189717,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					 <script>
						$('#makeclassid_' + 1189717).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영8.jpg" id="inputimg_1189717"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189717"
						name="1189717" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						1교시가 끝나자마자 과학실로 향했다. 분명히 과학실에 있을 것이다. 더위를 많이 타는 혜현은 과학실 돌바닥의 냉기를 좋아해서 먼지 나는 암막 커튼 아래에 늘어져있는 습관이 있었다. 승권은 그 구석을 해파리 여름 서식지라고 이름붙여놓았다.
						"조승권, 어디가? 너 오늘 지각했지?"
						담임인 한문이 불러세웠지만 승권은 못들은 척 걸음을 빨리했다. 다리를 저는 사람한테는 미안한 일이지만, 지금은 멈출 수가 없다.
						"성혜현."
						과학실 문을 열며 혜현을 불렀다. 어째서 성까지 붙여서 이렇게 딱딱하게밖에 부르지 못하는가. 혜현은 없었다. 벌써 늦었나. 10대 소년이 느끼기엔 다소 짙은 절망, 그 절망의 단내가 입안에 돌았다.
						그때 뭔가 날카로운 것이, 따끔, 목 뒤에 박혔다.
						</textarea>









					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189717"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189717_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189717)"> <br> <input
					type="checkbox" id="1189717_pagenumcb" value=""
					onclick="javascript:checkpage(1189717)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<!-- http://alik.info/p/155 -->









	<!--  -->



	<script>
		function noIdTagReset1189717() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189717 + ''].getData();

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
					CKEDITOR.instances['' + 1189717 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189717 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189717 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189717',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189717',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189717").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189717 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189717")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189717 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189717();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189717")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189717")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189717 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189717();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189717&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>


	<div class="ui bottom attached tab segment" id="yetabs-9" data-tab="yetabs-9">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189718"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189718)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189718"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189718)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189718" class="ui yellow button"
						onclick="javascript:ocrtext(1189718)">
						본문초기화
					</button>
					<button id="txt3_1189718" class="ui yellow button"
						onclick="javascript:clickrepage(1189718)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189718" class="ui yellow button"
						onclick="javascript:input(1189718,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					 <script>
						$('#makeclassid_' + 1189718).click(function(e) {

							var x = document.getElementById("makeclass");

							if (x.style.display === "none") {

								x.style.display = "block";
							} else {
								x.style.display = "none";
							}

						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">

					<div
						style="width: 100%; height: 565px; overflow: auto; align: center">


						<img src="/sori/views/bookmaking/images/보건교사안은영9.jpg" id="inputimg_1189718"
							width=" 495px" style="padding: 0px;" alt="" />


					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189718"
						name="1189718" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						보건교사가 핀셋을 들고 정체불명의 가시 같은 것을 빼냈다.
						"뭐예요?"
						이럴 시간이 없는데, 승권은 마음이 급했다. 목을 감싸쥐고 보건실로 오는 길에 농구부 1학년 애가 기타를 들고가는 것을 보았기 때문이다. 보건교사는 승권의 목 뒤에서 빼낸 것을 유심히 확인하며 입술을 약간 움직였는데, 승권에겐 언뜻 욕설처럼 읽혔다. 잘못본거겠지.
						"상처 자체가 큰 건 아니지만, 독성이 있을지 몰라. 벌써 주변부 색깔이 다른 게 염증이 생길 것 같아. 조퇴해서 병원에 가는 게 낫겠다. 몇 반?"
						"2학년 1반이요."
						"내가 너희 담임 선생님께 말씀드릴게."
						"아뇨. 이따가 제가 허락받을게요. 혹시 허락 안 해 주시면 확인증 받으러 올게요."
						승권은 총알같이 보건실에서 튀어 나갔다. 뒤에서 보건
						</textarea>

 <script src="/resources/ckeditor/image-list/js/style.js"></script> 
 <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189718"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189718_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189718)"> <br> <input
					type="checkbox" id="1189718_pagenumcb" value=""
					onclick="javascript:checkpage(1189718)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<script>
		function noIdTagReset1189718() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189718 + ''].getData();

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
					CKEDITOR.instances['' + 1189718 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189718 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189718 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189718',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189718',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189718").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189718 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189718")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189718 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189718();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189718")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189718")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189718 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189718();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189718&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>
	<div class="ui bottom attached tab segment" id="yetabs-10" data-tab="yetabs-10">
		<table class="table">
			<tr style="background-color: #f2f2f2">
				<td width="60%" align="center">
					<button name="if2_1189719"
						class="ui yellow button"
						onclick="javascript:changeImgSize(2,1189719)">
						<span class="ui-icon" style="margin-top: 0;"><i class="minus icon"></i></span>
					</button>
					<button name="if1_1189719"
						class="ui yellow button"
						onclick="javascript:changeImgSize(1,1189719)">
						<span class="ui-icon" style="margin-top: 0;"><i class="plus icon"></i></span>
					</button>
				</td>
				<td width="40%" align="center">

					<button id="txt5_1189719" class="ui yellow button"
						onclick="javascript:ocrtext(1189719)">
						본문초기화
					</button>
					<button id="txt3_1189719" class="ui yellow button"
						onclick="javascript:clickrepage(1189719)" disabled="disabled">
						되돌리기
					</button>

					<button id="txt4_1189719" class="ui yellow button"
						onclick="javascript:input(1189719,10,12407)" disabled="disabled">
						저장
					</button>
					<div class="tiny ui basic yellow icon button" data-html="true"
			data-tooltip="가이드라인을 반드시 숙지 후 꼼꼼히 제작해주시기 바랍니다. 
			 				페이지별로 제작을 완료하신 후 저장 버튼을 눌러주세요.
			 				모든 페이지 저장하신 후, 제출 버튼을 누르셔야 작업이 완료됩니다." 
			 data-position="bottom right"><i class="yellow large info circle icon"></i>
				</div>
			<div class="ui yellow teal button" id="ui-tooltip-content" data-html="true"
				data-tooltip="1-1. 오탈자를 확인해 주세요.
				1-2. 정확한 띄어쓰기를 해 주세요.
				1-3. 한자, 영어만 입력하고 나머지 외국어는 생략해 주세요.
				1-4. 로마 숫자, 라틴 문자(불어, 독어 등), 그리스 문자는 편집도구를 통해 입력해 주세요.
				2-1. 표 편집도구를 통해 표를 삽입하고 제목을 입력해 주세요.
				2-2. 이미지 편집도구를 통해 이미지를 자른 후 객관적인 설명과 텍스트를 입력해 주세요.
				2-3. 특수문자 편집도구를 통해 특수기호를 입력해 주세요.
				2-4. 쉼표와 소괄호는 특수기호를 사용하지 마시고 키보드 상에서 입력해 주세요.
				2-5. 사칙연산 입력시, 키보드 상에 하이픈과 알파벳 X를 쓰지 마시고 특수기호 편집도구를 통해 입력해 주세요.
				3-1. 목차로 추정되는 각 장의 제목과 소제목에 목차 지정을 해주세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				4-2. 이미지와 같이 줄 바꾸지 말고 문단 형식대로 줄 바꿔서 사용해 주세요.
				4-3. 문단 시작 시 들여쓰기를 하지 마세요.
				4-1. 빈 줄은 띄지 말아주세요. 단 인용 문구 같은 경우는 띄어 주세요.
				5-1. 주석번호는 해당 문자 뒤에 (주 해당숫자) 형식으로 변경해주세요. Ex) (주1), (주*) 
				5-2. 주석내용은 본문의 내용과 구분되도록 한 줄을 띄어준 후, 주 1: , 주 *: 형식으로 입력해 주세요.
				6-1. 오른쪽 텍스트 페이지 상단, 또는 하단에 나와 있는 쪽번호 및 제목을 삭제해 주세요. 
				6-2. 페이지 번호가 2개 있는 경우에는, 뒤에 있는 더 큰 숫자 하나만 페이지 입력란에 입력해 주세요.
				6-3. 페이지 넘버 입력칸에는 '원본' 페이지의 번호를 입력해 주세요."
				data-position="bottom center">제작가이드라인
			</div> 
					 <script>
						$('#makeclassid_' + 1189719).click(function(e) {
							var x = document.getElementById("makeclass");
							if (x.style.display === "none") {
								x.style.display = "block";
							} else {
								x.style.display = "none";
							}
						});
					</script>

				</td>
			</tr>
			<tr style="background-color: #f2f2f2">
				<td width="50%" align="center">
					<div style="width: 100%; height: 565px; overflow: auto; align: center">
						<img src="/sori/views/bookmaking/images/보건교사안은영10.jpg" id="inputimg_1189719"
							width=" 495px" style="padding: 0px;" alt="" />
					</div>
				</td>
				<td align="center" width="50%"><textarea id="1189719"
						name="1189719" cols="66" rows="6"
						style="overflow: visible; width: 430px; height: 465px; font-size: 14px;">
						선생님이 뭔가 만류하는 듯 웅얼거렸지만, 가시인지 뭔지를 뺏으니 됐다. 오늘은 선생님들이 유난히 귀찮았다.				
						보건교사 안은영은, 자잘한 일은 있어도 큰 사고는 일어나지 않는 학교생활에 만족하고 있었다. 오늘까지는.
						은영은 남학생의 목에서 뽑아낸, 동물성 물질을 내려다보며 작게 끓는 소리를 냈다. 욕이 되다 만 소리였다. 학교라서 매번 삼킬 뿐, 사실 은영은 욕을 잘하는 편이었다. 학생이 놀랄까 봐 차마 말을 못했지만 그것은 어떤 알 수 없는 동물의 손톱, 비늘, 뼈 중 하나인 것 같았다. 그 애의 목덜미에 핏줄을 타고 독기가 번져 가는 걸 보았는데 얼마나 나쁜게 들러붙은 건지는 짐작하기 어려웠다. 소독이라도 했어야 하나. 하지만 어차피 알코올로 어떻게 할 수 있는 종류는 아니었다. 본체를 잡을 때까지 괜찮아야 할 텐데, 은영은 걱정스러웠다. 본체로부터 멀리 보내는 게 나을 것 같았다.
						</textarea>

					<link href="/resources/ckeditor/image-list/css/sample.css"
						rel="stylesheet" type="text/css"> <script
						src="/resources/ckeditor/image-list/js/style.js"></script> <!-- 에디터 cdn 링크, 이미지 리스트 css,이미지 표현 js -->

					<div class="window">
						<ul class="image-list" id="image-list_1189719"
							style="margin-top: 0px; position: relative;">
						</ul>
					</div> 페이지 번호 : <input type="number" id="1189719_pagenum" min="0"
					inputmode="numeric" pattern="[0-9]*"
					onkeyup="javascript:checkpage(1189719)"> <br> <input
					type="checkbox" id="1189719_pagenumcb" value=""
					onclick="javascript:checkpage(1189719)">페이지 번호 없음</td>
			</tr>
		</table>

	</div>
	<script>
		function noIdTagReset1189719() {
			var tagmake = document.createElement("div");
			tagmake.innerHTML = CKEDITOR.instances['' + 1189719 + ''].getData();

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
					CKEDITOR.instances['' + 1189719 + ''].fire('lockSnapshot');
					CKEDITOR.instances['' + 1189719 + ''].document.$
							.getElementsByClassName("search_idx")[i]
							.replaceWith(d);
					CKEDITOR.instances['' + 1189719 + '']
							.fire('unlockSnapshot');

				}
			}
		};
	</script>
	<script>
		var path = location.href.substring(0, location.href.lastIndexOf('/'));
		path = path.substring(0, path.lastIndexOf('/') + 1);
		/* CKEDITOR.plugins.addExternal('cwjdsjcsconfineselection', 'http://www.itlo.org/resources/ckeditor/plugins/cwjdsjcsconfineselection/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('image2',
						'http://www.itlo.org/resources/ckeditor/plugins/image2/plugin.js');
		CKEDITOR.plugins
				.addExternal('imagecrop',
						'http://www.itlo.org/resources/ckeditor/plugins/image-crop/plugin.js');
		CKEDITOR.plugins
				.addExternal('symbol',
						'http://www.itlo.org/resources/ckeditor/plugins/symbol/plugin.js');
		CKEDITOR.plugins
				.addExternal('table2',
						'http://www.itlo.org/resources/ckeditor/plugins/table/plugin.js');
		CKEDITOR.plugins
				.addExternal('zoom',
						'http://www.itlo.org/resources/ckeditor/plugins/zoom/plugin.js');
		/*  CKEDITOR.plugins.addExternal('about', 'http://www.itlo.org/resources/ckeditor/plugins/about/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('justify',
						'http://www.itlo.org/resources/ckeditor/plugins/justify/plugin.js');
		CKEDITOR.plugins
				.addExternal('simplebox',
						'http://www.itlo.org/resources/ckeditor/plugins/title/title.js');
		CKEDITOR.plugins
				.addExternal('tableresize',
						'http://www.itlo.org/resources/ckeditor/plugins/tableresize/plugin.js');
		/*        CKEDITOR.plugins.addExternal('dragresize', 'http://www.itlo.org/resources/ckeditor/plugins/dragresize/plugin.js'); */
		CKEDITOR.plugins
				.addExternal('stylesheetparser',
						'http://www.itlo.org/resources/ckeditor/plugins/stylesheetparser/plugin.js');
		CKEDITOR.plugins
				.addExternal('format2',
						'http://www.itlo.org/resources/ckeditor/plugins/format/plugin.js');
		/*    CKEDITOR.plugins.addExternal('divarea', 'http://www.itlo.org/resources/ckeditor/plugins/divarea/plugin.js'); */
		/*     CKEDITOR.plugins.addExternal('imagerotate', 'http://www.itlo.org/resources/ckeditor/plugins/imagerotate-master/plugin.js'); */
		/*  CKEDITOR.plugins.addExternal('onchange', 'http://www.itlo.org/resources/ckeditor/plugins/onchange/plugin.js'); */

		CKEDITOR.plugins
				.addExternal('removebtn',
						'http://www.itlo.org/resources/ckeditor/plugins/removebtn/plugin.js');

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			if (dialogName == 'table' || dialogName == 'tableProperties') {
				var info = dialogDefinition.getContents('info');
				//	info.remove('txtCellSpace');

				info.get('txtCellSpace')['default'] = '2';
				info.get('txtWidth')['default'] = '50%'; // Set default width to 100%
				//  info.get( 'txtBorder' )[ 'default' ] = '2';        //  Set default border to 0
				info.get('txtCellSpace').style = 'display: none';
				info.get('txtCellPad').style = 'display: none';
				info.get('txtSummary').style = 'display: none';
				info.get('selHeaders').style = 'display: none';
				info.get('txtBorder').style = 'display: none';
				info.get('cmbAlign').style = 'display: none';
				info.get('txtHeight').style = 'display: none';
				info.get('txtWidth').style = 'display: none';
				info.get('txtCaption')['label'] = '표제';
				//	https://stackoverflow.com/questions/24405171/hide-or-remove-the-urltext-field-on-the-ckeditor-upload-dialogue

			}
		});
		var imgSelect = false;

		CKEDITOR
				.replace(
						'1189719',
						{
							'height' : '390',
							'extraPlugins' : 'stylesheetparser,table2,image2,simplebox,imagecrop,tableresize,symbol,justify,format2,zoom,removebtn',
							'contentsCss' : 'http://www.itlo.org/resources/ckeditor/contents.css',
							'allowedContent' : 'p',
							'docType' : '<!DOCTYPE HTML>',
							'customConfig' : 'http://www.itlo.org/resources/ckeditor/config.js',
							'extraAllowedContent' : 'h1,h2,h3,h4,h5,h6,div,figure,figcaption,img[src,alt,width,height]',
							'removePlugins' : 'elementspath',
							'toolbar' : 'Custom',
							'editorId' : '1189719',
							'toolbar_Custom' : [
									{
										name : 'clipboard',
										groups : [ 'clipboard', 'undo' ],
										items : [/* 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', */
												'Undo', 'Redo' ]
									},

									{
										name : 'insert',
										items : [ 'ImageCrop', 'image2',
												'Table', /* 'HorizontalRule',  */
												'Symbol', 'simplebox', 'Zoom' ]
									},
									/*   { name: 'tools', items: [ 'Maximize' ] }, */
									/*   { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [  'Source'  ] },  */
									{
										name : 'others',
										items : [ '-' ]
									},
									/*  '/', */
									{
										name : 'basicstyles',
										groups : [ 'basicstyles' ],
										items : [ 'Underline' ]
									},
									/*   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] }, */
									{
										name : 'Justi',
										items : [ 'Justify', 'JustifyLeft',
												'JustifyCenter',
												'JustifyRight', 'JustifyBlock',
												'-', 'removebtn' ]
									},

							],
							on : {

								instanceReady : function(ev) {
									var text = document
											.getElementById("1189719").value; //에디터 내용 호출시 br태그 삽입
									var newText = "";

									if (!text.match("<p>")) {
										var textArray = text.split('\n');

										for (var i = 0; i < textArray.length; i++) {
											textArray[i] = "<p>" + textArray[i]
													+ "</p>";
											newText += textArray[i];
										}
									}

									if (!newText == null || !newText == "") {
										CKEDITOR.instances['' + 1189719 + '']
												.setData(newText);//에디터 내용 호출시 br태그 삽입 
									}
									/* editor.setData(newText); */

									ev.editor.removeMenuItem('cut');
									ev.editor.removeMenuItem('copy');
									ev.editor.removeMenuItem('paste');

									var editor = ev.editor;
									// Tag name Count
									var innerArray = [];
									var removeImageUrl = "";
									var elem = document.createElement("div");
									elem.innerHTML = editor.getData();
									var images = elem
											.getElementsByTagName("img");
									for (var i = 0; i < images.length; i++) {
										$("#image-list_1189719")
												.append(
														'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

									}

									function getIdx() {

										var htagArray = [];
										var htagIdArray = [];
										var htagNameArray = [];
										var tagmake = document
												.createElement("div");
										tagmake.innerHTML = editor.getData();
										var Htag = tagmake
												.getElementsByClassName("search_idx");
										for (var i = 0; i < Htag.length; i++) {
											htagArray.push(Htag[i].innerHTML);
											htagNameArray.push(Htag[i].tagName);

											if (Htag[i].getAttribute("id") != null) {
												htagIdArray.push(Htag[i]
														.getAttribute("id"));

											} else {
												htagIdArray.push('');

											}

										}
										;

										var pageid = 1189719 + "";
										var input_bookId = 3968 + "";
										var rdata = {
											id : pageid,
											input_bookId : input_bookId,
											tagid : htagIdArray,
											tagname : htagNameArray,
											value : htagArray
										};
										var data = JSON.stringify(rdata);
										$
												.ajax({
													type : 'POST',
													contentType : "application/json;charset=utf-8",
													url : '/input/tagmove',
													dataType : "json",
													data : data,
													success : function(data) {
														noIdTagReset1189719();
													}
												});

									}
									;

									getIdx();

									editor
											.on(
													'change',
													function(event) {

														// Tag name Count
														var innerArray = [];
														var removeImageUrl = "";
														var elem = document
																.createElement("div");
														elem.innerHTML = editor
																.getData();
														var images = elem
																.getElementsByTagName("img");
														$("#image-list_1189719")
																.html('');
														for (var i = 0; i < images.length; i++) {

															$(
																	"#image-list_1189719")
																	.append(
																			'<li id="img_'+i+'"><div style="position: relative;"><img class="fishes" src="'+images[i].src+'" data-imgid="id_001"/></div></li>');

														}

														var htagArray = [];
														var htagIdArray = [];
														var htagNameArray = [];
														var tagmake = document
																.createElement("div");
														tagmake.innerHTML = editor
																.getData();
														var Htag = tagmake
																.getElementsByClassName("search_idx");
														for (var i = 0; i < Htag.length; i++) {
															htagArray
																	.push(Htag[i].innerHTML);
															htagNameArray
																	.push(Htag[i].tagName);

															if (Htag[i]
																	.getAttribute("id") != null) {
																htagIdArray
																		.push(Htag[i]
																				.getAttribute("id"));

															} else {

																htagIdArray
																		.push('');

															}
															/*  htagIdArray.push(Htag[i].outerHTML.data('id')); */
															/*  htagIdArray.push(Htag[i].outerHTML.getElementsById()); */
															/*  htagIdArray.push( Htag[i].getElementsByTagName().value); */

														}
														;

														var pageid = 1189719 + "";
														var input_bookId = 3968 + "";
														var rdata = {
															id : pageid,
															input_bookId : input_bookId,
															tagid : htagIdArray,
															tagname : htagNameArray,
															value : htagArray
														};
														var data = JSON
																.stringify(rdata);
														$
																.ajax({
																	type : 'POST',
																	contentType : "application/json;charset=utf-8",
																	url : '/input/tagmove',
																	dataType : "json",
																	data : data,
																	success : function(
																			data) {
																		noIdTagReset1189719();
																	}
																});

														//목차 태그 송수신입니다.	      getIdx(); 

													}); //onchange 함수 끝 

								}//instanceReady 함수 끝 

							},//instanceReady 메소드 끝 

							// https://github.com/anndoc/image-crop 
							// (See CKEditor documentation http://docs.ckeditor.com/#!/guide/dev_file_browser_api)
							'filebrowserBrowseUrl' : '/browser/browse.php',
							'filebrowserUploadUrl' : '/imagecropin',
							'watermark' : 'http://www.itlo.org/resources/ckeditor/plugins/image-crop/sample/js-watermark.js',
							'cropperJsUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.js',
							'cropperCssUrl' : 'https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.4.1/cropper.min.css',
							'sitepageImage' : 'http://www.itlo.org/user/inputimg/1189719&12407',

							// Setup cropper options.
							// (See cropper.js documentation https://github.com/fengyuanchen/cropperjs)
							'cropperOption' : {
								'viewMode' : 1,

								'aspectRatio' : NaN,
								'autoCropArea' : 1,
								'cropBoxResizable' : true,
								'dragMode' : 'move',
								'background' : 'False',

								'rotatable' : true
							},
							'resultOption' : {
								'width' : '100'
							},
						// Add js and css urls to cropper.js
						});
	</script>
</div>
<div class="makeclass-box" id="makeclass"
	style="display: none; z-index: 50000; position: absolute; height: 70%; width: 800px; top: 120px; right: 10px;">

	<iframe class="iframe-box" src="/fqa2"
		style="width: 100%; height: 100%;"></iframe>
</div>
	</div>
<!-- yecontent 끝 -->
<!-- up -->						
<div id="up" style="font-size: 14px; font-weight: bold;" align="right">
	<a href="#" style="color: black;"><i class="arrow alternate circle up icon"></i>위로가기</a>
</div>
<br><br><br>
</body>
</html>