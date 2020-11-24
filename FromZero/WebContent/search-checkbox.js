function check(){
	statement="";
        var check_count = document.getElementsByName("smallCategory").length;
		var check_count2 = document.getElementsByName("brandName").length; 
        
		for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("smallCategory")[i].checked == true) 
               	statement+=" #"+document.getElementsByName("smallCategory")[i].value+"  "; 
           }

		for (var i=0; i<check_count2; i++) {
            if (document.getElementsByName("brandName")[i].checked == true) 
               	statement+=" #"+document.getElementsByName("brandName")[i].value+"  "; 
           }

   		 var price=document.getElementsByName("price").length;
		for(var i=0; i<price; i++){
			if(document.getElementsByName("price")[i].checked)
				statement+=" #"+document.getElementsByName("price")[i].value+"  ";
		}
		
		document.getElementById("search-statement").value=statement;
}