function check(){
	statement="";
	var checklist_small=[document.getElementById("zipge"),document.getElementById("carrier"),document.getElementById("note"),document.getElementById("straw")];
	var checklist_brand = [document.getElementById("thepicker"), document.getElementById("jigushop"),document.getElementById("zwshop"),document.getElementById("jigusalimi")];
	var price=document.getElementsByName("price").length;

	for(var i=0; i<checklist_small.length; i++){
		if(checklist_small[i].checked)		
			statement+=" #"+checklist_small[i].value+"  ";
	}
	
	for(var i=0; i<checklist_brand.length; i++){
		if(checklist_brand[i].checked==true)
			statement+=" #"+checklist_brand[i].value+"  ";
	}
	for(var i=0; i<price; i++){
		if(document.getElementsByName("price")[i].checked)
			statement+=" #"+document.getElementsByName("price")[i].value+"  ";
	}
	document.getElementById("search-statement").value=statement;

}