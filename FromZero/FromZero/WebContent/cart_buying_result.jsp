<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>결제 내역</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<div class="title">
		<h2 style="text-align: center">결제 내역</h2>
	</div>
	<%
		String[] name = (String[]) request.getAttribute("name");
	int[] count = (int[]) request.getAttribute("count");
	int[] price = (int[]) request.getAttribute("price");
	String[] img = (String[]) request.getAttribute("img");
	int all_price = (int) request.getAttribute("all_price");

	int len = name.length;
	%>


	<div class="question_box">
		<table>
			<tr>
				<td><h3>상품 이미지</h3></td>
				<td><h3>상품명</h3></td>
				<td><h3>구매 개수</h3></td>
				<td><h3>금액</h3></td>
			</tr>
			<%
				for (int i = 0; i < len; i++) {
					int oprice = count[i] * price[i];
			%>
			<tr>
				<td><img src="<%=img[i]%>" width="200" height="200" alt=""></td>
				<td><%=name[i]%></td>
				<td><%=count[i]%>개</td>
				<td><%=oprice%>원</td>

			</tr>
			<%
				}
			%>
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><h3 style="text-align:center">최종 금액 : <%=all_price %>원</h3></td>
			</tr>
		</table>


	</div>

</body>
</html>