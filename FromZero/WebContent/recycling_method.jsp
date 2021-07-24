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
	<div id="webcam-container" style="display: inline-block;"></div>
	<div id="label-container" style="display: inline-block; width: 400px; padding: 100px;" ></div>
	</div>
	
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<script type="text/javascript">
		// More API functions here:
		// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

		// the link to your model provided by Teachable Machine export panel
		const URL = "./my_model/";
		let model, webcam, labelContainer, maxPredictions;

		// Load the image model and setup the webcam
		async function init() {
			const modelURL = URL + "model.json";
			const metadataURL = URL + "metadata.json";
							
			// load the model and metadata
			// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
			// or files from your local hard drive
			// Note: the pose library adds "tmImage" object to your window (window.tmImage)
			model = await tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();

			// Convenience function to setup a webcam
			const flip = true; // whether to flip the webcam
			webcam = new tmImage.Webcam(400, 400, flip); // width, height, flip
			await webcam.setup(); // request access to the webcam

			await webcam.play();
			
			window.requestAnimationFrame(loop);

			// append elements to the DOM
			document.getElementById("webcam-container").appendChild(webcam.canvas);
			labelContainer = document.getElementById("label-container");
			for (let i = 0; i < maxPredictions; i++) { // and class labels
				labelContainer.appendChild(document.createElement("div"));
			}
		}

		async function loop() {
			webcam.update(); // update the webcam frame
			await predict();
			window.requestAnimationFrame(loop);
		}

		// run the webcam image through the image model
		async function predict() {
			// predict can take in an image, video or canvas html element
			const prediction = await model.predict(webcam.canvas);
			if(prediction[0].probability.toFixed(2) >= 0.90){
				labelContainer.childNodes[0].innerHTML = "이것은 캔들입니다. 내용물은 일반쓰레기, 내용물을 비운 것은 유리로 분리수거해주세요.";
			}
			for (let i = 0; i < maxPredictions; i++) {
				const classPrediction = prediction[i].className + ": "
						+ prediction[i].probability.toFixed(2);
				labelContainer.childNodes[i].innerHTML = classPrediction;
			}
			if(prediction[0].probability.toFixed(2) >= 0.90){
				labelContainer.childNodes[0].innerHTML = "이것은 캔들입니다. 내용물은 일반쓰레기, 내용물을 비운 것은 유리로 분리수거해주세요.";
			}
		}
	</script>
	
</body>
</html>