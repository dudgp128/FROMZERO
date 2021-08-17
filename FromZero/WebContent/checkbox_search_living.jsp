<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<style>
table {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}
</style>
<script src="./search-checkbox.js"></script>
<meta charset="UTF-8">
<title>From zero</title>
<%
	ArrayList<Product> data = (ArrayList<Product>)request.getAttribute("data");
	String search_result = (String) request.getAttribute("search_result");
%>
<script>
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
		
		
		 var sort=document.getElementsByName("sorted").length;
		for(var i=0; i<sort; i++){
			if(document.getElementsByName("sorted")[i].checked==true) 
				statement+=" #"+document.getElementsByName("sorted")[i].value+"  ";
		}

		document.getElementById("search-statement").value=statement;
}
</script>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>
	<br />
		<form style="margin: 0 auto" method="post" action="doLiving">
		<table style="margin: 0 auto; width: 80%">
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="빨대" id="smallCategory1"> 빨대</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="주머니/가방" id="smallCategory2">주머니/가방</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="집게" id="smallCategory3">집게</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="책/노트" id="smallCategory4">
						책/노트</label></td>
			</tr>


			<tr>
				<th>브랜드</th>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="더피커" id="brand1"> 더피커</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="지구샵" id="brand2"> 지구샵</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="제로웨이스트샵" id="brand3"> 제로웨이스트샵</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="지구살림e" id="brand4"> 지구살림e</label></td>
			</tr>


			<tr>
				<th>가격</th>
				<td><input type="radio" onClick="check()" name="price"
					value="10000" id="one"><label for="one"> ~1만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
					value="30000" id="three"><label for="three"> ~3만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
					value="50000" id="five"><label for="five"> ~5만원</label></td>
				<td/>
			</tr>

			<tr>
				<th>정렬</th>
				<td><input type="radio" onClick="check()" name="sorted"
					value="브랜드순" id="sortBrand"><label for="sortBrand">
						브랜드순</label></td>
				<td><input type="radio" onClick="check()" name="sorted"
					value="이름순" id="sortName"><label for="sortName">
						이름순</label></td>
				<td><input type="radio" onClick="check()" name="sorted"
					value="가격 낮은순" id="sortLowPrice"><label for="sortLowPrice">
						가격 낮은순</label></td>
				<td><input type="radio" onClick="check()" name="sorted"
					value="가격 높은순" id="sortHighPrice"><label
					for="sortHighPrice"> 가격 높은순</label></td>
			</tr>

			<tr>
				<td />
				<td colspan="3" style="text-align: right;"><input type="text"
					name="search_result" style="width: 500px; height: 30px;"
					id="search-statement" readonly="readonly"
					value="<%=search_result%>" /></td>
				<td><button type="reset" class="test-result-button">초기화</button>
					<input type="submit" class="test-result-button" value="검색" /></td>
			</tr>
		</table>
	</form>


	<div class="big-shop-grid">
		<h2 class="big-category-text">LIVING</h2>
		<div class="div-shop-grid">
			<ul class="ul-shop-grid">
				<% 
               for(int i=0; i < data.size(); i++) {
               %>
				<form style="margin-left:100px" method="post" action="doDetailProduct">
					<button style="border: 0; outline: 0; background-color: white"
						name="productid" value=<%= data.get(i).getProductid() %>>
						<li id="li-living-item-box">
							<div class="div-display-living-box" style="margin-left: 0">
								<img class="img-display-box" src="<%=data.get(i).getImg()%>"
									alt="">
								<div class="display-text">
									<p>
										<strong><<%=data.get(i).getBrand()%>></strong>
									</p>
									<p>
										<strong><%=data.get(i).getProductname()%></strong>
									</p>
									<p><%=data.get(i).getPrice()%>원
									</p>
								</div>
							</div>
						</li>

						<%
							}
						%>
					</button>
			</ul>
			</form>
		</div>
	</div>
</body>
</html>