<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음 사이트 소개</title>
<%@ include file="/../inc/top.jsp" %>
<!-- CUSTOM CSS -->
<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
<script type="text/javascript">
	<%if(loginMember == null || loginMember.getTypeNumber() == 1 || loginMember.getTypeNumber() == 2 ) {%> // 이용(대기)자 일때
    var audio = new Audio("/sori/resources/mp3/introduce.mp3");	// 화면 접속 시 음성안내 자동재생
    window.onload = function(){
       audio.play();
    }

    $(function(){
    	window.onkeyup = function(){
   		   if(event.keyCode == 57 || event.keyCode == 105){		// 9번:입력시 메인 페이지 이동
   			location.href="/sori/index.jsp";
   		   }else if(event.keyCode == 54 || event.keyCode == 102){	// 6번 : 사이트 소개 처음부터 다시 듣기
   			location.reload();
   		   }else if(event.keyCode == 49 || event.keyCode == 97){	// 1번 : 소리지음 설립목적
   			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/introduce1.mp3");
   			   audio.play();
   		   }else if(event.keyCode == 50 || event.keyCode == 98){	// 2번 : 소리지음 비전과 미션
   			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/introduce2.mp3");
   			   audio.play();
   		   }else if(event.keyCode == 51 || event.keyCode == 99){	// 3번 : 주소와 연락처
   			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/introduce3.mp3");
   			   audio.play();
   		   }else if(event.keyCode == 52 || event.keyCode == 100){	// 4번 : 회원등록안내
   				audio.pause();
			   audio = new Audio("/sori/resources/mp3/introduce4.mp3");
			   audio.play();
   		   }else if(event.keyCode == 53 || event.keyCode == 101){	// 5번 : 회원가입
   			location.href="/sori/views/member/memberEnrollAgree.jsp";
   		   }else{														// 잘못누른경우
   			   audio.pause();
   			   audio = new Audio("/sori/resources/mp3/wrongNumber.mp3");
   			   audio.play();
   		   }
    	}
    });
    
    <%}%>
</script>
</head>
<body>
<!-- Content 시작! -->
	<section class="my-section">
	<div align="center" style="background:#fff; widht:auto; height:4000px;">
		<img src="/sori/resources/images/siteintro1.png">
		<p style="color:#fbbe09; font-size:30pt;">안녕하세요, 소리지음입니다.</p>
		<p style="color:#404040; font-size:20pt;">'소리지음'은 '소리를 짓다(만들다)'라는 의미와,<br>
		소리를 알아듣는다는 뜻으로 '자기의 속마음을 알아주는 친구'를 이르는 말인<br>
		知音(알 지, 소리음) 고사성어를 합한 중의적 표현입니다.</p>
		<br><br><br><br><br><br><br><br>
		
		<img src="/sori/resources/images/siteintro2.png">
		<p style="color:#fbbe09; font-size:30pt;">시각장애인의 독서 목마름, 소리지음으로 해소하자!</p>
		<p style="color:#404040; font-size:20pt;">시각장애인들에게 보다 간편한 절차로 도서를 제공하여<br>
		동등한 교육 기회 확보 및 사회참여를 도모하고<br>
		지식정보문화 격차를 해소하기 위해 설립되었습니다.<br>
		또한, 시간과 장소에 관계 없이 언제<br>
		어디서나 간편하게 소리책을 제작할 수 있도록 하였습니다.</p>
		<br><br><br><br><br><br><br><br>
		
		<img src="/sori/resources/images/siteintro3.png">
		<p style="color:#fbbe09; font-size:30pt;">시각장애인의 지식정보문화 격차 해소 프로젝트</p>
		<p style="color:#404040; font-size:20pt;">소리지음은 정보통신기술과 크라우드 소싱을 통해<br>
		시각장애인이 당면한 지식과 정보접근 문제를 해결해 나가고자 합니다.<br>
		시각장애인의 어려움에 공감하는 분들이 인터넷을 통해 협력하면<br>
		시각 장애인들이 접근할 수 있는 지식과 정보를 놀라운 수준으로 증가시킬 수 있습니다.<br>
		지식과 정보가 보다 널리 확산되어 시각장애인들의 삶이 더욱 다채로워질 수 있도록<br>
		당신의 소중한 시간과 능력을 나누어 주세요!</p>
		<br><br><br><br>
		
		
		<img src="/sori/resources/images/siteintro4.png">
		<p style="color:#fbbe09; font-size:30pt;">회원등록 안내</p><br>
		<p style="color:#404040; font-size:20pt;">소리가 보이는 도서관은 시각장애인을 위한 전용 사이트로서<br>
		도서를 이용하시려면 회원가입 후, 관리자의 승인이 있어야 이용이 가능합니다<br>
		회원가입을 원하시면 메인화면에서 회원가입 진행 후,<br>
		복지카드 사본을 팩스로 보내주시기 바랍니다.<br>
		보내주실 팩스번호는 02-562-2378 입니다.<br>
		궁금한 점이 있으시면 관리자에게 문의해 주십시오. (02-1234-5678)<br>
		제작자의 경우, 별도의 승인이 필요하지 않습니다.
		
		<br><br><br><br><br><br>
		<hr><br><br><br><br>
		
		<!-- 오시는길 -->
		<div style="padding: 30px 30px">
		<p style="color:#fbbe09; font-size:30pt;">찾아 오시는 길</p>
		
		<!-- 지도API 시작 -->
		<div id="map" style="width:700px;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f05c5efb7b8bf5c09d7011f0d132adf1"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(37.498993, 127.032867),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
			
		// 마커생성		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.498993, 127.032867), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(37.498993, 127.032867); 
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
		
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
		</script>
	
		<!-- 지도 API끝 -->
		
		<!-- 상세내역 -->
		<br>
		<table class="my-listTable3" style="width:700px;">
		<tr>
			<th style="widht:20%; text-align:center;">주소&연락처</th><td width="80%">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F
													<br>(T: 1544-9970 / F: 02-562-2378)</td>
		</tr>
		<tr>
			<th style="widht:20%; text-align:center;">버스</th><td width="80%">역삼역.포스코P&S타워 정류장<br>
												지선 146 / 740 / 341 / 360　　간선 1100 / 1700 / 2000 / 7007 / 8001</td>
		</tr>
		<tr>
			<th style="widht:20%; text-align:center;">지하철</th><td width="80%">지하철 2호선 역삼역 3번출구 100m</td>
		</tr>
		</table>
		</div>
		<br><br>
		<div>연관사이트
		<select class="ui mini simple dropdown" name="jump" onchange="location.href=this.value" style="border-radius:5px;">
			<option>선택</option>
			<option value="http://www.kbuwel.or.kr">한국시각장애인연합회</option>
			<option value="http://www.soriview.or.kr/sori">소리가보이는도서관</option>
			<option value="http://www.itlo.org/">IT로</option>
			</select>
		</div>
		<br><br>
	</div>
	<br><br>
	</section>

<!-- Content 끝! -->
</body>
</html>