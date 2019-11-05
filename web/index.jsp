<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
   Member loginMember = (Member)session.getAttribute("loginMember");
   int typeNumber = 0;
   if(loginMember != null){
      typeNumber = loginMember.getTypeNumber();
   }
%>     
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="/sori/resources/images/favicon.ico">
<link rel="icon" href="/sori/resources/images/favicon.ico">
<meta charset="UTF-8">
<title>소리지음 메인페이지</title>
<script src="/sori/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
   //알림표시할 개수 조회
   <% if(loginMember != null){ %>
     $.ajax({
       url:"/sori/getAlarm",
       type:"post",
       data:{userid:"<%= loginMember.getUserId() %>"},
       success:function(result){
         $(".alarm.circle").text(result);
       }
     });
   <% } %>

	$("#mainOpen").keyup(function(){	// 메인 처음 접속시 안내 멘트에 대한 값 입력 창
		var keyV = $(this).val();
		var audio1 = new Audio("/sori/resources/mp3/mainOpen1.mp3");
		if(keyV == '1'){				// 처음 접속하셨다면 (1번 클릭)
			audio1.play();
			$("#mainOpen1").focus();
		}else if(keyV == '2'){			// 로그인하시려면(2번 클릭)
			location.href="/sori/views/member/memberLoginView.jsp";
		}else{														// 잘못누른경우
			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
   			   audio.play();
   			$("#mainOpen").val('');
   		   }
	});
	
	$("#mainOpen1").keyup(function(){	// 처음 접속 후 1번 입력(사이트소개)
		var keyV2 = $(this).val();
		if(keyV2 == '1'){
			location.href="/sori/views/sorijieumIntro.jsp";
		}else if(keyV2 == '2'){			// 처음 접속 후 2번 입력(회원가입)
			location.href="/sori/views/member/memberEnrollAgree.jsp";
		}else{														// 잘못누른경우
			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
   			   audio.play();
   			$("#mainOpen1").val('');
   		   }
	});
	<% if(typeNumber > 1){ %>
	$("#loginMain").keyup(function(){	// 로그인 후의 메뉴 이동
		var keyV3 = $(this).val();
		if(keyV3 == '1'){		// 도서검색
			location.href="/sori/blist";
		}else if (keyV3 == '2'){	//도서신청
			location.href="/sori/views/boardwishbook/wishbookAddForm.jsp";
		}else if (keyV3 == '3'){	// 마이페이지
			location.href="/sori/views/member/memberMyPage.jsp";
		}else if (keyV3 == '4'){	// 공지사항
			location.href="/sori/nlist";
		}else if (keyV3 == '5'){	// 문의사항
			location.href="/sori/views/boardqna/qnaInsertView.jsp";
		}else if (keyV3 == '6'){	//자주묻는질문
			location.href="/sori/views/boardfaq/faqListView.jsp";
		}else if (keyV3 == '7'){	// 사이트소개
			location.href="/sori/views/sorijieumIntro.jsp";
		}else if (keyV3 == '8'){	// 없음(값 지우기)
			$("#loginMain").val("");
		}else if (keyV3 == '9'){	// 없음(값 지우기)
			$("#loginMain").val("");
		}else if (keyV3 == '0'){	// 다시듣기
			location.reload();
		}else{														// 잘못누른경우
			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
   			   audio.play();
   			$("#loginMain").val('');
   		   }
	});
	<% }else if(typeNumber == 1){ %> //이용대기자
		$("#loginMain").keyup(function(){	// 로그인 후
			var keyV3 = $(this).val();
			if(keyV3 == '1'){		// 마이페이지
				location.href="/sori/views/member/memberMyPage.jsp";
			}else if (keyV3 == '2'){	//공지사항
				location.href="/sori/nlist";
			}else if (keyV3 == '3'){	// 문의사항
				location.href="/sori/views/boardqna/qnaInsertView.jsp";
			}else if (keyV3 == '4'){	// 자주묻는질문
				location.href="/sori/views/boardfaq/faqListView.jsp";
			}else if (keyV3 == '5'){	// 사이트소개
				location.href="/sori/views/sorijieumIntro.jsp";
			}else if (keyV3 == '6'){	// 없음(값 지우기)
				$("#loginMain").val("");
			}else if (keyV3 == '7'){	// 없음(값 지우기)
				$("#loginMain").val("");
			}else if (keyV3 == '8'){	// 없음(값 지우기)
				$("#loginMain").val("");
			}else if (keyV3 == '9'){	// 없음(값 지우기)
				$("#loginMain").val("");
			}else if (keyV3 == '0'){	// 다시듣기
				location.reload();
			}else{														// 잘못누른경우
				   audio.pause();
	   			   audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
	   			   audio.play();
	   			$("#loginMain").val('');
	   		   }
		});
		<% } %>

});

// 음성안내 ***********************************
var audio = new Audio();
window.onload = function(){
	<%if(loginMember == null){%>  // 로그인멤버 X,
		audio = new Audio("/sori/resources/mp3/mainOpen.mp3"); 	// 화면 접속 시 음성안내 자동재생
		audio.play();
		$("#mainOpen").focus();
	<%}else if(loginMember.getTypeNumber() == 2 ) {%> // 이용(대기)자 일때
		audio = new Audio("/sori/resources/mp3/loginMain.mp3");	// 화면 접속 시 음성안내 자동재생
		audio.play();
		$("#loginMain").focus();
	<%}else if(loginMember.getTypeNumber() == 1){%>
		audio = new Audio("/sori/resources/mp3/loginMain2.mp3");	// 화면 접속 시 음성안내 자동재생
		audio.play();
		$("#loginMain").focus();
	<% } %>
}   
  
</script>
  <!-- 시맨틱유아이 cdn -->

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/main.css">
<style type="text/css">
@font-face { font-family: 'S-CoreDream-7ExtraBold'; 
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); 
          font-weight: normal; 
          font-style: normal; }

* { font-family: 'S-CoreDream-7ExtraBold';}

.wrapper {
   z-index:1;
   position:relative;
   width:100%;
   height:100%;
   }
   .wrapper:after{
   width:100%;
   height:100%;
   z-index:-1;
   position:absolute;
   top:0;
   left:0;
   content:"";
   background-image: url('/sori/resources/images/mainbook.jpg') ;
   background-repeat:no-repeat;
   background-position:center;
   background-size: cover; 
   background-attachment: scroll;
   opacity: 1;
   }

.ui.cards {
   font-family: 'S-CoreDream-7ExtraBold';
}

.ui.cards .card:hover{
   background: #fbc21b; 
   background-opacity:0.4;
}
</style>
</head>
<body>
<div class="wrapper">
<header>
<br>
<% if(loginMember == null){ %>
<div align="right" style="margin-top:10px;">
   <button class="ui yellow button" onclick="location.href='/sori/views/member/memberLoginView.jsp'" style="font-family:'S-Core Dream 6';">로그인</button>
   <button class="ui yellow button" onclick="location.href='/sori/views/member/memberEnrollAgree.jsp'" style="font-family:'S-Core Dream 6';">회원가입</button> &nbsp;
</div>
<% }else { %>
<div align="right">
<h2 class="ui header">
<div align="right" style="margin-right:2%;margin-top:1%">
   <% if(typeNumber==1){ %>
         <a class="ui grey image huge label" href="/sori/mypage?userid=<%= loginMember.getUserId() %>">
         <%= loginMember.getUserName() %><div class="floating ui big red circular label alarm circle"></div>
         <div class="detail">
         이용대기자
         </div>
         </a>
   <% }else if(typeNumber==2){ %>
         <a class="ui yellow image huge label" href="/sori/mypage?userid=<%= loginMember.getUserId() %>">
         <%= loginMember.getUserName() %><div class="floating ui big red circular label alarm circle"></div>
         <div class="detail">
         이용자
         </div>
         </a>
   <% }else if(typeNumber==3){ %>
         <a class="ui olive image huge label" href="/sori/mypage?userid=<%= loginMember.getUserId() %>">
         <%= loginMember.getUserName() %><div class="floating ui big red circular label alarm circle"></div>
         <div class="detail">
         제작자
         </div>
         </a>
   <% }else if(typeNumber==4 || typeNumber==5){ %>
         <a class="ui teal image huge label" href="/sori/admain.ad">
         <%= loginMember.getUserName() %>
         <div class="detail">
         <% if(typeNumber==4){ %>
         부관리자
         <% }else{ %>
         대표관리자
         <% } %>
         </div>
         </a>
   <% } %>
<div><a class="ui grey label" href="/sori/memberLogout">로그아웃</a></div>
</div>
</h2>
</div>
<% } %>
</header>
<br>
<div class="ui four cards" style="margin:-15px 5% 0 5%">
  <div class="card">
    <div class="image">
       <img onclick="location.href='/sori/index.jsp'" src="/sori/resources/images/logo.png" alt="소리지음">
    </div>
  </div>
  <div class="card">
    <div class="image">
         <img onclick="location.href='/sori/views/sorijieumIntro.jsp'" src="/sori/resources/images/사이트소개.png" alt="사이트소개">
    </div>
  </div>
  <% if(loginMember != null && loginMember.getTypeNumber() > 1){ %>
  <div class="card">
    <div class="image">
      <img onclick="location.href='/sori/blist'" src="/sori/resources/images/도서검색.png" alt="도서검색">
    </div>
  </div>
  <% }else{ %>
  <div class="card">
    <div class="image">
      <img src="/sori/resources/images/도서검색.png" alt="도서검색">
    </div>
  </div>
  <% } %>
  <% if(loginMember != null && loginMember.getTypeNumber() > 2){ %>
  <div class="card">
   <div class="image">
      <img onclick="location.href='/sori/bmkmain'" src="/sori/resources/images/도서제작.png" alt="도서제작">
    </div>
  </div> 
  <% }else{ %> 
  <div class="card">
   <div class="image">
      <img src="/sori/resources/images/도서제작.png" alt="도서제작">
    </div>
  </div> 
  <% } %>
</div>
<div class="ui four cards" style="margin:0 5% 0 5%">
<% if(loginMember != null && loginMember.getTypeNumber() > 1){ %>
  <div class="card">
    <div class="image">
      <img onclick="location.href='/sori/wblist'" src="/sori/resources/images/도서신청.png" alt="도서신청">
    </div>
  </div>
  <% }else{ %>
  <div class="card">
    <div class="image">
      <img src="/sori/resources/images/도서신청.png" alt="도서신청">
    </div>
  </div>
  <% } %>
  <div class="card">
    <div class="image">
      	<img onclick="location.href='/sori/nlist'" src="/sori/resources/images/공지사항.png" alt="공지사항">
    </div>
  </div>
  <% if(loginMember != null){ %>
  <div class="card">
    <div class="image">
         <img onclick="location.href='/sori/qlist'" src="/sori/resources/images/QNA.png" alt="문의하기">
    </div>
  </div>
  <% }else{ %>
  <div class="card">
    <div class="image">
         <img src="/sori/resources/images/QNA.png" alt="문의하기">
    </div>
  </div>
  <% } %>
  <div class="card">
    <div class="image">
         <img onclick="location.href='/sori/views/boardfaq/faqListView.jsp'" src="/sori/resources/images/FAQ.png" alt="자주묻는 질문">
    </div>
  </div>
</div>
</div>


<!-- 음성안내 관련 섹션 -->
<!-- 소리지음에 오신 것을 환영합니다. 처음 이용하신다면 1번 아니면 2번을 눌러주세요 -->
<%if(loginMember == null) {%>
<input type="text" id="mainOpen" autofocus="autofocus"> 
<input type="text" id="mainOpen1">
<%}else if(loginMember.getTypeNumber() <= 2){ %>
<input type="text" id="loginMain" autofocus="autofocus"> 
<% } %>
</body>
</html>