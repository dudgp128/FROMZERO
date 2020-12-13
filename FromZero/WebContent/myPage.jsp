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
	String name = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
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
	
	try {
		String sqlSt = "select * from online_order where custid='" + user_id + "'";
		pst = conn.prepareStatement(sqlSt);
		rs = pst.executeQuery();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	int all_price = 0;
	int tmp = 0;
	while (rs.next()) {
		tmp = rs.getInt("allprice");
		all_price += tmp;
	}
	
	PreparedStatement pstmtt = null;
	   ResultSet rsett = null;
	   String point = null;
	   try {
	      String sqlSt = "select * from bottle where custid='" + user_id + "'";
	      pstmtt = conn.prepareStatement(sqlSt);
	      rsett = pstmtt.executeQuery();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	   if (rsett.next())
	      point = rsett.getString("point");
	
	//String sqlSt = "select * from online_order where custid='" + user_id + "'";
	%>

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
				<div class="total-price" style='font-size: 16px; padding: 10px; font-size:larger'>누적 구매금액 :
					<%=all_price %>원</div>
			</div>

			<div class="point-view">
				<a href="point.html"> <!-- 공병 개수 보여주는거 어떻게 할것인지 결정하기  -->
					<ul>
						<li>포인트</li>
						<li style='font-size: 23px'><%=point%></li>
					</ul>
				</a>
			</div>



			<div class="point-view">
				<a href="test.jsp">
					<ul>
						<li>레 벨</li>
						<li style='font-size: 23px'><%=level%></li>
					</ul>
				</a>
			</div>
			<br /> <br /> <br />
			<div class="tabmenu" style="">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1"> <label for="tabmenu1">ONLINE
							ORDER</label>

						<div style="width: 100%" class="tabCon">
							<table>
								<tr>
									<%
										try {
										conn = DriverManager.getConnection(DBUrl, connectionProps);

										String osqlSt = "select online_product.productid,productname, count, price, img,big_category,orderid from online_product, order_items where online_product.productid=order_items.productid and custid="
										+ "'" + user_id + "' order by orderid desc";
										pstmt = conn.prepareStatement(osqlSt);
										rset = pstmt.executeQuery();

									} catch (SQLException e) {
										e.printStackTrace();
									}
									String productname = "";
									int count = 0;
									int online_price = 0;
									int online_productid = 0;
									String img = "";
									String img_li = "";
									String big_category = "";
									int orderid=0;
									while (rset.next()) {
										online_productid = rset.getInt(1);
										productname = rset.getString(2);
										count = rset.getInt(3);
										online_price = rset.getInt(4);
										img = rset.getString("img");
										big_category = rset.getString("big_category");
										orderid=rset.getInt("orderid");

										img_li = big_category + "/" + img + ".jpg";
									%>
									<td style="border-bottom: 1px solid #444444">
										<table style="width: 55%; text-algin: left">
										<form method="post" action="doReview">
				
											<tr>
												<td rowspan="2"><img
													style="width: 130px; height: 130px;"
													class="img-display-box" src="<%=img_li%>" alt=""></td>

												<td style="text-align: left; width: 100%; padding-right:0px"><strong><p><%=productname%></p></strong>
													<p style="font-size: 12px">
														수량 :
														<%=count%>개 /
														<%=online_price%>원
													</p></td>
												<td>
												<input type="hidden" name="productname" value="<%=productname%>">
												<input type="hidden" name="count" value="<%=count%>">
												<input type="hidden" name="price" value="<%=online_price%>">
												<input type="hidden" name="online_productid" value="<%=online_productid%>">
												<input type="hidden" name="orderid" value="<%=orderid %>"> 
												</td>
												<td>
													<button style="width: 40px" type="submit">후기작성</button>
												</td>
											</tr>
											<tr />
											</form>
										</table>
									</td>
								</tr>
								<%
									}
								%>
							</table>
						</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu2"> <label for="tabmenu2">OFFLINE
							ORDER</label>

						<div style="width: 100%" class="tabCon">
							<table>
								<tr>
									<%
										try {
										conn = DriverManager.getConnection(DBUrl, connectionProps);

										String sqlSt = "select productid, offlineproduct_name, count, offlineproduct_price from offline_order_items, offline_product where offline_order_items.productid=offline_product.offlineproduct_id and offline_order_items.storeid=offline_product.storeid and custid="
										+ "'" + user_id + "' order by orderid desc";
										pstmt = conn.prepareStatement(sqlSt);
										rset = pstmt.executeQuery();

									} catch (SQLException e) {
										e.printStackTrace();
									}
									String offlineproduct_name = "";
									//int count = 0;
									int offline_price = 0;
									int productid = 0;
									int storeid = 0;
									//String img_li = "";
									while (rset.next()) {
										productid = rset.getInt(1);
										storeid = productid / 100;
										offlineproduct_name = rset.getString(2);
										count = rset.getInt(3);
										offline_price = rset.getInt(4);
										img_li = "offline_store_img/Store" + storeid + "/" + productid + ".jpg";
									%>
									<td style="border-bottom: 1px solid #444444">
										<table style="width: 55%; text-algin: left">
											<tr>

												<td rowspan="2"><img
													style="width: 130px; height: 130px;"
													class="img-display-box" src="<%=img_li%>" alt=""></td>

												<td style="text-align: left; width: 100%; padding-right:0px"><strong><%=offlineproduct_name%></strong>
													<br />
													<p style="font-size: 12px">
														수량 :
														<%=count%>개 /
														<%=offline_price%>원
													</p></td>
												<td />
												
												<td/>
											</tr>
											<tr />
										</table>
									</td>
								</tr>
								<%
									}
								%>
							</table>
						</div></li>
				</ul>
			</div>
		</div>


		<!-- 오프라인구매내역/온라인구매내역으로 나눠서 테이블에서 가져오기 -->
	</div>
</body>
</html>