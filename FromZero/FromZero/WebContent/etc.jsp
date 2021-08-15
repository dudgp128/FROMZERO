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
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>
	<!-- 체크박스 -->
	<div class="big-shop-grid">
		<div class="div-shop-grid">

			<br />
			<!-- 
			<form>
				<table>
					<tr>
						<th>상세검색</th>
						<td />
						<td />
						<td />
						<td />
					</tr>
					<tr>
						<th>소분류</th>
						<td><label><input type="checkbox"
								name="smallCategory" value="straw" id="straw"> 빨대</label></td>
						<td><label><input type="checkbox"
								name="smallCategory" value="tumblr" id="tumblr"> 텀블러</label></td>
						<td><label><input type="checkbox"
								name="smallCategory" value="carrier" id="carrier"> 장바구니</label></td>
						<td><label><input type="checkbox"
								name="smallCategory" value="pouch" id="pouch"> 파우치</label></td>
						<td><label><input type="checkbox"
								name="smallCategory" value="strawPouch" id="strawPouch">
								빨대 주머니</label></td>
					</tr>


					<tr>
						<th>브랜드</th>
						<td><label><input type="checkbox" name="brandName"
								value="thepicker" id="thepicker"> 더피커</label></td>
						<td><label><input type="checkbox" name="brandName"
								value="jigushop" id="jigushop"> 지구샵</label></td>
						<td><label><input type="checkbox" name="brandName"
								value="zwshop" id="zwshop"> 제로웨이스트샵</label></td>
						<td><label><input type="checkbox" name="brandName"
								value="jigusalimi" id="jigusalimi"> 지구살림e</label></td>
						<td />
					</tr>


					<tr>
						<th>가격</th>
						<td><label><input type="checkbox" name="price"
								value="one" id="one"> ~1만원</label></td>
						<td><label><input type="checkbox" name="price"
								value="three" id="three"> ~3만원</label></td>
						<td><label><input type="checkbox" name="price"
								value="five" id="five"> ~5만원</label></td>
						<td />
						<td style="text-align: right;"><input type="submit"
							value="검색" />
						<td />
					</tr>
				</table>
			</form>
			 -->
			<div class="big-shop-grid">
				<h2 class="big-category-text">ETC</h2>
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

							String sqlSt = "select * from online_product where big_category='etc' order by binary(big_category), binary(brand), price, productid";
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
			            String brand=null;

			            while (rset.next()) {
			               productname = rset.getString("productname");
			               price = rset.getString("price");
			               productid = rset.getString("productid");
			               brand = rset.getString("brand");
			               img_count++;
			               img_li = "etc/" + img_count + ".jpg";
			            %>
							<form style="margin-left:100px" method="post" action="doDetailProduct">
			            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
			            <li id="li-living-item-box">
			                  <div class="div-display-living-box">
			                     <img class="img-display-box" src="<%=img_li%>" alt="">
			                     <div class="display-text">
			                     <p><strong><<%=brand%>></strong></p>
			                        <p><strong><%=productname%></strong></p>
			                        <p><%=price%>원
			                        </p>
			                     </div>
			                  </div>
			                  
			            </a></li>
			            
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