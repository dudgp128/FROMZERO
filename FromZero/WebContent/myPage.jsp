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
<%
	//String user_id = (String) session.getAttribute("user_id"); //세션 값 불러오기
%>
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
	height: 100px;
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
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<div class="inside">
		<div id="menu" style="float: left;">
			<ul class="leftMenu">
				<li><a href="myorder.jsp" class="submenuLink">주문조회</a></li>
				<li><a href="modify_info.jsp" class="submenuLink">회원정보수정</a></li>
			</ul>
		</div>

		<div class="info">
			<div class="intro">
				<div style='font-weight: bold; font-size: 26px; padding: 10px;'>
					<%=user_name%>님, 안녕하세요.
				</div>
				<div class="total-price" style='font-size: 16px; padding: 10px;'>누적구매금액:
					0원</div>
			</div>

			<div class="point-view">
				<a href="point.html"> <!-- 공병 개수 보여주는거 어떻게 할것인지 결정하기  -->
					<ul>
						<li>포인트</li>
						<li style='font-size: 23px'>0</li>
					</ul>
				</a>
			</div>

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
			try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select * from customer where custid = '" + user_id + "'";
				pstmt = conn.prepareStatement(sqlSt);
				rset = pstmt.executeQuery();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			String level = null;
			if (rset.next())
				level = rset.getString("level");

			if (level == null)
				level = "테스트하고 레벨 알아보기!";
			%>

			<div class="point-view">
				<a href="test.jsp">
					<ul>
						<li>레 벨</li>
						<!-- 레벨 디비 저장해서 가져오는거 구현하기 -->

						<li style='font-size: 23px'><%=level%></li>
					</ul>
				</a>
			</div>
		</div>
		<br />
		
		<!-- 오프라인구매내역/온라인구매내역으로 나눠서 테이블에서 가져오기 -->
	</div>
</body>
</html>