<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
.inside {
	padding: 10px;
	margin-top: 20px;
	margin-left: 10px;
	margin-right: 10px;
}

.info {
	background-color: #e2e2e2;
	width: 1100px;
	height: 300px;
	float: left;
	padding: 20px;
	display: inline-block;
	margin-top: 48px;
	margin-left: 20px;
}

.intro {
	display: inline-block;
}

.point-view {
	display: inline-block;
	float: right;
	margin-right: 10px;
	margin-left: 10px;
	text-align: center;
	font-weight: bold;
}

.point-view ul {
	display: flex;
	align-center: flex-start;
	flex-direction: column;
	flex-wrap: wrap;
	overflow: auto;
	margin: 0 0 20px 20px;
}

.point-view li {
	margin: 5px 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
	font-size: 29px;
	margin-bottom: 5px;
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

ul {
	list-style: none;
}

.tabmenu {
	margin: 0;
	padding: 0px;
	font-size: 15px;
	line-height: 1.3;
	max-width: 100%;
	margin: 0 auto;
	position: relative;
}

.tabmenu ul li {
	display: inline-block;
	width: 50.00%;
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
	box-sizing: border-box;
	border: 5px solid #f9f9f9;
}

.tabmenu input:checked ~ label {
	background: green;
}

.tabmenu input:checked ~ .tabCon {
	display: block;
}

td, tr {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>
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

	String custid = null;
	String passwd = null;
	String name = null;
	String phone = null;
	String address = null;
	String email=null;
	%>

	<div class="inside">
		<div id="menu" style="float: left;">
			<ul class="leftMenu">
				<li><a href="myorder.jsp" class="submenuLink">주문조회</a></li>
				<li><a href="modify_info.jsp" class="submenuLink">회원정보수정</a></li>
			</ul>
		</div>
		<div class="info">
			<br />
			<h1 align=center>Modify my information</h1>
			<br /> <br />

			<div style="text-align: center">
				<form method="post" action="doUpdateInfo">
					<%
						try {

						conn = DriverManager.getConnection(DBUrl, connectionProps);
						String sqlSt = "select * from customer";

						//System.out.println(sqlSt);
						pstmt = conn.prepareStatement(sqlSt);
						rset = pstmt.executeQuery();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					while (rset.next()) {
						custid = rset.getString("custid");
						passwd = rset.getString("passwd");
						name = rset.getString("name");
						address = rset.getString("address");
						phone = rset.getString("phone");
						email = rset.getString("email");
					}
					%>
					아이디 <input id="custid" type="text" value="<%=user_id%>"name="custid" required /><br />
					비밀번호 <input id="passwd" type="password" placeholder="PASSWORD"
						name="passwd" required /><br /> 이름 <input id="name"
						type="text" name="name" placeholder="NAME" required /><br /> 주소
					<input id="address" type="text" placeholder="ADDRESS"
						name="address" /><br /> 전화번호 <input id="phone" type="text"
						placeholder="PHONE_NUMBER" name="phone" /><br /> 이메일 <input
						id="email" type="text" placeholder="EMAIL" name="email" /><br />
					<input type="submit" style="margin-top: 20px" value="정보수정" /> <br />
					<br />

				</form>
			</div>
		</div>
	</div>
</body>
</html>