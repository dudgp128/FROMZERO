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
<%
	String user_id = (String) session.getAttribute("user_id");
String user_name = (String) session.getAttribute("user_name");
%>
<style>
th, td {
	background-color: #FFFFFF;
	border-bottom: 1px solid #D3D3D3;
	padding: 10px;
}

table {
	border-top: 1px solid #444444;
	margin: auto;
	text-align: center;
	background-color: #FFFFFF;
}
</style>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
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

	String store_id = null;
	String name = null;
	String num = null;
	String price = null;
	String product_id = null;
	%>
	<br />

	<header>
		<h1>
			<a href="admin_point.jsp"> <img src="./농부제로로고.png" width="200px"
				alt="My Image">
			</a>
		</h1>
	</header>
	</br>

	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a href="admin-main.jsp" class="menuLink"
				href="">들어온 주문내역 확인</a></li>
			<li>|</li>
			<li class="topMenuLi"><a href="update_stock.jsp"
				class="menuLink" href="">재고 변경</a></li>
			<li>|</li>
			<li class="topMenuLi"><a href="admin_point.jsp" class="menuLink"
				href="">고객 포인트 차감</a></li>

		</ul>
	</nav>


	<ul class="loginarea">
		<li><a><%=user_name%> 관리자님, 안녕하세요!</a>
		<li><a href="./doLogout">logout</a></li>
		<li><a href="main.jsp">home</a></li>
	</ul>


	<div class="title">
		<h2 style="text-align: center">상품 재고 변경</h2>
		<div style="margin-left: 800px">
			<button class="test-result-button" type="button"
				onclick="location.href='new_offline_stock.jsp'">
				<a href='new_offline_stock.jsp'> + </a>
			</button>
			<h5>제품 추가하기</h5>
		</div>
	</div>


	<div style="text-align: center">
		<div style="display: inline-block;">
			<table style="width: 900px; border-collapse:collapse;">
				<tr>
					<td colspan=5 style="border-bottom:0; text-algin: center; ">제품 삭제하는 방법 : 수량을 -1로
						설정해주세요!</td>
				</tr>
				<tr>
					<!-- <td>사진</td> -->
					<td style="text-size: 15px; border-bottom: 1px solid #444444;"><b>상품번호</b></td>
					<td style="text-size: 15px; border-bottom: 1px solid #444444;"><b>상품명</b></td>
					<td style="text-size: 15px; border-bottom: 1px solid #444444;"><b>상품가격</b></td>
					<td style="text-size: 15px; border-bottom: 1px solid #444444;"><b>재고</b></td>
					<td style="border-bottom: 1px solid #444444;"></td>
				</tr>


				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);
					String sqlSt = null;

					if (user_id.equals("off_admin1")) {
						sqlSt = "select * from offline_product where storeid=1";
					} else if (user_id.equals("off_admin2")) {
						sqlSt = "select * from offline_product where storeid=2";
					} else if (user_id.equals("off_admin3")) {
						sqlSt = "select * from offline_product where storeid=3";
					} else if (user_id.equals("off_admin4")) {
						sqlSt = "select * from offline_product where storeid=4";
					} else if (user_id.equals("off_admin5")) {
						sqlSt = "select * from offline_product where storeid=5";
					} else if (user_id.equals("off_admin6")) {
						sqlSt = "select * from offline_product where storeid=6";
					}
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String img_li = null;
				String file_name = null;
				String path = null;
				String directory = null;
				while (rset.next()) {
					store_id = rset.getString("storeid");
					name = rset.getString("offlineproduct_name");
					price = rset.getString("offlineproduct_price");
					num = rset.getString("offlineproduct_num");
					product_id = rset.getString("offlineproduct_id");
					file_name = rset.getString(2);
					if (file_name != null) //새로 추가한 파일
						img_li = "offline_store_img/Store" + store_id + "/" + file_name;
					else
						img_li = "offline_store_img/Store" + store_id + "/" + product_id + ".jpg";
				%>
				<form method="post" action="doUpdateStock">
					<tr>
						<!-- <td></td> -->
						<td><input type="text" value="<%=product_id%>"
							id="offlineproduct_id" name="offlineproduct_id"
							readonly="readonly"
							style="border: none; background: transparent; pointer-events: none; text-align: center; width: 50px; height: 20px;" /></td>
						<td><div>
								<img src="<%=img_li%>" alt="" style="width: 80px"> <br />
								<%=name%>
							</div></td>
						<td><%=price%>원</td>
						<td><input id="offlineproduct_id %>" type="number"
							name="offlineproduct_num" min="-1" step="1" value=<%=num%>
							style="width: 35px"
							onchange="javascript: document.getElementById('offlineproduct_num').value = this.value,
						javascript: document.getElementById('<%=product_id%>').value = <%=product_id%>" /></td>
						<td><button type="submit">UPDATE</button></td>
					</tr>
				</form>
				<%
					session.setAttribute("store_id", store_id);
				}
				%>

			</table>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>