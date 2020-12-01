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
	max-width: 930px;
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
float:left;/**/
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
<%ResultSet rs = (ResultSet)request.getAttribute("rs");%>

</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>

<%
	String productname = null;
	String price = null;
	String img = null;
	String img_num = null;
	String big_category = null;
	String small_category = null;
	if(rs.next()) {
		productname = rs.getString("productname");
		price = rs.getString("price");
		img = rs.getString("img");
		big_category = rs.getString("big_category");
		small_category = rs.getString("small_category");
		
		
		img_num = big_category + "/" + img + ".jpg";
		System.out.println(productname);
		}
		%>


	<div>
		<h1 id="bigCategory" style="text-align: center; margin-top: 20px; text-transform: uppercase;"><%= big_category %></h1>
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
		
			<img src=<%= img_num %> width=300 height=300 alt="" align="left"
				style="margin-left: 50px; padding: 0px 30px 0px 0px" /> <br>
			<br>
			<div id="display-text">
				<h2><%= productname %></h2>
				<h4><%= price %>원</h4>
				<h4>배송비</h4>
			</div>
			<br> <br> <br> <br> <br>
			<p>
				수량 <input id="product-count" type="number" name="product-count"
					min="1" max="10" step="1" value="1" />
			</p>
			<form method="post">
				<input id="buy" type="submit" value="BUY" /> <input id="cart"
					type="submit" value="CART" />
			</form>
			<br><br><br>
		<p>
		<div class="tabmenu">
			<ul>
				<li id="tab1" class="btnCon"><input type="radio" checked
					name="tabmenu" id="tabmenu1"> <label for="tabmenu1">DETAIL</label>
					<div class="tabCon">DETAIL 페이지 _ Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div></li>
				<li id="tab2" class="btnCon"><input type="radio" name="tabmenu"
					id="tabmenu2"> <label for="tabmenu2">REVIEW</label>
					<div class="tabCon">REVIEW 페이지 _ It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</div></li>
				<li id="tab3" class="btnCon"><input type="radio" name="tabmenu"
					id="tabmenu3"> <label for="tabmenu3">Q&A</label>
					
					<div class="tabCon">QNA 페이지 _ There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</div></li>
			</ul>
		</div>
		
		<div style="clear:both; position:absolute; left:330px; top:1000px;">
			<h3>추천 상품</h3>
			<br>
			<li><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="living/2.jpg" alt="">
							<div class="display-text">
								<strong>상품 이름</strong>
								<p>가격
								</p>
							</div>
						</div>
				</a></li>
		</div>
		</p>
		</div>
		</div>
</body>
</html>
