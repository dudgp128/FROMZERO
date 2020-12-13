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
<style>
ul {
	list-style: none;
}

.tabmenu {
	margin: 0;
	padding: 0px;
	font-size: 15px;
	line-height: 1.3;
	max-width: 1000px;
	margin: 0 auto;
	position: relative;
}

.tabmenu ul li {
	display: inline-block;
	width: 33.33%;
	float: left;
	text-align: center;
	background: #CEF6CE;
	line-height: 40px;
}

.tabmenu label {
	display: block;
	width: 100%;
	height: 40px;
	line-height: 40px;
}

.tabmenu input {
	display: none;
}

.tabCon {
	float: left; /**/
	display: none;
	text-align: left;
	padding: 20px;
	position: absolute;
	left: 0;
	top: 40px;
	box-sizing: border-box;
	border: 5px solid #f9f9f9;
}

.tabmenu input:checked ~ label {
	background: green;
}

.tabmenu input:checked ~ .tabCon {
	display: block;
}

.leftMenu {
	margin-top: 50px;
	margin-left: 50px;
	float: left;
	display: block;
}

.leftMenu li a {
	padding: 10px;
	text-align: center;
}

.bigCategory {
	margin-left: 100px;
	text-align: center;
}

.content {
	float: left;
	background-color: #dddddd;
	/*width: 1200px;*/
}
</style>
<meta charset="UTF-8">
<title>From zero</title>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
%>

</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<%
	String productid = (String) request.getAttribute("productid");
	String detail_productid=(String)request.getAttribute("productid");
	String productname = (String) request.getAttribute("productname");
	String price = (String) request.getAttribute("price");
	String img = (String) request.getAttribute("img");
	String brand = (String) request.getAttribute("brand");
	String big_category = (String) request.getAttribute("big_category");
	String img_num = big_category + "/" + img + ".jpg";
	String detail_img="online_productid/"+detail_productid+".jpg";
	

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
	%>



	<div>
		<h1 id="bigCategory"
			style="text-align: center; margin-top: 20px; text-transform: uppercase;"><%=big_category%></h1>
	</div>

	<div id="menu" style="float: left;">
		<ul class="leftMenu">
			<li><a href="living.jsp" class="submenuLink">LIVING</a></li>
			<li><a href="bathroom.jsp" class="submenuLink">BATHROOM</a></li>
			<li><a href="kitchen.jsp" class="submenuLink">KITCHEN</a></li>
			<li><a href="kit.jsp" class="submenuLink">KIT</a></li>
			<li><a href="etc.jsp" class="submenuLink">ETC</a></li>
		</ul>
	</div>


	<div id="content" style="margin-top: 50px; margin-left: 50px">
		<div class="product-detail">

			<img src=<%=img_num%> width=300 height=300 alt="" align="left"
				style="margin-left: 50px; padding: 0px 30px 0px 0px" />
			<div id="display-text">
				<h2>
					<<%=brand %>>
				</h2>
				<br>
				<h2><%=productname%></h2>
				<h3><%=price%>원
				</h3>
			</div>
			<br> <br> <br> <br> <br>
			<form method="post" action="doBuyingSpinner">
				<p>
					수량 <input id="product_count" type="number" name="product_count"
						min="1" max="10" step="1" value="1" />
				</p>
				<input id="buy" name="action" type="submit" value="BUY" /> <input
					id="cart" name="action" type="submit" value="CART" />
			</form>
			<br> <br> <br>
			<%
			session.setAttribute("productid", productid);
			session.setAttribute("productname", productname);
			session.setAttribute("price", price);
			session.setAttribute("img_num", img_num);
			//session.setAttribute("count", product_count);
			%>
			<div
				style="clear: both; margin-left: 280px; left: 330px; top: 1000px;">

				<div class="div-shop-grid">
					<ul class="ul-shop-grid">
						<br>
						<%
				String re_productid = null;
				String re_productname = null;
				String re_price = null;
				String re_big_category = null;
				String re_img = null;
				String img_li = null;
				String re_brand = null;
				int count = 0;
				int c = 0;
				if (rs != null) {
					while (rs.next()) {
						if (count < 4) {
							re_productid = rs.getString("productid");
							if(!(re_productid.equals(productid))){
								if (re_productid != productid) {
									re_productname = rs.getString("productname");
									re_price = rs.getString("price");
									//re_big_category = rs.getString("big_category");
									re_img = rs.getString("img");
									re_brand = rs.getString("brand");
									count++;
									img_li = big_category + "/" + re_img + ".jpg";
									c++;
									if(c == 1) {
				%>
						<div>
							<br>
							<h3>추천 상품</h3>
							<br>
							<%} 
				%>
							<form style="margin-left: 100px" method="post"
								action="doDetailProduct">
								<button
									style="clear: both; border: 0; outline: 0; background-color: white"
									name="productid" value=<%= re_productid%>>
									<li><a href="product_detail.jsp">
											<div class="recommend"
												style="position: relative; left: -120px; padding: 20px; left-margin: -20px;">
												<img class="recommend_img" src="<%=img_li%>" alt=""
													style="width: 220px; height: 220px">
												<div class="recommended">
													<p>
														<strong><<%=re_brand %>></strong>
													</p>
													<p>
														<strong><%=re_productname%></strong>
													</p>
													<p><%=re_price%>원
													</p>
												</div>
											</div>
									</a></li>
									<%
										}
									}
									}
									}
									}
									%>
								</button>
					</ul>
					</form>
				</div>
			</div>
		</div>

	</div>
	<div class="tabmenu">
		<ul>
			<li id="tab1" class="btnCon"><input type="radio" checked
				name="tabmenu" id="tabmenu1"> <label for="tabmenu1">DETAIL</label>
				<div style="width:100%; margin:0 auto; "class="tabCon">
					<img src="<%=detail_img%>" style="width:100%; height:auto" />
				</div></li>
			<li id="tab2" class="btnCon"><input type="radio" name="tabmenu"
				id="tabmenu2"> <label for="tabmenu2">REVIEW</label>
				<div style="width: 100%" class="tabCon">
					<table style="background-color: #FFFFFF">
						<tr>
							<%
							try {
								conn = DriverManager.getConnection(DBUrl, connectionProps);

								String reviewSql = "select * from review where productid=" + detail_productid;
								pstmt = conn.prepareStatement(reviewSql);
								rset = pstmt.executeQuery();
							} catch (SQLException e) {
								e.printStackTrace();
							}
							int db_review_score = 0;
							String review_date = null;
							String db_custid = "";
							String db_review_content = "";
							String img_score = "";
							while (rset.next()) {
								db_review_score = rset.getInt("review_score");
								review_date = rset.getString("review_date");
								db_custid = rset.getString("custid");
								db_review_content = rset.getString("review_content");

								img_score = "images/rating" + db_review_score + ".png";
							
							%>
							<td style="border-bottom: 1px solid #444444;">
								<table style="background-color: #FFFFFF; text-align:left">
									<tr>
										<td style="width:30%">
											<p>
												<img style="width: 40px" src="<%=img_score%>" alt="" />
										<br/>
										<%=review_date%><br/>
										<strong><%=db_custid%></strong></td>
										<td colspan="3">
											<p><%=db_review_content%></p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<%
						}
						%>
					</table>
				</div></li>
			<li id="tab3" class="btnCon">
			<input type="radio" name="tabmenu" onclick="javascript:window.location.replace('QnA.jsp');"
				id="tabmenu3"><label for="tabmenu3">Q&A</label>
				<div class="tabCon">QNA 페이지로 이동</div></li>
		</ul>
	</div>
</body>
</html>
