var num=0;

function show() {
	
	var order =	localStorage.getItem('num');
	
	if (order == 1) {
		document.getElementById("img").src = "./level/sprout.png";
		document.getElementById("result").innerHTML="당신은 '새싹' 레벨입니다!";
		}
		
	if (order == 2) {
		document.getElementById("img").src = "./level/plant.png";
		document.getElementById("result").innerHTML="당신은 '화분' 레벨입니다!";
		}
		
	if (order == 3) {
		document.getElementById("img").src = "./level/tree.png";
		document.getElementById("result").innerHTML="당신은 '나무' 레벨입니다!";
		}
		
	if (order == 4){
		document.getElementById("img").src = "./level/forest.png";
		document.getElementById("result").innerHTML="더 이상 올라갈 곳이 없는 당신!<br>당신은 '숲' 레벨입니다!";
		}
	
	document.getElementById("result").innerHTML=number;
}

function call() {	

	var score = document.getElementById('score');
	
	// 모든 문항에 체크되지 않을 경우 경고 메세지 출력
	var checkedCnt=0;
	
	for (var i=1 ; i<9 ; i++) {

		var checkedRadio=[];
		checkedRadio[i] = document.getElementsByName("q"+i);
	
		for (var j=0; j<checkedRadio[i].length;j++)
			if (checkedRadio[i][j].checked==true)
				checkedCnt++;
	}
	
	if(checkedCnt<8) {
		alert("모든 문항에 체크하세요!");
		document.question.checkedRadio[0].focus();
		return;
	}
	
	else {
	
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
	

		if (score.value <= 12)
			localStorage.setItem('num', 1);
		
		if (12 < score.value && score.value <= 20)
			localStorage.setItem('num', 2);
		
		if (20 < score.value && score.value <= 27)
			localStorage.setItem('num', 3);
		
		if (27 < score.value && score.value <= 32)
			localStorage.setItem('num', 4);
		
		window.location.href='test-result.jsp';
	}
}