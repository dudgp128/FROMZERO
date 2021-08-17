<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="./search-checkbox.js"></script>
<meta charset="UTF-8">
<title>From zero</title>
<script>
function doSort(select_value) {
	/*
	document.getElementById('selected').value = select_value;
	location.href="./doSort";
	*/
}
</script>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp"%>

	</br>

	<form method="post" action="doLiving">
		<table>
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="빨대" id="smallCategory1"> 빨대</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="주머니/가방" id="smallCategory2">
						주머니/가방</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="집게" id="smallCategory3"> 집게</label></td>
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
				<td />
			</tr>


			<tr>
				<th>가격</th>
				<td><input type="radio" onClick="check()" name="price"
					value="10000" id="one"><label for="one"> ~1만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
					value="30000" id="three"><label for="three"> ~3만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
					value="50000" id="five"><label for="five"> ~5만원</label></td>
			</tr>

			<tr>
				<td />
				<td />
				<td colspan="4" style="text-align: right;"><input type="text"
					name="search_result" style="width: 500px; height: 30px;"
					id="search-statement" readonly="readonly" /></td>
				<td style="text-align: left"><button type="reset">초기화</button></td>
				<td style="text-align: left"><input type="submit" value="검색" />
			</tr>
		</table>
	</form>

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

					String sqlSt = "select * from online_product where big_category='living' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String productname = null;
	            int price = 0;
	            int img_count = 0;
	            String img_li = null;
	            String productid = null;
	            String small_category = null;
	            String big_category = null;
	            String img = null;
	            String brand = null;

	            List<String> p_name = new ArrayList<>();
	            List<String> p_price = new ArrayList<>();
	            
	            ArrayList<Product> data = new  ArrayList<Product>();
	            int k = 0;
	            while (rset.next()) {
	            	productid = rset.getString("productid");
	            	productname = rset.getString("productname");
	            	brand = rset.getString("brand");
	               price = rset.getInt("price");
	               big_category = rset.getString("big_category");
	               small_category = rset.getString("small_category");
	               img_li = rset.getString("img");
	               p_name.add(productname);
	               img = "living/" + img_li + ".jpg";
	               data.add(new Product(productid, productname,brand,price, big_category, small_category, img));

	            }
	            %>

	<div class="big-shop-grid">
		<h2 class="big-category-text">LIVING</h2>
		<div class="div-shop-grid">
			<form method="post"  action="doSort">
			<%session.setAttribute("data", data); %>
			<% String value = "none"; %>
			 <input type="text" id="selected" name="selected" value="<%=value %>" style="height: 30px" /> 
			 <input type="hidden" name="len" value="<%=data.size()%>" style="height: 3px" /> 
				<select name="sort" onchange="doSort(this.value);">
					<option value="none">정렬</option>
					<option value="sortBrand"><button type="submit">브랜드순</button></option>
					<option value="sortName">이름순</option>
					<option value="sortLowPrice">가격 낮은순</option>
					<option value="sortHighPrice" onchange="<%PriceDescending PriceDescending = new PriceDescending();
						Collections.sort(data, PriceDescending);%>">가격 높은순</option>
				</select>
			</form>
			<ul class="ul-shop-grid">
				<% 
	            PriceAscending PrnameAscending = new PriceAscending();
	            Collections.sort(data, PrnameAscending);
	            for(int i=0; i < data.size(); i++) {
	               
	            %>
				<form method="post" action="doDetailProduct">
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
							</div> </a>
						</li>

						<%
							}
						Collections.sort(p_name); 
						%>
					</button>
			</ul>
			</form>
		</div>
	</div>
</body>
</html>