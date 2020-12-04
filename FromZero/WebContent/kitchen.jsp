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
<script src="./search-checkbox.js"></script>
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>

	<!-- 체크박스 -->
	</br>
	<form method="post" action="doKitchen">
		<table>
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="밀랍/시트" id="smallCategory1">
						밀랍/시트</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="설거지" id="smallCategory2"> 설거지
				</label></td>
				<td />
				<td />
			</tr>

			<tr>
				<th>브랜드</th>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="더피커" id="brand1"> 더피커</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="지구샵" id="brand2"> 지구샵</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="제로웨이스트샵" id="brand3"> 제로웨이스트샵</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="brandName" value="지구살림e" id="brand4"> 지구살림e</label></td>
				<td />
			</tr>


			<tr>
				<th>가격</th>
				<td><input type="radio" onClick="check()" name="price"
					value="10000" id="one"><label for="one"> ~1만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
					value="30000" id="three"><label for="three"> ~3만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
					value="50000" id="five"><label for="five"> ~5만원</label></td>
			</tr>

			<tr>
				<td />
				<td />
				<td colspan="4" style="text-align: right;"><input type="text"
					name="search_result" style="width: 500px; height: 30px;"
					id="search-statement" readonly="readonly" /></td>
				<td style="text-align: left"><button type="reset">초기화</button></td>
				<td style="text-align: left"><input type="submit" value="검색" />
			</tr>
		</table>
	</form>




	<div class="big-shop-grid">
		<h2 class="big-category-text">KITCHEN</h2>
		<div class="div-shop-grid">
			<ul class="ul-shop-grid">
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

					String sqlSt = "select * from online_product where big_category='kitchen' order by binary(big_category), binary(brand), price, productid";
					pstmt = conn.prepareStatement(sqlSt);
					rset = pstmt.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String productname = null;
				String price = null;
				int img_count = 0;
				String img_li = null;
				String productid = null;

				while (rset.next()) {
					productname = rset.getString("productname");
					price = rset.getString("price");
					productid = rset.getString("productid");
					img_count++;
					img_li = "kitchen/" + img_count + ".jpg";
				%>
				<form method="post" action="doDetailProduct">
            <button style="border:0; outline:0; background-color:white" name="productid" value=<%= productid%>>
            <li id="li-living-item-box">
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
            </button>
         </ul>
         </form>
		</div>
	</div>
</body>
</html>