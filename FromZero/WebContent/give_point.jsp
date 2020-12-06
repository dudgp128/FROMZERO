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
<title>Admin Page</title>
</head>
<body>
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

	String offlineproduct_name = null;
	String offlineproduct_num = null;
	String offlineproduct_price = null;
	String offlineproduct_id = null;
	%>
	<header>
		<h1>From zero</h1>
		<div style="font-size: 13pt">Admin Page for Offline Shop</div>
	</header>
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a href="admin-main.jsp" class="menuLink"
				href="">들어온 주문내역 확인</a></li>
			<li>|</li>
			<li class="topMenuLi"><a href="update_stock.jsp"
				class="menuLink" href="">재고 변경</a></li>
			<li>|</li>
			<li class="topMenuLi"><a href="give_point.jsp" class="menuLink" href="">고객 포인트 지급</a>
			</li>

		</ul>
	</nav>
	<ul class="loginarea">
		<li><a>logout</a></li>
	</ul>

	<div class="title">
		<h2 style="text-align: center">고객 포인트 지급</h2>
	</div>

	<div class="question_box">
		<table>
			<tr>
				<!-- <td>사진</td> -->
				<td><h3>상품번호</h3>
				<td><h3>상품명</td>
				<td><h3>상품가격</td>
				<td><h3>재고</td>
			</tr>
			<form method="post" action="doUpdateStock">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select * from offline_product where storeid=1";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				//String img = null;
				while (rset.next()) {
					//img = rset.getString("img");
					offlineproduct_name = rset.getString("offlineproduct_name");
					offlineproduct_price = rset.getString("offlineproduct_price");
					offlineproduct_num = rset.getString("offlineproduct_num");
					offlineproduct_id = rset.getString("offlineproduct_id");
				%>
			
			<tr>
				<!-- <td></td> -->
				<td><input type="text" value="<%=offlineproduct_id%>"
					id="productID" name="product_id" readonly="readonly"
					style="border: none; background: transparent; pointer-events: none; text-align: center; width: 100px; height: 20px;" /></td>
				<td><%=offlineproduct_name%></td>
				<td><%=offlineproduct_price%>원</td>
				<td><input id="productNum" type="number" name="product_num"
					min="0" step="1" value=<%=offlineproduct_num%>
					onchange="javascript: document.getElementById('productNum').value = this.value;
							  javascript: document.getElementById('productID').value = <%=offlineproduct_id%>" /></td>
				<td><button type="submit">UPDATE</button></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</form>
		</table>



	</div>

</body>
</html>