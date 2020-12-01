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
<title>From zero</title>
<style>
.map_image, .map_info {
	float: left;
}
</style>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp" %>


	<div class="big-shop-grid">
		<div class="div-shop-grid">
			<div class="map_image" style="position: absoulte;">
				<div style="position: relative; top: 120px, left:76px">
					<img src="images/seoul_map_store.jpg" width="400">
				</div>
			</div>
			<div style="positoin: absoulte;">
				<div style="position: relative; top:120px; z-index:2; left:-300px">
					<img src="images/offline_store-1.jpg" width="20">
				</div>
				<div class="map_info">
					<table class="table_div">
						<tr>
							<td rowspan="4"><img src="images/offline_store-1.jpg"
								width="150"></td>
							<td>~~~~가게이름~~~~~</td>
						</tr>
						<tr>
							<td>02-000-0000</td>
						</tr>
						<tr>
							<td>서울 마포구 합정동 월드컵로 49 한우마을 2층</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
</body>
</html>