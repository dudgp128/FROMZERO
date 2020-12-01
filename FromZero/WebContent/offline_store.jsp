<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
<meta charset="UTF-8">
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="offline_store.js"></script>

<title>From zero</title>
<style>
.map_image, .map_info {
	margin: 50px;
}
</style>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp"%>


	<div class="big-shop-grid">
		<div class="div-shop-grid">
			<div class="map_image" style="float: left;">
				<div style="position: relative; top: 120px, left:76px">
					<img src="images/seoul_map_store.jpg" width="400" usemap="#Map">
					<map name="Map" id="Map">
						<area shape="rect" coords="134,136,160,152" onClick="Store1()"
							tabindex="1">
						<area shape="rect" coords="165,200,192,217" onClick="Store2()"
							tabindex="2">
						<area shape="rect" coords="238,158,267,175" onClick="Store3()"
							tabindex="3">
						<area shape="rect" coords="183,139,213,157" onClick="Store4()"
							tabindex="4">
						<area shape="rect" coords="315,173,344,190" onClick="Store5()"
							tabindex="5">
						<area shape="rect" coords="133,136,174,176" onClick="Store6()"
							tabindex="6">
					</map>
				</div>
			</div>

				<div class="map_info" style="float: right;">
					<table class="table_div" style="width: 450px; height: 100px;">

						<tr>
							<td rowspan="4"><img id="img_td"
								src="images/offline_store-1.jpg" height="180px"></td>
							<td><p id="name_td">알맹상점</p></td>
						</tr>


						<tr>
							<td><p id="number_td">02-000-0000</p></td>
						</tr>
						<tr>
							<td><p id="address_td">서울 마포구 합정동 월드컵로 49 한우마을 2층</p></td>
						</tr>


						<tr>
							<td colspan="2">
								<button type="button"
									style="text-align: center; padding: 10px 30px">shop</button>
						</tr>


					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>