<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

   <div class="title">
      <h2 style="text-align:center">결제 내역</h2>
   </div>
 <%
 	String productid =  (String) session.getAttribute("productid");
	String productname = (String) session.getAttribute("productname");
	String img_num =  (String) session.getAttribute("img_num");
	
	int all_price = (Integer)request.getAttribute("all_price");
	int count = (Integer)request.getAttribute("count");
	%>
 
 
   <div class="question_box">
   <table>
   <tr>
      <td><h3>상품 이미지</h3></td>
      <td><h3>상품명</h3></td>
      <td><h3>구매 개수</h3></td>
      <td><h3>총 금액</h3></td>
   </tr>
  <tr>
      <td><img src="<%=img_num%>" width="200" height="200" alt="" ></td>
      <td><%= productname %></td>
      <td><%= count %>개</td>
      <td><%= all_price %>원</td>
   </tr>
   
   </table>


   </div>
   
</body>
</html>