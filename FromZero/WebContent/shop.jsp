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
<style>
	.
</style>
</head>

<body style="overflow-x: hidden">
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
	%>
	<%@ include file="./fz_header.jsp" %>

		<div style="margin-left: 150px" class="div-shop-grid">
			<ul class="ul-shop-grid" style="margin-right:0">
			<a href="living.jsp"><h2 style="margin-left:0" class="big-category-text">LIVING ></h2></a>
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='living' order by binary(big_category), binary(brand), price, productid";
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

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					img_count++;
					img_li = "living/" + img_count + ".jpg";
					brand = rset.getString("brand");
				%>
				<form style="margin-right:0; width:100%" method="post" action="doDetailProduct" >
	            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
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
	                  </div>
	                  
	            </a></li>
	            
	            <%
	               }
	            %>
	            </button>
	         </ul>
	         </form>
			
			<ul class="ul-shop-grid" style="margin-right:0">
			<a href="bathroom.jsp"><h2 style="margin-left:0" class="big-category-text">BATHROOM
					></h2></a>
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='bathroom' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				productid = null;
				img_count = 0;
				img_li = null;
				

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					img_count++;
					img_li = "bathroom/" + img_count + ".jpg";
					brand = rset.getString("brand");

				%>
				<form method="post" action="doDetailProduct" style="margin-right:0; width:100%">
	            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
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
	                  </div>
	                  
	            </a></li>
	            
	            <%
	               }
	            %>
	            </button>
	         </ul>
	         </form>
			
			<ul class="ul-shop-grid"  style="margin-right:0">
			<a href="kitchen.jsp"><h2 style="margin-left:0" class="big-category-text">KITCHEN
					></h2></a>
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='kitchen' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;
				productid = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					img_count++;
					img_li = "kitchen/" + img_count + ".jpg";
					brand = rset.getString("brand");

				%>
				<form method="post" action="doDetailProduct" style="margin-right:0; width:100%">
	            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
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
	                  </div>
	                  
	            </a></li>
	            
	            <%
	               }
	            %>
	            </button>
	         </ul>
	         </form>
			
			<ul class="ul-shop-grid"  style="margin-right:0">
			<a href="kit.jsp"><h2 style="margin-left:0" class="big-category-text">KIT ></h2></a>
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='kit' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;
				productid = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					img_count++;
					img_li = "kit/" + img_count + ".jpg";
					brand = rset.getString("brand");
				%>
				<form method="post" action="doDetailProduct" style="margin-right:0; width:100%">
	            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
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
	                  </div>
	                  
	            </a></li>
	            
	            <%
	               }
	            %>
	            </button>
	         </ul>
	         </form>
			
			<ul class="ul-shop-grid"  style="margin-right:0">
			<a href="etc.jsp"><h2 style="margin-left:0" class="big-category-text">ETC ></h2></a>
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from online_product where big_category='etc' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				productname = null;
				price = null;
				img_count = 0;
				img_li = null;
				productid = null;

				while (rset.next() && img_count < 5) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					img_count++;
					productid = rset.getString("productid");
					img_li = "etc/" + img_count + ".jpg";
					brand = rset.getString("brand");
				%>
				<form method="post" action="doDetailProduct" style="margin-right:0; width:100%">
	            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
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
	                  </div>
	                  
	            </a></li>
	            
	            <%
	               }
	            %>
	            </button>
	         </ul>
	         </form>
		</div>


</body>
</html>