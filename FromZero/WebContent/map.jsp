<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="./offline_store.js"></script>
<meta charset="UTF-8">
<title>From zero</title>

<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	font-size: 11px;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

<!--
지도에+ ,-, 지도뷰, 스카이뷰 올리는 style 태그 -->html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 350px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}
</style>

</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<div class="big-shop-grid">
		<div class="div-shop-grid">
			<h2 style="margin-top: 50px">오프라인 제로웨이스트샵</h2>
			<h4>지도에 표시된 shop에 들어가서, 상품을 예약해보세요!</h4>

		</div>
	</div>


	<div id="map"
		style="width: 800px; height: 400px; margin: 50px auto; z-index: 1;">
		<!-- 지도타입 컨트롤 div 입니다 -->
		<div class="custom_typecontrol radius_border" style="z-index: 2">
			<span id="btnRoadmap" class="selected_btn"
				onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
				class="btn" onclick="setMapType('skyview')">스카이뷰</span>
		</div>
		<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
		<div class="custom_zoomcontrol radius_border" style="z-index: 2">
			<span onclick="zoomIn()"><img
				src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
				alt="확대"></span> <span onclick="zoomOut()"><img
				src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
				alt="축소"></span>
		</div>

	</div>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd7986774cd84349fa338b960cd169d5"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.556109626332514,
					126.97061993634316), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		function setMapType(maptype) {
			var roadmapControl = document.getElementById('btnRoadmap');
			var skyviewControl = document.getElementById('btnSkyview');
			if (maptype === 'roadmap') {
				map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
				roadmapControl.className = 'selected_btn';
				skyviewControl.className = 'btn';
			} else {
				map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
				skyviewControl.className = 'selected_btn';
				roadmapControl.className = 'btn';
			}
		}

		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
			map.setLevel(map.getLevel() - 1);
		}

		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomOut() {
			map.setLevel(map.getLevel() + 1);
		}

		function 알맹상점() {
			window.open("https://map.kakao.com/link/map/1771847437");
		}

		function 지구샵() {
			window.open("https://map.kakao.com/link/map/139053180");
		}

		function 더피커() {
			window.open("https://map.kakao.com/link/map/1728774489");
		}

		function 라마홈() {
			window.open("https://map.kakao.com/link/map/844929863");
		}

		function 송포어스() {
			window.open("https://map.kakao.com/link/map/545799219");
		}

		function 디어얼스() {
			window.open("https://map.kakao.com/link/map/746751792");
		}

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
				{
					content : '<div class="info" >'
							+ '<form method="post" action="doOffline">'
							+ '        <div class="title" name="name_td" id="name_td" value="알맹상점">'
							+ ' <input type="hidden" name="name_td" id="name_td" value="알맹상점">알맹상점</div>'
							+ '<div class="body">'
							+ '            <div class="img">'
							+ '                <img src="images/offline_store-1.jpg" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc" style="width:279px">'
							+ '                <div class="ellipsis">서울특별시 마포구 합정동 월드컵로 49 한우마을 2층</div>'
							+ '                <div class="jibun ellipsis">0507-1393-8913</div>'
							+ '<button class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px; margin-top:10px;" type="submit">예약하기</button>'
							+ '<input type ="button" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px;" value="길찾기" onclick="javascript:알맹상점();">'
							+ '            </div>' + '       	</div>'
							+ '        </div>' + ' 	</form>' + '    	</div>',
					latlng : new kakao.maps.LatLng(37.553715125652765,
							126.91167307623124)
				},
				{
					content : '<div class="info">'
							+ '<form method="post" action="doOffline">'
							+ '        <div class="title" name="name_td" id="name_td" value="지구샵">'
							+ ' <input type="hidden" name="name_td" id="name_td" value="지구샵">지구샵</div>'
							+ '<div class="body">'
							+ '            <div class="img">'
							+ '                <img src="images/offline_store-2.jpg" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc" style="width:217px">'
							+ '                <div class="ellipsis">서울특별시 동작구 상도동 성대로1길 16</div>'
							+ '                <div class="jibun ellipsis">070-7640-4940</div>'
							+ '<button type="submit" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px; margin-top:10px;">예약하기</button>'
							+ '<input type ="button" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px;" value="길찾기" onclick="javascript:지구샵();">'
							+ '            </div>' + '       	</div>'
							+ '        </div>' + ' 	</form>' + '    	</div>',
					latlng : new kakao.maps.LatLng(37.5008250709186,
							126.93387012009408)
				},
				{
					content : '<div class="info">'
							+ '<form method="post" action="doOffline">'
							+ '        <div class="title" name="name_td" id="name_td" value="더피커">'
							+ ' <input type="hidden" name="name_td" id="name_td" value="더피커">더피커</div>'
							+ '<div class="body">'
							+ '            <div class="img">'
							+ '                <img src="images/offline_store-3.jpg" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc" style="width:270px">'
							+ '                <div class="ellipsis">서울특별시 성동구 왕십리로 115 헤이그라운드 9층</div>'
							+ '                <div class="jibun ellipsis">070-4118-0710</div>'
							+ '<button type="submit" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px; margin-top:10px;">예약하기</button>'
							+ '<input type ="button" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px;" value="길찾기" onclick="javascript:더피커();">'
							+ '            </div>' + '       	</div>'
							+ '        </div>' + ' 	</form>' + '    	</div>',
					latlng : new kakao.maps.LatLng(37.54680749741442,
							127.04203621988087)
				},
				{
					content : '<div class="info">'
							+ '<form method="post" action="doOffline">'
							+ '        <div class="title" name="name_td" id="name_td" value="라마홈">'
							+ ' <input type="hidden" name="name_td" id="name_td" value="라마홈">라마홈</div>'
							+ '<div class="body">'
							+ '            <div class="img">'
							+ '                <img src="images/offline_store-4.jpg" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc" style="width:210px">'
							+ '                <div class="ellipsis">서울특별시 종로구 자하문로 48 1층</div>'
							+ '                <div class="jibun ellipsis">0507-1300-3042</div>'
							+ '<button type="submit" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px; margin-top:10px;">예약하기</button>'
							+ '<input type ="button" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px;" value="길찾기" onclick="javascript:라마홈();">'
							+ '            </div>' + '       	</div>'
							+ '        </div>' + ' 	</form>' + '    	</div>',
					latlng : new kakao.maps.LatLng(37.58023627793376,
							126.97160105351999)
				},
				{
					content : '<div class="info">'
							+ '<form method="post" action="doOffline">'
							+ '        <div class="title" name="name_td" id="name_td" value="송포어스">'
							+ ' <input type="hidden" name="name_td" id="name_td" value="송포어스">송포어스</div>'
							+ '<div class="body">'
							+ '            <div class="img">'
							+ '                <img src="images/offline_store-5.jpg" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc" style="width:210px">'
							+ '                <div class="ellipsis">서울특별시 강동구 풍성로35길 34 1층</div>'
							+ '                <div class="jibun ellipsis">070-8095-3534</div>'
							+ '<button type="submit" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px; margin-top:10px;">예약하기</button>'
							+ '<input type ="button" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px;" value="길찾기" onclick="javascript:송포어스();">'
							+ '            </div>' + '       	</div>'
							+ '        </div>' + ' 	</form>' + '    	</div>',
					latlng : new kakao.maps.LatLng(37.533436041368354,
							127.12548081867307)
				},
				{
					content : '<div class="info">'
							+ '<form method="post" action="doOffline">'
							+ '        <div class="title" name="name_td" id="name_td" value="디어얼스">'
							+ ' <input type="hidden" name="name_td" id="name_td" value="디어얼스">디어얼스</div>'
							+ '<div class="body">'
							+ '            <div class="img">'
							+ '                <img src="images/offline_store-6.jpg" width="73" height="70">'
							+ '           </div>'
							+ '            <div class="desc" style="width:210px">'
							+ '                <div class="ellipsis">서울특별시 서대문구 수색로 43 104호</div>'
							+ '                <div class="jibun ellipsis">0507-1300-3388</div>'
							+ '<button type="submit" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px; margin-top:10px;">예약하기</button>'
							+ '<input type ="button" class="test-result-button" style="width:70px; height:20px; font-size:10px; padding:0px; margin:2px;" value="길찾기" onclick="javascript:디어얼스();">'
							+ '            </div>' + '       	</div>'
							+ '        </div>' + ' 	</form>' + '    	</div>',
					latlng : new kakao.maps.LatLng(37.569783379918924,
							126.91334071048675)
				} ];

		var iwRemoveable = true;

		/*
		 for (var i = 0; i < positions.length; i++) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map : map, // 마커를 표시할 지도
		 position : positions[i].latlng
		 // 마커의 위치
		 });

		 // 마커에 표시할 인포윈도우를 생성합니다 
		 var infowindow = new kakao.maps.InfoWindow({
		 content : positions[i].content
		 // 인포윈도우에 표시할 내용
		 });

		 // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		 // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		 // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
		 map, marker, infowindow));
		 kakao.maps.event.addListener(marker, 'mouseout',
		 makeOutListener(infowindow));
		 }

		 // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		 function makeOverListener(map, marker, infowindow) {
		 return function() {
		 infowindow.open(map, marker);
		 };
		 }

		 // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		 function makeOutListener(infowindow) {
		 return function() {
		 infowindow.close();
		 };
		 }
		 )
		
		 */

		/* 아래와 같이도 할 수 있습니다 */

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content,
				removable : iwRemoveable
			// 인포윈도우에 표시할 내용
			});

			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, infowindow) {
				// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
				kakao.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map, marker);
				});

				/*
				// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
				if(selectedMarker == marker){
					kakao.maps.event.addListener(marker, 'click', function() {
					    infowindow.close();
					});
				}
				 */
				kakao.maps.event.addListener(marker, 'rightclick', function() {
					infowindow.close();
				});

			})(marker, infowindow);
		}

		var scrollingElement = (document.scrollingElement || document.body);
		scrollingElement.scrollTop = scrollingElement.scrollHeight;

		function gotoBottom(id) {
			var element = document.getElementById(id);
			element.scrollTop = element.scrollHeight - element.clientHeight;
		}
	</script>





</body>
</html>