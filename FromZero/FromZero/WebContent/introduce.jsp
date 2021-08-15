<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--<link rel="stylesheet" href="./fromzero.css" type="text/css">-->
<meta charset="UTF-8">
<title>From zero</title>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

#slider-wrap {
	width: 602px;	/*이미지 크기 70%*/
	height: 770px; /*dot 위치 확인*/
	position: relative;
	overflow: hidden;
	margin: 0 auto;
}

#slider-wrap ul#slider {
	height: 100%;
	position: absolute;
	top: 70px; /*내비바와 이미지 슬라이드 간 거리*/
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 600px;
}

#slider-wrap ul#slider li>div {
	position: absolute;
	top: 20px;
	left: 35px;
}

#slider-wrap ul#slider li>div h3 {
	font-size: 36px;
	text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
	font-size: 21px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 85%;
	height: 100%;
}

/*btns*/
.slider-btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	z-index: 100;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.slider-btns:hover {
	background: rgba(0, 0, 0, 0.3);
}

#next {
	right: -50px;
	border-radius: 7px 0px 0px 7px;
	color: #eee;
}

#previous {
	left: -50px;
	border-radius: 0px 7px 7px 7px;
	color: #eee;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

/*bar*/
#slider-pagination-wrap {
	min-width: 20px;
	margin-top: 350px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#slider-pagination-wrap ul {
	width: 100%;
}

#slider-pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: -270px;	/* dot 위치 조절 top으로 */
}

#slider-pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: -270px;
	opacity: 1;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

#slider-wrap img {
	display: block;
	margin: 0px auto;
	z-index: 2;
}

/*ANIMATION*/
#slider-wrap ul, #slider-pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>
	
	<div id="slider-wrap">
		<ul id="slider">
			<li>
				<div></div> <img src="images/introduce01.jpg">
			</li>

			<li>
				<div></div> <img src="images/introduce02.jpg">
			</li>

			<li>
				<div></div> <img src="images/introduce03.jpg">
			</li>
		</ul>

		<div class="slider-btns" id="next">
			<span>▶</span>
		</div>
		<div class="slider-btns" id="previous">
			<span>◀</span>
		</div>

		<div id="slider-pagination-wrap">
			<ul>
			</ul>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<script>
		//slide-wrap
		var slideWrapper = document.getElementById('slider-wrap');
		//current slideIndexition
		var slideIndex = 0;
		//items
		var slides = document.querySelectorAll('#slider-wrap ul li');
		//number of slides
		var totalSlides = slides.length;
		//get the slide width
		var sliderWidth = slideWrapper.clientWidth;
		//set width of items
		slides.forEach(function(element) {
			element.style.width = sliderWidth + 'px';
		})
		//set width to be 'x' times the number of slides
		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';

		// next, prev
		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function() {
			plusSlides(1);
		});
		prevBtn.addEventListener('click', function() {
			plusSlides(-1);
		});

		// hover
		slideWrapper.addEventListener('mouseover', function() {
			this.classList.add('active');
			clearInterval(autoSlider);
		});
		slideWrapper.addEventListener('mouseleave', function() {
			this.classList.remove('active');
			autoSlider = setInterval(function() {
				plusSlides(1);
			}, 3000);
		});

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlides(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			slideIndex = n;
			if (slideIndex == -1) {
				slideIndex = totalSlides - 1;
			} else if (slideIndex === totalSlides) {
				slideIndex = 0;
			}

			slider.style.left = -(sliderWidth * slideIndex) + 'px';
			pagination();
		}

		//pagination
		slides.forEach(function() {
			var li = document.createElement('li');
			document.querySelector('#slider-pagination-wrap ul')
					.appendChild(li);
		})

		function pagination() {
			var dots = document
					.querySelectorAll('#slider-pagination-wrap ul li');
			dots.forEach(function(element) {
				element.classList.remove('active');
			});
			dots[slideIndex].classList.add('active');
		}

		pagination();
		var autoSlider = setInterval(function() {
			plusSlides(1);
		}, 3000);
		
		var scrollingElement = (document.scrollingElement || document.body);
		scrollingElement.scrollTop = scrollingElement.scrollHeight;
		
		function gotoBottom(id){
			   var element = document.getElementById(id);
			   element.scrollTop = element.scrollHeight - element.clientHeight;
			}
	</script>
	
</body>
</html>