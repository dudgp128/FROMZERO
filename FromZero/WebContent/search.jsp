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

<%
   ResultSet rset = (ResultSet) request.getAttribute("rs");
%>
<%
   String search_text = (String) request.getAttribute("search_text");
%>
</head>
<body style="overflow-x: hidden">

   <%@ include file="./fz_header.jsp" %>

	<div class="big-shop-grid" style="text-align:center; margin-top: 30px;">
	<h2>[<%=search_text %>] 검색 결과</h2>
		<div class="div-shop-grid" style="margin-top: 40px;">
			<ul class="ul-shop-grid">
				<%
				String productname = null;
				String price = null;
				String img = null;
				String img_li = null;
				String productid = null;
				String brand = null;
				String big_category = null;
				while (rset.next()) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					img = rset.getString("img");
					brand = rset.getString("brand");
					big_category = rset.getString("big_category");
					img_li = big_category + "/" + img + ".jpg";
				%>
				<form style="margin-left:100px" method="post" action="doDetailProduct">
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
</body>
</html>