function call() {
	var score = document.getElementById('score');
			
	with( document.question ) {
		score.value = 
		parseInt(q1.value)+
		parseInt(q2.value)+
		parseInt(q3.value)+
		parseInt(q4.value)+
		parseInt(q5.value)+
		parseInt(q6.value)+
		parseInt(q7.value)+
		parseInt(q8.value);
	}
	
	if (score.value <= 12) {
		document.getElementById("img").src = "./level/sprout.png";
		document.getElementById("result").innerHTML="당신은 '새싹' 레벨입니다!";
		}
		
	if (12 < score.value && score.value <= 20) {
		document.getElementById("img").src = "./level/plant.png";
		document.getElementById("result").innerHTML="당신은 '화분' 레벨입니다!";
		}
	if (20 < score.value && score.value <= 27) {
		document.getElementById("img").src = "./level/tree.png";
		document.getElementById("result").innerHTML="당신은 '나무' 레벨입니다!";
		}
	if (27 < score.value && score.value <= 32) {
		document.getElementById("img").src = "./level/forest.png";
		document.getElementById("result").innerHTML="더 이상 올라갈 곳이 없는 당신!<br>당신은 '숲' 레벨입니다!";
		}
}