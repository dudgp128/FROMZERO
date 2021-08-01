<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="./offline_store.js"></script>
<meta charset="UTF-8">
<title>map test</title>

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
	background: #eee;
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

.desc .address {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .contact {
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
</style>

</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<div id="map" style="width: 500px; height: 400px; margin: 50px auto;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd7986774cd84349fa338b960cd169d5"></script>

	<script>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.556109626332514, 126.97061993634316), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [ {
			content : '<form method="post" action="doOffline">'+
					' <input type="hidden" name="name_td" id="name_td" value="알맹상점">알맹상점</div>'+
					'<button type="submit">shop</button>',
			latlng : new kakao.maps.LatLng(37.553715125652765, 126.91167307623124)
		}, {
			content : '<form method="post" action="doOffline">'+
			' <input type="hidden" name="name_td" id="name_td" value="지구샵">지구샵</div>'+
			'<button type="submit">shop</button>',
			latlng : new kakao.maps.LatLng(37.5008250709186, 126.93387012009408)
		}, {
			content : '<form method="post" action="doOffline">'+
			' <input type="hidden" name="name_td" id="name_td" value="더피커">더피커</div>'+
			'<button type="submit">shop</button>',
			latlng : new kakao.maps.LatLng(37.54680749741442, 127.04203621988087)
		}, {
			content : '<form method="post" action="doOffline">'+
			' <input type="hidden" name="name_td" id="name_td" value="라마홈">라마홈</div>'+
			'<button type="submit">shop</button>',
			latlng : new kakao.maps.LatLng(37.58023627793376, 126.97160105351999)
		},{
			content : '<form method="post" action="doOffline">'+
			' <input type="hidden" name="name_td" id="name_td" value="송포어스">송포어스</div>'+
			'<button type="submit">shop</button>',
			latlng : new kakao.maps.LatLng(37.533436041368354, 127.12548081867307)
		},{
			content : '<form method="post" action="doOffline">'+
			' <input type="hidden" name="name_td" id="name_td" value="디어얼스">디어얼스</div>'+
			'<button type="submit">shop</button>',
			latlng : new kakao.maps.LatLng(37.569783379918924, 126.91334071048675)
		} ];
		
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
		*/

		/* 아래와 같이도 할 수 있습니다 */
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
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
		        kakao.maps.event.addListener(marker, 'mouseout', function() {
		            infowindow.close();
		        });
		        */
		        
		    })(marker, infowindow);
		}

	</script>
	
</body>
</html>