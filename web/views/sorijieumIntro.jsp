<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소리지음 사이트 소개</title>

<!-- Semantic UI CND -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<!-- CUSTOM CSS -->
	<link rel = "stylesheet" type="text/css" href="/sori/resources/css/board.css">
	
</head>
<body>

<!-- Content 시작! -->
	<section class="my-section">
	<div align="center" style="background:#fff; widht:auto; height:3600px;">
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
			<th widht="20%">주소&연락처</th><td width="80%">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F
													<br>(T: 1544-9970 / F: 02-562-2378)</td>
		</tr>
		<tr>
			<th widht="20%">버스</th><td width="80%">역삼역.포스코P&S타워 정류장<br>
												지선 146 / 740 / 341 / 360　　간선 1100 / 1700 / 2000 / 7007 / 8001</td>
		</tr>
		<tr>
			<th widht="20%">지하철</th><td width="80%">지하철 2호선 역삼역 3번출구 100m</td>
		</tr>
		</table>
		</div>
	</div>
	</section>
<!-- Content 끝! -->
</body>
</html>