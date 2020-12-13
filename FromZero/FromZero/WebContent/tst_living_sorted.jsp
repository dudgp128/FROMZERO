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
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./fromzero.css" type="text/css">
<script src="./search-checkbox.js"></script>
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp"%>

	<!-- 체크박스 -->
	</br>

	<form method="post" action="doLiving">
		<table>
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="빨대" id="smallCategory1"> 빨대</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="주머니/가방" id="smallCategory2">
						주머니/가방</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="집게" id="smallCategory3"> 집게</label></td>
				<td><label><input type="checkbox" onClick="check()"
						name="smallCategory" value="책/노트" id="smallCategory4">
						책/노트</label></td>
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

	<%   
               ArrayList<Product> data = (ArrayList<Product>)request.getAttribute("data");
               %>

	<div class="big-shop-grid">
		<h2 class="big-category-text">LIVING</h2>
		<div class="div-shop-grid">
			<form>
				<input type="hidden" name="data" value="<%=data%>"
					style="height: 3px" /> <select name="sort">
					<option value="none">정렬</option>
					<option value="sortBrand">브랜드순</option>
					<option value="sortName";">이름순</option>
					<option value="sortLowPrice">가격 낮은순</option>
					<option value="sortHighPrice">가격 높은순</option>
				</select>
			</form>
			<ul class="ul-shop-grid">
				<% 
               for(int i=0; i < data.size(); i++) {
               %>
				<form method="post" action="doDetailProduct">
					<button style="border: 0; outline: 0; background-color: white"
						name="productid" value=<%= data.get(i).getProductid() %>>
						<li id="li-living-item-box">
							<div class="div-display-living-box" style="margin-left: 0">
								<img class="img-display-box" src="<%=data.get(i).getImg()%>"
									alt="">
								<div class="display-text">
									<p>
										<strong><<%=data.get(i).getBrand()%>></strong>
									</p>
									<p>
										<strong><%=data.get(i).getProductname()%></strong>
									</p>
									<p><%=data.get(i).getPrice()%>원
									</p>
								</div>
							</div> </a>
						</li>

						<%
							}

						//System.out.println(p_name);

						//for(int i = 0; i < data.size(); i++) 
						//   data.get(i).getProductname().replaceAll(System.getProperty("line.separator"), " ");
						//for(int i = 0; i < data.size(); i++) 
						//   System.out.println((i+1)+"번쨰 : " + data.get(i).getProductname());

						for (int i = 0; i < data.size(); i++)
						System.out.println((i + 1) + "번쨰 : " + data.get(i).getProductname() + ", 가격  : " + data.get(i).getPrice());
						%>
					</button>
			</ul>
			</form>
		</div>
	</div>
</body>
</html>