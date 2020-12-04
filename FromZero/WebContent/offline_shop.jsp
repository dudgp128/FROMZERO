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
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
%>
<title>From zero</title>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp" %>

	<div class="big-shop-grid">
		<h2 class="big-category-text"></h2>
		<div class="div-shop-grid">
			<ul class="ul-shop-grid">
			<table style="width: 600px; height: 300px; border: 1px">
					<tr>
						<td rowspan="5"><img id="img_td"
							src="images/offline_store-1.jpg" height="180px"></td>
						<td><p><%=rs.getString("storename") %></p></td>
					</tr>
					             <tr>
                     <td><p id="number_td">02-000-0000</p></td>
                  </tr>
                  <tr>
                     <td style="width:100%"><p id="address_td">서울 마포구 합정동 월드컵로 49 한우마을 2층</p></td>
                  </tr>


                  <tr>
                     <td colspan="2">
                        <button type="submit"
                           style="text-align: center; padding: 10px 30px">shop</button>
                  </tr>
				</table>
				<%
					String img;
				String img_li = null;
				while (rs.next()) {
					String productname = null;
					String price = null;
					int i=0;
					i=rs.getInt("storeid");
					productname = rs.getString("offlineproduct_name");
					price = rs.getString("offlineproduct_price");
					img = rs.getString("offlineproduct_id");
					img_li = "offline_store_img/Store"+i+"/"+img+ ".jpg";

					System.out.println(productname);
				%>
				<li id="li-living-item-box"><a href="living-item1.html">
						<div class="div-display-living-box">
							<img class="img-display-box" src="<%=img_li%>" alt="">
							<div class="display-text">
								<strong><%=productname%></strong>
								<p><%=price%>원
								</p>
							</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</body>
</html>