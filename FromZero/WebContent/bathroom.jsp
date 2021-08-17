<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="./search-checkbox.js"></script>
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
<meta charset="UTF-8">
<title>From zero</title>
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

	<!-- 체크박스 -->
	<br />
	<form style="margin: 0 auto" method="post" action="doBathroom">
		<table style="margin: 0 auto; width: 80%">
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" name="smallCategory"
						onClick="check()" value="비누" id="smallCategory1"> 비누</label></td>
				<td><label><input type="checkbox" name="smallCategory"
						onClick="check()" value="샤워" id="smallCategory2"> 샤워</label></td>
				<td><label><input type="checkbox" name="smallCategory"
						onClick="check()" value="타월" id="smallCategory3"> 타월</label></td>
				<td />
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
				<td />
			</tr>

			<tr>
				<th>정렬</th>
				<td><input type="radio" name="sorted" onClick="check()"
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
					id="search-statement" readonly="readonly" /></td>
				<td style="text-align: left"><button type="reset"
						class="test-result-button">초기화</button> <input type="submit"
					class="test-result-button" value="검색" />
			</tr>
		</table>
	</form>
	<div class="big-shop-grid">
		<h2 class="big-category-text">BATHROOM</h2>
		<div class="div-shop-grid">
			<ul class="ul-shop-grid">
				<%
					PreparedStatement pstmt = null;
				ResultSet rset = null;
				Connection conn = null;
				Properties connectionProps = new Properties();

				String DBUrl = "jdbc:mysql://localhost:3306/fz_webapp";
				String DBuser = "fz_webapp";
				String DBpasswd = "fz_webapp";
				String DBTimeZone = "UTC";

				connectionProps.put("user", DBuser);
				connectionProps.put("password", DBpasswd);
				connectionProps.put("serverTimezone", DBTimeZone);
				String name = null;
				try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='bathroom' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String productname = null;
				String price = null;
				int img_count = 0;
				String img_li = null;
				String productid = null;
				String brand = null;
				while (rset.next()) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					brand = rset.getString("brand");
					img_count++;
					img_li = "bathroom/" + img_count + ".jpg";
				%>
				<form style="margin-left: 100px" method="post" action="doDetailProduct">
					<button style="border: 0; outline: 0; background-color: white"
						name="productid" value=<%= productid%>>
						<li id="li-living-item-box">
							<div class="div-display-living-box">
								<img class="img-display-box" src="<%=img_li%>" alt="">
								<div class="display-text">
									<p>
										<strong><<%=brand%>></strong>
									</p>
									<p>
										<strong><%=productname%></strong>
									</p>
									<p><%=price%>원
									</p>
								</div>
							</div> </a>
						</li>

						<%
							}
						%>
					</button>
			</ul>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>