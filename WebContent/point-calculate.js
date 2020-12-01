function call() {
			var display=document.getElementById('display');
			var calculate=document.getElementById('calculate-result');
		
			
			
			if (document.getElementById("soju").value
					&& document.getElementById("macju").value
					&& document.getElementById("milk").value
					&& document.getElementById("water").value){
				
				calculate.value = parseInt(document.getElementById('soju').value)*100
				+parseInt(document.getElementById('macju').value)*140
				+parseInt(document.getElementById('milk').value)*400
				+parseInt(document.getElementById('water').value)*50;
				
				
				display.value="("+document.getElementById('soju').value+"x100)+"+
				"("+document.getElementById('macju').value+"x140)+"+
				"("+document.getElementById('milk').value+"x400)+"+
				"("+document.getElementById('water').value+"x50)";	
			}
			}