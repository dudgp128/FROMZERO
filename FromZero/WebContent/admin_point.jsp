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
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
table {
	border-top: 1px solid #444444;
	margin: auto;
	text-align: center;
	background-color: #FFFFFF;
}

th, td {
	background-color: #FFFFFF;
	border-bottom: 1px solid #D3D3D3;
	padding: 10px;
}


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
	String custid = null;
	String phone = null;
	String point = null;
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
		<h2 style="text-align: center">고객 포인트 차감</h2>
	</div>

	<div class="question_box" style="background-color: #FFFFFF">
		<table>
			<tr>
				<!-- <td>사진</td> -->
				<th style="border-bottom: 1px solid #444444;">고객아이디</th>
				<th style="border-bottom: 1px solid #444444;">이름</th>
				<th style="border-bottom: 1px solid #444444;">전화번호</th>
				<th style="border-bottom: 1px solid #444444;">포인트</th>
				<th style="border-bottom: 1px solid #444444;"></th>
			</tr>
			<form method="post" action="doUsePoint">
				<%
					try {
					conn = DriverManager.getConnection(DBUrl, connectionProps);

					String sqlSt = "select customer.custid, customer.name, customer.phone, bottle.point from customer, bottle where customer.custid = bottle.custid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();

				} catch (SQLException e) {
					e.printStackTrace();
				}
				while (rset.next()) {
					custid = rset.getString("custid");
					name = rset.getString("name");
					phone = rset.getString("phone");
					point = rset.getString("point");
				%>

				<tr>
					<!-- <td></td> -->
					<td><input type="text" value="<%=custid%>" id="custid"
						name="custid" readonly="readonly"
						style="border: none; background: transparent; pointer-events: none; text-align: center; width: 100px; height: 20px;" /></td>
					<td><%=name%></td>
					<td><%=phone%></td>
					<td><input id="point" type="number" name="point" min="0"
						step="1" value=<%=point%>
						onchange="javascript: document.getElementById('point').value = this.value;
							  javascript: document.getElementById('custid').value = <%=custid%>" /></td>
					<td><button type="submit" class="test-result-button">UPDATE</button></td>
				</tr>
				<%
					}
				%>
				
			</form>
		</table>



	</div>


</body>
</html>