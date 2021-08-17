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

table.editTable {
	margin: 0 auto;
	width: 35%;
	text-align: center;
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
	String email = null;
	%>

	<br /> <br /> <br />
		<h2 style="text-align: center">회원 정보 수정</h2>
		<br />
		
	<div class="inside">
		<div id="menu" style="float: left;">
			<ul class="leftMenu">
				<li><a href="myPage.jsp" class="submenuLink">주문조회</a></li>
				<li><a href="modify_info.jsp" class="submenuLink">회원정보수정</a></li>
			</ul>
		</div>
		
		<div class="question_box" style="text-align: center">
			<div style="text-align: center">
				<form method="post" action="doUpdateInfo">
					<%
						try {

						conn = DriverManager.getConnection(DBUrl, connectionProps);
						String sqlSt = "select * from customer";
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

					<table class="editTable" border="0" style="width:40%">
						<tr>
							<td>아이디</td>
							<td><input id="custid" type="text" value="<%=user_id%>"
								name="custid" readonly /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input id="passwd" type="password" name="passwd"
								required /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input id="name" type="text" name="name" required /></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input id="address" type="text" name="address" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input id="phone" type="text" name="phone" /></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input id="email" type="text" name="email" /></td>
						</tr>
					</table>
					<br>
					<input type="submit" style="margin-top: 20px"
						class="test-result-button" value="정보수정" /> <br /> <br />

				</form>
			</div>
		</div>
	</div>
</body>
</html>