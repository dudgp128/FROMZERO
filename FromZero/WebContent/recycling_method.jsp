<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../fromzero.css" type="text/css">
<title>From zero</title>

</head>
<body>
<%@ include file="./fz_header.jsp" %>

	<!-- 분리수거 방법 페이지 본문 -->
	<div class="title">
	<img style="margin-bottom:10px"src="images/teachable_machine_logo.png"/>
		<h2 style="text-align: center">분리수거 방법 알아보기</h2>
		<h4 style="text-align: center">
			머신러닝 기술을 이용해 분리수거 방법을 알아보세요!<br/>
			카메라를 켜고, 분리수거 방법이 궁금한 물품을 비춰보세요. 
		</h4>
	</div>
	
	<div class="center_box" style="text-align: center;">

	<button class="test-result-button" id="invisible" type="button" onclick="init(); invisible();">Start</button>
	<script>

	function invisible() {
		document.all.invisible.style.display="none";
	}
	
	</script>
	
	<div>
	<table style="margin: 0 auto; width: 80%; background-color:white">
			<tr>
				<td><div id="webcam-container" style="display: inline-block;"></div></td>
				<td><div id="label-container" style="display: inline-block; width:450px; padding: 100px;" ></div></td>
			</tr>
	</table>
	</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<script type="text/javascript">
	
		// the link to your model provided by Teachable Machine export panel
		const URL = "./my_model/";
		let model, webcam, labelContainer, maxPredictions;

		// Load the image model and setup the webcam
		async function init() {
			const modelURL = URL + "model.json";
			const metadataURL = URL + "metadata.json";
							
			model = await tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();

			const flip = true; 
			webcam = new tmImage.Webcam(400, 400, flip); 
			await webcam.setup(); 

			await webcam.play();
			
			window.requestAnimationFrame(loop);


			document.getElementById("webcam-container").appendChild(webcam.canvas);
			labelContainer = document.getElementById("label-container");
			for (let i = 0; i < maxPredictions; i++) { 
				labelContainer.appendChild(document.createElement("div"));
			}
		}

		async function loop() {
			webcam.update(); 
			await predict();
			window.requestAnimationFrame(loop);
		}

		// run the webcam image through the image model
		async function predict() {
			const prediction = await model.predict(webcam.canvas);
			
			
			
			if(prediction[0].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>플라스틱류</h3>'+'</br></br>'+'페트병과 플라스틱 용기는 안에 내용물을 깨끗이 비우고,'
				+' 부착상표와 뚜껑 등 다른 재질로 된 부분은 제거해주세요.'
				+' 알약 포장재와 카세트테이프 등 여러 재질이 섞이고 분리가 어려운 제품은'
				+' 종량제봉투에 담아 버려주세요.';
			}
			
			else if(prediction[1].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>비닐류</h3>'+'</br></br>'+'과자, 라면봉지, 1회용 비닐봉투에 음식물과 이물질이 묻었다면'
				+' 물로 2~3번 헹궈 잔여물을 없애고 버리고,'
				+' 이물질 제거가 어려운 경우에는 종량제봉투에 배출하시면 됩니다.';
			}
			
			else if(prediction[2].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>유리류</h3>'+'</br></br>'+'탄산음료병이나 맥주병, 소주병은 담배꽁초와 같은 이물질을 넣지 말고 버려주세요.'
				+' 하지만 거울, 깨진 유리, 도자기류,유리 식기류는 유리병류가 아니기 때문에'
				+' 종량제봉투나 전용 마대에 버려주세요.';
			}
			
			else if(prediction[3].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>캔류</h3>'+'</br></br>'+'내용물을 비우고 물로 헹구는 등 이물질을 제거하여 배출해 주세요.'
				+' 플라스틱 뚜껑 등 금속캔과 다른 재질은 제거한 후 배출합니다.';
			}
			
			else if(prediction[4].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>종이류</h3>'+'</br></br>'+'스프링 등 종이류와 다른 재질은 제거 후 배출해 주세요.';
			}
			
			else if(prediction[5].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>종이팩</h3>'+'</br></br>'+'종이팩은 일반 종이류와 구분하여 종이팩 전용 수거함에 따로 배출해 주세요.'
				+' 수거함이 없는 경우 묶어 종이류로 배출해 주세요.';
			}
			
			else if(prediction[6].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>건전지</h3>'+'</br></br>'+'폐건전지는 녹슬지 않게 물기를 제거하고 원상태로 분리수거함에 배출해 주세요.';
			}
			
			else if(prediction[7].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>폐가전류</h3>'+'</br></br>'+'폐가전제품 무상 방문 수거 서비스를 이용하기 위해서는,'+'우선 폐가전제품 배출예약시스템(http://www.15990903.or.kr/ )에 접속해서 <br/>수거 예약을 해야 합니다. 냉장고, 세탁기, 에어컨, TV, 런닝머신, 전자레인지, 데스크탑PC까지 대부분의 품목을 신청할 수 있습니다.'
				+' 일반적으로 시·군·구청에 폐기물 신고를 하거나 주민센터에서 폐기물 스티커를 구입한 다음에 가전제품에 붙여서 배출해야 합니다.';
			}
			
			else if(prediction[8].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = '<h3>일반쓰레기</h3>'+'</br></br>'+'일반 생활 쓰레기는 각 동별로 정해진 배출일의 저녁 8시 ~ 12시에 해당 지역의 청소대행업체 종량제봉투를 사용하여 배출해 주세요.';
			}
			
			else if(prediction[9].probability.toFixed(2) >= 0.90) {
				labelContainer.childNodes[0].innerHTML = "분리수거 방법을 알고 싶은 사물을 비춰주세요!";
			}
			
		}
	</script>
	
</body>
</html>