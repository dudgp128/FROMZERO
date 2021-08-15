<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String productid = (String) request.getAttribute("productid");
String productname = (String) request.getAttribute("productname");
String count = (String) request.getAttribute("count");
String price = (String) request.getAttribute("price");
int product_img = (int) request.getAttribute("product_img");
String big_category = (String) request.getAttribute("big_category");
String img_path = big_category + "/" + product_img + ".jpg";
int orderid=(int) request.getAttribute("orderid");
String db_review_content=(String)request.getAttribute("db_review_content");
%>
<title>From zero</title>

</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp"%>
	<div class="big-shop-grid">
		<div class="div-shop-grid">
			<br />
			<h2>review</h2>
			<br />
			<form method="post" action="reviewDB">
						<input type="hidden" name="orderid" value="<%=orderid%>"/>
						<input type="hidden" name="productid" value="<%=productid%>"/>
				<table style="background-color: #FFFFFF;">
					<tr>
						<td style="height: 50%">
							<table style="width: 100%; background-color: #FFFFFF;">
								<tr>
									<td rowspan="3"><img style="width: 150px"
										src="<%=img_path%>" alt="" /> </td>
									<td colspan="3"><strong><%=productname%></strong>
										<p>
											수량 :
											<%=count%>
											개/
											<%=price%></p></td>
								</tr>
								<tr>
									<td><label><img
											style="width: 30px; margin: auto 10px"
											src="images/rating3.png" alt="" /><br /> <input type="radio"
											name="rating" value="3" checked="checked"/></label></td>
									<td><label><img
											style="width: 30px; margin: auto 10px"
											src="images/rating2.png" alt="" /><br /> <input type="radio"
											name="rating" value="2" /></label></td>
									<td><label><img
											style="width: 30px; margin: auto 10px"
											src="images/rating1.png" alt="" /><br /> <input type="radio"
											name="rating" value="1" /></label></td>
								</tr>
							</table>
						</td>
						<td rowspan="3"><textarea name="review_content"
								style="width: 500px; height: 270px; padding-top: 10px" required><%=db_review_content %></textarea>
						</td>
					</tr>
					<tr>
						<td />
					</tr>
					<tr>
						<td><button class="test-result-button"style="width: 100%" type="submit">리뷰
								작성하기</button>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script src="./rating.js"></script>

</body>
</html>